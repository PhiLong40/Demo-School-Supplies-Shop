/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package htplong.data.web;

import htplong.data.dao.Database;
import htplong.data.model.Category;
import htplong.data.model.Product;
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
@WebServlet(name = "AdAddProductServlet", urlPatterns = {"/Themsanpham"})
public class AdAddProductServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {      
        List<Category> listCategory = Database.getCategoryDao().finAll();
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("./views/QLThemsanpham.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        double price =Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String img = request.getParameter("img");
        int id_category = Integer.parseInt(request.getParameter("category"));
        Database.getProductDao().insertProduct(name, img, price, id_category, quantity, true);
        response.sendRedirect("sanphamAdmin");
    }



}
