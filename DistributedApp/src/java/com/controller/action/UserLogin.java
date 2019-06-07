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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;

/**
 *
 * @author Lahiru Kahawatta
 */
public class UserLogin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String uname = request.getParameter("email");
            String pw = request.getParameter("password");
            String check = request.getParameter("check");
            Boolean result = null;
            String msg = "";
            int userID = 0;

            String online_server = new LoadBalancer().getOnlineServer();
            String servlet_name = "UserLoginService";

            if (check != null) {
                System.out.println(check);
                String login = uname + "," + pw + "," + check;
                Cookie c = new Cookie("login", login);
                c.setMaxAge(60 * 60 * 60 * 30);
                response.addCookie(c);
            }

            System.out.println("OutPut : " + online_server);
            if (!online_server.equals("")) {
                String params[] = {uname, pw};

                String res = new ServerCommunication().getDataSet(online_server, servlet_name, params);
                System.out.println("UserLogin res11 " + res);

                JSONObject jsonObj = new JSONObject(res);
                System.out.println("jsonObj : " + jsonObj);
                if (jsonObj != null) {
                    result = jsonObj.getBoolean("result");
                    msg = jsonObj.getString("msg");
                    userID = jsonObj.getInt("id");

                    if (result == true) {
                        HttpSession hs1 = request.getSession();
                        double Stot = 0;
                        if (hs1.getAttribute("mycart") != null) {
                            Cart Sessioncart = (Cart) hs1.getAttribute("mycart");
                            List<CartItem> cartItems = Sessioncart.getMyCart();
                            for (CartItem ci : cartItems) {
                                int id = ci.getPid();
                                int qty = ci.getQty();

                                String servlet_name1 = "AddToCartService";
                                if (!online_server.equals("")) {
                                    String pid = id + "";
                                    String pqty = qty + "";
                                    String ID=userID+"";
                                    System.out.println("login userID :- " + userID);
                                    System.out.println("login pid :- " + pid);
                                    System.out.println("login qty :- " + qty);

                                    String params1[] = {ID, pid, pqty};
                                    String res1 = new ServerCommunication().getDataSet(online_server, servlet_name1, params1);
                                    System.out.println("login ** AddToCartService res " + res1);
                                }
                            }
                        }
                        HttpSession hs = request.getSession();
                        hs.setAttribute("userID", userID);
                        response.sendRedirect("index.jsp");
                    } else {
                        response.sendRedirect("login.jsp?error=" + msg);
                    }
                } else {
                    response.sendRedirect("login.jsp?error=" + msg);
                }

            } else {
                //server offline
                response.sendRedirect("login.jsp?error=" + msg);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
