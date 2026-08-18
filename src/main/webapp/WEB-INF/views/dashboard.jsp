<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aurora Portal</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg: #07111f;
            --panel: rgba(18, 31, 49, 0.88);
            --panel-soft: rgba(11, 20, 31, 0.7);
            --text: #eaf6ff;
            --muted: #9ab6cd;
            --primary: #6ee7f9;
            --secondary: #8b5cf6;
            --accent: #34d399;
            --warning: #fbbf24;
            --danger: #f87171;
            --border: rgba(158, 177, 196, 0.18);
        }

        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background:
                radial-gradient(circle at top left, rgba(110, 231, 249, 0.18), transparent 25%),
                radial-gradient(circle at bottom right, rgba(139, 92, 246, 0.18), transparent 25%),
                var(--bg);
            color: var(--text);
        }

        .app-shell {
            max-width: 1280px;
            margin: 0 auto;
            padding: 48px 24px 72px;
        }

        .topbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 32px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 1.1rem;
            font-weight: 700;
            letter-spacing: 0.08em;
            text-transform: uppercase;
        }

        .brand-badge {
            width: 14px;
            height: 14px;
            border-radius: 50%;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            box-shadow: 0 0 18px rgba(110, 231, 249, 0.8);
        }

        .nav {
            display: flex;
            gap: 12px;
            color: var(--muted);
            font-size: 0.9rem;
        }

        .nav a {
            color: var(--muted);
            text-decoration: none;
            padding: 8px 12px;
            border-radius: 999px;
            transition: 0.2s ease;
        }

        .nav a:hover {
            background: rgba(255,255,255,0.04);
            color: var(--text);
        }

        .hero {
            display: grid;
            grid-template-columns: 1.5fr 1fr;
            gap: 24px;
            margin-bottom: 28px;
        }

        .panel {
            background: var(--panel);
            border: 1px solid var(--border);
            border-radius: 22px;
            box-shadow: 0 30px 60px rgba(3, 6, 12, 0.35);
        }

        .hero-card {
            padding: 28px 28px 22px;
            min-height: 220px;
            position: relative;
            overflow: hidden;
        }

        .hero-card::after {
            content: "";
            position: absolute;
            width: 220px;
            height: 220px;
            right: -40px;
            bottom: -70px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(110,231,249,0.18), transparent 60%);
        }

        .eyebrow {
            color: var(--primary);
            letter-spacing: 0.12em;
            text-transform: uppercase;
            font-size: 0.72rem;
            font-weight: 700;
        }

        h1 {
            margin: 18px 0 10px;
            font-size: clamp(2.2rem, 4vw, 4rem);
            line-height: 1;
            letter-spacing: -0.06em;
        }

        .hero-copy {
            color: var(--muted);
            font-size: 1.05rem;
            max-width: 52ch;
            line-height: 1.7;
        }

        .cta-row {
            display: flex;
            gap: 14px;
            margin-top: 26px;
            flex-wrap: wrap;
        }

        .button {
            border: 0;
            border-radius: 12px;
            cursor: pointer;
            padding: 12px 18px;
            font-weight: 700;
            font-size: 0.96rem;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .button:hover {
            transform: translateY(-1px);
        }

        .button-primary {
            background: linear-gradient(135deg, var(--primary), #8ef0ff);
            color: #02151d;
            box-shadow: 0 14px 32px rgba(110, 231, 249, 0.25);
        }

        .button-secondary {
            background: rgba(255,255,255,0.04);
            border: 1px solid rgba(255,255,255,0.08);
            color: var(--text);
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(2, minmax(120px, 1fr));
            gap: 16px;
            padding: 28px;
        }

        .metric {
            background: var(--panel-soft);
            border-radius: 18px;
            border: 1px solid rgba(255,255,255,0.05);
            padding: 18px 16px;
        }

        .metric-value {
            font-size: 1.9rem;
            font-weight: 800;
            letter-spacing: -0.05em;
        }

        .metric-label {
            margin-top: 8px;
            color: var(--muted);
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.08em;
        }

        .content-grid {
            display: grid;
            grid-template-columns: 1.3fr 0.7fr;
            gap: 24px;
        }

        .tasks-panel,
        .form-panel {
            padding: 24px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }

        .section-header h2 {
            margin: 0;
            font-size: 1.2rem;
        }

        .tag {
            font-size: 0.76rem;
            padding: 8px 10px;
            border-radius: 999px;
            background: rgba(52, 211, 153, 0.12);
            color: var(--accent);
            border: 1px solid rgba(52, 211, 153, 0.18);
        }

        .task-list {
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        .task-item {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            gap: 14px;
            background: rgba(255,255,255,0.02);
            border: 1px solid rgba(255,255,255,0.06);
            border-radius: 16px;
            padding: 16px 14px;
        }

        .task-main {
            display: flex;
            gap: 12px;
            flex: 1;
        }

        .task-bullet {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            margin-top: 8px;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            box-shadow: 0 0 12px rgba(110, 231, 249, 0.7);
        }

        .task-title {
            margin: 0 0 6px;
            font-size: 1.02rem;
        }

        .task-meta {
            color: var(--muted);
            font-size: 0.8rem;
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .task-description {
            margin: 8px 0 0;
            color: var(--muted);
            line-height: 1.6;
        }

        .task-actions {
            display: flex;
            align-items: center;
            gap: 10px;
            flex-shrink: 0;
        }

        .pill {
            background: rgba(139, 92, 246, 0.14);
            color: #d9d1ff;
            border: 1px solid rgba(139, 92, 246, 0.18);
            border-radius: 999px;
            padding: 7px 10px;
            font-size: 0.72rem;
            font-weight: 600;
        }

        .delete-form {
            margin: 0;
        }

        .delete-btn {
            border: 1px solid rgba(248, 113, 113, 0.26);
            background: rgba(248, 113, 113, 0.08);
            color: #fecaca;
            padding: 8px 10px;
            border-radius: 10px;
            cursor: pointer;
            font-weight: 600;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        label {
            display: flex;
            flex-direction: column;
            gap: 8px;
            color: var(--muted);
            font-size: 0.88rem;
            font-weight: 600;
        }

        input, textarea, select {
            width: 100%;
            background: rgba(12, 20, 31, 0.8);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 12px;
            color: var(--text);
            padding: 12px 14px;
            font: inherit;
        }

        textarea {
            min-height: 110px;
            resize: vertical;
        }

        .error-message {
            padding: 12px 14px;
            border: 1px solid rgba(248,113,113,0.26);
            background: rgba(248,113,113,0.06);
            color: #fecaca;
            border-radius: 12px;
            margin-bottom: 14px;
        }

        @media (max-width: 900px) {
            .hero, .content-grid {
                grid-template-columns: 1fr;
            }

            .topbar {
                flex-direction: column;
                align-items: flex-start;
                gap: 16px;
            }
        }
    </style>
</head>
<body>
    <div class="app-shell">
        <header class="topbar">
            <div class="brand">
                <span class="brand-badge"></span>
                Aurora Portal
            </div>
            <nav class="nav">
                <a href="#">Overview</a>
                <a href="#">Insights</a>
                <a href="#">Projects</a>
                <a href="#">Settings</a>
            </nav>
        </header>

        <section class="hero">
            <div class="panel hero-card">
                <div class="eyebrow">Operational pulse</div>
                <h1>Build the next signal.</h1>
                <p class="hero-copy">
                    Launch smarter routines, coordinate your teams, and turn raw work into a beautiful operating rhythm.
                </p>
                <div class="cta-row">
                    <a class="button button-primary" href="#task-form">Add new task</a>
                    <a class="button button-secondary" href="#task-list">View workflow</a>
                </div>
            </div>

            <div class="panel stats">
                <div class="metric">
                    <div class="metric-value">${totalTasks}</div>
                    <div class="metric-label">Open items</div>
                </div>
                <div class="metric">
                    <div class="metric-value">12</div>
                    <div class="metric-label">Active sprints</div>
                </div>
                <div class="metric">
                    <div class="metric-value">94%</div>
                    <div class="metric-label">Efficiency</div>
                </div>
                <div class="metric">
                    <div class="metric-value">+21%</div>
                    <div class="metric-label">Momentum</div>
                </div>
            </div>
        </section>

        <main class="content-grid">
            <section class="panel tasks-panel">
                <div class="section-header">
                    <h2>Workflow board</h2>
                    <span class="tag">Live activity</span>
                </div>

                <div class="task-list" id="task-list">
                    <c:forEach var="task" items="${tasks}">
                        <article class="task-item">
                            <div class="task-main">
                                <span class="task-bullet"></span>
                                <div>
                                    <h3 class="task-title">${task.title}</h3>
                                    <div class="task-meta">
                                        <span>${task.category}</span>
                                        <span>•</span>
                                        <span>${task.createdAt}</span>
                                    </div>
                                    <p class="task-description">${task.description}</p>
                                </div>
                            </div>
                            <div class="task-actions">
                                <span class="pill">Priority</span>
                                <form class="delete-form" method="post" action="${pageContext.request.contextPath}/tasks/delete">
                                    <input type="hidden" name="id" value="${task.id}" />
                                    <button type="submit" class="delete-btn">Remove</button>
                                </form>
                            </div>
                        </article>
                    </c:forEach>
                </div>
            </section>

            <aside class="panel form-panel" id="task-form">
                <div class="section-header">
                    <h2>Create task</h2>
                    <span class="tag">New</span>
                </div>

                <c:if test="${not empty param.error}">
                    <div class="error-message">${param.error}</div>
                </c:if>

                <form method="post" action="${pageContext.request.contextPath}/">
                    <label>
                        Title
                        <input type="text" name="title" placeholder="Design launch sequence" required>
                    </label>

                    <label>
                        Category
                        <select name="category">
                            <option value="Marketing">Marketing</option>
                            <option value="Product">Product</option>
                            <option value="Operations">Operations</option>
                            <option value="General">General</option>
                        </select>
                    </label>

                    <label>
                        Notes
                        <textarea name="description" placeholder="Describe the task brief and expected outcome..."></textarea>
                    </label>

                    <button class="button button-primary" type="submit">Add to board</button>
                </form>
            </aside>
        </main>
    </div>
</body>
</html>
