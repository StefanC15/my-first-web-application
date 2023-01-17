<%-- 
    Document   : profesori
    Created on : 22.09.2020., 21.13.47
    Author     : Cvele
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Profesori</title>
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
                        <a class="dropdown-item" href="adminaddProfesor.jsp">Profesora</a>
                        <a class="dropdown-item" href="adminaddStudent.jsp">Studenta</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    
</head>
<body>
   <br /> <center> <h4>Profesori </h4> </center> <br /> <br />
    <table class="table table-hover">
        <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Ime</th>
                <th scope="col">Prezime</th>
                <th scope="col">Pol</th>
                <th scope="col">Update</th>
                <th scope="col">Delete</th>
            </tr>
        </thead>

   <%  
        String driver = "com.mysql.jdbc.Driver";
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
                String sql =  "SELECT  profesor_id, profesor_ime, profesor_prezime, profesor_pol FROM student_finalno.profesor";
                        
                resultSet = statement.executeQuery(sql);
                while (resultSet.next()) {
        %>
        <tbody>
            <tr>
                <td><%=resultSet.getString("profesor_id")%></td>
                <td><%=resultSet.getString("profesor_ime")%></td>
                <td><%=resultSet.getString("profesor_prezime")%></td>
                <td><%=resultSet.getString("profesor_pol")%></td>
                <td><a href="updateprof.jsp?profesor_id=<%=resultSet.getString("profesor_id")%>"><button type="button" class="btn btn-info">Update</button></a></td>
                <td><a href="adminDeletePROF.jsp?profesor_id=<%=resultSet.getString("profesor_id") %>"><button type="button" class="btn btn-danger">Delete</button></a></td>
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
</html>