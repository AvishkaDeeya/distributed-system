/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.action;

import com.controller.common.LoadBalancer;
import com.controller.common.ServerCommunication;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lahiru Kahawatta
 */
public class LoadProduct extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String online_server = new LoadBalancer().getOnlineServer();
            String servlet_name="LoadProductService";

            System.out.println("OutPut : " + online_server);
            if(!online_server.equals("")){
                String params[]={request.getParameter("category")};
                
                String res=new ServerCommunication().getDataSet(online_server, servlet_name, params);
                System.out.println("LoadProduct res "+res);
            }else{
                //server offline
                response.sendRedirect("index.jsp");
            }

        } catch (Exception e) {
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    

}
