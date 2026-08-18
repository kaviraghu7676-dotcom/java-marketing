package com.example.aurora.servlet;

import com.example.aurora.model.TaskItem;
import com.example.aurora.service.TaskStore;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/")
public class DashboardServlet extends HttpServlet {
    private final TaskStore taskStore = TaskStore.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<TaskItem> tasks = taskStore.getAllTasks();
        request.setAttribute("tasks", tasks);
        request.setAttribute("totalTasks", taskStore.count());
        request.setAttribute("categories", List.of("Marketing", "Product", "Operations", "General"));
        request.getRequestDispatcher("/WEB-INF/views/dashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String category = request.getParameter("category");

        try {
            taskStore.addTask(title, description, category);
            response.sendRedirect(request.getContextPath() + "/");
        } catch (IllegalArgumentException ex) {
            response.sendRedirect(request.getContextPath() + "/?error=" + java.net.URLEncoder.encode(ex.getMessage(), java.nio.charset.StandardCharsets.UTF_8));
        }
    }
}
