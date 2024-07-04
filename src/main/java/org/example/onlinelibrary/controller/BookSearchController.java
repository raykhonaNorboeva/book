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
import java.util.List;

@WebServlet({"/search-book"})
public class BookSearchController extends HttpServlet {

    private final BookService bookService = Beans.bookService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String genre = req.getParameter("genre");
        String author = req.getParameter("author");

        int currentPage = 1;
        if (req.getParameter("page") != null) {
            currentPage = Integer.parseInt(req.getParameter("page"));
        }

        List<Book> books = bookService.getBooksByCategory(currentPage, title, genre, author);
        int totalPages = bookService.getTotalPages();

        req.setAttribute("books", books);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("totalPages", totalPages);

        req.getRequestDispatcher("get-all-books.jsp").forward(req, resp);
    }
}
