/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Iservices;

/**
 *
 * @author ASUS
 */
public interface Idatetimehelper {
    public abstract java.util.Date removeTime(java.util.Date d);
    
    public abstract java.sql.Date tosqlDate(java.util.Date d);
}
