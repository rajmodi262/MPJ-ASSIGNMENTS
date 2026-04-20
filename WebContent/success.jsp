<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Added – StaffHub</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@700;800&family=Nunito:wght@300;400;500&display=swap');
        * { margin:0; padding:0; box-sizing:border-box; }
        body {
            font-family:'Nunito',sans-serif;
            background:linear-gradient(135deg,#e8f5e9,#f0f4ff);
            min-height:100vh; display:flex; align-items:center; justify-content:center;
        }
        .card {
            background:#fff; border-radius:28px;
            padding:60px 50px; text-align:center;
            max-width:440px; width:90%;
            box-shadow:0 16px 60px rgba(0,0,0,0.1);
        }
        .check-wrap {
            width:90px; height:90px;
            background:linear-gradient(135deg,#00897b,#26a69a);
            border-radius:50%;
            display:flex; align-items:center; justify-content:center;
            font-size:2.8em; margin:0 auto 28px;
            box-shadow:0 8px 28px rgba(0,137,123,0.35);
            animation:popIn 0.5s cubic-bezier(0.175,0.885,0.32,1.275);
        }
        @keyframes popIn {
            0% { transform:scale(0); opacity:0; }
            100% { transform:scale(1); opacity:1; }
        }
        h2 {
            font-family:'Poppins',sans-serif;
            font-size:1.9em; font-weight:800;
            color:#1a2e2c; margin-bottom:10px;
        }
        .msg {
            color:#78909c; font-size:0.96em;
            line-height:1.7; margin-bottom:36px;
        }
        .emp-name { color:#00695c; font-weight:700; }
        .actions { display:flex; flex-direction:column; gap:10px; }
        .btn {
            display:flex; align-items:center; justify-content:center;
            gap:8px; padding:14px; border-radius:12px;
            text-decoration:none; font-weight:700; font-size:0.92em; transition:all 0.2s;
        }
        .btn-primary {
            background:linear-gradient(135deg,#00897b,#26a69a); color:#fff;
            box-shadow:0 4px 16px rgba(0,137,123,0.3);
        }
        .btn-primary:hover { transform:translateY(-2px); box-shadow:0 8px 24px rgba(0,137,123,0.45); }
        .btn-ghost {
            background:#f4f7f6; color:#546e7a;
            border:1.5px solid #cfd8dc;
        }
        .btn-ghost:hover { background:#e0f2f1; color:#00695c; border-color:#b2dfdb; }
        .home-link {
            display:block; margin-top:18px;
            color:#b0bec5; font-size:0.82em;
            text-decoration:none; transition:color 0.2s;
        }
        .home-link:hover { color:#90a4ae; }
    </style>
</head>
<body>
<div class="card">
    <div class="check-wrap">✅</div>
    <h2>Employee Added!</h2>
    <p class="msg">
        <span class="emp-name"><%= request.getAttribute("empName") %></span>
        has been successfully registered in the system.
    </p>
    <div class="actions">
        <a href="register.jsp" class="btn btn-primary">➕ Add Another Employee</a>
        <a href="EmployeeServlet?action=list" class="btn btn-ghost">📋 View All Employees</a>
    </div>
    <a href="index.jsp" class="home-link">← Back to Home</a>
</div>
</body>
</html>
