package org.example.onlinelibrary.utils;

import lombok.Getter;
import org.example.onlinelibrary.service.BookService;
import org.example.onlinelibrary.service.UserService;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Beans {

    @Getter
    private static final Connection connection;
    public static UserService userService = UserService.getInstance();
    public static BookService bookService = BookService.getInstance();
    static {
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/online_book",
                    "postgres",
                    "rayaandmaya1426"
            );
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
