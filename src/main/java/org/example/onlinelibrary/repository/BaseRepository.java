package org.example.onlinelibrary.repository;

import org.example.onlinelibrary.model.BaseModel;
import org.example.onlinelibrary.utils.Beans;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Optional;
import java.util.UUID;

public interface BaseRepository<T extends BaseModel>{
    Connection connection = Beans.getConnection();
    int add(T t);
    String update(T update);
    int delete(UUID id);
    Optional<T> findById(UUID id);
    ArrayList<T> getAll();
}
