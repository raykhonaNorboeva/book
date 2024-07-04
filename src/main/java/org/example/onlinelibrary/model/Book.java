package org.example.onlinelibrary.model;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Book extends BaseModel{
    private String title;
    private String description;
    private String author;
    private String picturePath;
    private String bookPath;
    private Genre genre;
    private UUID ownerId;

    public static Book bookMap(ResultSet resultSet) throws SQLException {
        Book user = Book.builder()
                .title(resultSet.getString("title"))
                .description(resultSet.getString("description"))
                .author(resultSet.getString("author"))
                .picturePath(resultSet.getString("picture_path"))
                .bookPath(resultSet.getString("book_path"))
                .genre(Genre.valueOf(resultSet.getString("genre")))
                .ownerId(resultSet.getObject("owner_id", UUID.class))
                .build();
        user.setId(resultSet.getObject("id", UUID.class));
        user.setCreatedDate(resultSet.getTimestamp("created_date").toLocalDateTime());
        user.setUpdatedDate(resultSet.getTimestamp("updated_date").toLocalDateTime());
        user.setIsActive(resultSet.getBoolean("is_active"));
        return user;
    }
}
