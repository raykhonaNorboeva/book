package org.example.onlinelibrary.service;

import org.example.onlinelibrary.model.Book;
import org.example.onlinelibrary.model.Genre;
import org.example.onlinelibrary.repository.BookRepository;
import org.example.onlinelibrary.repository.UserRepository;

import java.util.ArrayList;
import java.util.UUID;

public class BookService extends BaseService<Book, BookRepository>{
    private static final BookService bookService = new BookService();

    private BookService() {
        super(BookRepository.getInstance());
    }

    public static BookService getInstance() {
        return bookService;
    }

    public int getTotalPages() {
        return repository.getTotalPages();
    }
    public ArrayList<Book> getAllBooks(int currentPage) {
        return repository.getAllBooks(currentPage);
    }

    public ArrayList<Book> getBooksByCategory(int page, String title, String genre, String author) {
        return repository.getBooksByCategory(page, title, genre, author);
    }

    public int add(Book book) {
       return repository.add(book);
    }

    public ArrayList<Book> getUserBooks(UUID userId) {
        return repository.getUserBooks(userId);
    }

    public int deleteBook(UUID id) {
        return repository.delete(id);
    }


}
