package uk.ac.ucl.model;

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

  private static final String NOTES_CSV_PATH = "data/notes_storage.csv";

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

  public void getNotesByCategory(String category)
  {
    List<Note> notes = readNotesFromCsv();
    for (Note n : notes)
    {
      if (n.getCategory().equals(category))
      {
        System.out.println(n.getTitle());
      }
    }
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

  public List<String> readFile(String fileName)
  {
    List<String> data = new ArrayList<>();

    try (Reader reader = new FileReader(fileName);
         CSVParser csvParser = new CSVParser(reader, CSVFormat.DEFAULT))
    {
      for (CSVRecord csvRecord : csvParser)
      {
        // The first row of the file contains the column headers, so is not actual data.
        data.add(csvRecord.get(0));
      }
    } catch (IOException e)
    {
      e.printStackTrace();
    }
    return data;
  }
}
