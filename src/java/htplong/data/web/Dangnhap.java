/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package htplong.data.web;

import htplong.data.dao.Database;
import htplong.data.model.Category;
import htplong.data.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author FPTHP
 */
@WebServlet(name = "Dangnhap", urlPatterns = {"/Dangnhap"})
public class Dangnhap extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> listCategory = Database.getCategoryDao().finAll();
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("title", "Login page");
        request.getRequestDispatcher("./views/dangnhap.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html");
        String emailphone = request.getParameter("emailphone");
        String password = request.getParameter("password");
        User user = Database.getUserDao().findUser(emailphone, password);
//        PrintWriter pr = response.getWriter();
        if(user==null){
            request.getSession().setAttribute("error_login", "Thông tin đăng nhập không chính xác!");
            response.sendRedirect("Dangnhap");
        }else{
            if(user.getRole().equals("admin")) response.sendRedirect("trangchuAdmin");
            else{
                request.getSession().setAttribute("user", user);
                request.getSession().removeAttribute("error_login");
                response.sendRedirect("Home");
            }
        }

    }

}
