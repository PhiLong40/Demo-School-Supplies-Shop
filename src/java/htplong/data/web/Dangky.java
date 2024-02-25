/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package htplong.data.web;

import htplong.data.dao.Database;
import htplong.data.model.User;
import htplong.utils.API;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author FPTHP
 */
@WebServlet(name = "Dangky", urlPatterns = {"/Dangky"})
public class Dangky extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("title", "Register page");
        request.getRequestDispatcher("./views/dangky.jsp").include(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String err_mail ="", err_phone ="", err_password="", err_hoten="";
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String Email_Regex = "^[\\w-\\+]+(\\.[\\w]+)*@[\\w-]+(\\.[\\w]+)*(\\.[a-z]{2,})$";
        String Phone_Regex = "^\\d{10}$";
        String hoten_Regex = "^[a-zA-Zỳọáầảấờễàạằệếýộậốũứĩõúữịỗìềểẩớặòùồợãụủíỹắẫựỉỏừỷởóéửỵẳẹèẽổẵẻỡơôưăêâđ]*$";
        boolean err = false;
        if(!name.matches(hoten_Regex)){
            err_hoten = "Họ tên không được nhập ký tự số hoặc ký tự đặc biệt";
            request.getSession().setAttribute("err_hoten", err_hoten);
            err = true;   
        }else{
            request.getSession().removeAttribute("err_hoten");
        }
        System.out.println(Database.getUserDao().findUser(phone));
        if(!email.matches(Email_Regex)){
            err_mail = "Email không đúng định dạng";
            request.getSession().setAttribute("err_email", err_mail);
            err = true;
        }else{
            request.getSession().removeAttribute("err_email");
        }
        if(!phone.matches(Phone_Regex)){
            err_phone = "Số điện thoại phải ghi đúng 10 số";
            request.getSession().setAttribute("err_phone", err_phone);
            err = true;
        }else{
            request.getSession().removeAttribute("err_phone");
        }
        if(!repassword.matches(password)){
            err_password="Mật khẩu nhập lại không trùng";
            request.getSession().setAttribute("err_repassword", err_password);
            err=true;
        }else{
            request.getSession().removeAttribute("err_repassword");
        }
        if(err){
            response.sendRedirect("Dangky");
        }else{
            if(Database.getUserDao().findUser(email)!=null || Database.getUserDao().findUser(phone)!=null){
                request.getSession().setAttribute("err_dtt", "Email hoặc số điện thoại đã được đăng ký!");
               response.sendRedirect("Dangky"); 
            }else{
                Database.getUserDao().insertUser(name, email, phone, API.getMd5(password));
                request.getSession().removeAttribute("err_dtt");
                response.sendRedirect("Dangnhap");
            }
        }
    }

}
