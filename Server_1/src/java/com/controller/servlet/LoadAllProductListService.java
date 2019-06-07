/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.servlet;

import com.entity.ItemProfile;
import com.modle.Hibernate_Functions;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Damih-PC
 */
public class LoadAllProductListService extends HttpServlet {

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

            String res = loadAllProduct();
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

    public String loadAllProduct() {
        String msg = "";
        JSONArray arrSend = new JSONArray();
        JSONObject objSend;
        try {
            System.out.println("category : ");

            Session ses = com.connection.NewHibernateUtil.getSessionFactory().openSession();
            Hibernate_Functions hf = new Hibernate_Functions(ses);

            int count = 1;
            List<ItemProfile> ListA = hf.setCriteriaList(ItemProfile.class);
            if (ListA.size() != 0) {
                objSend = new JSONObject();
                objSend.put("result", true);

                arrSend.put(objSend);
                for (ItemProfile a : ListA) {
                    objSend = new JSONObject();
                    objSend.put("id", a.getId());
                    objSend.put("GenID", a.getGeneratedId());
                    objSend.put("name", a.getItemName());
                    objSend.put("price", a.getPrice());
                    objSend.put("image", a.getImageUrl());

                    arrSend.put(objSend);
                }
            } else {
                objSend = new JSONObject();

                objSend.put("result", false);
                objSend.put("id", 0);
                objSend.put("msg", "Not product in this database");

                arrSend.put(objSend);
            }

        } catch (Exception e) {
            try {
                objSend = new JSONObject();

                objSend.put("result", false);
                objSend.put("id", 0);
                objSend.put("msg", "Something went to wrong...");

                arrSend.put(objSend);
            } catch (JSONException ex) {
                e.printStackTrace();
            }
        }
        msg = arrSend.toString();

        return msg;
    }

}
