package com.winterhold.Controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import com.winterhold.DAO.DepartmentDAO;
import com.winterhold.DAO.OTBonusDAO;
import com.winterhold.DAO.StaffDAO;
import com.winterhold.Model.Department;
import com.winterhold.Model.OTBonus;
import com.winterhold.Model.Staff;
import com.winterhold.Util.HibernateUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/otbonus")
public class OTBonusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StaffDAO staffDAO;
	private DepartmentDAO departmentDAO;
	private OTBonusDAO otBonusDAO;

	public void init() {
		staffDAO = new StaffDAO(HibernateUtil.getSessionFactory());
		departmentDAO = new DepartmentDAO(HibernateUtil.getSessionFactory());
		otBonusDAO = new OTBonusDAO(HibernateUtil.getSessionFactory());
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
			viewOT(request, response);
			break;
		case "new":
			break;
		case "addTk":
			break;
		case "delete":
			break;
		case "edit":
			updateOT(request, response);
			break;
		case "editDp":
			break;
		case "update":
			break;
		default:
			break;
		}
	}
	
	private void viewOT(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		LocalDate currentDate = LocalDate.now(); // Lấy ngày hiện tại
		request.setAttribute("currentDate", currentDate.toString()); // Đặt thuộc tính request
		List<OTBonus> otBonuses = otBonusDAO.getAllOTBonuses();
		request.setAttribute("otBonuses", otBonuses);
		List<Department> departments = departmentDAO.getAllDepartments();
		List<Staff> staffs = staffDAO.getAllStaff();
		request.setAttribute("staffs", staffs);
		request.setAttribute("departments", departments);
		request.getRequestDispatcher("/views/admin/otbonus-manager.jsp").forward(request, response);
	}
	
	private void updateOT(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("ID_ot"));
        float coef = Float.parseFloat(request.getParameter("coef"));
        Date otDay = Date.valueOf(request.getParameter("otDay"));
        int otTime= Integer.parseInt(request.getParameter("otTime"));
        String des = request.getParameter("description");
        Staff staff = getStaff(request);
        boolean type = true;  
        OTBonus otBonus = new OTBonus(id,otDay,otTime,coef,des,type,staff);
        otBonusDAO.updateOTBonus(otBonus);
        response.sendRedirect("otbonus");
    }
	private Staff getStaff(HttpServletRequest request) {
		  int staffId = Integer.parseInt(request.getParameter("staffId"));
		return staffDAO.getStaffById(staffId);
	}

}
