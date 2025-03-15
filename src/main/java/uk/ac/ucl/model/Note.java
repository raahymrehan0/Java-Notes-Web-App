package uk.ac.ucl.model;

public class Note
{
    private String title;
    private String content;
    private String URL;
    private String imageURL;
    private int Id;
    private String category;

    public Note(int Id, String title, String content, String URL, String imageURL, String category)
    {
        this.Id = Id;
        this.title = title;
        this.content = content;
        this.URL = URL;
        this.imageURL = imageURL;
        this.category = category;

    }

    public String getURL()
    {
        return URL;
    }

    public void setURL(String URL)
    {
        this.URL = URL;
    }

    public String getImageURL()
    {
        return imageURL;
    }

    public void setImageURL(String imageURL)
    {
        this.imageURL = imageURL;
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

    public String getCategory()
    {
        return category;
    }

    public void setCategory(String category)
    {
        this.category = category;
    }
}
