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
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/searchResult.html")
public class SearchServlet extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Model model = ModelFactory.getModel();
        String searchString = request.getParameter("searchstring").toLowerCase();

        // Get all categories
        List<String> allCategories = model.getAllCategories();

        // Filter categories that match the search string
        List<String> matchingCategories = allCategories.stream()
                .filter(category -> category != null && category.toLowerCase().contains(searchString))
                .sorted((cat1, cat2) -> {
                    String cat1Lower = cat1.toLowerCase();
                    String cat2Lower = cat2.toLowerCase();

                    // Check for exact matches first
                    if (cat1Lower.equals(searchString) && !cat2Lower.equals(searchString)) {
                        return -1;
                    }
                    if (!cat1Lower.equals(searchString) && cat2Lower.equals(searchString)) {
                        return 1;
                    }

                    // If both contain the search string, compare by position
                    return Integer.compare(cat1Lower.indexOf(searchString), cat2Lower.indexOf(searchString));
                })
                .collect(Collectors.toList());

        // Store the total number of results found
        int totalResults = matchingCategories.size();
        boolean foundMatches = totalResults > 0;

        // If no matches found, just get the first 3 categories alphabetically
        List<String> topResults;
        if (!foundMatches) {
            topResults = allCategories.stream()
                    .limit(3)
                    .collect(Collectors.toList());
        } else {
            // Limit to top 3 results if more than 3 matches found
            topResults = matchingCategories.stream()
                    .limit(3)
                    .collect(Collectors.toList());
        }

        request.setAttribute("searchResults", topResults);
        request.setAttribute("totalResults", totalResults);
        request.setAttribute("searchTerm", searchString);
        request.setAttribute("foundMatches", foundMatches);

        ServletContext context = getServletContext();
        RequestDispatcher dispatch = context.getRequestDispatcher("/searchResult.jsp");
        dispatch.forward(request, response);
    }
}