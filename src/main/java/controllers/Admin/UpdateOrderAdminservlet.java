/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers.Admin;

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
import models.Order;

/**
 *
 * @author ASUS
 */
@WebServlet("/UpdateOrderAdminservlet")
public class UpdateOrderAdminservlet extends HttpServlet {
   
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
            out.println("<title>Servlet UpdateOrderAdminservlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateOrderAdminservlet at " + request.getContextPath () + "</h1>");
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
        int order_id = Integer.parseInt(request.getParameter("order_id"));
        String Sender = request.getParameter("sender");
        String Receiver = request.getParameter("receiver");
        String Origin_address = request.getParameter("origin_address");
        String Destination_address = request.getParameter("destination_address");
        String Sender_phone = request.getParameter("sender_phone");
        String Receiver_phone = request.getParameter("receiver_phone");
        String Status = request.getParameter("status");
        int Weight = Integer.parseInt(request.getParameter("weight"));
        float Total_Cost = Float.parseFloat(request.getParameter("total"));
        String choice = request.getParameter("payment");
        boolean Payment_status;
        if(choice.equals("true")){
            Payment_status = true;
        }
        else{
            Payment_status = false;
        }
        try {
        	orderdao od = new orderdao();
        	Order order = new Order();
            order.setSender(Sender);
            order.setReceiver(Receiver);
            order.setOriginAddress(Origin_address);
            order.setDestinationAddress(Destination_address);
            order.setSender_phone(Sender_phone);
            order.setReceiver_phone(Receiver_phone);
            order.setStatus(Status);
            order.setWeight(Weight);
            order.setTotal_cost(Total_Cost);
            order.setPayment_status(Payment_status);
            order.setOrder_id(order_id);
            od.UpdateOrderAdmin(request,conn,order);
            response.sendRedirect("adminpage.jsp");
		} catch (Exception e) {
			System.out.println("UPDATE ERROR" + e.getMessage());
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
