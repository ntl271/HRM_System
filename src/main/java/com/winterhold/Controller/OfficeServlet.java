package com.winterhold.Controller;


import java.io.IOException;


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


@WebServlet("/admin/office")
public class OfficeServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private DepartmentDAO departmentDAO;
	private OfficeDAO officeDAO;

	public void init() {
		new StaffDAO(HibernateUtil.getSessionFactory());
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

			break;
		case "new":
	
			break;
		case "addOffice":
			insertOffice(request, response);
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
	
	
	private void insertOffice(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// Các thông tin của nhân viên từ request
		String ofName = request.getParameter("ofName");
		int money =  Integer.parseInt(request.getParameter("salary"));
		
		// Lấy thông tin department và office từ request
		Department department = getDepartmentFromRequest(request);
		// Tạo đối tượng Staff mới
		Office newOffice = new Office(ofName,money,department);
		officeDAO.addOffice(newOffice);
		response.sendRedirect("department?id="+department.getID_dp());
	}

	private Department getDepartmentFromRequest(HttpServletRequest request) {
		int departmentId = Integer.parseInt(request.getParameter("id"));
		return departmentDAO.getDepartmentById(departmentId);
	}
}
