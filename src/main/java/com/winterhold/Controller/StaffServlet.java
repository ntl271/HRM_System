package com.winterhold.Controller;

import com.google.gson.Gson;
import com.winterhold.DAO.DepartmentDAO;
import com.winterhold.DAO.OfficeDAO;
import com.winterhold.DAO.StaffDAO;
import com.winterhold.Model.Department;
import com.winterhold.Model.Office;
import com.winterhold.Model.Staff;
import com.winterhold.Util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

@WebServlet("/admin/staff")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB
public class StaffServlet extends HttpServlet {
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

	private void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action == null) {
			action = "list";
		}

		try {
			switch (action) {
			case "new":
				showNewForm(request, response);
				break;
			case "insert":
				insertStaff(request, response);
				break;
			case "delete":
				deleteStaff(request, response);
				break;
			case "edit":
				showEditForm(request, response);
				break;
			case "update":
				updateStaff(request, response);
				break;
			case "view":
				viewStaff(request, response);
				break;
			default:
				listStaff(request, response);
				break;
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	private void listStaff(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Staff> listStaff = staffDAO.getAllStaff();
		request.setAttribute("listStaff", listStaff);
		List<Department> departments = departmentDAO.getAllDepartments();
		List<Office> offices = officeDAO.getAllOffices();
		request.setAttribute("departments", departments);
		request.setAttribute("offices", offices);
		request.getRequestDispatcher("/views/admin/staff-manager.jsp").forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Department> departments = departmentDAO.getAllDepartments();

		request.setAttribute("departments", departments);
	
		request.getRequestDispatcher("/views/admin/staff-add.jsp").forward(request, response);

	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Staff existingStaff = staffDAO.getStaffById(id);
		List<Department> departments = departmentDAO.getAllDepartments();
		List<Office> offices = officeDAO.getAllOffices();
		request.setAttribute("staff", existingStaff);
		request.setAttribute("departments", departments);
		request.setAttribute("offices", offices);
		request.getRequestDispatcher("/views/admin/staff-update.jsp").forward(request, response);
	}

	private void insertStaff(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// Các thông tin của nhân viên từ request
		String stName = request.getParameter("stName");
		boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
		Date dateOfBirth = Date.valueOf(request.getParameter("dateOfBirth"));
		String email = request.getParameter("email");
		String phoneNumber = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String CCCD = request.getParameter("CCCD");
		String imagePath = "";

		System.out.println(getServletContext().getRealPath(""));
		// Đường dẫn thư mục lưu trữ ảnh
		String uploadPath = "C:\\Users\\baruk\\eclipse-workspace\\WinterHold_HRM\\src\\main\\webapp\\views\\resources\\avatars";

		// Tạo một thư mục lưu trữ nếu chưa tồn tại
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		for (Part part : request.getParts()) {
			String fileName = extractFileName(part);
			if (!fileName.isEmpty()) {
				// Ghi file ảnh vào thư mục upload
				part.write(uploadPath + File.separator + fileName);

				// Đường dẫn tương đối của ảnh để lưu vào cơ sở dữ liệu
				imagePath = "views/resources/avatars/" + fileName;
			}
		}

		// Lấy thông tin department và office từ request
		Department department = getDepartmentFromRequest(request);
		Office office = getOfficeFromRequest(request);

		// Tạo đối tượng Staff mới
		Staff newStaff = new Staff(stName, gender, dateOfBirth, email, phoneNumber, address, CCCD, imagePath,
				department, office, null);
		staffDAO.addStaff(newStaff);
		response.sendRedirect("staff?action=list");
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
		;

		Department department = getDepartmentFromRequest(request);
		Office office = getOfficeFromRequest(request);

		Staff staff = new Staff(stName, gender, dateOfBirth, email, phoneNumber, address, CCCD, imagePath, department,
				office, null);
		staff.setID_staff(id);
		staffDAO.updateStaff(staff);
		response.sendRedirect("staff?action=list");
	}

	private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		staffDAO.deleteStaff(id);
		response.sendRedirect("staff?action=list");
	}

	private Department getDepartmentFromRequest(HttpServletRequest request) {
		int departmentId = Integer.parseInt(request.getParameter("departmentId"));
		return departmentDAO.getDepartmentById(departmentId);
	}

	private Office getOfficeFromRequest(HttpServletRequest request) {
		int officeId = Integer.parseInt(request.getParameter("officeId"));
		return officeDAO.getOfficeById(officeId);
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

	private void viewStaff(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		Staff staff = staffDAO.getStaffById(id);

		// Chuyển đổi đối tượng Staff thành JSON để gửi về client
		Gson gson = new Gson();
		String staffJson = gson.toJson(staff);

		// Gửi JSON về client
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(staffJson);
		out.flush();
	}

	

}
