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


@WebServlet(name = "AdProductServlet", urlPatterns = {"/sanphamAdmin"})
public class AdProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int i = 0;
        request.setAttribute("i", i);
        List<Product> listProduct = Database.getProductDao().finAll();
        System.out.println(listProduct);
        request.setAttribute("listProduct", listProduct);
        request.getRequestDispatcher("./views/QLproduct.jsp").include(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id_product = Integer.parseInt(request.getParameter("id_product"));
        Database.getProductDao().delete(id_product);
        response.sendRedirect("sanphamAdmin");
    }


}
