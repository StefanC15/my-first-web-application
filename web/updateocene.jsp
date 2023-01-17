<%-- 
    Document   : updateocena
    Created on : 28.09.2020., 19.35.43
    Author     : Cvele
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String ocene_id = request.getParameter("ocene_id");
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
        String sql = "SELECT ocene_datum, ocene_profesor, ocene_ocena, profesor_id FROM ocene o INNER JOIN profesor p ON o.ocene_id = p.profesor_id where ocene_id=" + ocene_id;
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Menjanje korisnickih podataka profesora u bazi podataka</h1>
        <form method="post" action="update-process-ocene.jsp">
            <input type="hidden" name="ocene_id" value="<%=resultSet.getString("ocene_id")%>">
            Id: <br />
            <input type="text" name="ocene_id" value="<%=resultSet.getString("ocene_id")%>">
            <br>
            Datum:<br>
            <input type="text" name="ocene_datum" value="<%=resultSet.getString("ocene_datum")%>">
            <br>
            Profesor:<br>
            <input type="text" name="ocene_profesor" value="<%=resultSet.getString("ocene_profesor")%>">
            <br>
            Ocena:<br>
            <input type="text" name="ocene_ocena" value="<%=resultSet.getString("ocene_ocena")%>">
            <br>
            Profesor id:<br>
            <input type="text" name="profesor_id" value="<%=resultSet.getString("ocene_profesor")%>">
          
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