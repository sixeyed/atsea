package com.docker.atsea.controller;

import org.json.simple.JSONObject;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.ui.Model;

import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
@RequestMapping("/health/")
public class HealthController {
	
	private static boolean _Healthy = true;
		
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/check", method = RequestMethod.GET)
    public ResponseEntity<?> check() {
    	JSONObject healthcheck = new JSONObject();
    	if (_Healthy)
    	{
    		healthcheck.put("status", "healthy");
    	} 
		else
		{
    		healthcheck.put("status", "unhealthy");
			return new ResponseEntity<JSONObject>(healthcheck, HttpStatus.INTERNAL_SERVER_ERROR);
    	}    	    	
		return new ResponseEntity<JSONObject>(healthcheck, HttpStatus.OK);
    }
		
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/toggle", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
	public ResponseEntity<?> containerId() {
		_Healthy = !_Healthy;
		JSONObject healthcheck = new JSONObject();
    	if (_Healthy)
    	{
    		healthcheck.put("status", "healthy");
    	} 
		else
		{
    		healthcheck.put("status", "unhealthy");
    	}    	    	
		return new ResponseEntity<JSONObject>(healthcheck, HttpStatus.ACCEPTED);
	}
}