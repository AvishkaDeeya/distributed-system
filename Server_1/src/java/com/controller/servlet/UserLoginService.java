/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.servlet;

import com.entity.UserCart;
import com.entity.UserLogin;
import com.entity.UserProfile;
import com.modle.Hibernate_Functions;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Lahiru Kahawatta
 */
public class UserLoginService extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            System.out.println("post income " + request.getParameter("param1"));
            System.out.println("post income " + request.getParameter("param2"));

            String res = userLogin(request.getParameter("param1"), request.getParameter("param2"));
            PrintWriter out = response.getWriter();
            out.print(res);
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public String userLogin(String param1, String param2) {
        String msg = "";
        JSONObject objSend = new JSONObject();
        try {
            System.out.println("Username : " + param1);
            System.out.println("Password : " + param2);

            Session ses = com.connection.NewHibernateUtil.getSessionFactory().openSession();
            Hibernate_Functions hf = new Hibernate_Functions(ses);

            String PASSWORD = "";
            String EMAIL = "";

            Criteria cr = ses.createCriteria(UserLogin.class);
            cr.add(Restrictions.eq("userName", param1));
            cr.add(Restrictions.eq("password", param2));
            cr.add(Restrictions.eq("isActive", true));
            System.out.println("Step 1 ");
            if (cr.uniqueResult() != null) {
                System.out.println("Step 2 ");
                UserLogin UL = (UserLogin) cr.uniqueResult();

                UserProfile UP = (UserProfile) hf.setCriteria("id", UL.getUserProfile().getId(), UserProfile.class);

                objSend.put("result", true);
                objSend.put("id", UL.getId());
                objSend.put("msg", "Hi..." + UL.getUserProfile().getFirstName());

                Criteria cartCRT = ses.createCriteria(UserCart.class);
                cartCRT.add(Restrictions.eq("userProfile", UL.getUserProfile().getId()));
                cartCRT.add(Restrictions.eq("isActive", false));
                if (cr.uniqueResult() == null) {
                    Transaction tr = ses.beginTransaction();
                    UserCart cart = new UserCart();
                    cart.setUserProfile(UP);
                    cart.setCreateDateTime(new Date());
                    cart.setTotalQty(0);
                    cart.setTotalAmount(0.0);
                    cart.setIsActive(Boolean.FALSE);
                    ses.save(cart);
                    tr.commit();
                    System.out.println("CREATE CART ");

                } else if (cr.uniqueResult() != null) {
                    Transaction tr = ses.beginTransaction();
                    Criteria crtt = ses.createCriteria(UserCart.class);
                    cartCRT.add(Restrictions.eq("userProfile", UL.getUserProfile().getId()));
                    cartCRT.add(Restrictions.eq("isActive", false));
                    List<UserCart> crList = crtt.list();

                    for (UserCart crt : crList) {
                        crt.setUpdateDateTime(new Date());
                        ses.update(crt);
                    }
                    tr.commit();

                }

                System.out.println("Step 3 ");
                msg = objSend.toString();
            } else {
                System.out.println("Step 4 ");
                objSend.put("result", false);
                objSend.put("id", 0);
                objSend.put("msg", "Invalid username or password");
                msg = objSend.toString();
            }

            System.out.println("Step 5");
        } catch (Exception e) {
            e.printStackTrace();
            try {
                objSend.put("result", false);
                objSend.put("id", 0);
                objSend.put("msg", "Something went to wrong...");
                msg = objSend.toString();
            } catch (JSONException ex) {
                ex.printStackTrace();
            }
        }

        return msg;
    }

}
