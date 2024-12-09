package com.winterhold.Controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;


import com.winterhold.DAO.DepartmentDAO;
import com.winterhold.DAO.LeaveDAO;
import com.winterhold.DAO.NotificationDAO;
import com.winterhold.DAO.OTBonusDAO;
import com.winterhold.DAO.OfficeDAO;
import com.winterhold.DAO.SalaryDAO;
import com.winterhold.DAO.StaffDAO;
import com.winterhold.DAO.TicketAndThumupDAO;
import com.winterhold.DAO.TimekeepingDAO;
import com.winterhold.Model.Account;
import com.winterhold.Model.Department;
import com.winterhold.Model.Leave;
import com.winterhold.Model.Notification;
import com.winterhold.Model.OTBonus;
import com.winterhold.Model.Office;
import com.winterhold.Model.Salary;
import com.winterhold.Model.Staff;
import com.winterhold.Model.TicketAndThumup;
import com.winterhold.Model.Timekeeping;
import com.winterhold.Util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/user/home-page")
public class UserDashboardServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private NotificationDAO notificationDAO;
	private TimekeepingDAO timekeepingDAO;
	private TicketAndThumupDAO cardDAO;
	private LeaveDAO leaveDAO;
	private SalaryDAO salaryDAO;
	private OTBonusDAO bonusDAO;
	private DepartmentDAO departmentDAO;
	private OfficeDAO officeDAO;
	private StaffDAO staffDAO;
	public void init() {
		notificationDAO = new NotificationDAO(HibernateUtil.getSessionFactory());
		timekeepingDAO = new TimekeepingDAO(HibernateUtil.getSessionFactory());
	cardDAO = new TicketAndThumupDAO(HibernateUtil.getSessionFactory());
		salaryDAO = new SalaryDAO(HibernateUtil.getSessionFactory());
		leaveDAO = new LeaveDAO(HibernateUtil.getSessionFactory());
		bonusDAO = new OTBonusDAO(HibernateUtil.getSessionFactory());
		departmentDAO = new DepartmentDAO(HibernateUtil.getSessionFactory());
		officeDAO = new OfficeDAO(HibernateUtil.getSessionFactory());
		staffDAO = new StaffDAO(HibernateUtil.getSessionFactory());
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
		case "viewProfile":
			viewProfile(request, response);
			break;
		case "salary":
			viewManager(request, response);
			break;
		case "addLeave":
			addLeave(request, response);
			break;
		case "update":
			updateStaff(request, response);
			break;
		case "addOT":
			addOT(request, response);
			break;
		
		default:
			break;
		}
	}
	
	private void viewDashboard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		
		    Account account = (Account) session.getAttribute("user");
		    Staff staff = account.getStaff(); // Lấy đối tượng Staff từ Account
		
		List<Timekeeping> monthTimekeepings= timekeepingDAO.getCurrentMonthTimekeepingByStaff(staff);
		List<Timekeeping> timekeepings = timekeepingDAO.getAllTimekeepingByStaff(staff);
		List<TicketAndThumup> tickets = cardDAO.getTicketsByStaffAndType(staff,false);
		List<TicketAndThumup> thumups = cardDAO.getTicketsByStaffAndType(staff,true);
		long countTimekeeping = timekeepingDAO.countCurrentMonthTimekeepingByStaff(staff);
		long countTicket = cardDAO.countTicketsByStaffAndType(staff, false);
		long countThumup = cardDAO.countTicketsByStaffAndType(staff, true);
		
		request.setAttribute("staff",staff);
		
		request.setAttribute("countTimekeeping",countTimekeeping);
		request.setAttribute("countTicket",countTicket);
		request.setAttribute("countThumup",countThumup);
		
		request.setAttribute("monthTimekeepings",monthTimekeepings);
		request.setAttribute("timekeepings",timekeepings);
		request.setAttribute("tickets",tickets);
		request.setAttribute("thumups",thumups);
		List<Notification> notifications = notificationDAO.getAllNotifications();
		request.setAttribute("notifications",notifications);
		request.getRequestDispatcher("/views/user/index.jsp").forward(request, response);
	}
	
	
	private void viewProfile(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		
		    Account account = (Account) session.getAttribute("user");
		    Staff staff = account.getStaff(); // Lấy đối tượng Staff từ Account
		
		long countTimekeeping = timekeepingDAO.countCurrentMonthTimekeepingByStaff(staff);
		long countTicket = cardDAO.countTicketsByStaffAndType(staff, false);
		long countThumup = cardDAO.countTicketsByStaffAndType(staff, true);
		
		request.setAttribute("staff",staff);
		
		request.setAttribute("countTimekeeping",countTimekeeping);
		request.setAttribute("countTicket",countTicket);
		request.setAttribute("countThumup",countThumup);
		
		request.getRequestDispatcher("/views/user/profile.jsp").forward(request, response);
	}
	
	private void viewManager(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		
		    Account account = (Account) session.getAttribute("user");
		    Staff staff = account.getStaff(); // Lấy đối tượng Staff từ Account
		
		
		List<Leave> leaves = leaveDAO.getAllLeavesByStaff(staff);
		List<OTBonus>  otBonus = bonusDAO.getAllOTBonusesByStaff(staff);
		List<Salary> salaries = salaryDAO.getAllSalaries();
		request.setAttribute("leaves",leaves);
		request.setAttribute("otBonus",otBonus);
		request.setAttribute("salaries",salaries);
		request.setAttribute("staff",staff);
			

		request.getRequestDispatcher("/views/user/salary-manager.jsp").forward(request, response);
	}
	
	private void updateStaff(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		String stName = request.getParameter("stName");
		// Xử lý và chuyển đổi giá trị gender
		boolean gender = false;
		try {
			int genderInt = Integer.parseInt(request.getParameter("gender"));
			gender = (genderInt == 1);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			// Có thể xử lý trường hợp lỗi tại đây nếu cần
		}
		Date dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String CCCD = request.getParameter("CCCD");
		String imagePath = request.getParameter("image");
		
		int officeId = Integer.parseInt(request.getParameter("officeId"));
		int departmentId = Integer.parseInt(request.getParameter("departmentId"));
		
		Department department =departmentDAO.getDepartmentById(departmentId);
		Office office = officeDAO.getOfficeById(officeId);
		

		Staff staff = new Staff(stName, gender, dateOfBirth, email, phoneNumber, address, CCCD, imagePath, department,
				office, null);
		staff.setID_staff(id);
		staffDAO.updateStaff(staff);
		response.sendRedirect("home-page?action=list");
	}
	
	private void addLeave(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession(false);
	    Account account = (Account) session.getAttribute("user");
	    Staff staff = account.getStaff(); // Lấy đối tượng Staff từ Account
	    
		Date dayOff = Date.valueOf(request.getParameter("dayOff"));
		String description= request.getParameter("description");
		Leave leave = new Leave(dayOff,description,staff);
		leaveDAO.addLeave(leave);
		response.sendRedirect("home-page?action=list");
	}
	
	private void addOT(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		HttpSession session = request.getSession(false);
	    Account account = (Account) session.getAttribute("user");
	    Staff staff = account.getStaff(); // Lấy đối tượng Staff từ Account
	    
	    LocalDate currentDate = LocalDate.now();
		Date date = Date.valueOf(currentDate);
		boolean type = false;
	    float ceof =0;
	    int otTime = Integer.parseInt(request.getParameter("otTime"));
		String description= request.getParameter("description");
		OTBonus otBonus = new OTBonus(date, otTime,ceof, description, type, staff);
		bonusDAO.addOTBonus(otBonus);
		response.sendRedirect("home-page?action=list");
	}
	
}
