import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EbookshopServlet")
public class EbookshopServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String title = "Ebookshop Database";
        String docType = "<!DOCTYPE html>";

        out.println(docType + "<html>\n" + "<head><title>" + title + "</title></head>\n" + "<body>");

        try {
            // Replace with your MySQL connection details
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet_test", "root", "");

            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery("SELECT * FROM ebookshop");

            out.println("<table border=\"1\" cellpadding=\"5\">");
            out.println("<caption>Ebookshop</caption>");
            out.println("<tr><th>Book ID</th><th>Book Title</th><th>Book Author</th><th>Book Price</th><th>Quantity</th></tr>");

            while (result.next()) {
                int bookId = result.getInt("book_id");
                String bookTitle = result.getString("book_title");
                String bookAuthor = result.getString("book_author");
                double bookPrice = result.getDouble("book_price");
                int quantity = result.getInt("quantity");

                out.println("<tr><td>" + bookId + "</td><td>" + bookTitle + "</td><td>" + bookAuthor + "</td><td>" + bookPrice + "</td><td>" + quantity + "</td></tr>");
            }
            out.println("</table>");

            result.close();
            statement.close();
            connection.close();

        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        }

        out.println("</body></html>");
    }
}
