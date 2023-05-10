package com.itwillbs.util;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class GeoLocation {
    
    public static String getAddress(double lat, double lng) throws IOException, ParseException {
        String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=" + lat + "," + lng + "&language=ko&key=API_KEY";
        URL obj = new URL(url);
        URLConnection conn = obj.openConnection();
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        
        JSONParser parser = new JSONParser();
        JSONObject json = (JSONObject) parser.parse(response.toString());
        JSONArray results = (JSONArray) json.get("results");
        JSONObject result = (JSONObject) results.get(0);
        String address = (String) result.get("formatted_address");
        
        return address;
    }
}