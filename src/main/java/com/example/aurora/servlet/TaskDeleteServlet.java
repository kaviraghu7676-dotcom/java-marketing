package com.example.aurora.servlet;

import com.example.aurora.service.TaskStore;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/tasks/delete")
public class TaskDeleteServlet extends HttpServlet {
    private final TaskStore taskStore = TaskStore.getInstance();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        taskStore.deleteTask(id);
        response.sendRedirect(request.getContextPath() + "/");
    }
}
