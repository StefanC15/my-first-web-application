<%-- 
    Document   : adminDeletePROF
    Created on : 28.09.2020., 14.29.52
    Author     : Cvele
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String profesor_id = request.getParameter("profesor_id");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_finalno", "root", "123456");
        Statement st = conn.createStatement();
        int i = st.executeUpdate("DELETE FROM profesor WHERE profesor_id=" + profesor_id);
        out.println("Profesor uspesno izbrisan iz baze podataka!");
    } catch (Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>