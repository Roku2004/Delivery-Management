/*
0 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import Idao.iorder;
import jakarta.servlet.http.HttpServletRequest;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import models.Order;

/**
 *
 * @author ASUS
 */
public class orderdao implements iorder {

	@Override
	public void AddOrder(HttpServletRequest request, Connection connection, Order order) {
		PreparedStatement psm = null;
		String sql = "INSERT INTO public.\"Order\"("
				+ "\"Sender\", \"Receiver\", \"Origin_address\", \"Destination_address\", \"Sender_phone\", \"Receiver_phone\",\"Status\", \"Weight\", \"Account_id\")"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";

		try {
			psm = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			psm.setString(1, order.getSender());
			psm.setString(2, order.getReceiver());
			psm.setString(3, order.getOriginAddress());
			psm.setString(4, order.getDestinationAddress());
			psm.setString(5, order.getSender_phone());
			psm.setString(6, order.getReceiver_phone());
			psm.setString(7, order.getStatus());
			psm.setInt(8, order.getWeight());
			psm.setInt(9, order.getAccount().getAccount_id());

			int status = psm.executeUpdate();
			if (status > 0) {
				System.out.println("Order added successfully");
			}
			psm.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void AddOrderAdmin(HttpServletRequest request, Connection connection, Order order) {
		PreparedStatement psm = null;// thực thi các câu lệnh sql
		String sql = "INSERT INTO public.\"Order\"("
				+ "\"Sender\", \"Receiver\", \"Origin_address\", \"Destination_address\", \"Sender_phone\", \"Receiver_phone\", \"Status\", \"Weight\", \"Total Cost\", \"Payment status\")"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
		try {
			psm = connection.prepareStatement(sql);
			psm.setString(1, order.getSender());
			psm.setString(2, order.getReceiver());
			psm.setString(3, order.getOriginAddress());
			psm.setString(4, order.getDestinationAddress());
			psm.setString(5, order.getSender_phone());
			psm.setString(6, order.getReceiver_phone());
			psm.setString(7, order.getStatus());
			psm.setInt(8, order.getWeight());
			psm.setFloat(9, order.getTotal_cost());
			psm.setBoolean(10, order.isPayment_status());
			int status = psm.executeUpdate();
			if (status > 0) {
				System.out.println("Order added successfully");
			}
			psm.close();
		} catch (Exception e) {
			String msg = e.toString();
			System.out.println("Extra error" + msg);
		}
	}

	@Override
	public void UpdateOrderUser(HttpServletRequest request, Connection connection, Order order) {
		PreparedStatement psm = null;// thực thi các câu lệnh sql
		String sql = "UPDATE public.\"Order\"\n"
				+ "	SET  \"Sender\"=?, \"Receiver\"=?, \"Origin_address\"=?, \"Destination_address\"=?, \"Sender_phone\"=?, \"Receiver_phone\"=?,\"Weight\" = ? "
				+ "	WHERE \"Order_id\"=? and \"Account_id\"=?;";
		try {
			psm = connection.prepareStatement(sql);
			psm.setString(1, order.getSender());
			psm.setString(2, order.getReceiver());
			psm.setString(3, order.getOriginAddress());
			psm.setString(4, order.getDestinationAddress());
			psm.setString(5, order.getSender_phone());
			psm.setString(6, order.getReceiver_phone());
			psm.setInt(7, order.getWeight());
			psm.setInt(8, order.getOrder_id());
			psm.setInt(9, order.getAccount().getAccount_id());
			int status = psm.executeUpdate();
			if (status > 0) {
				System.out.println("Order updated successfully ");
			}
			psm.close();
		} catch (Exception e) {
			String msg = e.toString();
			System.out.println("Update ERROR " + msg);
		}
	}

	@Override
	public void UpdateOrderAdmin(HttpServletRequest request, Connection connection, Order order) {
		PreparedStatement psm = null;// thực thi các câu lệnh sql
		String sql = "UPDATE public.\"Order\"\n"
				+ "SET \"Sender\"=?, \"Receiver\"=?, \"Origin_address\"=?, \"Destination_address\"=?, \"Sender_phone\"=?, \"Receiver_phone\"=?, \"Status\"=?, \"Weight\"=?, \"Total Cost\"=?, \"Payment status\"=?\n"
				+ "WHERE \"Order_id\"=?;";
		try {
			psm = connection.prepareStatement(sql);
			psm.setString(1, order.getSender());
			psm.setString(2, order.getReceiver());
			psm.setString(3, order.getOriginAddress());
			psm.setString(4, order.getDestinationAddress());
			psm.setString(5, order.getSender_phone());
			psm.setString(6, order.getReceiver_phone());
			psm.setString(7, order.getStatus());
			psm.setInt(8, order.getWeight());		
			psm.setFloat(9, order.getTotal_cost());
			psm.setBoolean(10, order.isPayment_status());
			psm.setInt(11, order.getOrder_id());
			int state = psm.executeUpdate();
			if (state > 0) {
				System.out.println("Successfully updated order status");
			}
			psm.close();
		} catch (Exception e) {
			String msg = e.toString();
			System.out.println("Update ERROR" + msg);
		}
	}

	@Override
	public ArrayList<Order> getOrder(HttpServletRequest request, Connection connection, int account_id) {
		PreparedStatement psm = null;// thực thi các câu lệnh sql

		String sql = "SELECT DISTINCT o.\"Order_id\", o.\"Sender\",o.\"Receiver\", o.\"Origin_address\", o.\"Destination_address\",\r\n"
				+ "o.\"Sender_phone\",o.\"Receiver_phone\",o.\"Status\", o.\"Weight\", o.\"Total Cost\", o.\"Payment status\"\r\n"
				+ "FROM public.\"Order\" as o\r\n"
				+ "inner join public.\"Account\" as a on o.\"Account_id\" = ? and a.\"role_id\" = 2";
		try {
			ArrayList<Order> orderList = new ArrayList<>();
			psm = connection.prepareStatement(sql);
			psm.setInt(1, account_id);
			ResultSet rs = psm.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setOrder_id(rs.getInt("Order_id"));
				order.setSender(rs.getString("Sender"));
				order.setReceiver(rs.getString("Receiver"));
				order.setOriginAddress(rs.getString("Origin_address"));
				order.setDestinationAddress(rs.getString("Destination_address"));
				order.setSender_phone(rs.getString("Sender_phone"));
				order.setReceiver_phone(rs.getString("Receiver_phone"));
				order.setStatus(rs.getString("Status"));
				order.setWeight(rs.getInt("Weight"));
				order.setTotal_cost(rs.getFloat("Total Cost"));
				order.setPayment_status(rs.getBoolean("Payment status"));
				orderList.add(order);	
			}
			psm.close();
			return orderList;
		} catch (Exception e) {
			String msg = e.toString();
			System.out.println("Search order ERROR" + msg);
		}
		return null;
	}

	@Override
	public ArrayList<Order> getOrderAdmin(HttpServletRequest request, Connection connection) {
		PreparedStatement psm = null;// thực thi các câu lệnh sql

		String sql = "SELECT \"Order_id\", \"Sender\", \"Receiver\", \"Origin_address\", \"Destination_address\", "
				+ "\"Sender_phone\", \"Receiver_phone\", \"Status\", \"Weight\", \"Total Cost\", \"Payment status\"\n"
				+ "FROM public.\"Order\" ORDER BY \"Order_id\" ASC ";
		try {
			ArrayList<Order> orderList = new ArrayList<>();
			psm = connection.prepareStatement(sql);
			ResultSet rs = psm.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setOrder_id(rs.getInt("Order_id"));
				order.setSender(rs.getString("Sender"));
				order.setReceiver(rs.getString("Receiver"));
				order.setOriginAddress(rs.getString("Origin_address"));
				order.setDestinationAddress(rs.getString("Destination_address"));
				order.setSender_phone(rs.getString("Sender_phone"));
				order.setReceiver_phone(rs.getString("Receiver_phone"));
				order.setStatus(rs.getString("Status"));
				order.setWeight(rs.getInt("Weight"));
				order.setTotal_cost(rs.getFloat("Total Cost"));
				order.setPayment_status(rs.getBoolean("Payment status"));
				orderList.add(order);	
			}
			psm.close();
			return orderList;
		} catch (Exception e) {
			String msg = e.toString();
			System.out.println("Search order ERROR" + msg);
		}
		return null;
	}

	@Override
	public Order searchOrder(HttpServletRequest request, Connection connection, int order_id) {
		PreparedStatement psm = null;// thực thi các câu lệnh sql

		String sql = "SELECT \"Order_id\", \"Sender\", \"Receiver\", \"Origin_address\", \"Destination_address\", \r\n"
				+ "\"Sender_phone\", \"Receiver_phone\", \"Status\", \"Weight\", \"Total Cost\", \"Payment status\"\r\n"
				+ "FROM public.\"Order\" where \"Order_id\" = ?";
		try {
			psm = connection.prepareStatement(sql);
			psm.setInt(1, order_id);
			ResultSet rs = psm.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setOrder_id(rs.getInt("Order_id"));
				order.setSender(rs.getString("Sender"));
				order.setReceiver(rs.getString("Receiver"));
				order.setOriginAddress(rs.getString("Origin_address"));
				order.setDestinationAddress(rs.getString("Destination_address"));
				order.setSender_phone(rs.getString("Sender_phone"));
				order.setReceiver_phone(rs.getString("Receiver_phone"));
				order.setStatus(rs.getString("Status"));
				order.setWeight(rs.getInt("Weight"));
				order.setTotal_cost(rs.getFloat("Total Cost"));
				order.setPayment_status(rs.getBoolean("Payment status"));

				return order;
			}
			psm.close();
			rs.close();
		} catch (Exception e) {
			String msg = e.toString();
			System.out.println("Search order ERROR" + msg);
		}
		return null;
	}

}
