/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import Idao.idrive;
import jakarta.servlet.http.HttpServletRequest;
import models.Driver;

/**
 *
 * @author ASUS
 */
public class driverdao implements idrive {
    @Override
    public void addDrive(HttpServletRequest request, Connection connection,String Dvier_name, String Driver_phone, boolean Status) {
    	PreparedStatement psm = null;// thực thi các câu lệnh sql
    	String sql = "INSERT INTO public.\"Driver\"(\n"
    			+ "\"Driver_name\", \"Driver_phone\", \"Status\")\n"
    			+ "VALUES (?, ?, ?);";
        try {
            psm = connection.prepareStatement(sql);
            psm.setString(1, Dvier_name);
            psm.setString(2, Driver_phone);
            psm.setBoolean(3, Status);
            int state = psm.executeUpdate();
            if (state > 0) {
                System.out.println("Driver added successfully");
            }
            psm.close();
        } catch (Exception e) {
            String msg = e.toString();
            System.out.println("Extra error" + msg);
        }
    }

    @Override
    public ArrayList<Driver> driver(HttpServletRequest request, Connection connection) {
    	PreparedStatement psm = null;// thực thi các câu lệnh sql
    	String sql = "SELECT * FROM public.\"Driver\";";
        try {
            ArrayList<Driver> driverList = new ArrayList<>();
            psm = connection.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while (rs.next()) {
                Driver driver = new Driver();
                driver.setDriver_id(rs.getInt("Driver_id"));
                driver.setName(rs.getString("Driver_name"));
                driver.setPhone(rs.getString("Driver_phone"));
                driver.setStatus(rs.getBoolean("Status"));
                driverList.add(driver);              
            }
            psm.close();
            return driverList;
        } catch (Exception e) {
            String msg = e.toString();
            System.out.println("Search driver ERROR" + msg);
        }
        return null;
    }

    @Override
    public void updateDrive(HttpServletRequest request, Connection connection,int driver_id, String Driver_name, String Driver_phone, boolean Status) {
    	PreparedStatement psm = null;// thực thi các câu lệnh sql
    	String sql = "UPDATE public.\"Driver\"\n"
    			+ "SET \"Driver_name\"=?, \"Driver_phone\"=?, \"Status\"=?\n"
    			+ "WHERE \"Driver_id\"=?;";
        try {
            psm = connection.prepareStatement(sql);
            psm.setString(1, Driver_name);
            psm.setString(2, Driver_phone);
            psm.setBoolean(3, Status);
            psm.setInt(4, driver_id);
            int state = psm.executeUpdate();
            if (state > 0) {
                System.out.println("Driver update successfully");
            }
            psm.close();
        } catch (Exception e) {
            String msg = e.toString();
            System.out.println("Extra error" + msg);
        }
    }

}
