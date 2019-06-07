/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.action;

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

/**
 *
 * @author Nano Foxy Dev - 01
 */
@WebServlet(name = "DeleteCartItems", urlPatterns = {"/DeleteCartItems"})
public class DeleteCartItems extends HttpServlet {

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
            out.println("<title>Servlet DeleteCartItems</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteCartItems at " + request.getContextPath() + "</h1>");
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
            /* TODO output your page here. You may use following sample code. */
            int pid = Integer.parseInt(request.getParameter("pid"));
            int qty = Integer.parseInt(request.getParameter("qty"));

            System.out.println("pid : "+pid);
            System.out.println("qty : "+qty);
            
            if (request.getSession().getAttribute("cartitemcount") != null) {
                int totqty = Integer.parseInt(request.getSession().getAttribute("cartitemcount").toString());
                totqty -= qty;
                request.getSession().setAttribute("cartitemcount", totqty);
            } else {
                request.getSession().setAttribute("cartitemcount", qty);
            }

            CartItem ci = new CartItem();
            ci.setPid(pid);

            HttpSession hs = request.getSession();
            Cart cr = (Cart) hs.getAttribute("mycart");
            cr.removeProduct(ci);
            hs.setAttribute("mycart", cr);

//            response.sendRedirect("session_cart.jsp");
            out.write("ok");
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
