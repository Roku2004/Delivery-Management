/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers.Admin;


import dao.orderdao;
import dao.routedao;
import dao.routeorderdao;
import dbcontext.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import models.Order;
import models.Route;
import models.RouteOrder;

/**
 *
 * @author ASUS
 */
@WebServlet("/addtrackingservlet")
public class addtrackingservlet extends HttpServlet {
   
    private static final long serialVersionUID = 1L;

	/** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addtrackingservlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addtrackingservlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	Connection conn = db.getConnection();
        int route_id = Integer.parseInt(request.getParameter("route"));
        int order_id = Integer.parseInt(request.getParameter("order"));
        String address = request.getParameter("address");
        String time = request.getParameter("time");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date date = sdf.parse(time);
            
            RouteOrder ro = new RouteOrder();
            routeorderdao rod = new routeorderdao();
            
            routedao routedao = new routedao();
            ArrayList<Route> routeList = routedao.routeList(request, conn);
            
            orderdao od = new orderdao();
            ArrayList<Order> orderList = od.getOrderAdmin(request, conn);
            
            for(Route route : routeList) {
            	if(route.getRoute_id() == route_id) {
            		route_id = route.getRoute_id();
            		ro.setRoute(route);
            		break;
            	}
            }
            
            for(Order order : orderList) {
            	if(order.getOrder_id() == order_id) {
            		order_id = order.getOrder_id();
            		ro.setOrder(order);
            		break;
            	}
            }
                     
            ro.setAddress(address);
            ro.setTime(date);
            rod.addRouteOrder(request,conn,ro);
            request.setAttribute("msg", "them xong");
			request.getRequestDispatcher("/addtrackingadmin.jsp").forward(request, response);
        } catch (Exception e) {
        	e.printStackTrace();
			request.setAttribute("msg", "Đã xảy ra lỗi: " + e.getMessage());
			request.getRequestDispatcher("/addtrackingadmin.jsp").forward(request, response);
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
