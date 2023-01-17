<%-- 
    Document   : updateprof
    Created on : 27.09.2020., 18.09.26
    Author     : Cvele
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String profesor_id = request.getParameter("profesor_id");
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
        String sql = "select * from profesor where profesor_id=" + profesor_id;
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Menjanje korisnickih podataka profesora u bazi podataka</h1>
        <form method="post" action="update-process.jsp">
            <input type="hidden" name="profesor_id" value="<%=resultSet.getString("profesor_id")%>">
            Id: <br />
            <input type="text" name="profesor_id" value="<%=resultSet.getString("profesor_id")%>">
            <br>
            Ime:<br>
            <input type="text" name="profesor_ime" value="<%=resultSet.getString("profesor_ime")%>">
            <br>
            Prezime:<br>
            <input type="text" name="profesor_prezime" value="<%=resultSet.getString("profesor_prezime")%>">
            <br>
            Pol:<br>
            <input type="text" name="profesor_pol" value="<%=resultSet.getString("profesor_pol")%>">
            <br>
            <br />
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