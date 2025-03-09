package uk.ac.ucl.model;

public class Note
{
    private String title;
    private String content;
    private int Id;

    public Note(int Id, String title, String content)
    {
        this.Id = Id;
        this.title = title;
        this.content = content;
    }

    public int getId()
    {
        return Id;
    }

    public void setId(int Id)
    {
        this.Id = Id;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }
}
