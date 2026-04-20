<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.emp.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Directory – StaffHub</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600;700&family=Nunito:wght@300;400;500;600&display=swap');
        * { margin:0; padding:0; box-sizing:border-box; }
        body { font-family:'Nunito',sans-serif; background:#f4f7f6; min-height:100vh; padding:32px 20px; color:#263238; }

        .page-wrap { max-width:1140px; margin:0 auto; }

        .top-bar {
            display:flex; align-items:center; justify-content:space-between;
            margin-bottom:24px; flex-wrap:wrap; gap:14px;
        }
        .top-left { display:flex; align-items:center; gap:14px; }
        .back-btn {
            display:flex; align-items:center; gap:6px;
            background:#fff; border:1.5px solid #cfd8dc;
            color:#546e7a; padding:8px 14px;
            border-radius:10px; text-decoration:none;
            font-size:0.85em; font-weight:600; transition:all 0.2s;
        }
        .back-btn:hover { background:#e0f2f1; color:#00695c; border-color:#b2dfdb; }

        .page-title { font-family:'Poppins',sans-serif; font-size:1.6em; font-weight:700; color:#1a2e2c; }
        .badge-count {
            background:#e0f2f1; color:#00695c; border:1px solid #b2dfdb;
            font-size:0.75em; font-weight:700; padding:3px 11px;
            border-radius:20px; margin-left:8px;
        }

        .btn-add {
            display:flex; align-items:center; gap:8px;
            padding:11px 22px;
            background:linear-gradient(135deg,#00897b,#26a69a);
            color:#fff; text-decoration:none; border-radius:11px;
            font-size:0.9em; font-weight:700;
            box-shadow:0 4px 16px rgba(0,137,123,0.3);
            transition:all 0.2s;
        }
        .btn-add:hover { transform:translateY(-2px); box-shadow:0 8px 24px rgba(0,137,123,0.45); }

        .table-wrap {
            background:#fff; border-radius:18px;
            box-shadow:0 4px 24px rgba(0,0,0,0.07);
            overflow:hidden; overflow-x:auto;
        }

        table { width:100%; border-collapse:collapse; min-width:820px; }

        thead tr { background:#f0faf8; border-bottom:2px solid #b2dfdb; }
        th {
            padding:14px 16px; text-align:left;
            font-size:0.72em; font-weight:700;
            letter-spacing:1.2px; text-transform:uppercase; color:#00695c;
        }

        tbody tr { border-bottom:1px solid #f4f7f6; transition:background 0.15s; }
        tbody tr:last-child { border-bottom:none; }
        tbody tr:hover { background:#f8fffe; }

        td { padding:14px 16px; font-size:0.9em; color:#455a64; vertical-align:middle; }

        .emp-id { color:#b0bec5; font-weight:600; font-size:0.85em; }
        .emp-name { font-weight:700; color:#1a2e2c; }
        .emp-email { color:#90a4ae; font-size:0.82em; margin-top:2px; }

        .dept-badge {
            display:inline-block; padding:4px 12px;
            background:#e0f2f1; color:#00695c;
            border:1px solid #b2dfdb; border-radius:20px;
            font-size:0.75em; font-weight:700; white-space:nowrap;
        }

        .salary { font-weight:700; color:#2e7d32; }

        .btn-delete {
            padding:6px 14px;
            background:#fff5f5; border:1px solid #ffcdd2;
            color:#e53935; border-radius:8px;
            text-decoration:none; font-size:0.8em; font-weight:600;
            transition:all 0.2s; white-space:nowrap;
        }
        .btn-delete:hover { background:#ffebee; border-color:#ef9a9a; }

        .empty-state { padding:80px 20px; text-align:center; }
        .empty-icon { font-size:3.5em; margin-bottom:16px; opacity:0.25; }
        .empty-state h3 { color:#90a4ae; font-family:'Poppins',sans-serif; margin-bottom:6px; }
        .empty-state p { color:#b0bec5; font-size:0.88em; }

        .footer { text-align:center; margin-top:20px; color:#b0bec5; font-size:0.8em; }
    </style>
</head>
<body>
<%
    List<Employee> employees = (List<Employee>) request.getAttribute("employees");
    int count = (employees != null) ? employees.size() : 0;
%>
<div class="page-wrap">
    <div class="top-bar">
        <div class="top-left">
            <a href="index.jsp" class="back-btn">← Home</a>
            <div class="page-title">
                Employee Directory
                <span class="badge-count"><%= count %> records</span>
            </div>
        </div>
        <a href="register.jsp" class="btn-add">➕ Add Employee</a>
    </div>

    <div class="table-wrap">
        <% if (count == 0) { %>
        <div class="empty-state">
            <div class="empty-icon">📭</div>
            <h3>No Employees Found</h3>
            <p>Register your first employee to get started.</p>
        </div>
        <% } else { %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Employee</th>
                    <th>Department</th>
                    <th>Designation</th>
                    <th>Salary</th>
                    <th>Phone</th>
                    <th>Joined</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
            <% for (Employee emp : employees) { %>
                <tr>
                    <td class="emp-id">#<%= emp.getId() %></td>
                    <td>
                        <div class="emp-name"><%= emp.getName() %></div>
                        <div class="emp-email"><%= emp.getEmail() %></div>
                    </td>
                    <td><span class="dept-badge"><%= emp.getDepartment() %></span></td>
                    <td><%= emp.getDesignation() %></td>
                    <td class="salary">₹<%= String.format("%,.0f", emp.getSalary()) %></td>
                    <td><%= emp.getPhone() %></td>
                    <td><%= emp.getJoinDate() %></td>
                    <td>
                        <a href="EmployeeServlet?action=delete&id=<%= emp.getId() %>"
                           class="btn-delete"
                           onclick="return confirm('Remove <%= emp.getName() %> from records?')">🗑 Remove</a>
                    </td>
                </tr>
            <% } %>
            </tbody>
        </table>
        <% } %>
    </div>
    <div class="footer">StaffHub · Assignment 05 · JSP + Servlet + JDBC</div>
</div>
</body>
</html>
