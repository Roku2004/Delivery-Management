/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Idao;

import java.sql.Connection;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import models.RouteOrder;

/**
 *
 * @author ASUS
 */
public interface irouteorder {
    public void addRouteOrder(HttpServletRequest request, Connection connection,RouteOrder routeorder);
    
    public ArrayList<RouteOrder> RouteOrderList(HttpServletRequest request, Connection connection);
    
    public ArrayList<RouteOrder> RouteOrderList(HttpServletRequest request, Connection connection,int order_id); 
}
