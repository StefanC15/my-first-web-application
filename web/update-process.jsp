<%-- 
    Document   : update-process
    Created on : 27.09.2020., 18.14.06
    Author     : Cvele
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/student_finalno";%>
<%!String user = "root";%>
<%!String psw = "123456";%>
<%
    String profesor_id = request.getParameter("profesor_id");
    String profesor_ime = request.getParameter("profesor_ime");
    String profesor_prezime = request.getParameter("profesor_prezime");
    String profesor_pol = request.getParameter("profesor_pol");
    if (profesor_id != null) {
        Connection con = null;
        PreparedStatement ps = null;
        int personID = Integer.parseInt(profesor_id);
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(url, user, psw);
            String sql = "Update profesor set profesor_id=?,profesor_ime=?,profesor_prezime=?,profesor_pol=? where profesor_id=" + profesor_id;
            ps = con.prepareStatement(sql);
            ps.setString(1, profesor_id);
            ps.setString(2, profesor_ime);
            ps.setString(3, profesor_prezime);
            ps.setString(4, profesor_pol);
            int i = ps.executeUpdate();
            if (i > 0) {
                out.print("Uspesno ste izmenili podatke iz tabele profesor");
            } else {
                out.print("Upsss...Greska prilikom izmene u bazi");
            }
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>