/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Idao;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import models.Order;
import java.sql.Connection;

/**
 *
 * @author ASUS
 */
public interface iorder {
	public void AddOrder(HttpServletRequest request, Connection connection, Order order);

	public void UpdateOrderUser(HttpServletRequest request, Connection connection, Order order);

	public void UpdateOrderAdmin(HttpServletRequest request, Connection connection, Order order);

	public void AddOrderAdmin(HttpServletRequest request, Connection connection, Order order);

	public ArrayList<Order> getOrder(HttpServletRequest request, Connection connection, int account_id);

	public ArrayList<Order> getOrderAdmin(HttpServletRequest request, Connection connection);

	public Order searchOrder(HttpServletRequest request, Connection connection, int order_id);
}
