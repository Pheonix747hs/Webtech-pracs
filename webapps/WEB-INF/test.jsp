<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.mysql.jdbc.Driver" %>

<%! String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost/3306/students";
    String name = "root";
    String pass = "admin";
%>

<html>
<head>
    <title>testJSP</title>
</head>
<body>
    <p>Attempting to open JDBC connection to: <%= url %></p>

    <% 
    try {
        String tableStr = "CREATE TABLE test (testid mediumint(8), name varchar(100))";
        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, name, pass);
        Statement stat = con.createStatement();
        %>
        <p>Executing: <%= tableStr %></p>
        <% stat.executeUpdate(tableStr); %>
        <p>Success...</p>
        <% con.close();
    } catch (SQLException sqle) {
        out.println("<p>Error opening JDBC, cause:</p><b>" + sqle + "</b>");
    } catch (ClassNotFoundException cnfe) {
        out.println("<p>Error opening JDBC, cause:</p><b>" + cnfe + "</b>");
    }
    %>
</body>
</html>
