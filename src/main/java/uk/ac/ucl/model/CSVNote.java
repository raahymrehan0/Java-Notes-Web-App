package uk.ac.ucl.model;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

public class CSVNote
{
    Model model = ModelFactory.getModel();

    public ArrayList<Note> CSVList = new ArrayList<>(model.readFile(new File("./data/notes.csv")));

    public CSVNote() throws IOException {}
}
