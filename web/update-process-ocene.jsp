<%-- 
    Document   : update-process-ocene
    Created on : 28.09.2020., 19.38.04
    Author     : Cvele
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/student_finalno";%>
<%!String user = "root";%>
<%!String psw = "123456";%>
<%
    String ocene_id = request.getParameter("ocene_id");
    String ocene_datum = request.getParameter("ocene_datum");
    String ocene_profesor = request.getParameter("ocene_profesor");
    String ocene_ocena = request.getParameter("ocene_ocena");
    if (ocene_id != null) {
        Connection con = null;
        PreparedStatement ps = null; 
        int personID = Integer.parseInt(ocene_id);
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(url, user, psw);
            String sql = "Update ocene set ocene_id=?,ocene_datum=?,ocene_profesor,ocene_ocena where ocene_id=" + ocene_id;
            ps = con.prepareStatement(sql);
            ps.setString(1, ocene_id);
            ps.setString(2, ocene_datum);
            ps.setString(3, ocene_profesor);
            ps.setString(4, ocene_ocena);
            int i = ps.executeUpdate();
            if (i > 0) {
                out.print("Uspesno ste dodali ocenu");
            } else {
                out.print("Upsss...Greska prilikom izmene u bazi");
            } 
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>