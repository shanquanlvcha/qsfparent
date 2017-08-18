package com.qsf.websit.tool;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

public class IpAddress {
	
	
	public static String getLocalIp(){
		String localIp = "";
		try {
			localIp = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		return localIp  ;
	}
	
	public static String getRemoteIp(HttpServletRequest request){
		String remoteIp = "";
		String remoteAddr = request.getRemoteAddr();  
		String forwarded = request.getHeader("X-Forwarded-For");  
		String realIp = request.getHeader("X-Real-IP");  
		String ip = null;  
		if (realIp == null) {  
		    if (forwarded == null) {  
		        ip = remoteAddr;  
		    } else {  
		        ip = remoteAddr + "/" + forwarded.split(",")[0];  
		    }  
		} else {
		    if (realIp.equals(forwarded)) {  
		        ip = realIp;  
		    } else {  
		        if(forwarded != null){  
		            forwarded = forwarded.split(",")[0];  
		        }  
		        ip = realIp + "/" + forwarded;  
		    }  
		}
		return remoteIp  ;
	}
	

}