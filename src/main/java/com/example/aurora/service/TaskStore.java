package com.example.aurora.service;

import com.example.aurora.model.TaskItem;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

public class TaskStore {
    private static final TaskStore INSTANCE = new TaskStore();
    private final Map<String, TaskItem> tasks = new ConcurrentHashMap<>();

    private TaskStore() {
        seedDemoTasks();
    }

    public static TaskStore getInstance() {
        return INSTANCE;
    }

    public List<TaskItem> getAllTasks() {
        return Collections.unmodifiableList(new ArrayList<>(tasks.values()));
    }

    public TaskItem addTask(String title, String description, String category) {
        String cleanTitle = title == null ? "" : title.trim();
        String cleanDescription = description == null ? "" : description.trim();
        String cleanCategory = category == null ? "General" : category.trim();

        if (cleanTitle.isEmpty()) {
            throw new IllegalArgumentException("Task title is required.");
        }

        TaskItem task = new TaskItem(UUID.randomUUID().toString(), cleanTitle, cleanDescription, cleanCategory);
        tasks.put(task.getId(), task);
        return task;
    }

    public void deleteTask(String id) {
        if (id != null) {
            tasks.remove(id);
        }
    }

    public long count() {
        return tasks.size();
    }

    private void seedDemoTasks() {
        addTask("Launch campaign brief", "Finalize the Friday launch story with design and product teams.", "Marketing");
        addTask("Fix onboarding flow", "Address the flow for new users creating their first workspace.", "Product");
        addTask("Review security checklist", "Verify MFA and access control settings for the new client portal.", "Operations");
    }
}
