package org.example.onlinelibrary.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.onlinelibrary.model.Book;
import org.example.onlinelibrary.model.Genre;
import org.example.onlinelibrary.service.BookService;
import org.example.onlinelibrary.service.FileService;
import org.example.onlinelibrary.utils.Beans;

import java.io.IOException;
import java.util.UUID;


@WebServlet({"/add-book"})
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 5, /* 5mb*/
        maxRequestSize = 1024 * 1024 * 20, /* 20 mb in total */
        fileSizeThreshold = 1024 * 20 /* 20 KB */
)
public class BookUploadController extends HttpServlet {

FileService fileService = new FileService();
BookService bookService = Beans.bookService;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String imageName = fileService.savePic(req.getPart("image"));
        String file = fileService.saveFile(req.getPart("file"));
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String genre = req.getParameter("genre");
        String author = req.getParameter("author");

        UUID userId = (UUID)req.getSession().getAttribute("userId");

        if(bookService.add(Book.builder()
                       .title(title)
                       .picturePath(imageName)
                       .ownerId(userId)
                        .author(author)
                        .bookPath(file)
                        .description(description)
                        .genre(Genre.valueOf(genre))
               .build()) == 1) {
            req.setAttribute("message", "Successfully added!");
        } else {
            req.setAttribute("message", "Book already exists!");

        }

        req.setAttribute("files", fileService.getFileList());
        req.getRequestDispatcher("add-book.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setAttribute("files", fileService.getFileList());
        req.getRequestDispatcher("add-book.jsp").forward(req, resp);
    }
}
