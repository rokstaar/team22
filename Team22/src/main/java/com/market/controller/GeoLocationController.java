package com.market.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;

import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.model.GeocodingResult;
import com.google.maps.model.LatLng;

@Controller
public class GeoLocationController {

	private static final String API_KEY = "AIzaSyBsygGJzVpj1MgNVArxxK8fIr8KYNFE5HM"; // 구글맵스 API 키를 입력해주세요.

	  public String getLocationFromRequest(HttpServletRequest request) throws Exception {
	    // 클라이언트 IP 주소를 가져옵니다.
	    String ipAddress = getIpAddress(request);
	    // 구글맵스 API를 사용해 위도, 경도 정보를 가져옵니다.
	    GeoApiContext context = new GeoApiContext.Builder().apiKey(API_KEY).build();
	    GeocodingResult[] results = GeocodingApi.geocode(context, ipAddress).await();
	    if (results.length > 0) {
	      LatLng location = results[0].geometry.location;
	      // 위도, 경도 정보를 이용해 주소를 가져옵니다.
	      GeocodingResult[] addresses = GeocodingApi.reverseGeocode(context, location).await();
	      if (addresses.length > 0) {
	        return addresses[0].formattedAddress;
	      }
	    }
	    return null;
	  }

	  public String getIpAddress(HttpServletRequest request) {
	    String ip = request.getHeader("X-Forwarded-For");
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	      ip = request.getHeader("Proxy-Client-IP");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	      ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	      ip = request.getHeader("HTTP_CLIENT_IP");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	      ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
	      ip = request.getRemoteAddr();
	    }
	    return ip;
	  }


		public String getLocationFromIp(String ipAddress) throws Exception {
		    try {
		        // IP 주소를 InetAddress 객체로 변환합니다.
		        InetAddress address = InetAddress.getByName(ipAddress);
		        // GeoApiContext 객체를 생성합니다.
		        GeoApiContext context = new GeoApiContext.Builder().apiKey(API_KEY).build();
		        // GeoCodingAPI를 사용하여 위도, 경도 정보를 가져옵니다.
		        GeocodingResult[] results = GeocodingApi.geocode(context, address.getHostAddress()).await();
		        // 가져온 결과에서 첫 번째 결과를 사용합니다.
		        if (results.length > 0) {
		            LatLng location = results[0].geometry.location;
		            // 위도, 경도 정보를 사용하여 주소를 가져옵니다.
		            GeocodingResult[] addresses = GeocodingApi.reverseGeocode(context, location).await();
		            if (addresses.length > 0) {
		                return addresses[0].formattedAddress;
		            }
		        }
		        return null;
		    } catch (UnknownHostException e) {
		    	
		        throw e;
		    }
		}
}