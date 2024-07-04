package org.example.onlinelibrary.filters;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebFilter(urlPatterns = {"/books"})
public class Filter extends HttpFilter {

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        if (req.getSession().getAttribute("userId") != null) {
           chain.doFilter(req, res);
        }
        req.setAttribute("message", "please sign in");
        req.getRequestDispatcher("sign-in.jsp").forward(req, res);
    }
}
