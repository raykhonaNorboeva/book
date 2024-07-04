package org.example.onlinelibrary.model;

import lombok.*;

import java.time.LocalDateTime;
import java.util.UUID;

@Getter
@Setter
public abstract class BaseModel {
    protected UUID id;
    protected LocalDateTime createdDate;
    protected LocalDateTime updatedDate;
    protected Boolean isActive;
}
