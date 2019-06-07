/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.action;

import com.controller.common.LoadBalancer;
import com.controller.common.ServerCommunication;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Lahiru Kahawatta
 */
public class LoadCategory extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Boolean result = null;
            String msg = "";

            String online_server = new LoadBalancer().getOnlineServer();
            String servlet_name = "LoadCategoryService";
            String servlet_name1 = "LoadAllProductListService";
            HttpSession hs = request.getSession();
            hs.removeAttribute("jsonArraySelectProduct");
           
            System.out.println("OutPut : " + online_server);
            if (!online_server.equals("")) {
                String params[] = {};
                String res = new ServerCommunication().getDataSet(online_server, servlet_name, params);
                System.out.println("LoadCategoryService res " + res);
              
                JSONArray jsonArray = new JSONArray(res);
                hs.setAttribute("jsonArray", jsonArray);
                
            } else {
                //server offline
                response.sendRedirect("index.jsp");
            }
            
            
            
             if (!online_server.equals("")) {
                String params[] = {};
                String resProduct = new ServerCommunication().getDataSet(online_server, servlet_name1, params);
                System.out.println("LoadAllProductListService res " + resProduct);

               

                JSONArray jsonArrayProduct = new JSONArray(resProduct);
                hs.setAttribute("jsonArrayProduct", jsonArrayProduct);
                

                RequestDispatcher rs = request.getRequestDispatcher("category.jsp");
                rs.forward(request, response);
            } else {
                //server offline
                response.sendRedirect("index.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
