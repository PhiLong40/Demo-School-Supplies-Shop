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
@WebServlet(name = "AdfixProductServlet", urlPatterns = {"/Suasanpham"})
public class AdfixProductServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id_product =Integer.parseInt(request.getParameter("id"));
        List<Product> listProduct = Database.getProductDao().finAll();
        for(Product pd : listProduct){
            if(pd.getId()==id_product){
                request.getSession().setAttribute("product", pd);
                break;
            }
        }
        List<Category> listCategory = Database.getCategoryDao().finAll();
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("./views/QLSuasanpham.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id_product =Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price =Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String img = request.getParameter("img");
        int id_category = Integer.parseInt(request.getParameter("category"));
        Database.getProductDao().updateProduct(id_product, name, img, price, id_category, quantity, true);
    }

}
