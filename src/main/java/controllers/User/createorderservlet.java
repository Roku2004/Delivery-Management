/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers.User;

import dao.orderdao;
import dbcontext.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import models.Account;
import models.Order;

/**
 *
 * @author ASUS
 */
@WebServlet("/createorderservlet")
public class createorderservlet extends HttpServlet {

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
			out.println("<title>Servlet createorderservlet</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet createorderservlet at " + request.getContextPath() + "</h1>");
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
		String Sender = request.getParameter("sender");
		String Receiver = request.getParameter("receiver");
		String Origin_address = request.getParameter("origin_address");
		String Destination_address = request.getParameter("destination_address");
		String Sender_phone = request.getParameter("sender_phone");
		String Receiver_phone = request.getParameter("receiver_phone");
		String status = "Wait confirm";
		int Weight = Integer.parseInt(request.getParameter("weight"));
		HttpSession session = request.getSession();// lấy thông tin account từ session về
		Account acc = (Account) session.getAttribute("account");

		orderdao od = new orderdao();
		Order order = new Order();
		order.setSender(Sender);
		order.setReceiver(Receiver);
		order.setOriginAddress(Origin_address);
		order.setDestinationAddress(Destination_address);
		order.setSender_phone(Sender_phone);
		order.setReceiver_phone(Receiver_phone);
		order.setStatus(status);
		order.setWeight(Weight);
		order.setAccount(acc);
		try {
			od.AddOrder(request, conn, order);
			request.setAttribute("msg", "them xong");
			request.getRequestDispatcher("/createorder.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "Đã xảy ra lỗi: " + e.getMessage());
			request.getRequestDispatcher("/createorder.jsp").forward(request, response);
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
