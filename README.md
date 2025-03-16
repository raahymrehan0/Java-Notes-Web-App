# Notes Management System

## Overview

The Notes Management System is a Java web application for efficiently organizing, categorizing, and retrieving textual information. This application provides a user-friendly interface for managing notes with associated metadata including titles, content, URLs, images, and categories.

## Features

Notes Management: Create, view, edit, and delete notes through an intuitive web interface
Dynamic Categorization: Organize notes into automatically generated categories
Intelligent Search: Find relevant categories with a smart search algorithm that prioritizes exact matches
Smart Results Display: Shows top 3 relevant results with graceful fallback for no matches
Responsive Web Interface: Access notes from any modern web browser
<span>## Technologies Used</span>

Java
Jakarta Servlets
JavaServer Pages (JSP)
HTML/CSS
Maven for dependency management
CSV for data persistence
## Project Structure

 src/ ├── main/ │ ├── java/ │ │ └── uk/ │ │ └── ac/ │ │ └── ucl/ │ │ ├── model/ │ │ │ ├── Model.java │ │ │ ├── ModelFactory.java │ │ │ └── Note.java │ │ └── servlets/ │ │ ├── AddNoteServlet.java │ │ ├── DeleteNoteServlet.java │ │ ├── EditNoteServlet.java │ │ ├── SearchServlet.java │ │ ├── ViewCategoriesServlet.java │ │ └── ViewNotesServlet.java │ ├── resources/ │ │ └── notes.csv │ └── webapp/ │ ├── footer.jsp │ ├── header.jsp │ ├── meta.jsp │ ├── search.jsp │ ├── searchResult.jsp │ ├── styles.css │ └── viewNotes.jsp ├── pom.xml └── README.md

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


Model: Handles data operations and business logic
View: JSP pages for rendering content
Controller: Servlets processing HTTP requests
