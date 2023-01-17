<%-- 
    Document   : adminaddProfesor
    Created on : 24.09.2020., 17.29.44
    Author     : Cvele
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dodaj Profesora</title>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
</head>
<body>
    <br /><center><h4>Dodajte profesora</h4></center> <br /> <br />
    <form action="adminProcesDodavanjaprof.jsp" method="post">
        <label>Ime:</label>
        <input type="text" name="profesor_ime" id="profesor_ime" class="form-control" placeholder="Ime profesora" size="30px" required > <br />
        <label>Prezime</label>
        <input type="text" name="profesor_prezime" id="profesor_prezime" class="form-control" placeholder="Prezime" size="30px" required> <br />
        <label>Pol</label>
        <input type="text" name="profesor_pol" id="profesor_pol" class="form-control" placeholder="Pol" size="30px" required > <br />
        <label>Skola</label>
        <input type="text" name="skola_id" id="skola_id" class="form-control" placeholder="Skola" size="30px"value="1" > <br /> 
        <input type="submit" value="Dodaj" class="btn btn-info" id="posalji"/> 
    </form>
</body>
</html>
