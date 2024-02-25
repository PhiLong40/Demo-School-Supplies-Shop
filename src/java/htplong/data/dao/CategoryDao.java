/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package htplong.data.dao;

import htplong.data.model.Category;
import java.util.List;

public interface CategoryDao {
    public List<Category> finAll();
    public boolean insert(Category category);
    public boolean update(Category category);
    public boolean delete(int id);
    public Category find(int id);
}
