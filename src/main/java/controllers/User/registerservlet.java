/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers.User;

import dao.accountdao;
import dbcontext.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import models.Account;

/**
 *
 * @author ASUS
 */
@WebServlet("/registerservlet")
public class registerservlet extends HttpServlet {

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
			out.println("<title>Servlet registerservlet</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet registerservlet at " + request.getContextPath() + "</h1>");
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
		String user_name = request.getParameter("user");// tên đăng nhập
		String password = request.getParameter("pass");
		String full_name = request.getParameter("full_name");// tên của thật người dùng
		String phone = request.getParameter("phone");

		try {
			accountdao accDao = new accountdao();
			accDao.Addaccount(request, conn, user_name, password);
			ArrayList<Account> accList = accDao.getAccount(request, conn);
			for (Account acc : accList) {
				if (acc.getUser_name().equals(user_name) && acc.getPassword().equals(password)) {
					int account_id = acc.getAccount_id();
					accDao.Adduser(request, conn, full_name, phone, account_id);
					break;
				}
			}
			response.sendRedirect("login.jsp");
		} catch (Exception e) {
			System.out.println("ERROR" + e.getMessage());
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
