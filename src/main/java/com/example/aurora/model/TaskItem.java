package com.example.aurora.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TaskItem {
    private final String id;
    private final String title;
    private final String description;
    private final String category;
    private final String createdAt;

    public TaskItem(String id, String title, String description, String category) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.category = category;
        this.createdAt = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
    }

    public String getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public String getCategory() {
        return category;
    }

    public String getCreatedAt() {
        return createdAt;
    }
}
