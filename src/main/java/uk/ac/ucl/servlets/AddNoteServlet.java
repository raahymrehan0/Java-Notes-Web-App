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

@WebServlet("/add-note.html")
public class AddNoteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Model model = ModelFactory.getModel();

        // Get note details from the form
        String noteTitle = request.getParameter("note_title");
        String noteContent = request.getParameter("note_content");

        // Add the new note to the model
        model.addNote(noteTitle, noteContent);

        // Forward to the confirmation page
        ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/updated.jsp");
        dispatcher.forward(request, response);
    }
}