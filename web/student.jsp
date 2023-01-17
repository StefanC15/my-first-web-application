<%-- 
    Document   : student
    Created on : 22.09.2020., 14.53.40
    Author     : Cvele
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>

    <head>  
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Profil</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#"><span class="sr-only">(current)</span></a>
                </li>
            </ul>
        </div>
    </nav>
</head> 

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">

<body>
    <%
        String str = (String) session.getAttribute("username");
        out.print("Welcome " + str);
    %>

<html>
    <body>
    <br /> <center> <h4>Studenti </h4> </center> <br /> <br />
<br />
<table class="table table-hover">
    <thead>
        <tr>
            <th scope="col">Ime</th>
            <th scope="col">Prezime</th>
            <th scope="col">Datum Rodjenja</th>
            <th scope="col">Pol</th>
            <th scope="col">Indeks</th>
            <th scope="col">Datum test</th>
            <th scope="col">Broj Pitanja</th>
            <th scope="col">Ocena</th>
            <th scope="col">Naziv predmeta</th>
            

    </thead>

    <%       String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/student_finalno";
        String userid = "root";
        String password = "123456";
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
    %>
    <%
        try {
            connection = DriverManager.getConnection(connectionUrl, userid, password);
            statement = connection.createStatement();
            String sql = "SELECT  student_ime, student_prezime, student_datumRodjenja, student_pol, student_indeks, testovi_datum, testovi_brojPitanja, testovi_ocena, predmet_naziv"
                    + " FROM student s INNER JOIN testovi t ON s.student_id = t.student_id"
                    + " INNER JOIN studpred spr ON spr.student_id = s.student_id"
                    + " INNER JOIN predmet p ON p.predmet_id = spr.predmet_id;";
            //preko inner joina spoji tabelu student
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
    %>
    <tbody>
            <tr>
                <td><%=resultSet.getString("student_ime")%></td>
                <td><%=resultSet.getString("student_prezime")%></td>
                <td><%=resultSet.getString("student_datumRodjenja")%></td>
                <td><%=resultSet.getString("student_pol")%></td>
                <td><%=resultSet.getString("student_indeks")%></td>
                <td><%=resultSet.getString("testovi_datum")%></td>
                <td><%=resultSet.getString("testovi_brojPitanja")%></td>
                <td><%=resultSet.getString("testovi_ocena")%></td>
                <td><%=resultSet.getString("predmet_naziv")%></td>
            </tr>
        </tbody>
    <%
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

</table>
</body>