package org.example.onlinelibrary.repository;

import lombok.Getter;
import org.example.onlinelibrary.model.Book;
import org.example.onlinelibrary.model.Genre;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;
import java.util.UUID;

public class BookRepository implements BaseRepository<Book>{
    @Getter
    private static final BookRepository instance = new BookRepository();

    private BookRepository() {}

    private static final String GET_ALL_BOOKS = "select * from get_all_books(?)";
    private static final String GET_BY_CATEGORY = "select * from get_books_by_category(?, ?, ?, ?)";
    private static final String ADD_BOOK = "select * from add_book(?, ?, ?, ?, ?, ?, ?::uuid)";
    private static final String GET_USER_BOOKS = "select * from get_user_books(?::uuid)";
    private static final String DELETE_USER_BOOKS = "select * from delete_book(?::uuid)";
    private static final String GET_TOTAL_PAGES = "select * from get_all_books_active()";


    public ArrayList<Book> getUserBooks(UUID userId) {
        try(PreparedStatement preparedStatement = connection.prepareStatement(GET_USER_BOOKS)) {
            preparedStatement.setString(1, userId.toString());
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<Book> books = new ArrayList<>();
            while (resultSet.next()) {
                books.add(Book.bookMap(resultSet));
            }
            return books;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Book> getBooksByCategory(int page, String title, String genre, String author) {
        try(PreparedStatement preparedStatement = connection.prepareStatement(GET_BY_CATEGORY)) {
            preparedStatement.setInt(1, page);
            preparedStatement.setString(2, title);
            preparedStatement.setString(3, genre);
            preparedStatement.setString(4, author);
            ResultSet resultSet = preparedStatement.executeQuery();
            ArrayList<Book> books = new ArrayList<>();
            while (resultSet.next()) {
                books.add(Book.bookMap(resultSet));
            }
            return books;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getTotalPages() {
        int totalPages = 0;
        try (PreparedStatement preparedStatement = connection.prepareStatement(GET_TOTAL_PAGES)) {
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                totalPages = (int) Math.ceil(resultSet.getInt(1) / 2.0);
            }
            return totalPages;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Book> getAllBooks(int currentPage) {
        ArrayList<Book> books = new ArrayList<>();
        try(PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_BOOKS)) {
            preparedStatement.setInt(1, currentPage);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                books.add(Book.bookMap(resultSet));
            }
            return books;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


    @Override
    public int add(Book book) {
    try(PreparedStatement preparedStatement = connection.prepareStatement(ADD_BOOK)) {
        preparedStatement.setString(1, book.getTitle());
        preparedStatement.setString(2, book.getDescription());
        preparedStatement.setString(3, book.getAuthor());
        preparedStatement.setString(4, book.getPicturePath());
        preparedStatement.setString(5, book.getBookPath());
        preparedStatement.setString(6, book.getGenre().toString());
        preparedStatement.setString(7, book.getOwnerId().toString());
        ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();
        return resultSet.getInt(1);
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
    }

    @Override
    public String update(Book update) {
        return "";
    }

    @Override
    public int delete(UUID id) {
        try(PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_BOOKS)) {
            preparedStatement.setString(1, id.toString());
            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
                return resultSet.getInt(1);
            }
            else return -1;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Optional<Book> findById(UUID id) {
        return Optional.empty();
    }

    @Override
    public ArrayList<Book> getAll() {
     return null;
    }
}
