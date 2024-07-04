package org.example.onlinelibrary.service;

import jakarta.servlet.http.Part;
import org.example.onlinelibrary.model.MyFile;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

public class FileService {

    private String picPath = "D:\\frontend\\OnlineLibrary\\src\\main\\webapp\\pics";
    private String filePath = "D:\\frontend\\OnlineLibrary\\src\\main\\resources\\books";


    public String savePic(Part part) {
            String fileName = getFileName(part);
            try {
                part.write(picPath + File.separator + fileName);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        return fileName;
    }

    public String saveFile(Part part) {
        String fileName = getFileName(part);
        try {
            part.write(filePath + File.separator + fileName);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return fileName;
    }


    public List<MyFile> getFileList() {
        return Arrays.stream(new File(picPath).listFiles())
                .map((file) -> new MyFile(file.getName(), file.getAbsolutePath()))
                .collect(Collectors.toList());
    }


    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String field : contentDisposition.split("; ")) {
            if (field.startsWith("filename")) {
                return field.substring(10, field.length() - 1);
            }
        }
        return "file-" + UUID.randomUUID();
    }
}
