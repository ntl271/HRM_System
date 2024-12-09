package com.winterhold.Controller;

import java.io.IOException;
import java.util.List;

import com.winterhold.DAO.AccountDAO;
import com.winterhold.DAO.DepartmentDAO;
import com.winterhold.DAO.NotificationDAO;
import com.winterhold.DAO.StaffDAO;
import com.winterhold.Model.Department;
import com.winterhold.Model.Notification;
import com.winterhold.Model.Staff;
import com.winterhold.Util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/admin/home-page")
public class DashboardServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private StaffDAO staffDAO;
	private DepartmentDAO departmentDAO;
	private AccountDAO accountDAO;
	private NotificationDAO notificationDAO;
	
	

	public void init() {
		staffDAO = new StaffDAO(HibernateUtil.getSessionFactory());
		departmentDAO = new DepartmentDAO(HibernateUtil.getSessionFactory());
		accountDAO = new AccountDAO(HibernateUtil.getSessionFactory());
		notificationDAO = new NotificationDAO(HibernateUtil.getSessionFactory());
		
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
			viewDashboard(request, response);
			break;
		case "new":
			break;
		case "add":
			break;
		case "delete":
			break;
		case "editPw":
			break;
		case "editRole":
			break;
		case "update":
			break;
		default:
			break;
		}
	}
	
	private void viewDashboard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long  staffCount = staffDAO.getStaffCount();
		long dpCount = departmentDAO.getDepartmentCount();
		long accountCount = accountDAO.getAccountCount();
		List<Staff> newStaffs = staffDAO.getStaffByDepartmentAndOffice(5,16);
		List<Department> departments = departmentDAO.getAllDepartments();
		List<Notification> notifications = notificationDAO.getAllNotifications();
		request.setAttribute("newStaffs",newStaffs);
		request.setAttribute("notifications",notifications);
		request.setAttribute("accountCount",accountCount);
		request.setAttribute("dpCount",dpCount);
		request.setAttribute("departments",departments);
		request.setAttribute("staffCount", staffCount);
		request.getRequestDispatcher("/views/admin/index.jsp").forward(request, response);
	}
}
