/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package htplong.data.impl;

import htplong.data.dao.CategoryDao;
import htplong.data.driver.MySQLDriver;
import htplong.data.model.Category;
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
public class CategoryImpl implements CategoryDao{
    Connection con = MySQLDriver.getConnection();
    @Override
    public List<Category> finAll(){
        List<Category> listCategory= new ArrayList<>();
        String sql="select * from category";
        try {
            PreparedStatement sttm = con.prepareStatement(sql);
            ResultSet rs = sttm.executeQuery();
            while(rs.next()){
                int id = rs.getInt("id");
                String name = rs.getString("name");
                listCategory.add(new Category(id, name));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCategory;
    }
    @Override
    public boolean insert(Category category){
        return true;
    }
    @Override
    public boolean update(Category category){
        return true;
    }
    @Override
    public boolean delete(int id){
        return true;
    }
    @Override
    public Category find(int id){
        return null;
    }
    
}
