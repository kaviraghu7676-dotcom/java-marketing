package com.example.aurora.service;

import com.example.aurora.model.TaskItem;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

public final class TaskStore {

    private static final TaskStore STORE = new TaskStore();

    private final Map<String, TaskItem> taskDatabase = new ConcurrentHashMap<>();

    private TaskStore() {
        loadInitialTasks();
    }

    public static TaskStore getInstance() {
        return STORE;
    }

    public List<TaskItem> getAllTasks() {
        return new ArrayList<>(taskDatabase.values());
    }

    public TaskItem addTask(String title, String description, String category) {

        String taskTitle = normalize(title);
        String taskDescription = normalize(description);
        String taskCategory = normalize(category);

        if (taskTitle.isBlank()) {
            throw new IllegalArgumentException("Task title cannot be empty.");
        }

        if (taskCategory.isBlank()) {
            taskCategory = "General";
        }

        String taskId = generateTaskId();

        TaskItem newTask = new TaskItem(
                taskId,
                taskTitle,
                taskDescription,
                taskCategory
        );

        taskDatabase.put(taskId, newTask);

        return newTask;
    }

    public void deleteTask(String taskId) {
        if (taskId == null || taskId.isBlank()) {
            return;
        }

        taskDatabase.remove(taskId);
    }

    public long count() {
        return taskDatabase.size();
    }

    public boolean containsTask(String taskId) {
        return taskId != null && taskDatabase.containsKey(taskId);
    }

    private String generateTaskId() {
        return UUID.randomUUID().toString();
    }

    private String normalize(String value) {
        return value == null ? "" : value.trim();
    }

    private void loadInitialTasks() {

        addTask(
                "Prepare marketing campaign",
                "Complete the campaign plan and coordinate with the design team.",
                "Marketing"
        );

        addTask(
                "Improve user onboarding",
                "Check the registration and first-time user experience.",
                "Product"
        );

        addTask(
                "Audit portal security",
                "Review authentication and user access permissions.",
                "Security"
        );
    }
    }
