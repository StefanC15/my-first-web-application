<%-- 
    Document   : update-casovi
    Created on : 30.09.2020., 17.58.08
    Author     : Cvele
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/student_finalno";%>
<%!String user = "root";%>
<%!String psw = "123456";%>
<%
    String casovi_id = request.getParameter("casovi_id");
    String casovi_vreme = request.getParameter("casovi_vreme");
    if (casovi_id != null) {
        Connection con = null;
        PreparedStatement ps = null;
        int personID = Integer.parseInt(casovi_id);
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(url, user, psw);
            String sql = "Update casovi set casovi_id=?,casovi_vreme=? where casovi_id=" + casovi_id;
            ps = con.prepareStatement(sql);
            ps.setString(1, casovi_id);
            ps.setString(2, casovi_vreme);
            
            int i = ps.executeUpdate();
            if (i > 0) {
                out.print("Uspesno ste izmenili datum odrzavanja casa");
            } else {
                out.print("Upsss...Greska prilikom izmene u bazi");
            } 
        } catch (SQLException sql) {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>
