/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Idao;

import java.sql.Connection;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import models.Vehical;

/**
 *
 * @author ASUS
 */
public interface ivehical {
    public void addVehical(HttpServletRequest request, Connection connection,String vehicalType,double capacity,String numberPlate);
    
    public ArrayList<Vehical> getVehical(HttpServletRequest request, Connection connection);
}
