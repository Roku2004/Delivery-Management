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
 * Servlet implementation class TrackingListservlet
 */
@WebServlet("/TrackingListservlet")
public class TrackingListservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrackingListservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Connection conn = db.getConnection();
			routeorderdao track = new routeorderdao();
			ArrayList<RouteOrder> trackList = track.RouteOrderList(request, conn);
			request.setAttribute("list",trackList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("TrackingList.jsp");
            System.out.println("Search Succesfull");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			System.out.println("ERROR" + e.getMessage()); 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
