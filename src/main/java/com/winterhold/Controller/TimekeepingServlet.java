package com.winterhold.Controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.Enumeration;
import java.util.List;

import com.winterhold.DAO.DepartmentDAO;
import com.winterhold.DAO.LeaveDAO;
import com.winterhold.DAO.StaffDAO;
import com.winterhold.DAO.TimekeepingDAO;
import com.winterhold.Model.Department;
import com.winterhold.Model.Leave;
import com.winterhold.Model.Staff;
import com.winterhold.Model.Timekeeping;
import com.winterhold.Util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/timekeeping")
public class TimekeepingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StaffDAO staffDAO;
	private DepartmentDAO departmentDAO;
	private TimekeepingDAO timekDAO;
	private LeaveDAO leaveDAO;

	public void init() {
		staffDAO = new StaffDAO(HibernateUtil.getSessionFactory());
		departmentDAO = new DepartmentDAO(HibernateUtil.getSessionFactory());

		timekDAO =  new TimekeepingDAO(HibernateUtil.getSessionFactory());
		leaveDAO = new LeaveDAO(HibernateUtil.getSessionFactory());
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
			viewTimekeeping(request, response);
			break;
		case "new":
			break;
		case "addTk":
			insertTimekeeping(request, response);
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

	private void viewTimekeeping(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		LocalDate currentDate = LocalDate.now(); // Lấy ngày hiện tại
		request.setAttribute("currentDate", currentDate.toString()); // Đặt thuộc tính request
		Date tkDay = Date.valueOf(currentDate);
		List<Timekeeping> timekeepings = timekDAO.getAllTimekeepings();
		request.setAttribute("timekeepings", timekeepings);
		List<Leave> leaves = leaveDAO.getLeavesByDate(tkDay);//Lấy danh sách các nhân viên nghỉ hôm nay
		request.setAttribute("leaves", leaves);
		List<Department> departments = departmentDAO.getAllDepartments();

		List<Staff> staffs = staffDAO.getAllStaff();
		request.setAttribute("staffs", staffs);
		//Danh sách tất cả phòng ban
		request.setAttribute("departments", departments);
		//Danh sách tất cả chức vụnhyrm văn tornnguyeenx van trfdjjf

		//Danh sách phòng ban theo ID

		request.getRequestDispatcher("/views/admin/timekeeping-manager.jsp").forward(request, response);

	}
	 private void insertTimekeeping(HttpServletRequest request, HttpServletResponse response)
	            throws IOException {
		 LocalDate currentDate = LocalDate.now(); // Lấy ngày hiện tại
		 Date tkDay = Date.valueOf(currentDate);

	        // Lấy giá trị của radio button từ request
	        Enumeration<String> parameterNames = request.getParameterNames();
	        while (parameterNames.hasMoreElements()) {
	            String paramName = parameterNames.nextElement();
	            if (paramName.startsWith("gridRadios_")) {
	                int idStaff = Integer.parseInt(paramName.substring("gridRadios_".length()));
	                int type = Integer.parseInt(request.getParameter(paramName));

	                // Lấy thông tin nhân viên từ ID
	                Staff staff = staffDAO.getStaffById(idStaff);
	                if (staff != null) {
	                    // Tạo đối tượng Timekeeping và lưu vào cơ sở dữ liệu
	                    Timekeeping timekeeping = new Timekeeping(tkDay, type, staff);
	                    timekDAO.addTimekeeping(timekeeping);
	                }
	            }
	        }

	        response.sendRedirect("timekeeping");
	    }
	    
	
}
