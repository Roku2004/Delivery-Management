package controllers.User;

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
 * Servlet implementation class SearchTrackOrder
 */
@WebServlet("/SearchTrackOrder")
public class SearchTrackOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTrackOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
                RequestDispatcher dispatcher = request.getRequestDispatcher("UserTrackRoute.jsp");
    			dispatcher.forward(request, response);
            }
		} catch (Exception e) {
			System.out.print("khong gui len duoc" + e.getMessage());
		}
	}

}
