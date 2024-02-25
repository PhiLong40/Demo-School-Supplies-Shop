/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package htplong.data.web;

import htplong.data.dao.Database;
import htplong.data.model.Category;
import htplong.data.model.Product;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author FPTHP
 */
public class HomeServlet extends HttpServlet {  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Category> listCategory = Database.getCategoryDao().finAll();
        request.setAttribute("listCategory", listCategory);
        List<Product> listProduct = Database.getProductDao().finAll();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("title", "Home page");
        request.setAttribute("id_category", request.getParameter("id_category"));
        addProductToCart(request);
        request.getRequestDispatcher("./views/home.jsp").include(request, response);
        System.out.println(listCategory);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    void addProductToCart(HttpServletRequest request){
        int id_product;
        try {
            id_product = Integer.parseInt(request.getParameter("id_product"));
        } catch (Exception e) {
            id_product = 0;
        }
        List<Product> cart = (List<Product>)
            request.getSession().getAttribute("cart");
        if(cart==null) 
            cart = new ArrayList<>();
        if(id_product>0){
            Product product = Database.getProductDao().findProduct(id_product);
            boolean isProductInCart=false;
            System.out.println(product);
            for(Product pro : cart)
                if(pro.getId()==id_product){
                    pro.setQuantity(pro.getQuantity()+1);
                    isProductInCart=true;
                    
                }
            if(!isProductInCart)cart.add(product);
        }
        request.getSession().setAttribute("cart", cart);
    }
}
