/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package htplong.data.web;

import htplong.data.dao.Database;
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
@WebServlet(name = "ResetpwdServlet", urlPatterns = {"/Resetpwd"})
public class ResetpwdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("./views/resetpassword.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pass = request.getParameter("rspass");
        String repass = request.getParameter("rerspass");
        String Email = request.getParameter("email");
        if(repass.equals(pass)==false){
            request.getSession().setAttribute("err_pass", "Mật khẩu nhập lại không trùng");
            response.sendRedirect("Resetpwd?email="+Email);
        }else{
            
            Database.getUserDao().UpdateUser(Email, repass);
            response.sendRedirect("Dangnhap");
        }
    }

}
