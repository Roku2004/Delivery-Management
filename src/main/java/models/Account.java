/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class Account {
    private int account_id;
    private String user_name;
    private String password;
    private boolean active; // tkhoan có bị block ko
    private Role role;
    private ArrayList<User> user;
    private ArrayList<Order> order;
    public Account() {
    }

    public Account(int account_id, String user_name, String password, boolean active, Role role, ArrayList<User> user, ArrayList<Order> order) {
        this.account_id = account_id;
        this.user_name = user_name;
        this.password = password;
        this.active = active;
        this.role = role;
        this.user = user;
        this.order = order;
    }

    public Account(int account_id, String user_name, String password, boolean active, Role role) {
        this.account_id = account_id;
        this.user_name = user_name;
        this.password = password;
        this.active = active;
        this.role = role;
    }
    
    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public ArrayList<User> getUser() {
        return user;
    }

    public void setUser(ArrayList<User> user) {
        this.user = user;
    }

    public ArrayList<Order> getOrder() {
        return order;
    }

    public void setOrder(ArrayList<Order> order) {
        this.order = order;
    }
    
}
