<%-- 
    Document   : testovi-proces-dodavanja
    Created on : 29.09.2020., 11.15.29
    Author     : Cvele
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
    String ocene_datum = request.getParameter("ocene_datum");
    String ocene_profesor = request.getParameter("ocene_profesor");
    String ocene_ocena = request.getParameter("ocene_ocena");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_finalno", "root", "123456");
        Statement st = conn.createStatement();

        int i = st.executeUpdate("insert into ocene(ocene_datum,ocene_profesor,ocene_ocena)values('" + ocene_datum + "','" + ocene_profesor + "','" + ocene_ocena + "')");
        out.println("Podaci su uspesno uneti u bazu!");
    } catch (Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>