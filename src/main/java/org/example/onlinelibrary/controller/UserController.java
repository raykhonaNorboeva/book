package org.example.onlinelibrary.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.onlinelibrary.model.User;
import org.example.onlinelibrary.service.UserService;
import org.example.onlinelibrary.utils.Beans;

import java.io.IOException;

@WebServlet({"/sign-up", "/sign-in"})
public class UserController extends HttpServlet {

    private final UserService userService = Beans.userService;


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = userService.signIn(username, password);
        req.getSession().setAttribute("userId", user.getId());
        req.getRequestDispatcher("main-menu.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        userService.add(User.builder()
                .name(name)
                .username(username)
                .password(password)
                .build());

        req.getRequestDispatcher("index.jsp").forward(req, resp);
    }

}
