package com.winterhold.Controller;

import com.winterhold.DAO.AccountDAO;
import com.winterhold.Model.Account;
import com.winterhold.Util.HibernateUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AccountDAO accountDAO = new AccountDAO(HibernateUtil.getSessionFactory());
        Account account = accountDAO.getAccountByUsernameAndPassword(username, password);

        if (account != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", account);
            if (account.getRole()) {
                response.sendRedirect("/WinterHold_HRM/admin/home-page");
            } else {
                response.sendRedirect("/WinterHold_HRM/user/home-page");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/views/login.jsp?error=true");
        }
    }

    
    
}
