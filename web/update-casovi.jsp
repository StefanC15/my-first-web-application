<%-- 
    Document   : update-casovi
    Created on : 30.09.2020., 19.11.58
    Author     : Cvele
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String casovi_id = request.getParameter("casovi_id");
    String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "student_finalno";
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
        connection = DriverManager.getConnection(connectionUrl + database, userid, password);
        statement = connection.createStatement();
        String sql = "select * from casovi where casovi_id=" + casovi_id;
        resultSet = statement.executeQuery(sql);
        while (resultSet.next()) {
%>
<!DOCTYPE html>
<html>
    <body>
        <h1>Update data from database in jsp</h1>
        <form method="post" action="update-proces-casovi.jsp">
            <input type="hidden" name="casovi_id" value="<%=resultSet.getString("casovi_id")%>">
            <input type="text" name="casovi_id" value="<%=resultSet.getString("casovi_id")%>">
            <br>
            ID:<br>
            <input type="text" name="casovi_id" value="<%=resultSet.getString("casovi_id")%>">
            <br>
            Vreme:<br>
            <input type="text" name="casovi_vreme" value="<%=resultSet.getString("casovi_vreme")%>">
            <br><br>
            <input type="submit" value="submit">
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