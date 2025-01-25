package controllers.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Order;

import java.io.IOException;
import java.sql.Connection;

import dao.orderdao;
import dbcontext.db;

/**
 * Servlet implementation class SearchOrder
 */
@WebServlet(name = "SearchOrderAdmin", urlPatterns = { "/SearchOrderAdmin" })
public class SearchOrderAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchOrderAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection conn = db.getConnection();
        int order_id = Integer.parseInt(request.getParameter("id"));
        orderdao od = new orderdao();
        try {
        	Order order = od.searchOrder(request, conn, order_id);
            if(order != null) {
            	System.out.print("tim duoc");
            	request.setAttribute("order",order);
                request.getRequestDispatcher("/HomePageAdmin.jsp").forward(request, response);
            }
		} catch (Exception e) {
			System.out.print("khong gui len duoc" + e.getMessage());
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
