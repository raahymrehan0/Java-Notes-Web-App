package uk.ac.ucl.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uk.ac.ucl.model.Model;
import uk.ac.ucl.model.ModelFactory;

@WebServlet("/allCategories.html")
public class ViewCategoriesServlet extends HttpServlet
{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Model model = ModelFactory.getModel();
        List<String> categories = model.getAllCategories();  // Retrieve all notes
        request.setAttribute("categories", categories);

        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/allCategories.jsp");
        dispatch.forward(request, response);
    }
}
