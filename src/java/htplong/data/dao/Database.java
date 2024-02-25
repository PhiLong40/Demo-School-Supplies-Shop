/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package htplong.data.dao;

import htplong.data.impl.CategoryImpl;
import htplong.data.impl.ProductImpl;
import htplong.data.impl.UserImpl;


public class Database {
    public static CategoryDao getCategoryDao(){
        return new CategoryImpl();
    }
    public static ProductDao getProductDao(){
        return new ProductImpl();
    }
    public static UserDao getUserDao(){
        return new UserImpl();
    }
}
