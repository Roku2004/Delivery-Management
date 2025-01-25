/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package services;

import Iservices.Idatetimehelper;
import java.util.Date;
import java.util.Calendar;
/**
 *
 * @author ASUS
 */
public class DateTimeHelper implements Idatetimehelper{

    @Override
    public Date removeTime(Date d) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(d);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE,0);
        cal.set(Calendar.SECOND, 0);
        return cal.getTime();
    }

    @Override
    public java.sql.Date tosqlDate(Date d) {
        d = removeTime(d);
        return new java.sql.Date(d.getTime());
    }
    
}
