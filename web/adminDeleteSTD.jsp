<%-- 
    Document   : adminDeleteSTD
    Created on : 28.09.2020., 14.17.40
    Author     : Cvele
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
    String student_id = request.getParameter("student_id");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_finalno", "root", "123456");
        Statement st = conn.createStatement();
        int i = st.executeUpdate("DELETE FROM student WHERE student_id=" + student_id);
        out.println("Student uspesno izbrisan iz baze podataka");
    } catch (Exception e) {
        System.out.print(e);
        e.printStackTrace();
    }
%>