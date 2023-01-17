<%-- 
    Document   : ocene
    Created on : 28.09.2020., 19.28.07
    Author     : Cvele
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="profesor.jsp">Pocetna</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="studenti.jsp">Studenti</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Dodaj
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="ocene.jsp">Ocenu</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="casovi.jsp">Izmeni raspored</a>
                </li>
            </ul>
        </div>
         <%

            String str = (String) session.getAttribute("username");

            out.print("Welcome " + str);

        %>
    </nav>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="//cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">

    </head>
    <body>
<br />  <form  action="ocene-proces-dodavanja.jsp"method="post"><br><br>
        <center><h4>Dodajte podatke o oceni</h4></center>
        <label>Datum</label>
        <input type="text" name="ocene_datum" id="ocene_datum" class="form-control" class="form-control" placeholder="Datum" size="30px" required> <br />
        <label>Profesor :</label>
        <input type="text" name="ocene_profesor" id="ocene_profesor" class="form-control" placeholder="Profesor" size="30px" required> <br />
        <label>Ocena:</label>
        <input type="text" name="ocene_ocena" id="ocene_ocena" class="form-control" placeholder="Ocena" size="30px"> <br />
        <label>Profesor id :</label>
        <input type="text" name="profesor_id" id="ocene_profesor" class="form-control" placeholder="Profesor" size="30px" required> <br />
        
        <input type="submit" value="Dodaj" class="btn btn-info" id="posalji"/> 


    </form>
</body>
</html>
