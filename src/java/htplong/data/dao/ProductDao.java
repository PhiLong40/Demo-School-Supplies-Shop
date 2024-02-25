/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package htplong.data.dao;

import htplong.data.model.Product;
import java.util.List;


public interface ProductDao {
    public List<Product> finAll();
    public void insertProduct(String name, String image, double price, int id_category, int quantity, boolean st);
    public Product findProduct(int id_product);
    public void delete(int id_product);
    public void updateProduct(int id_product, String name, String image, double price, int id_category, int quantity, boolean st); 
}
