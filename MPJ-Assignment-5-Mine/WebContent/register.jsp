<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee – StaffHub</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@600;700&family=Nunito:wght@300;400;500;600&display=swap');
        * { margin:0; padding:0; box-sizing:border-box; }
        body {
            font-family:'Nunito',sans-serif;
            background:#f4f7f6;
            min-height:100vh;
            display:flex; align-items:flex-start; justify-content:center;
            padding:40px 16px;
        }
        .page { width:100%; max-width:680px; }
        .breadcrumb { color:#90a4ae; font-size:0.82em; margin-bottom:20px; }
        .breadcrumb a { color:#00897b; text-decoration:none; }
        .breadcrumb a:hover { text-decoration:underline; }

        .card {
            background:#fff; border-radius:22px;
            box-shadow:0 4px 24px rgba(0,0,0,0.08);
            overflow:hidden;
        }
        .card-header {
            background:linear-gradient(135deg,#00897b,#26a69a);
            padding:28px 32px;
            display:flex; align-items:center; gap:16px;
        }
        .header-icon {
            width:52px; height:52px; background:rgba(255,255,255,0.2);
            border-radius:14px; display:flex; align-items:center;
            justify-content:center; font-size:1.6em; flex-shrink:0;
        }
        .card-header h2 { font-family:'Poppins',sans-serif; font-size:1.4em; color:#fff; font-weight:700; }
        .card-header p { color:rgba(255,255,255,0.75); font-size:0.85em; margin-top:3px; }

        .card-body { padding:32px; }

        .error-box {
            background:#fff5f5; border:1px solid #ffcdd2; color:#c62828;
            padding:12px 16px; border-radius:10px; margin-bottom:22px;
            font-size:0.88em; display:flex; align-items:center; gap:8px;
            border-left:4px solid #ef5350;
        }

        .section-title {
            font-family:'Poppins',sans-serif;
            font-size:0.75em; font-weight:600;
            text-transform:uppercase; letter-spacing:1.5px;
            color:#00897b; margin:24px 0 14px;
            display:flex; align-items:center; gap:8px;
        }
        .section-title::after {
            content:''; flex:1; height:1px; background:#e0f2f1;
        }

        .form-grid { display:grid; grid-template-columns:1fr 1fr; gap:16px; }
        .form-group { display:flex; flex-direction:column; }
        .form-group.full { grid-column:1/-1; }

        label { font-size:0.8em; font-weight:600; color:#546e7a; margin-bottom:6px; }
        label .req { color:#ef5350; margin-left:2px; }

        input, select {
            background:#f9fafb; border:1.5px solid #e0e7e7;
            border-radius:10px; padding:11px 14px;
            color:#263238; font-size:0.92em;
            font-family:'Nunito',sans-serif;
            outline:none; transition:all 0.2s; width:100%;
        }
        input::placeholder { color:#b0bec5; }
        input:focus, select:focus {
            border-color:#00897b; background:#fff;
            box-shadow:0 0 0 3px rgba(0,137,123,0.12);
        }
        select option { background:#fff; }

        .btn-row { display:flex; gap:12px; margin-top:28px; }
        .btn-submit {
            flex:1; padding:14px;
            background:linear-gradient(135deg,#00897b,#26a69a);
            color:#fff; border:none; border-radius:12px;
            font-size:0.95em; font-weight:700;
            font-family:'Nunito',sans-serif; cursor:pointer;
            box-shadow:0 4px 16px rgba(0,137,123,0.3);
            transition:all 0.2s;
        }
        .btn-submit:hover { transform:translateY(-2px); box-shadow:0 8px 24px rgba(0,137,123,0.45); }
        .btn-back {
            padding:14px 22px;
            background:#f4f7f6; color:#546e7a;
            border:1.5px solid #cfd8dc; border-radius:12px;
            text-decoration:none; font-size:0.92em; font-weight:600;
            display:flex; align-items:center; gap:6px; transition:all 0.2s;
        }
        .btn-back:hover { background:#e0f2f1; color:#00695c; border-color:#b2dfdb; }

        @media(max-width:520px) {
            .card-body { padding:22px; }
            .form-grid { grid-template-columns:1fr; }
            .form-group.full { grid-column:1; }
        }
    </style>
</head>
<body>
<div class="page">
    <div class="breadcrumb">
        <a href="index.jsp">🏢 StaffHub</a> &rsaquo; Add Employee
    </div>
    <div class="card">
        <div class="card-header">
            <div class="header-icon">📝</div>
            <div>
                <h2>Add New Employee</h2>
                <p>Fields marked <span style="color:#fff;font-weight:600">*</span> are required</p>
            </div>
        </div>
        <div class="card-body">
            <% String err = (String) request.getAttribute("errorMsg");
               if (err != null && !err.isEmpty()) { %>
                <div class="error-box">⚠ &nbsp;<%= err %></div>
            <% } %>

            <form action="EmployeeServlet" method="post" autocomplete="off">
                <div class="section-title">👤 Personal Details</div>
                <div class="form-grid">
                    <div class="form-group">
                        <label>Full Name <span class="req">*</span></label>
                        <input type="text" name="name" placeholder="e.g. Rohit Verma" required>
                    </div>
                    <div class="form-group">
                        <label>Email Address <span class="req">*</span></label>
                        <input type="email" name="email" placeholder="rohit@company.com" required>
                    </div>
                    <div class="form-group">
                        <label>Phone Number <span class="req">*</span></label>
                        <input type="tel" name="phone" placeholder="9876543210"
                               pattern="[6-9][0-9]{9}" title="Enter valid 10-digit mobile number" required>
                    </div>
                </div>

                <div class="section-title">💼 Job Details</div>
                <div class="form-grid">
                    <div class="form-group">
                        <label>Department <span class="req">*</span></label>
                        <select name="department" required>
                            <option value="">-- Select Department --</option>
                            <option>Engineering</option>
                            <option>Human Resources</option>
                            <option>Finance</option>
                            <option>Marketing</option>
                            <option>Operations</option>
                            <option>Sales</option>
                            <option>Information Technology</option>
                            <option>Research &amp; Development</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Designation <span class="req">*</span></label>
                        <input type="text" name="designation" placeholder="e.g. Software Engineer" required>
                    </div>
                    <div class="form-group">
                        <label>Salary (₹) <span class="req">*</span></label>
                        <input type="number" name="salary" placeholder="e.g. 55000" min="0" step="100" required>
                    </div>
                    <div class="form-group">
                        <label>Date of Joining <span class="req">*</span></label>
                        <input type="date" name="joinDate" required>
                    </div>
                </div>

                <div class="btn-row">
                    <a href="index.jsp" class="btn-back">← Back</a>
                    <button type="submit" class="btn-submit">✔ Save Employee</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
