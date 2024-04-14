<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
    <title>Learner Directory</title>
    <style>
        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .card {
            width: 30%;
            background-color: #f2f2f2;
            padding: 20px;
            box-sizing: border-box;
            margin-bottom: 20px;
        }

        @media (max-width: 768px) {
            .card {
                width: 48%;
            }
        }

        @media (max-width: 480px) {
            .card {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <h1>Learner Directory</h1>

    <%
        String dbUrl = "jdbc:mysql://localhost:3306/academy";
        String dbUser = "root";
        String dbPassword = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            Statement stmt = conn.createStatement();

            String query = "SELECT * FROM learners_tbl";
            ResultSet rs = stmt.executeQuery(query);
    %>

    <div class="card-container">
        <%
            int cardCount = 0;
            while (rs.next()) {
                if (cardCount % 3 == 0 && cardCount != 0) {
                    out.println("<div style='clear: both;'></div>"); 
                }
        %>
        <div class="card">
            <h3><%= rs.getString("full_name") %></h3>
            <p>Learner ID: <%= rs.getInt("learner_id") %></p>
            <p>Year Level: <%= rs.getString("year_level") %></p>
            <p>Track: <%= rs.getString("track") %></p>
            <p>Location: <%= rs.getString("location") %></p>
        </div>
        <%
                cardCount++;
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }
        %>
    </div>
</body>
</html>