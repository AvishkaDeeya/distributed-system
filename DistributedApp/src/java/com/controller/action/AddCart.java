/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.action;

import com.controller.common.LoadBalancer;
import com.controller.common.ServerCommunication;
import com.controller.javasrc.Cart;
import com.controller.javasrc.CartItem;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author Nano Foxy Dev - 01
 */
@WebServlet(name = "AddCart", urlPatterns = {"/AddCart"})
public class AddCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCart</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCart at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                int qty = Integer.parseInt(request.getParameter("qty"));

                if (request.getSession().getAttribute("userID") != null) {

                    if (request.getSession().getAttribute("cartitemcount") != null) {
                        int totqty = Integer.parseInt(request.getSession().getAttribute("cartitemcount").toString());
                        totqty += qty;
                        request.getSession().setAttribute("cartitemcount", totqty);
                    } else {
                        request.getSession().setAttribute("cartitemcount", qty);
                    }

                    String userID = request.getSession().getAttribute("userID") + "";

                    String online_server = new LoadBalancer().getOnlineServer();
                    String servlet_name = "AddToCartService";
                    String pid = id + "";
                    String pqty = qty + "";
                    System.out.println("OutPut : " + online_server);
                    if (!online_server.equals("")) {
                        System.out.println("userID :-" + userID);
                        System.out.println("pid : " + id);
                        System.out.println("qty : " + qty);
                        String params[] = {userID,pid, pqty};
                        String res = new ServerCommunication().getDataSet(online_server, servlet_name, params);
                        System.out.println("AddToCartService res " + res);

                    }

                } else {
                    System.out.println("pid : " + id);
                    System.out.println("qty : " + qty);

                    if (request.getSession().getAttribute("cartitemcount") != null) {
                        int totqty = Integer.parseInt(request.getSession().getAttribute("cartitemcount").toString());
                        totqty += qty;
                        request.getSession().setAttribute("cartitemcount", totqty);
                    } else {
                        request.getSession().setAttribute("cartitemcount", qty);
                    }

                    String online_server = new LoadBalancer().getOnlineServer();
                    String servlet_name = "LoadSingleProductService";

                    String pid = id + "";
                    System.out.println("OutPut : " + online_server);
                    if (!online_server.equals("")) {
                        String params[] = {pid};
                        String res = new ServerCommunication().getDataSet(online_server, servlet_name, params);
                        System.out.println("LoadSingleProductService************ res " + res);

                        JSONObject jsonObj = new JSONObject(res);

                        CartItem new_cartitem = new CartItem();
                        new_cartitem.setPid(id);
                        new_cartitem.setPname(jsonObj.getString("name"));
                        new_cartitem.setPrice(jsonObj.getDouble("price"));
                        new_cartitem.setQty(qty);

                        HttpSession hs = request.getSession();
                        Cart cart = null;
                        if (hs.getAttribute("mycart") == null) {
                            cart = new Cart();
                        } else {
                            cart = (Cart) hs.getAttribute("mycart");
                        }
                        cart.addCartItem(new_cartitem);
                        hs.setAttribute("mycart", cart);
                    }

                }

//
//                String pname = "test Product";
//                double price = 200;
//
//                CartItem new_cartitem = new CartItem();
//                new_cartitem.setPid(id);
//                new_cartitem.setPname(pname);
//                new_cartitem.setPrice(price);
//                new_cartitem.setQty(qty);
//
//                HttpSession hs = request.getSession();
//                Cart cart = null;
//                if (hs.getAttribute("mycart") == null) {
//                    cart = new Cart();
//                } else {
//                    cart = (Cart) hs.getAttribute("mycart");
//                }
//                cart.addCartItem(new_cartitem);
//                hs.setAttribute("mycart", cart);
//
                response.sendRedirect("single-product.jsp");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
