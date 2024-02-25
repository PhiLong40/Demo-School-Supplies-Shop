/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package htplong.data.web;

import htplong.data.dao.Database;
import htplong.data.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "BuySP", urlPatterns = {"/BuySP"})
public class BuySP extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("clear")!=null){
            request.getSession().setAttribute("cart", new ArrayList<>());
        }
        request.getRequestDispatcher("./views/Buyshop.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UpdateDelete(request, response);
    }
    void UpdateDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String action = request.getParameter("action");
        int id_product = Integer.parseInt(request.getParameter("id_product"));
        switch (action) {
            case "update":
                doUpdate(request, id_product);
                break;
            case "delete":
                doDelete(request, id_product);
                break;
        }
        request.getRequestDispatcher("./views/Buyshop.jsp").include(request, response);
    }
    
    void doUpdate(HttpServletRequest request, int id_product){
        List<Product> cart = (List<Product>)request.getSession().getAttribute("cart");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        for(Product pd : cart){
            if(pd.getId()==id_product && quantity>0){
                pd.setQuantity(quantity);
                break;
            }
        }
        request.getSession().setAttribute("cart", cart);
    }
    void doDelete(HttpServletRequest request, int id_product){
        List<Product> cart = (List<Product>)request.getSession().getAttribute("cart");   
        for(Product pd : cart){
            if(pd.getId()==id_product){
                cart.remove(pd);
                break;
            }
        }
        request.getSession().setAttribute("cart", cart);
    }
}
