/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Idao;

import java.sql.Connection;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import models.Route;

/**
 *
 * @author ASUS
 */
public interface iroute {
    public void addRoute(HttpServletRequest request, Connection connection,Route route);
    
    public void updateRoute(HttpServletRequest request, Connection connection,Route route);
    
    public ArrayList<Route> routeList(HttpServletRequest request, Connection connection);
}
