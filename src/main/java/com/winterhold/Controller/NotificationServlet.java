package com.winterhold.Controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

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

@WebServlet("/admin/notification")
public class NotificationServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private StaffDAO staffDAO;
	private DepartmentDAO departmentDAO;
	private NotificationDAO notificationDAO;
	

	public void init() {
		staffDAO = new StaffDAO(HibernateUtil.getSessionFactory());
		departmentDAO = new DepartmentDAO(HibernateUtil.getSessionFactory());
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
			viewNotification(request, response);
			break;
		case "new":
			break;
		case "add":
			addNotification(request, response);
			break;
		case "delete":
			break;
		case "edit":
			break;
		case "editDp":
			break;
		case "update":
			break;
		default:
			break;
		}
	}

	
	private void viewNotification(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LocalDate currentDate = LocalDate.now();
		request.setAttribute("currentDate", currentDate);
		List<Department> departments = departmentDAO.getAllDepartments();
		List<Notification> notifications = notificationDAO.getAllNotifications();
		request.setAttribute("notifications",notifications);
		request.setAttribute("departments",departments);
		List<Staff> staffs = staffDAO.getAllStaff();
		request.setAttribute("staffs", staffs);
		  request.getRequestDispatcher("/views/admin/notification-manager.jsp").forward(request, response);
	}
	
	private void addNotification(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LocalDate currentDate = LocalDate.now();
		Date date = Date.valueOf(currentDate);
		int staffId = Integer.parseInt(request.getParameter("staffId"));
		Staff staff = staffDAO.getStaffById(staffId);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Notification notification = new Notification(title,content,date,staff);
		notificationDAO.addNotification(notification);
		
		response.sendRedirect("notification");
	}

}
