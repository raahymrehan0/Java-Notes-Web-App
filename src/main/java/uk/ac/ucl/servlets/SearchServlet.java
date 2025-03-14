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
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/searchResult.html")
public class SearchServlet extends HttpServlet
{
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
  {
    Model model = ModelFactory.getModel();
    String searchString = request.getParameter("searchstring").toLowerCase();

    // Get all notes
    List<Note> allNotes = model.getAllNotes();

    // Sort notes by relevance to search string
    List<Note> sortedNotes = allNotes.stream()
            .sorted((note1, note2) -> {
              String title1 = note1.getTitle().toLowerCase();
              String title2 = note2.getTitle().toLowerCase();

              // Check for exact matches first
              if (title1.equals(searchString) && !title2.equals(searchString)) {
                return -1;
              }
              if (!title1.equals(searchString) && title2.equals(searchString)) {
                return 1;
              }

              // Then check for contains matches
              if (title1.contains(searchString) && !title2.contains(searchString)) {
                return -1;
              }
              if (!title1.contains(searchString) && title2.contains(searchString)) {
                return 1;
              }

              // If both contain the search string, compare by position
              if (title1.contains(searchString) && title2.contains(searchString)) {
                return Integer.compare(title1.indexOf(searchString), title2.indexOf(searchString));
              }

              // If neither contains the search string, sort alphabetically
              return title1.compareTo(title2);
            })
            .collect(Collectors.toList());

    request.setAttribute("searchResults", sortedNotes);
    request.setAttribute("searchTerm", searchString);

    // Invoke the JSP page
    ServletContext context = getServletContext();
    RequestDispatcher dispatch = context.getRequestDispatcher("/searchResult.jsp");
    dispatch.forward(request, response);
  }
}