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
import uk.ac.ucl.model.Note;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import java.util.stream.Collectors;

@WebServlet("/searchResult.html")
public class SearchServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Model model = ModelFactory.getModel();
        String searchInput = request.getParameter("searchstring");

        // Process search string and make it final
        final String searchString;
        if (searchInput == null || searchInput.trim().isEmpty()) {
            searchString = "";
        } else {
            searchString = searchInput.toLowerCase();
        }

        // Get all notes
        List<Note> allNotes = model.getAllNotes();
        List<Note> exactMatches = new ArrayList<>();
        List<Note> partialMatches = new ArrayList<>();

        // Separate exact and partial matches
        if (!searchString.isEmpty()) {
            for (Note note : allNotes) {
                String title = note.getTitle() != null ? note.getTitle().toLowerCase() : "";
                if (title.equals(searchString)) {
                    exactMatches.add(note);
                } else if (title.contains(searchString)) {
                    partialMatches.add(note);
                }
            }
        }

        // Create combined sorted list
        List<Note> sortedNotes = new ArrayList<>(exactMatches);
        sortedNotes.addAll(partialMatches);

        boolean hasExactMatches = !exactMatches.isEmpty();
        boolean hasResults = !sortedNotes.isEmpty();

        request.setAttribute("searchResults", sortedNotes);
        request.setAttribute("searchTerm", searchString);
        request.setAttribute("foundMatches", hasExactMatches);
        request.setAttribute("hasResults", hasResults);
        request.setAttribute("matchCount", sortedNotes.size());

        // Invoke the JSP page
        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/searchResult.jsp");
        dispatch.forward(request, response);
    }
}