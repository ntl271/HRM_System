package com.winterhold.Controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;


import com.winterhold.DAO.DepartmentDAO;
import com.winterhold.DAO.OTBonusDAO;
import com.winterhold.DAO.SalaryDAO;
import com.winterhold.DAO.StaffDAO;
import com.winterhold.DAO.TicketAndThumupDAO;
import com.winterhold.DAO.TimekeepingDAO;
import com.winterhold.Model.Department;
import com.winterhold.Model.Salary;
import com.winterhold.Model.Staff;
import com.winterhold.Util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/admin/salarytb")
public class SalaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StaffDAO staffDAO;
	private DepartmentDAO departmentDAO;
	private SalaryDAO salaryDAO;
	private TicketAndThumupDAO tatDAO;
	private OTBonusDAO otBonusDAO;
	private TimekeepingDAO timekeepingDAO;
	public void init() {
		staffDAO = new StaffDAO(HibernateUtil.getSessionFactory());
		departmentDAO = new DepartmentDAO(HibernateUtil.getSessionFactory());
		salaryDAO = new SalaryDAO(HibernateUtil.getSessionFactory());
		tatDAO = new TicketAndThumupDAO(HibernateUtil.getSessionFactory());
		otBonusDAO = new OTBonusDAO(HibernateUtil.getSessionFactory());
		timekeepingDAO =  new TimekeepingDAO(HibernateUtil.getSessionFactory());
		
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
			viewSalary(request, response);
			break;
		case "confirmSalary":
			viewSalarytb(request, response);
			break;
		case "add":
			addSalarytb(request, response);
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
	
	private void viewSalary(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LocalDate currentDate = LocalDate.now(); // Lấy ngày hiện tại
		request.setAttribute("currentDate", currentDate.toString()); // Đặt thuộc tính request
	
		List<Salary> salaries = salaryDAO.getAllSalaries();
		List<Department> departments = departmentDAO.getAllDepartments();
		List<Staff> staffs = salaryDAO.getStaffNotTimekeepingInCurrentMonth();
		request.setAttribute("staffs", staffs);
		request.setAttribute("departments", departments);
		request.setAttribute("salaries", salaries);
	
		request.getRequestDispatcher("/views/admin/salarytb-manager.jsp").forward(request, response);
	}
	
	private void viewSalarytb(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LocalDate currentDate = LocalDate.now(); // Lấy ngày hiện tại
		int currentMonth = currentDate.getMonthValue();
		request.setAttribute("currentDate", currentDate.toString()); // Đặt thuộc tính request
		int staffId = Integer.parseInt(request.getParameter("id"));
		Staff staff = staffDAO.getStaffById(staffId);
		float thumup = tatDAO.calculateTotalMoneyAosThumupForStaffAndMonth(staffId, currentMonth);
		float ticket = tatDAO.calculateTotalMoneyAosTicketForStaffAndMonth(staffId, currentMonth);
		float otbonus = otBonusDAO.calculateOTSalary(staffId, currentMonth);
		float salaryTk = timekeepingDAO.countWorkingDaysInMonth(staffId, currentMonth, 2024) * staff.getOffice().getSalary();
	
		request.setAttribute("thumup", thumup);
		request.setAttribute("ticket", ticket);
		request.setAttribute("otbonus", otbonus);
		request.setAttribute("salaryTk", salaryTk);
		request.setAttribute("total", thumup+ticket+otbonus+salaryTk);
		List<Department> departments = departmentDAO.getAllDepartments();
		request.setAttribute("staff", staff);
		request.setAttribute("departments", departments);
		
		request.getRequestDispatcher("/views/admin/salarytb-create.jsp").forward(request, response);
	}
	
	private void addSalarytb(HttpServletRequest request,HttpServletResponse response)
		throws ServletException, IOException{
		LocalDate currentDate = LocalDate.now();
		Date date = Date.valueOf(currentDate);
		int staffId = Integer.parseInt(request.getParameter("id"));
		Staff staff = staffDAO.getStaffById(staffId);
		float thumup = Float.parseFloat(request.getParameter("thumup"));
		float ticket = Float.parseFloat(request.getParameter("ticket"));
		float otbonus = Float.parseFloat(request.getParameter("otbonus"));
		float salaryTk = Float.parseFloat(request.getParameter("salaryTk"));
		
		Salary salary = new Salary(date,ticket,thumup,otbonus,salaryTk,staff);
		
		salaryDAO.saveSalary(salary);
		response.sendRedirect("salarytb");
		}
	
	
	
	
	

}
