/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.servlet;

import com.entity.ItemCategory;
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
public class LoadSingleProductService extends HttpServlet {

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

            String res = loadSingleProduct(request.getParameter("param1"));
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

    public String loadSingleProduct(String param1) {
        String msg = "";
        JSONObject objSend = new JSONObject();
        try {
            System.out.println("category : " + param1);

            Session ses = com.connection.NewHibernateUtil.getSessionFactory().openSession();
            Hibernate_Functions hf = new Hibernate_Functions(ses);

            int count = 1;
            ItemCategory IC = (ItemCategory) hf.setCriteria("id", Integer.parseInt(param1), ItemCategory.class);
            ItemProfile ListA = (ItemProfile) hf.setCriteria("itemCategory.id", IC.getId(), ItemProfile.class);
            if (ListA != null) {

                objSend.put("result", true);

                objSend.put("id", ListA.getId());
                objSend.put("GenID", ListA.getGeneratedId());
                objSend.put("name", ListA.getItemName());
                objSend.put("price",  ListA.getPrice());
                objSend.put("image", ListA.getImageUrl());
                objSend.put("category", ListA.getItemCategory().getName());

            } else {
                objSend = new JSONObject();

                objSend.put("result", false);
                objSend.put("id", 0);
                objSend.put("msg", "Not product in this database");

            }

        } catch (Exception e) {
            e.printStackTrace();
            try {
                objSend = new JSONObject();

                objSend.put("result", false);
                objSend.put("id", 0);
                objSend.put("msg", "Something went to wrong...");

            } catch (JSONException ex) {
                ex.printStackTrace();
            }
        }
        msg = objSend.toString();

        return msg;
    }

}
