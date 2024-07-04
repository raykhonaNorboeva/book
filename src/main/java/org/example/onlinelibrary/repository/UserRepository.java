package org.example.onlinelibrary.repository;

import lombok.Getter;
import org.example.onlinelibrary.model.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Optional;
import java.util.UUID;

public class UserRepository implements BaseRepository<User>{
    @Getter
    private static final UserRepository instance = new UserRepository();

    private UserRepository() {}

    private static final String ADD = "select * from add_user(?, ?, ?)";
    private static final String SIGN_IN = "select * from sign_in(?, ?)";

    public int add(User user) {
        try(PreparedStatement preparedStatement = connection.prepareStatement(ADD)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getUsername());
            preparedStatement.setString(3, user.getPassword());
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            return resultSet.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public String update(User update) {
        return "";
    }

    @Override
    public int delete(UUID id) {
        return 1;
    }

    @Override
    public Optional<User> findById(UUID id) {
        return Optional.empty();
    }

    @Override
    public ArrayList<User> getAll() {
        return null;
    }

    public Optional<User> signIn(String username, String password) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SIGN_IN);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return Optional.of(User.userMap(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return Optional.empty();
    }
}
