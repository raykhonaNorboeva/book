package org.example.onlinelibrary.service;

import org.example.onlinelibrary.model.User;
import org.example.onlinelibrary.repository.UserRepository;

import java.util.Optional;

public class UserService extends BaseService<User, UserRepository>{
    private static final UserService userService = new UserService();

    private UserService() {
        super(UserRepository.getInstance());
    }

    public static UserService getInstance() {
        return userService;
    }

    public int add(User user) {
        return repository.add(user);
    }

    public User signIn(String username, String password) {
        Optional<User> user = repository.signIn(username, password);
        return user.orElseThrow(() -> new RuntimeException("user not found"));
    }
}
