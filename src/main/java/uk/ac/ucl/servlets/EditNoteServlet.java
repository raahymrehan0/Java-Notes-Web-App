package uk.ac.ucl.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uk.ac.ucl.model.Model;
import uk.ac.ucl.model.ModelFactory;


import java.io.IOException;

@WebServlet("/edit-note.html")
public class EditNoteServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Model model = ModelFactory.getModel();

        String stringId = request.getParameter("id");   //get current list's ID from URL query string
        int noteId = Integer.parseInt(stringId);

        //get list contents from webpage form
        String noteTitle = request.getParameter("list_name");
        String noteContent = request.getParameter("list_text");

        model.editNote(noteId, noteTitle, noteContent);

        ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/updated.jsp");
        dispatcher.forward(request, response);
    }
}
