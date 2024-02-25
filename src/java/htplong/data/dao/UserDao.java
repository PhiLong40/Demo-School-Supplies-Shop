/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package htplong.data.dao;

import htplong.data.model.User;
import java.util.List;

/**
 *
 * @author FPTHP
 */
public interface UserDao {
//    public List<User> finAll(String email, String password, String phone);
    public User findUser(String emailphone, String password);
    public User findUser(String emailphone);
    public void insertUser(String name, String email, String phone, String password);
    public void UpdateUser(String email, String password);
}
