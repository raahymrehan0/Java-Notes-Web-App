package uk.ac.ucl.model;

import java.io.BufferedWriter;
import java.io.Reader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.apache.commons.csv.CSVPrinter;

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
        Note n = new Note();
        n.setId(Integer.parseInt(record.get("id")));
        n.setTitle(record.get("title"));
        n.setContent(record.get("content"));
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
    try (BufferedWriter writer = Files.newBufferedWriter(Paths.get(NOTES_CSV_PATH));
         CSVPrinter csvPrinter = new CSVPrinter(writer,
                 CSVFormat.DEFAULT.withHeader("id","title","content")))
    {
      for (Note note : notes)
      {
        csvPrinter.printRecord(note.getId(), note.getTitle(), note.getContent());
      }
      csvPrinter.flush();
    }
    catch (IOException e)
    {
      e.printStackTrace();
    }
  }

  // Add a note
  public void addNote(String title, String content)
  {
    List<Note> notes = readNotesFromCsv();
    int newId = notes.size() + 1;
    Note n = new Note();
    n.setId(newId);
    n.setTitle(title);
    n.setContent(content);
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
    for (Note n : readNotesFromCsv())
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
    List<Note> notes = readNotesFromCsv();
    notes.removeIf(n -> n.getId() == id);
    writeNotesToCsv(notes);
  }

  // Edit a note
  public void editNote(int id, String newTitle, String newContent)
  {
    List<Note> notes = readNotesFromCsv();
    for (Note n : notes)
    {
      if (n.getId() == id)
      {
        if (!newTitle.isEmpty()) n.setTitle(newTitle);
        if (!newContent.isEmpty()) n.setContent(newContent);
        break;
      }
    }
    writeNotesToCsv(notes);
  }

  // The example code in this class should be replaced by your Model class code.
  // The data should be stored in a suitable data structure.

  public List<String> getPatientNames()
  {
    return readFile("data/patients100.csv");
  }

  // This method illustrates how to read csv data from a file.
  // The data files are stored in the root directory of the project (the directory your project is in),
  // in the directory named data.
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

  // This also returns dummy data. The real version should use the keyword parameter to search
  // the data and return a list of matching items.
  public List<String> searchFor(String keyword)
  {
    return List.of("Search keyword is: "+ keyword, "result1", "result2", "result3");
  }
}
