<%-- 
    Document   : updatestud
    Created on : 27.09.2020., 18.31.10
    Author     : Cvele
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String student_id = request.getParameter("student_id");
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
        String sql = "SELECT * FROM student where student_id=" + student_id;
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Menjanje korisnickih podataka studenta u bazi podataka</h1>
        <form method="post" action="update-processStud.jsp">
            <input type="hidden" name="student_id" value="<%=resultSet.getString("student_id")%>">
            Id: <br />
            <input type="text" name="student_id" value="<%=resultSet.getString("student_id")%>">
            <br />
            Ime:<br />
            <input type="text" name="student_ime" value="<%=resultSet.getString("student_ime")%>">
            <br />
            Prezime:<br />
            <input type="text" name="student_prezime" value="<%=resultSet.getString("student_prezime")%>">
            <br />
            Datum rodjenja: <br />
            <input type="text" name="student_datumRodjenja" value="<%=resultSet.getString("student_datumRodjenja")%>">
            <br />
            Pol: <br />
            <input type="text" name="student_pol" value="<%=resultSet.getString("student_pol")%>">
            <br />
            Indeks: <br />
            <input type="text" name="student_indeks" value="<%=resultSet.getString("student_indeks")%>">
            <br /> <br />
            <input type="submit" value="Update">
          
        </form>
        <%
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>