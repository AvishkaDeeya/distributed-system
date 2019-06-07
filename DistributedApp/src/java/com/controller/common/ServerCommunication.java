/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

/**
 *
 * @author Lahiru Kahawatta
 */
public class ServerCommunication {
    
    public String getDataSet(String server, String servlet, String params[]) {
        try {
            // Construct data
            int i=1;
            String data="";
            for(String param:params){
                if(data.equals("")){
                    data = URLEncoder.encode("param"+i, "UTF-8") + "=" + URLEncoder.encode(param, "UTF-8");
                }else{
                    data += "&" + URLEncoder.encode("param"+i, "UTF-8") + "=" + URLEncoder.encode(param, "UTF-8");
                }
                i++;
            }
            
            // Send data
            URL url = new URL(server+servlet);
            URLConnection conn = url.openConnection();
            conn.setDoOutput(true);
            OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
            wr.write(data);
            wr.flush();

            // Get the response
            BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            String output="";
            while ((line = rd.readLine()) != null) {
                output+=line;
            }
            wr.close();
            rd.close();
            return output;
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }
    
}
