package org.example.onlinelibrary.controller;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

@WebServlet("/download")
public class BookDownloadController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mainPath = "D:\\frontend\\OnlineLibrary\\src\\main\\resources\\books\\";
        String filePath = req.getParameter("bookPath");
        File file = new File(mainPath + filePath);

        ServletContext servletContext = req.getServletContext();

        String mimeType = servletContext.getMimeType(filePath);
        resp.setContentType(mimeType);
        resp.setContentLength((int) file.length());
        resp.setHeader("Content-Disposition", "attachment; filename=\"" + file.getName() + "\"");

        FileInputStream fileInputStream = new FileInputStream(file);


        ServletOutputStream outputStream = resp.getOutputStream();

        byte[] bytes = fileInputStream.readAllBytes();
        outputStream.write(bytes);
        outputStream.flush();
        outputStream.close();
        fileInputStream.close();

    }
}
