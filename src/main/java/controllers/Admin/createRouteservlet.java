/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers.Admin;

import dao.driverdao;
import dao.routedao;
import dao.vehicaldao;
import dbcontext.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Driver;
import models.Route;
import models.Vehical;

/**
 *
 * @author ASUS
 */
@WebServlet("/createRouteservlet")
public class createRouteservlet extends HttpServlet {

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
			out.println("<title>Servlet createRouteservlet</title>");
			out.println("</head>");
			out.println("<body>");
			out.println("<h1>Servlet createRouteservlet at " + request.getContextPath() + "</h1>");
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
		processRequest(request, response);
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
		String startpoint = request.getParameter("startpoint");
		String endpoint = request.getParameter("endpoint");
		int driver_id = Integer.parseInt(request.getParameter("driver"));
		int vehical_id = Integer.parseInt(request.getParameter("vehical"));
		driverdao driverdao = new driverdao();
		ArrayList<Driver> driverList = driverdao.driver(request,conn);
		
		vehicaldao vd = new vehicaldao();
		ArrayList<Vehical> vehicalList = vd.getVehical(request, conn);
		
		routedao rd = new routedao();
		Route route = new Route();
		route.setStartPoint(startpoint);
		route.setEndPoint(endpoint);
		for(Driver driver : driverList) {
			if(driver.getDriver_id() == driver_id) {
				driver_id = driver.getDriver_id();
				route.setDriver(driver);
				break;
			}
		}
		
		for(Vehical vehical : vehicalList) {
			if(vehical.getVehical_id() == vehical_id) {
				vehical_id = vehical.getVehical_id();
				route.setVehical(vehical);
				break;
			}
		}
		
		
		try {
			rd.addRoute(request, conn, route);
			request.setAttribute("msg", "them xong");
			request.getRequestDispatcher("/createRouteAdmin.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", "Đã xảy ra lỗi: " + e.getMessage());
			request.getRequestDispatcher("/createRouteAdmin.jsp").forward(request, response);
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
