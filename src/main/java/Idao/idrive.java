/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Idao;

import java.sql.Connection;
import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import models.Driver;

/**
 *
 * @author ASUS
 */
public interface idrive {
    public void addDrive(HttpServletRequest request, Connection connection,String Dvier_name,String Driver_phone,boolean Status);
    
    public ArrayList<Driver> driver(HttpServletRequest request, Connection connection);
    
    public void updateDrive(HttpServletRequest request, Connection connection,int driver_id,String Driver_name,String Driver_phone,boolean Status);
}
