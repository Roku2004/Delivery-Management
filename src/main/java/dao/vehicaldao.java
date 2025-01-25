/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Idao.ivehical;
import jakarta.servlet.http.HttpServletRequest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import models.Vehical;

/**
 *
 * @author ASUS
 */
public class vehicaldao implements ivehical{  
    @Override
    public void addVehical(HttpServletRequest request, Connection connection,String vehicalType, double capacity, String numberPlate) {
    	PreparedStatement psm = null;//thực thi các câu lệnh sql
        String sql = "INSERT INTO public.\"Vehical\"(\n" +
                     "\"Vehicaltype\", \"Capacity(KG)\", \"NumberPlate\")\n" +
                     "VALUES (?, ?, ?);";
        try {
            psm = connection.prepareStatement(sql);
            psm.setString(1, vehicalType);
            psm.setDouble(2, capacity);
            psm.setString(3, numberPlate);
            int status = psm.executeUpdate();
            if(status > 0){
                System.out.println("Vehical added successfully");
            }
            psm.close();
        } catch (Exception e) {
            String msg = e.toString();
            System.out.println("Extra error" + msg);
        }
    }

    @Override
    public ArrayList<Vehical> getVehical(HttpServletRequest request, Connection connection) {
    	PreparedStatement psm = null;//thực thi các câu lệnh sql
        String sql = "SELECT * FROM public.\"Vehical\"\n"
        		   + "ORDER BY \"Vehical_id\" ASC ";
        try {
            ArrayList<Vehical> vehicalList = new ArrayList<>();
            psm = connection.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while(rs.next()){
                Vehical vehical = new Vehical();
                vehical.setVehical_id(rs.getInt("Vehical_id"));
                vehical.setVehicalType(rs.getString("Vehicaltype"));
                vehical.setCapacity(rs.getDouble("Capacity(KG)"));
                vehical.setNumberPlate(rs.getString("NumberPlate"));
                vehicalList.add(vehical);                
            }
            psm.close();
            return vehicalList;
        } catch (Exception e) {
            String msg = e.toString();
            System.out.println("Search vehical ERROR" + msg);
        }
        return null;       
    }
    
}
