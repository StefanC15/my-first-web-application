<%-- 
    Document   : adminProcesDodavanjaprof
    Created on : 27.09.2020., 11.59.32
    Author     : Cvele
--%>

<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="utils.PasswordGenerator" %>


<%
              
    String profesor_ime = request.getParameter("profesor_ime");
    String profesor_prezime = request.getParameter("profesor_prezime");
    String profesor_pol = request.getParameter("profesor_ime");

    // dodao sam i ovo
    int skola_id = Integer.parseInt(request.getParameter("skola_id"));


    // pravimo mi korisnicko ime
    String korIme = profesor_ime + '_' + profesor_pol;
    String korRola = "profesor";
    String korSifra = PasswordGenerator.generate(7);

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_finalno", "root", "123456");
        
        // kreiranje korisnika prvo
        PreparedStatement ps = conn.prepareStatement("INSERT INTO korisnik (korisnik_korisnickoIme, korisnik_sifra, korisnik_rol) VALUES (?, ?, ?)");
        ps.setString(1, korIme);
        ps.setString(2, korSifra);
        ps.setString(3, korRola);
        
        int rezultat = ps.executeUpdate();

        if (rezultat != 1) {  %> 
            <h5> Korisnik nije kreiran <%= rezultat %></h5>  <%
        }

        // uzimamo ID od poslednjeg korisnika i smestamo u korId
        ps = conn.prepareStatement("SELECT korisnik_id FROM korisnik WHERE korisnik_korisnickoIme = ? and korisnik_sifra = ?");
        ps.setString(1, korIme);
        ps.setString(2, korSifra);
                    
        ResultSet rs = ps.executeQuery();

        int korId = 0;

        if (rs.last()) {
            korId = rs.getInt("korisnik_id");
        }
        
        if (korId == 0) {
            throw new Exception("Korisnik nije kreiran");
        }

        // kreiranje profesora
        ps = conn.prepareStatement("INSERT INTO profesor(korisnik_id, skola_id, profesor_ime, profesor_prezime, profesor_pol) values (?, ?, ?, ?, ?)");
        ps.setInt(1, korId);
        ps.setInt(2, skola_id);
        ps.setString(3, profesor_ime);
        ps.setString(4, profesor_prezime);
        ps.setString(5, profesor_pol);
       
       rezultat = ps.executeUpdate();

       if (rezultat != 1) {
           %> 
           <h1> Profesor nije upisan </h1>
           <%
       } else {
            %> 
           <h1> Profesor uspesno upisan u bazu</h1>     
            <%
       }

    } catch (Exception e) {
        %>
        
        <h1> GRESKA: <%= e %></h1>
       
        <% 
        
    }

%>