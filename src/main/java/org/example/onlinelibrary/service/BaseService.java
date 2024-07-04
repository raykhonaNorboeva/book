package org.example.onlinelibrary.service;

import org.example.onlinelibrary.model.BaseModel;
import org.example.onlinelibrary.repository.BaseRepository;

public class BaseService<T extends BaseModel, R extends BaseRepository<T>>{
    protected R repository;

    public BaseService(R repository) {
        this.repository = repository;
    }
}
