<%-- 
    Document   : adminStudenti
    Created on : 22.09.2020., 21.11.34
    Author     : Cvele
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.sql.*"%>




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin studenti</title>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="admin.jsp">Pocetna</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="adminStudenti.jsp">Studenti</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="profesori.jsp">Profesori</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Dodaj
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item" href="dodajProfesora.jsp">Profesora</a>
                        <a class="dropdown-item" href="adminaddStudent.jsp">Studenta</a>
                    </div>
                </li>
            </ul>
        </div>
        <%

            String str = (String) session.getAttribute("username");

            out.print("Welcome " + str);

        %>
    </nav>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
</head>

<body>
    <br /> <center> <h4>Studenti </h4> </center> <br /> <br />
<br />
<table class="table table-hover">
    <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Ime</th>
            <th scope="col">Prezime</th>
            <th scope="col">Datum Rodjenja</th>
            <th scope="col">Pol</th>
            <th scope="col">Indeks</th>
            <th scope="col">Update</th>
            <th scope="col">Delete</th>

    </thead>

    <%       String driver = "com.mysql.jdbc.Driver";
        String connectionUrl = "jdbc:mysql://localhost:3306/student_finalno";
        String userid = "root";
        String password = "0641093012";
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
            String sql = "SELECT  student_id, student_ime, student_prezime, student_datumRodjenja, student_pol,student_indeks FROM student_finalno.student";

            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
    %>
    <tbody>
            <tr>
                <td><%=resultSet.getString("student_id")%></td>
                <td><%=resultSet.getString("student_ime")%></td>
                <td><%=resultSet.getString("student_prezime")%></td>
                <td><%=resultSet.getString("student_datumRodjenja")%></td>
                <td><%=resultSet.getString("student_pol")%></td>
                <td><%=resultSet.getString("student_indeks")%></td>
                <td><a href="updatestud.jsp?student_id=<%=resultSet.getString("student_id")%>"><button type="button" class="btn btn-info">Update</button></a></td>
                <td><a href="adminDeleteSTD.jsp?student_id=<%=resultSet.getString("student_id") %>"><button type="button" class="btn btn-danger">Delete</button></a></td>
            </tr>
        </tbody>
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
</html>

