package uk.ac.ucl.servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import uk.ac.ucl.model.Model;
import uk.ac.ucl.model.ModelFactory;
import uk.ac.ucl.model.Note;

@WebServlet("/view-note.html")
public class ViewNoteServlet extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        Model model = ModelFactory.getModel();

        String paramId = request.getParameter("id");
        int noteId = Integer.parseInt(paramId);

        Note note = model.getNoteById(noteId);

        if (note != null)
        {
            request.setAttribute("noteId", note.getId());
            request.setAttribute("noteTitle", note.getTitle());
            request.setAttribute("noteContent", note.getContent());
        }

        ServletContext context = getServletContext();
        RequestDispatcher dispatcher = context.getRequestDispatcher("/viewNote.jsp");
        dispatcher.forward(request, response);
    }
}
