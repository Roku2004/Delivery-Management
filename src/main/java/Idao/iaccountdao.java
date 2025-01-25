/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Idao;

import java.sql.Connection;
import java.util.ArrayList;
import jakarta.servlet.http.HttpServletRequest;
import models.Account;
import models.Role;


/**
 *
 * @author ASUS
 */
public interface iaccountdao {
    
    public void AddaccountAdmin(HttpServletRequest request, Connection connection,String user_name, String password);
    
    public void Addaccount(HttpServletRequest request, Connection connection,String user_name, String password);
    
    public ArrayList<Account> getAccount(HttpServletRequest request, Connection connection);
    
    public ArrayList<Role> getAllRole(HttpServletRequest request, Connection connection);
    
    public void Adduser(HttpServletRequest request, Connection connection,String full_name,String phone,int user_id );
}
