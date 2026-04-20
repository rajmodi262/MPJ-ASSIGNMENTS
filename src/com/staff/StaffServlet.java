package com.staff;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

public class StaffServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private StaffDAO dao = new StaffDAO();

    // ── POST: Register a new staff member ─────────────────────────────────
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            String name        = request.getParameter("name").trim();
            String email       = request.getParameter("email").trim();
            String department  = request.getParameter("department").trim();
            String designation = request.getParameter("designation").trim();
            double salary      = Double.parseDouble(request.getParameter("salary"));
            String phone       = request.getParameter("phone").trim();
            Date   joinDate    = Date.valueOf(request.getParameter("joinDate"));

            Staff s = new Staff();
            s.setName       (name);
            s.setEmail      (email);
            s.setDepartment (department);
            s.setDesignation(designation);
            s.setSalary     (salary);
            s.setPhone      (phone);
            s.setJoinDate   (joinDate);

            boolean success = dao.addStaff(s);

            if (success) {
                request.setAttribute("empName", name);
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMsg", "Registration failed. Email may already exist.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "Error: " + e.getMessage());
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }

    // ── GET: List staff or redirect to form ───────────────────────────────
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("list".equals(action)) {
            List<Staff> staffList = dao.getAllStaff();
            request.setAttribute("employees", staffList);
            request.getRequestDispatcher("employeeList.jsp").forward(request, response);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            dao.removeStaff(id);
            response.sendRedirect("EmployeeServlet?action=list");

        } else {
            response.sendRedirect("register.jsp");
        }
    }
}
