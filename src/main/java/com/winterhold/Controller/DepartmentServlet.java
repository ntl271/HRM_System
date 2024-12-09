package com.winterhold.Controller;

import com.winterhold.DAO.DepartmentDAO;
import com.winterhold.DAO.OfficeDAO;
import com.winterhold.DAO.StaffDAO;
import com.winterhold.Model.Department;
import com.winterhold.Model.Office;
import com.winterhold.Util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/department")
public class DepartmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StaffDAO staffDAO;
	private DepartmentDAO departmentDAO;
	private OfficeDAO officeDAO;


    public void init() {
    	staffDAO = new StaffDAO(HibernateUtil.getSessionFactory());
		departmentDAO = new DepartmentDAO(HibernateUtil.getSessionFactory());
		officeDAO = new OfficeDAO(HibernateUtil.getSessionFactory());
		
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
            	viewDepartment(request, response);
                break;
            case "new":
                showNewForm(request, response);
                break;
            case "addDp":
                insertDepartment(request, response);
                break;
            case "delete":
                deleteDepartment(request, response);
                break;
            case "edit":
            	editPosition(request, response);
                break;
            case "editDp":
            	editPositionDepartment(request, response);
                break;  
            case "update":
                updateDepartment(request, response);
                break;
            default:
            	viewDepartment(request, response);
                break;
        }
    }


  

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implement your logic to show new department form
    }

   
    private void insertDepartment(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
    	  int id = Integer.parseInt(request.getParameter("id"));
        String dpName = request.getParameter("dpName");
        String dpDescription = request.getParameter("description");
        Department newDepartment = new Department(dpName, dpDescription);
        departmentDAO.addDepartment(newDepartment);
        response.sendRedirect("department?id="+id);
    }

    private void updateDepartment(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String dpName = request.getParameter("dpName");
        String dpDescription = request.getParameter("dpDescription");
        Department department = new Department(dpName, dpDescription);
        department.setID_dp(id);
        departmentDAO.updateDepartment(department);
        response.sendRedirect("department?action=list");
    }

    private void deleteDepartment(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        departmentDAO.deleteDepartment(id);
        response.sendRedirect("department?action=list");
    }
    
    private void viewDepartment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Department department = departmentDAO.getDepartmentWithStaff(id);
        Department dpAssignment = staffDAO.getStaffinAssignment(5);
        request.setAttribute("dpAssignment", dpAssignment);
        Department dpWithOf = departmentDAO.getDepartmentWithOffice(id);
        Long staffCount = departmentDAO.countStaffInDepartment(id);
        List<Department> departments = departmentDAO.getAllDepartments();
		List<Office> offices = officeDAO.getAllOffices();
		request.setAttribute("staffCount", staffCount);
        request.setAttribute("departments", departments);
		request.setAttribute("offices", offices);
		request.setAttribute("dpWithOf", dpWithOf);
        if (department != null) {
            request.setAttribute("department", department);
            request.getRequestDispatcher("/views/admin/department-manager.jsp").forward(request, response);
        } else {
            // Handle case where department with given id doesn't exist
            response.sendRedirect("department");
        }
    }
    private void editPosition(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	  int staffId = Integer.parseInt(request.getParameter("staffId2"));
    	  int id = Integer.parseInt(request.getParameter("id"));
          int newPositionId = Integer.parseInt(request.getParameter("newPosition"));

          staffDAO.updatePosition(staffId, newPositionId);
          response.sendRedirect("department?id="+id); // Redirect lại trang quản lý phòng ban
    }
    private void editPositionDepartment(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	  int staffId = Integer.parseInt(request.getParameter("staffId"));
    	  int id = Integer.parseInt(request.getParameter("id"));
          int newPositionId = Integer.parseInt(request.getParameter("newPosition"));
          int newDepartment = Integer.parseInt(request.getParameter("newDepartment"));

          staffDAO.updatePositionDepartment(staffId, newDepartment,newPositionId);
          response.sendRedirect("department?id="+id); // Redirect lại trang quản lý phòng ban
    }
	
}
