package Post;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by Marysia on 13.06.2017.
 */
public class Servlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        PrintWriter out = response.getWriter();

        out.println("Wczytanie 3 parametrow z zadania :");
        out.println(request.getParameter("nazwa"));
        out.println(request.getParameter("komentarz"));
        out.println(request.getParameter("parametr3"));
        out.close();

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }
}
