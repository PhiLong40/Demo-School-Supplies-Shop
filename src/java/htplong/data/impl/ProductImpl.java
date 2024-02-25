/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package htplong.data.impl;


import htplong.data.dao.ProductDao;
import htplong.data.driver.MySQLDriver;
import htplong.data.model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author FPTHP
 */
public class ProductImpl implements ProductDao {
    Connection cn = MySQLDriver.getConnection();
    
    @Override
    public List<Product> finAll() {
        List<Product> listProduct = new ArrayList<>();
        String sql = "select * from product";
        PreparedStatement sttm;
        try {
            sttm = cn.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                int id_category = rs.getInt("id_category");
                String name = rs.getString("name");
                String image = rs.getString("image");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                boolean status = rs.getBoolean("status");
                listProduct.add(new Product(id, id_category, name, image, price, quantity, status));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct; 
    }

    @Override
    public void insertProduct(String name, String image, double price, int id_category, int quantity, boolean st) {
        String sql = "INSERT INTO product( name, image, price, quantity, id_category, status) VALUES (?, ?, ?, ?, ?, ?)";
    try {
        PreparedStatement sttm = cn.prepareStatement(sql);

        sttm.setString(1, name);
        sttm.setString(2, image);
        sttm.setDouble(3, price);
        sttm.setInt(4, quantity);
        sttm.setInt(5, id_category);
        sttm.setBoolean(6, st);
        sttm.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }
    @Override
    public Product findProduct(int id_product){
        String sql = "select * from product where id="+id_product;
        try {
            PreparedStatement sttm = cn.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            if(rs.next()) 
                return new Product(rs);
        } catch (SQLException ex) {
            Logger.getLogger(ProductImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public void delete(int id_product) {
        String sql = "DELETE FROM product WHERE id=?";
        try{
            PreparedStatement sttm = cn.prepareStatement(sql);
            sttm.setInt(1, id_product);
            sttm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateProduct(int id_product, String name, String image, double price, int id_category, int quantity, boolean st) {
        String sql = "update product set name=?, img=?, price=?, quantity=?, id_category=?, status=? where id=?";
    try {
        PreparedStatement sttm = cn.prepareStatement(sql);
        sttm.setString(1, name);
        sttm.setString(2, image);
        sttm.setDouble(3, price);
        sttm.setInt(4, quantity);
        sttm.setInt(5, id_category);
        sttm.setBoolean(6, st);
        sttm.setInt(7, id_product);
        sttm.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }
}
