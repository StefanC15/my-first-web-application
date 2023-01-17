<%-- 
    Document   : update-processStud
    Created on : 27.09.2020., 18.37.07
    Author     : Cvele
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/student_finalno";%>
<%!String user = "root";%>
<%!String psw = "123456";%>
<%
    String student_id = request.getParameter("student_id");
    String student_ime = request.getParameter("student_ime");
    String student_prezime = request.getParameter("student_prezime");
    String student_datumRodjenja = request.getParameter("student_datumRodjenja");
    String student_pol = request.getParameter("student_pol");
    String student_indeks = request.getParameter("student_indeks");
    if (student_id != null) {
        Connection con = null;
        PreparedStatement ps = null;
        int personID = Integer.parseInt(student_id);
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(url, user, psw);
            String sql = "Update student set student_id=?,student_ime=?,student_prezime=?,student_datumRodjenja=?,student_pol=?,student_indeks=? where student_id=" + student_id;
            ps = con.prepareStatement(sql);
            ps.setString(1, student_id);
            ps.setString(2, student_ime);
            ps.setString(3, student_prezime);
            ps.setString(4, student_datumRodjenja);
            ps.setString(5, student_pol);
            ps.setString(6, student_indeks);
            int i = ps.executeUpdate();
            if (i > 0) {
                out.print("Uspesno ste izmenili podatke iz tabele student");
            } else {
                out.print("Upsss...Greska prilikom izmene u bazi");
            }
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>