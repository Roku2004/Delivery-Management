package controllers.Admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.RouteOrder;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import dao.routeorderdao;
import dbcontext.db;

/**
 * Servlet implementation class AdminTrackRouteservlet
 */
@WebServlet("/AdminTrackRouteservlet")
public class AdminTrackRouteservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminTrackRouteservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = db.getConnection();
        int track = Integer.parseInt(request.getParameter("search"));
        routeorderdao rod = new routeorderdao();
        try {
        	ArrayList<RouteOrder> routeorder = rod.RouteOrderList(request, conn, track);
            if(routeorder != null) {
            	System.out.print("tim duoc");
            	request.setAttribute("list",routeorder);
                RequestDispatcher dispatcher = request.getRequestDispatcher("adminpage.jsp");
    			dispatcher.forward(request, response);
            }
		} catch (Exception e) {
			System.out.print("khong gui len duoc" + e.getMessage());
		}
	}

}
