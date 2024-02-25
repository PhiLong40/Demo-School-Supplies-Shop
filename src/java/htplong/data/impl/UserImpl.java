/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package htplong.data.impl;

import htplong.data.dao.UserDao;
import htplong.data.driver.MySQLDriver;
import htplong.data.model.User;
import htplong.utils.API;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author FPTHP
 */
public class UserImpl implements UserDao {
    Connection con = MySQLDriver.getConnection();
    @Override
    public User findUser(String emailphone, String password) {
        String sql;
        if(emailphone.contains("@"))sql="select * from nguoidung where email='"+emailphone+"' and password='"+API.getMd5(password)+"'";
        else sql="select * from nguoidung where phone = '"+emailphone+"' and password='"+API.getMd5(password)+"'";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            if(rs.next()) return new User(rs);
        } catch (SQLException ex) {
            Logger.getLogger(UserImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    @Override
    public User findUser(String emailphone) {
        String sql;
        if(emailphone.contains("@"))sql="select * from nguoidung where email=?";
        else sql="select * from nguoidung where phone = ?";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            sttm.setString(1, emailphone);
            ResultSet rs = sttm.executeQuery();
            if(rs.next()) return new User(rs);
        } catch (SQLException ex) {
            Logger.getLogger(UserImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    @Override
    public void insertUser(String name, String email, String phone, String password){
        String sql = "insert into nguoidung(name, email, phone, password, role) values(?,?,?,?,'')";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            sttm.setString(1, name);
            sttm.setString(2, email);
            sttm.setString(3, phone);
            sttm.setString(4, password);
            sttm.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
    }

    @Override
    public void UpdateUser(String email, String password) {
        String sql = "update nguoidung set password=? where email=?";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            sttm.setString(1, password);
            sttm.setString(2, email);
            sttm.executeUpdate();
            System.out.println(email+" "+password);
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        }
    }
}
