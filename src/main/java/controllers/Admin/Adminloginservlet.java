/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers.Admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import dao.accountdao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

import dbcontext.db;
import models.Account;


/**
 *
 * @author ASUS
 */
@WebServlet("/Adminloginservlet")
public class Adminloginservlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Servlet loginservlet</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet loginservlet at " + request.getContextPath() + "</h1>");
			out.println("</body>");
			out.println("</html>");
		}
	}

	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
	// + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection conn = db.getConnection();
		accountdao accdao = new accountdao();
		ArrayList<Account> accList = accdao.getAccount(request, conn);
		String full_name = request.getParameter("Username");
		String password = request.getParameter("Password");
		boolean isMatched = false; // Biến cờ kiểm tra tài khoản khớp

		for (Account acc : accList) {
			if (acc.getUser_name().equals(full_name) && acc.getPassword().equals(password)) {
				isMatched = true; // Đánh dấu tài khoản khớp

				if (acc.isActive()) { // Tài khoản còn hoạt động
					HttpSession ss = request.getSession();
					ss.setAttribute("account", acc);
					if (acc.getRole().getRole_id() == 1) { // User
						response.sendRedirect("adminpage.jsp");
					}
				} else { // Tài khoản bị khóa
					response.sendRedirect("Adminlogin.jsp");
				}
				return; // Thoát khỏi phương thức sau khi xử lý
			}
		}

		if (!isMatched) { // Không tìm thấy tài khoản khớp
			response.sendRedirect("Adminlogin.jsp");
		}

	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
