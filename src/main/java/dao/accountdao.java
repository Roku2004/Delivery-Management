/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Idao.iaccountdao;
import jakarta.servlet.http.HttpServletRequest;
import models.Account;
import models.Role;

/**
 *
 * @author ASUS
 */
public class accountdao implements iaccountdao {
	// thêm vào account trong database
	@Override
	public void Addaccount(HttpServletRequest request, Connection connection, String user_name, String password) {
		PreparedStatement psm = null;
		String sql = "INSERT INTO public.\"Account\"(\r\n" + "username, \"password\", role_id, active)\r\n"
				+ "	VALUES (?, ?, ?, ?);";
		try {
			psm = connection.prepareStatement(sql);
			psm.setString(1, user_name);
			psm.setString(2, password);
			psm.setInt(3, 2);// role
			psm.setBoolean(4, true);

			int status = psm.executeUpdate();// thêm account
			if (status > 0) {
				System.out.println("them account thanh cong");
			}
			psm.close();
		} catch (Exception e) {
			String msg = e.toString();
			System.out.println("loi register" + msg);
		}
	}

	@Override
	public void AddaccountAdmin(HttpServletRequest request, Connection connection, String user_name, String password) {
		PreparedStatement psm = null;
		String sql = "INSERT INTO public.\"Account\"(\r\n" + "username, \"password\", role_id, active)\r\n"
				+ "	VALUES (?, ?, ?, ?);";
		try {
			psm = connection.prepareStatement(sql);
			psm.setString(1, user_name);
			psm.setString(2, password);
			psm.setInt(3, 1);// role
			psm.setBoolean(4, true);

			int status = psm.executeUpdate();// thêm account
			if (status > 0) {
				System.out.println("them account thanh cong");
			}
			psm.close();
		} catch (Exception e) {
			String msg = e.toString();
			System.out.println("loi register" + msg);
		}
	}

	@Override
	public ArrayList<Account> getAccount(HttpServletRequest request, Connection connection) {
		PreparedStatement psm = null;
		try {
			ArrayList<Account> accList = new ArrayList<>();
			String sql = "SELECT a.account_id, a.username, a.password, a.active,r.role_id, r.role_name\r\n"
					+ "FROM public.\"Account\" AS a \r\n"
					+ "INNER JOIN public.\"Role\" AS r ON a.role_id = r.role_id";
			psm = connection.prepareStatement(sql);
			ResultSet rs = psm.executeQuery();

			while (rs.next()) {
				Role role = new Role();
				role.setRole_id(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));

				Account acc = new Account();
				acc.setRole(role);
				acc.setAccount_id(rs.getInt("account_id"));
				acc.setUser_name(rs.getString("username"));
				acc.setPassword(rs.getString("password"));
				acc.setActive(rs.getBoolean("active"));

				accList.add(acc);				
			}
			psm.close();
			return accList;
		} catch (Exception e) {
			System.out.println("Error getting accounts: " + e.getMessage());
			e.printStackTrace();
		}
		return null;
	}

	// lấy hết các roll
	@Override
	public ArrayList<Role> getAllRole(HttpServletRequest request, Connection connection) {
		PreparedStatement psm = null;
		String sql = "select * from Role";
		try {
			ArrayList<Role> listRole = new ArrayList<>();

			psm = connection.prepareStatement(sql);
			ResultSet rs = psm.executeQuery();
			while (rs.next()) {
				Role role = new Role();
				role.setRole_id(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));
				listRole.add(role);				
			}
			psm.close();
			return listRole;
		} catch (Exception e) {
			String msg = e.toString();
			System.out.println("Get all role error: " + msg);
		}
		return null;
	}

	@Override
	public void Adduser(HttpServletRequest request, Connection connection, String full_name, String phone,
			int user_id) {
		PreparedStatement psm = null;
		String sql = "INSERT INTO public.\"User\"(full_name, phone, account_id) VALUES (?, ?, ?);";
		try {
			psm = connection.prepareStatement(sql);
			psm.setString(1, full_name);
			psm.setString(2, phone);
			psm.setInt(3, user_id);
			int status = psm.executeUpdate();// thêm account
			if (status > 0) {
				System.out.println("them thong tin nguoi dung thanh cong");
			}
			psm.close();
		} catch (Exception e) {
			String msg = e.toString();
			System.out.println("add user error" + msg);
		}
	}

}
