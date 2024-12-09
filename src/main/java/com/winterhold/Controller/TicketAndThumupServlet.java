package com.winterhold.Controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import com.winterhold.DAO.DepartmentDAO;
import com.winterhold.DAO.StaffDAO;
import com.winterhold.DAO.TicketAndThumupDAO;
import com.winterhold.Model.Department;
import com.winterhold.Model.Staff;
import com.winterhold.Model.TicketAndThumup;
import com.winterhold.Util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/card")
public class TicketAndThumupServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private StaffDAO staffDAO;
	private DepartmentDAO departmentDAO;
	private TicketAndThumupDAO cardDAO;
	public void init() {
		staffDAO = new StaffDAO(HibernateUtil.getSessionFactory());
		departmentDAO = new DepartmentDAO(HibernateUtil.getSessionFactory());
		cardDAO = new TicketAndThumupDAO(HibernateUtil.getSessionFactory());
		
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
			viewCardList(request, response);
			break;
		case "new":
			break;
		case "addCard":
			insertCard(request, response);
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
	private void viewCardList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		LocalDate currentDate = LocalDate.now(); // Lấy ngày hiện tại
		request.setAttribute("currentDate", currentDate.toString()); // Đặt thuộc tính request
		
		
		List<Department> departments = departmentDAO.getAllDepartments();
		List<TicketAndThumup> cards = cardDAO.getAllTicketAndThumups();
		List<Staff> staffs = staffDAO.getAllStaff();
		request.setAttribute("staffs", staffs);
		//Danh sách tất cả phòng ban
		request.setAttribute("departments", departments);
		request.setAttribute("cards", cards);

		request.getRequestDispatcher("/views/admin/ticketandthumup-manager.jsp").forward(request, response);

	}
	
	private void insertCard(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
		LocalDate currentDate = LocalDate.now(); // Lấy ngày hiện tại
		 Date tkDay = Date.valueOf(currentDate);
        Staff staff = getStaffFromRequest(request);
        float money = Float.parseFloat(request.getParameter("money"));
        boolean type = Boolean.parseBoolean(request.getParameter("type"));
        String description = request.getParameter("description");
        TicketAndThumup newCard = new TicketAndThumup(type, money, description,tkDay,staff);
        cardDAO.addTicketAndThumup(newCard);
        response.sendRedirect("card");
    }
	
	private Staff getStaffFromRequest(HttpServletRequest request) {
		int idStaff = Integer.parseInt(request.getParameter("staffId"));
		return staffDAO.getStaffById(idStaff);
	}
}
