<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Display Students</title>
</head>
<body>
    <h1>Student Information</h1>
    <table border="1">
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Class</th>
            <th>Division</th>
            <th>City</th>
        </tr>
        <% 
            // JDBC connection parameters
            String url = "jdbc:mysql://localhost:3306/students";
            String username = "root";
            String password = "admin";
            
            try {
                // Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Establish the connection
                Connection conn = DriverManager.getConnection(url, username, password);
                
                // Create a statement
                Statement stmt = conn.createStatement();
                
                // Execute the SQL query
                String query = "SELECT * FROM students_info";
                ResultSet rs = stmt.executeQuery(query);
                
                // Display the results in HTML table rows
                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("stud_id") %></td>
                        <td><%= rs.getString("stud_name") %></td>
                        <td><%= rs.getString("class") %></td>
                        <td><%= rs.getString("division") %></td>
                        <td><%= rs.getString("city") %></td>
                    </tr>
        <% 
                }
                
                // Close resources
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                out.println("Exception: " + e.getMessage());
            }
        %>
    </table>
</body>
</html>
