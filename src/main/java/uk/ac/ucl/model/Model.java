package uk.ac.ucl.model;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVPrinter;
import org.apache.commons.csv.CSVRecord;

public class Model
{

  private static final String NOTES_CSV_PATH = "data" + File.separator +  "notes_storage.csv"; // Path to the CSV file

  // Read notes from CSV
  public List<Note> readNotesFromCsv()
  {
    List<Note> notes = new ArrayList<>();
    try (Reader reader = new FileReader(NOTES_CSV_PATH);
         CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT.withHeader()))
    {
      for (CSVRecord record : csvParser)
      {
        Note n = new Note(Integer.parseInt(record.get("id")), record.get("title"), record.get("content"), record.get("URL"), record.get("image"), record.get("category"));
        notes.add(n);
      }
    }
    catch (IOException e)
    {
      e.printStackTrace();
    }
    return notes;
  }

  // Write notes to CSV
  public void writeNotesToCsv(List<Note> notes)
  {
    try (Writer writer = new FileWriter(NOTES_CSV_PATH);
         CSVPrinter csvPrinter = new CSVPrinter(
                 writer, CSVFormat.DEFAULT.withHeader("id","title","content","URL","image","category")))
    {
      for (Note note : notes)
      {
        csvPrinter.printRecord(
                note.getId(),
                note.getTitle(),
                note.getContent(),
                note.getURL(),
                note.getImageURL(),
                note.getCategory()
        );
      }

      csvPrinter.flush();
    }
    catch (IOException e)
    {
      e.printStackTrace();
    }
  }

  public List<Note> getNotesByCategory(String category)
  {
    List<Note> notes = readNotesFromCsv();
    List<Note> notesByCategory = new ArrayList<>();
    for (Note n : notes)
    {
      if (n.getCategory().equals(category))
      {
        notesByCategory.add(n);
      }
    }
    return notesByCategory;
  }

  public List<String> getAllCategories()
  {
    List<String> categories = new ArrayList<>();
    List<Note> notes = readNotesFromCsv();
    for (Note n : notes)
    {
      if (!categories.contains(n.getCategory()))
      {
        categories.add(n.getCategory());
      }
    }
    return categories;
  }

  // Add a note
  public void addNote(String title, String content, String URL, String image, String category)
  {
    List<Note> notes = readNotesFromCsv();
    int newId = notes.size() + 1;
    Note n = new Note(newId, title, content, URL, image, category);
    notes.add(n);
    writeNotesToCsv(notes);
  }

  // Get all notes
  public List<Note> getAllNotes()
  {
    return readNotesFromCsv();
  }

  // Get note by ID
  public Note getNoteById(int id)
  {
    for (Note n : getAllNotes())
    {
      if (n.getId() == id)
      {
        return n;
      }
    }
    return null;
  }

  // Delete a note
  public void deleteNote(int id)
  {
    List<Note> notes = getAllNotes();
    notes.removeIf(n -> n.getId() == id);
    writeNotesToCsv(notes);
  }

  // Edit a note
  public void editNote(int id, String newTitle, String newContent, String newURL, String newImage, String newCategory)
  {
    List<Note> notes = readNotesFromCsv();
    for (Note n : notes)
    {
      if (n.getId() == id)
      {
        if (!newTitle.isEmpty()) n.setTitle(newTitle);
        if (!newContent.isEmpty()) n.setContent(newContent);
        if (!newURL.isEmpty()) n.setURL(newURL);
        if (!newImage.isEmpty()) n.setImageURL(newImage);
        if (!newCategory.isEmpty()) n.setCategory(newCategory);
        break;
      }
    }
    writeNotesToCsv(notes);
  }
}
