/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

/**
 *
 * @author Lahiru Kahawatta
 */
public class LoadBalancer {
    private final String LOAD_BALANCER_URL = "http://localhost:8080/LoadBalancer/Controller";
    
    public String getOnlineServer() {
        try {
            // Send data
            URL url = new URL(LOAD_BALANCER_URL);
            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);

            // Get the response
            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            String output = "";
            while ((line = rd.readLine()) != null) {
                output += line;
            }
            rd.close();
            
            return output;
        } catch (Exception e) {
            return null;
        }
    }
}
