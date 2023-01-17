<%-- 
    Document   : adminProcesDodavanja
    Created on : 27.09.2020., 11.55.56
    Author     : Cvele
--%>

<%@page import="java.nio.charset.Charset"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ page import="utils.PasswordGenerator" %>


<%
              
    String student_ime = request.getParameter("student_ime");
    String student_prezime = request.getParameter("student_prezime");
    String student_datumRodjenja = request.getParameter("student_datumRodjenja");
    String student_pol = request.getParameter("student_pol");
    String student_indeks = request.getParameter("student_indeks");

    // dodao sam i ovo
    int skola_id = Integer.parseInt(request.getParameter("skola_id"));


    // pravimo mi korisnicko ime
    String korIme = student_ime + '_' + student_indeks;
    String korRola = "student";
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
        ps = conn.prepareStatement("INSERT INTO student(korisnik_id, skola_id, student_ime, student_prezime, student_datumRodjenja, student_pol, student_indeks) values (?, ?, ?, ?, ?, ?, ?)");
        ps.setInt(1, korId);
        ps.setInt(2, skola_id);
        ps.setString(3, student_ime);
        ps.setString(4, student_prezime);
        ps.setString(5, student_datumRodjenja);
        ps.setString(6, student_pol);
        ps.setString(7, student_indeks);
        
       
       rezultat = ps.executeUpdate();

       if (rezultat != 1) {
           %> 
           <h1> Student nije upisan </h1>
           <%
       } else {
            %> 
           <h1> Student uspesno upisan u bazu</h1>     
            <%
       }

    } catch (Exception e) {
        %>
        
        <h1> GRESKA: <%= e %></h1>
       
        <% 
        
    }

%>
