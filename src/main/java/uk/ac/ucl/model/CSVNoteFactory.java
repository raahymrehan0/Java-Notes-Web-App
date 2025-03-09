package uk.ac.ucl.model;

import java.io.IOException;

public class CSVNoteFactory
{
    private static CSVNote csvNote;

    public static CSVNote getCSVNote() throws IOException
    {
        if (csvNote == null)
        {
            csvNote = new CSVNote();
        }
        return csvNote;
    }
}
