<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StaffHub – HR Management</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700;800&family=Nunito:wght@300;400;500&display=swap');
        * { margin:0; padding:0; box-sizing:border-box; }
        body {
            font-family: 'Nunito', sans-serif;
            background: linear-gradient(135deg, #e8f5e9 0%, #f0f4ff 100%);
            min-height: 100vh;
            display: flex; align-items: center; justify-content: center;
        }
        .container {
            display: flex; align-items: center; gap: 60px;
            max-width: 900px; width: 90%; padding: 40px 0;
        }
        .left-panel { flex: 1; display: flex; flex-direction: column; align-items: flex-start; }
        .brand { display: flex; align-items: center; gap: 10px; margin-bottom: 28px; }
        .brand-icon {
            width: 44px; height: 44px;
            background: linear-gradient(135deg, #00897b, #26a69a);
            border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.4em; box-shadow: 0 4px 14px rgba(0,137,123,0.3);
        }
        .brand-name { font-family:'Poppins',sans-serif; font-size:1.4em; font-weight:700; color:#00695c; }
        h1 { font-family:'Poppins',sans-serif; font-size:2.8em; font-weight:800; color:#1a2e2c; line-height:1.15; margin-bottom:16px; }
        h1 span { color:#00897b; }
        .tagline { color:#546e7a; font-size:1em; line-height:1.7; max-width:360px; margin-bottom:36px; }
        .stats-row { display:flex; gap:20px; }
        .stat { background:#fff; border-radius:14px; padding:14px 20px; text-align:center; box-shadow:0 2px 12px rgba(0,0,0,0.06); }
        .stat-num { font-family:'Poppins',sans-serif; font-size:1.5em; font-weight:700; color:#00897b; }
        .stat-lbl { font-size:0.72em; color:#90a4ae; text-transform:uppercase; letter-spacing:0.8px; }
        .right-card {
            background:#fff; border-radius:28px; padding:44px 38px;
            width:340px; flex-shrink:0; box-shadow:0 12px 48px rgba(0,0,0,0.1);
        }
        .card-title { font-family:'Poppins',sans-serif; font-size:1.1em; font-weight:600; color:#263238; margin-bottom:6px; }
        .card-sub { color:#90a4ae; font-size:0.82em; margin-bottom:28px; }
        .menu-item {
            display:flex; align-items:center; gap:14px;
            padding:16px 18px; border-radius:14px; text-decoration:none;
            margin-bottom:12px; transition:all 0.2s; border:2px solid transparent;
        }
        .menu-primary {
            background:linear-gradient(135deg,#00897b,#26a69a); color:#fff;
            box-shadow:0 6px 20px rgba(0,137,123,0.3);
        }
        .menu-primary:hover { box-shadow:0 10px 28px rgba(0,137,123,0.45); transform:translateY(-2px); }
        .menu-secondary { background:#f8fffe; border-color:#b2dfdb; color:#00695c; }
        .menu-secondary:hover { background:#e0f2f1; transform:translateY(-2px); }
        .menu-icon {
            width:40px; height:40px; border-radius:10px;
            display:flex; align-items:center; justify-content:center;
            font-size:1.2em; flex-shrink:0;
        }
        .menu-primary .menu-icon { background:rgba(255,255,255,0.2); }
        .menu-secondary .menu-icon { background:#e0f2f1; }
        .menu-text { font-weight:600; font-size:0.93em; }
        .menu-desc { font-size:0.75em; opacity:0.75; margin-top:1px; }
        .divider {
            margin-top:24px; padding-top:18px; border-top:1px solid #f0f0f0;
            text-align:center; color:#b0bec5; font-size:0.74em;
            letter-spacing:0.8px; text-transform:uppercase;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="left-panel">
        <div class="brand">
            <div class="brand-icon">🏢</div>
            <span class="brand-name">StaffHub</span>
        </div>
        <h1>Manage Your<br><span>Workforce</span><br>Smarter</h1>
        <p class="tagline">A simple, powerful system to register, track and manage employees — built with JSP, Servlets &amp; JDBC.</p>
        <div class="stats-row">
            <div class="stat"><div class="stat-num">CRUD</div><div class="stat-lbl">Operations</div></div>
            <div class="stat"><div class="stat-num">MySQL</div><div class="stat-lbl">Database</div></div>
            <div class="stat"><div class="stat-num">MVC</div><div class="stat-lbl">Pattern</div></div>
        </div>
    </div>
    <div class="right-card">
        <div class="card-title">Quick Actions</div>
        <div class="card-sub">What would you like to do?</div>
        <a href="register.jsp" class="menu-item menu-primary">
            <div class="menu-icon">➕</div>
            <div><div class="menu-text">Add New Employee</div><div class="menu-desc">Fill in employee details</div></div>
        </a>
        <a href="EmployeeServlet?action=list" class="menu-item menu-secondary">
            <div class="menu-icon">📋</div>
            <div><div class="menu-text">View All Employees</div><div class="menu-desc">Browse &amp; manage records</div></div>
        </a>
        <div class="divider">Assignment 05 · JSP + Servlet + JDBC</div>
    </div>
</div>
</body>
</html>
