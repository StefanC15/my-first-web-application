<%-- 
    Document   : checklogin
    Created on : 22.09.2020., 14.52.55
    Author     : Cvele
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <%
    String name = request.getParameter("korisnik_korisnickoIme");
    String pass = request.getParameter("korisnik_sifra");

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student_finalno", "root", "123456");

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from korisnik");

        String rolaKorisnika = "";
        String korisnickoIme;
        String lozinka;

        while(rs.next()) {
            korisnickoIme = rs.getString("korisnik_korisnickoIme");
            lozinka = rs.getString("korisnik_sifra");

            if (korisnickoIme.equals(name) && lozinka.equals(pass)) {
                rolaKorisnika = rs.getString("korisnik_rol");
                break;
            }
        }

        if (rolaKorisnika.equals("student")) {
            response.sendRedirect("student.jsp");

        } else if (rolaKorisnika.equals("admin")) {
            response.sendRedirect("admin.jsp");

        } else if(rolaKorisnika.equals("profesor")) {
            response.sendRedirect("profesor.jsp");

        } else {
            out.println("Podaci koje ste uneli nisu ispravni, pokušajte ponovo!");
        }
%>

<jsp:include page="index.html"/>
    <%}
     catch (Exception e) {
        out.println(e);
    }

    session.setAttribute("username", name);
%>
