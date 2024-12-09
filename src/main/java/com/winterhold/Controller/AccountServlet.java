package com.winterhold.Controller;

import java.io.IOException;
import java.util.List;

import com.winterhold.DAO.AccountDAO;
import com.winterhold.DAO.DepartmentDAO;
import com.winterhold.DAO.StaffDAO;
import com.winterhold.Model.Account;
import com.winterhold.Model.Department;
import com.winterhold.Model.Staff;
import com.winterhold.Util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin/account")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StaffDAO staffDAO;
	private DepartmentDAO departmentDAO;
	private AccountDAO accountDAO;
	
	

	public void init() {
		staffDAO = new StaffDAO(HibernateUtil.getSessionFactory());
		departmentDAO = new DepartmentDAO(HibernateUtil.getSessionFactory());
		accountDAO = new AccountDAO(HibernateUtil.getSessionFactory());
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
			viewAcount(request, response);
			break;
		case "new":
			break;
		case "add":
			addAcount(request, response);
			break;
		case "delete":
			deleteAccount(request, response);
			break;
		case "editPw":
			editPasswordAcount(request, response);
			break;
		case "editRole":
			editRoleAcount(request, response);
			break;
		case "update":
			viewUpdate(request, response);
			break;
		default:
			break;
		}
	}
	
	private void viewAcount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<Department> departments = departmentDAO.getAllDepartments();
		List<Account> accounts = accountDAO.getAllAccounts();
		List<Staff> staffWithoutAccount = staffDAO.getStaffWithoutAccount();
		request.setAttribute("accounts",accounts);
		request.setAttribute("departments",departments);
		List<Staff> staffs = staffDAO.getAllStaff();
		request.setAttribute("staffs", staffs);
		request.setAttribute("staffAccount", staffWithoutAccount);
		request.getRequestDispatcher("/views/admin/account-manager.jsp").forward(request, response);
	}
	
	private void addAcount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		int staffId = Integer.parseInt(request.getParameter("staffId"));
		Staff staff = staffDAO.getStaffById(staffId);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		boolean role = Boolean.parseBoolean(request.getParameter("role"));
		Account account = new Account(username, password, role, staff);
		accountDAO.addAccount(account);
		
		response.sendRedirect("account");
	}
	
	private void deleteAccount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		int staffAC = Integer.parseInt(request.getParameter("id"));
		
		accountDAO.deleteAccount(staffAC);
		response.sendRedirect("account");
	}
	
	
	private void viewUpdate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		List<Department> departments = departmentDAO.getAllDepartments();
		Account account = accountDAO.getAccountById(id);
		
		request.setAttribute("account",account);
		request.setAttribute("departments",departments);
		
		request.getRequestDispatcher("/views/admin/account-update.jsp").forward(request, response);
	}
	
	private void editPasswordAcount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		int accountId = Integer.parseInt(request.getParameter("accountId"));
		
		String password = request.getParameter("password");
		accountDAO.updatePassword(accountId, password);
		response.sendRedirect("account");
	}
	
	private void editRoleAcount(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		
		boolean role = Boolean.parseBoolean(request.getParameter("role"));
		int accountId = Integer.parseInt(request.getParameter("accountId"));

		accountDAO.updateRole(accountId, role);
		response.sendRedirect("account");

	}
}
