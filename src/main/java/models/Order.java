/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class Order {

    private int order_id;
    private String sender;
    private String receiver;
    private String originAddress;
    private String destinationAddress;
    private String status;
    private String sender_phone;
    private String receiver_phone;
    private int weight;
    private float total_cost;
    private boolean payment_status;
    private Account account;
    private ArrayList<RouteOrder> routeorder;
    public Order() {
    }

    public Order(int order_id, String sender, String receiver, String originAddress, String destinationAddress, String status, String sender_phone, String receiver_phone, int weight, float total_cost, boolean payment_status, Account account, ArrayList<RouteOrder> routeorder) {
        this.order_id = order_id;
        this.sender = sender;
        this.receiver = receiver;
        this.originAddress = originAddress;
        this.destinationAddress = destinationAddress;
        this.status = status;
        this.sender_phone = sender_phone;
        this.receiver_phone = receiver_phone;
        this.weight = weight;
        this.total_cost = total_cost;
        this.payment_status = payment_status;
        this.account = account;
        this.routeorder = routeorder;
    }

    public Order(int order_id, String sender, String receiver, String originAddress, String destinationAddress, String status, String sender_phone, String receiver_phone, int weight, float total_cost, boolean payment_status) {
        this.order_id = order_id;
        this.sender = sender;
        this.receiver = receiver;
        this.originAddress = originAddress;
        this.destinationAddress = destinationAddress;
        this.status = status;
        this.sender_phone = sender_phone;
        this.receiver_phone = receiver_phone;
        this.weight = weight;
        this.total_cost = total_cost;
        this.payment_status = payment_status;
    }

    public int getOrder_id() {
        return order_id;
    }

    public String getSender() {
        return sender;
    }

    public String getReceiver() {
        return receiver;
    }

    public String getOriginAddress() {
        return originAddress;
    }

    public String getDestinationAddress() {
        return destinationAddress;
    }

    public String getStatus() {
        return status;
    }

    public String getSender_phone() {
        return sender_phone;
    }

    public String getReceiver_phone() {
        return receiver_phone;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver;
    }

    public void setOriginAddress(String originAddress) {
        this.originAddress = originAddress;
    }

    public void setDestinationAddress(String destinationAddress) {
        this.destinationAddress = destinationAddress;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setSender_phone(String sender_phone) {
        this.sender_phone = sender_phone;
    }

    public void setReceiver_phone(String receiver_phone) {
        this.receiver_phone = receiver_phone;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public float getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(float total_cost) {
        this.total_cost = total_cost;
    }

    public boolean isPayment_status() {
        return payment_status;
    }

    public void setPayment_status(boolean payment_status) {
        this.payment_status = payment_status;
    }

    public ArrayList<RouteOrder> getRouteorder() {
        return routeorder;
    }

    public void setRouteorder(ArrayList<RouteOrder> routeorder) {
        this.routeorder = routeorder;
    }

    public Account getAccount() {
        return account;
    }

    public void setAccount(Account account) {
        this.account = account;
    }
    
    
    
}
