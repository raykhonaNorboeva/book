package org.example.onlinelibrary.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.onlinelibrary.model.Book;
import org.example.onlinelibrary.service.BookService;
import org.example.onlinelibrary.utils.Beans;

import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

@WebServlet({"/user-books"})
public class UserBooksController extends HttpServlet {

    BookService bookService = Beans.bookService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    ArrayList<Book> books = bookService.getUserBooks((UUID) req.getSession().getAttribute("userId"));
     req.setAttribute("books", books);

        req.getRequestDispatcher("show-user-books.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookId = req.getParameter("bookId");

        int i = bookService.deleteBook(UUID.fromString(bookId));

        if(i == -1) {
            req.setAttribute("message", "Something went wrong!");
        }

        ArrayList<Book> books = bookService.getUserBooks((UUID) req.getSession().getAttribute("userId"));
        req.setAttribute("books", books);
        req.getRequestDispatcher("show-user-books.jsp").forward(req, resp);
    }
}
