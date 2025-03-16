# Notes Management System

## Overview

The Notes Management System is a Java web application for efficiently organising, categorising, and retrieving textual information. This application provides a user-friendly interface for managing notes with associated metadata including titles, content, URLs, images, and categories.

## Features

Notes Management: Create, view, edit, and delete notes through an intuitive web interface
Dynamic Categorisation: Organise notes into automatically generated categories
Intelligent Search: Find relevant categories with a smart search algorithm that prioritises exact matches
Smart Results Display: Shows top 3 relevant results with graceful fallback for no matches
Responsive Web Interface: Access notes from any modern web browser
## Technologies Used

Java
Jakarta Servlets
JavaServer Pages (JSP)
HTML/CSS
Maven for dependency management
CSV for data persistence
## Project Structure

 - README.md
- data
  - notes_storage.csv
- logfile.txt
- pom.xml
- src
  - main
    - java
      - uk
        - ac
          - ucl
            - main
              - Main.java
            - model
              - Model.java
              - ModelFactory.java
              - Note.java
            - servlets
              - AddNoteServlet.java
              - DeleteNoteServlet.java
              - EditNoteServlet.java
              - SearchServlet.java
              - ViewCategoriesServlet.java
              - ViewNoteServlet.java
              - ViewNotesServlet.java
    - webapp
      - META-INF
        - MANIFEST.MF
      - WEB-INF
        - web.xml
      - addNote.jsp
      - allCategories.jsp
      - editNote.jsp
      - footer.jsp
      - header.jsp
      - index.jsp
      - meta.jsp
      - search.jsp
      - searchResult.jsp
      - styles.css
      - updated.jsp
      - viewNote.jsp
      - viewNotes.jsp
- war-file
  - WebApp-1.2.war


## Setup and Installation


Ensure you have Java JDK 21 or higher installed
Install Maven
Clone this repository
Navigate to the project directory
Run mvn clean install to build the project
Run mvn exec:exec and navigate to http://localhost:8080 in your web browser

## Data Storage

Notes are stored in CSV format, providing a lightweight persistence mechanism. Each note contains:

Title
Content
URL reference
Image reference
Category

## MVC Architecture

The application follows the Model-View-Controller pattern:


Model: Handles data operations and logic

View: JSP pages for rendering content

Controller: Servlets processing HTTP requests
