package org.example.onlinelibrary.model;

import lombok.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Builder
@Getter
public class User extends BaseModel{
    private String name;
    private String username;
    private String password;

    public static User userMap(ResultSet resultSet) throws SQLException {
        User user = User.builder()
                .name(resultSet.getString("name"))
                .username(resultSet.getString("username"))
                .password(resultSet.getString("password"))
                .build();
        user.setId(resultSet.getObject("id", UUID.class));
        user.setCreatedDate(resultSet.getTimestamp("created_date").toLocalDateTime());
        user.setUpdatedDate(resultSet.getTimestamp("updated_date").toLocalDateTime());
        user.setIsActive(resultSet.getBoolean("is_active"));
        return user;
    }
}
