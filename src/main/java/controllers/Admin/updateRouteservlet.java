/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controllers.Admin;

import dao.routedao;
import dbcontext.db;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

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
@WebServlet("/updateRouteservlet")
public class updateRouteservlet extends HttpServlet {
   
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
            out.println("<title>Servlet updateRouteservlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateRouteservlet at " + request.getContextPath () + "</h1>");
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
        int route_id = Integer.parseInt(request.getParameter("route_id"));
        String startpoint = request.getParameter("startpoint");
        String endpoint = request.getParameter("endpoint");
        int driver_id = Integer.parseInt(request.getParameter("driver"));
        int vehical_id =Integer.parseInt(request.getParameter("vehical"));
        try {
            Route route = new Route();
            routedao rd = new routedao();
            route.setStartPoint(startpoint);
            route.setEndPoint(endpoint);
            
            Driver driver = new Driver();
            driver.setDriver_id(driver_id);
            
            route.setDriver(driver);

            Vehical vehical = new Vehical();
            vehical.setVehical_id(vehical_id);
            
            route.setVehical(vehical);
            route.setRoute_id(route_id);
            
            rd.updateRoute(request,conn,route);
            response.sendRedirect("adminpage.jsp");
        } catch (Exception e) {
            System.out.println("UPDATE ERROR CHECK DRIVER AND VEHICAL" + e.getMessage());
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
