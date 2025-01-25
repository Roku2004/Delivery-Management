/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Idao.iroute;
import jakarta.servlet.http.HttpServletRequest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import models.Driver;
import models.Route;
import models.Vehical;

/**
 *
 * @author ASUS
 */
public class routedao implements iroute{
    @Override
    public void addRoute(HttpServletRequest request, Connection connection,Route route) {
    	PreparedStatement psm = null;//thực thi các câu lệnh sql
        String sql ="INSERT INTO public.\"Route\"(\n" +
"	\"Startpoint\", \"Endpoint\", \"Driver_id\", \"Vehical_id\")\n" +
"	VALUES (?, ?, ?, ?);";
        try {
            psm = connection.prepareStatement(sql);
            psm.setString(1,route.getStartPoint() );
            psm.setString(2,route.getEndPoint() );
            psm.setInt(3, route.getDriver().getDriver_id());
            psm.setInt(4, route.getVehical().getVehical_id());
            int status = psm.executeUpdate();
            if(status > 0){
                System.out.println("Route added successfully");
            }
            psm.close();
        } catch (Exception e) {
            String msg = e.toString();
            System.out.println("ADD ERROR" + msg);
        }
    }

    @Override
    public void updateRoute(HttpServletRequest request, Connection connection,Route route) {
    	PreparedStatement psm = null;//thực thi các câu lệnh sql
        String sql = "UPDATE public.\"Route\"\n" +
"	SET  \"Startpoint\"=?, \"Endpoint\"=?, \"Driver_id\"=?, \"Vehical_id\"=?\n" +
"	WHERE \"Route_id\"=?;";
        try {
            psm = connection.prepareStatement(sql);
            psm.setString(1,route.getStartPoint() );
            psm.setString(2,route.getEndPoint() );
            psm.setInt(3, route.getDriver().getDriver_id());
            psm.setInt(4, route.getVehical().getVehical_id());
            psm.setInt(5, route.getRoute_id());
            int status = psm.executeUpdate();
            if(status > 0){
                System.out.println("Route update successfully");
            }
            psm.close();
        } catch (Exception e) {
            String msg = e.toString();
            System.out.println("UPDATE error" + msg);
        }
    }

    @Override
    public ArrayList<Route> routeList(HttpServletRequest request, Connection connection) {
    	PreparedStatement psm = null;//thực thi các câu lệnh sql
        String sql = "select r.* from public.\"Route\" as r\n" +
                     "INNER join public.\"Driver\" as d on d.\"Driver_id\" = r.\"Driver_id\"\n" +
                     "INNER join public.\"Vehical\" as v on v.\"Vehical_id\" = r.\"Vehical_id\"" +
                     "ORDER BY \"Route_id\" ASC ";
        try {
            ArrayList<Route> routeList = new ArrayList<>();
            psm = connection.prepareStatement(sql);
            ResultSet rs = psm.executeQuery();
            while(rs.next()){
                Driver driver =new Driver();
                driver.setDriver_id(rs.getInt("Driver_id"));
                
                Vehical vehical =new Vehical();
                vehical.setVehical_id(rs.getInt("Vehical_id"));
                
                Route route =new Route();
                route.setRoute_id(rs.getInt("Route_id"));
                route.setStartPoint(rs.getString("Startpoint"));
                route.setEndPoint(rs.getString("EndPoint"));
                route.setDriver(driver);
                route.setVehical(vehical);
                
                routeList.add(route);                
            }
            psm.close();
            return routeList;
        } catch (Exception e) {
            String msg = e.toString();
            System.out.println("Search route ERROR" + msg);
        }
        return null;
    }
    
}
