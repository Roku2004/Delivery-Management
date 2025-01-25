/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Idao.irouteorder;
import jakarta.servlet.http.HttpServletRequest;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import models.Order;
import models.Route;
import models.RouteOrder;
import services.DateTimeHelper;

/**
 *
 * @author ASUS
 */
public class routeorderdao implements irouteorder {
	@Override
	public void addRouteOrder(HttpServletRequest request, Connection connection,RouteOrder routeorder) {
		PreparedStatement psm = null;// thực thi các câu lệnh sql
		String sql = " INSERT INTO public.\"Route-Order\"(\n" + "\"Route_id\", \"Order_id\", \"Address\", \"Time\")\n"
				+ "VALUES (?, ?, ?, ?);";
		try {
			psm = connection.prepareStatement(sql);
			psm.setInt(1, routeorder.getRoute().getRoute_id());
			psm.setInt(2, routeorder.getOrder().getOrder_id());
			psm.setString(3, routeorder.getAddress());
			DateTimeHelper dth = new DateTimeHelper();
			java.sql.Date dob = dth.tosqlDate(routeorder.getTime());
			psm.setDate(4, dob);
			int status = psm.executeUpdate();
			if (status > 0) {
				System.out.println("Order added successfully");
			}
			psm.close();
		} catch (Exception e) {
			String msg = e.toString();
			System.out.println("Extra error: " + msg);
		}
	}

	@Override
	public ArrayList<RouteOrder> RouteOrderList(HttpServletRequest request, Connection connection) {
		PreparedStatement psm = null;// thực thi các câu lệnh sql
		String sql = "SELECT * FROM public.\"Route-Order\";";
		try {
			ArrayList<RouteOrder> routeorderlist = new ArrayList<>();
			psm = connection.prepareStatement(sql);
			ResultSet rs = psm.executeQuery();
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			while (rs.next()) {
				RouteOrder ro = new RouteOrder();
				
				Route route = new Route();
				route.setRoute_id(rs.getInt("Route_id"));
				
				Order order = new Order();
				order.setOrder_id(rs.getInt("Order_id"));
				
				ro.setId(rs.getInt("Track_id"));
				ro.setRoute(route);
				ro.setOrder(order);
				ro.setAddress(rs.getString("Address"));
				 Date date = rs.getDate("Time");
		            if (date != null) {
		                ro.setFormattedTime(sdf.format(date)); // Gán chuỗi định dạng
		            } else {
		                ro.setFormattedTime("N/A");
		            }
//				ro.setTime(rs.getDate("Time"));
				routeorderlist.add(ro);				
			}
			psm.close();
			return routeorderlist;
		} catch (Exception e) {
			System.out.println("Error getting tracking: " + e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ArrayList<RouteOrder> RouteOrderList(HttpServletRequest request, Connection connection, int order_id) {
		PreparedStatement psm = null;// thực thi các câu lệnh sql
		String sql = "SELECT \"Order_id\",\"Address\",\"Time\" FROM public.\"Route-Order\"\r\n"
				+ "Where \"Order_id\" = ?;";
		try {
			ArrayList<RouteOrder> routeorderlist = new ArrayList<>();
			psm = connection.prepareStatement(sql);
			psm.setInt(1, order_id);
			ResultSet rs = psm.executeQuery();			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
			while (rs.next()) {
				RouteOrder ro = new RouteOrder();
				
				Order order = new Order();
				order.setOrder_id(rs.getInt("Order_id"));

				ro.setOrder(order);
				ro.setAddress(rs.getString("Address"));
				 Date date = rs.getDate("Time");
		            if (date != null) {
		                ro.setFormattedTime(sdf.format(date)); // Gán chuỗi định dạng
		            } else {
		                ro.setFormattedTime("N/A");
		            }
				routeorderlist.add(ro);				
			}
			psm.close();
			return routeorderlist;
		} catch (Exception e) {
			System.out.println("Error getting tracking: " + e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

}
