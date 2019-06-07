/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.intermediary;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lahiru Kahawatta
 */
public class Controller extends HttpServlet {

    private static final String[] SERVER_LIST = {"http://localhost:8080/Server_2/ServerService_2", "http://localhost:8080/Server_1/", "http://localhost:8080/Server_3/ServerService_3"};
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            PrintWriter out = response.getWriter();
            for (String server : SERVER_LIST) {
                if (isServerOnline(server)) {
                    System.out.println("ONLINE SERVER : " + server);
                    //Return server status
                    out.print(server);
                    out.flush(); 
                    break;
                } else {
                    System.out.println("OFFLINE SERVER : " + server);
                }
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

    public static boolean isServerOnline(String server) {
        try {
            // We want to change string to URL
            URL url = new URL(server);

            // We want to check the current URL
            HttpURLConnection.setFollowRedirects(false);

            HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();

            // We don't need to get data
            httpURLConnection.setRequestMethod("HEAD");

            // Some websites don't like programmatic access so pretend to be a browser
            httpURLConnection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1.2) Gecko/20090729 Firefox/3.5.2 (.NET CLR 3.5.30729)");
            int responseCode = httpURLConnection.getResponseCode();

            // We only accept response code 200
            return responseCode == HttpURLConnection.HTTP_OK;
        } catch (Exception e) {
            return Boolean.FALSE;
        }

    }
    
    

}
