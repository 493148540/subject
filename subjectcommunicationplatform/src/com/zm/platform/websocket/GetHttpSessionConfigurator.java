package com.zm.platform.websocket;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;
/*
 * 获取HttpSession
 * 
 */

public class GetHttpSessionConfigurator extends Configurator {

    @Override
    public void modifyHandshake(ServerEndpointConfig sec,
            HandshakeRequest request, HandshakeResponse response) {
        // TODO Auto-generated method stub
        HttpSession httpSession=(HttpSession) request.getHttpSession();
        System.out.println("sec"+sec.getUserProperties());
        System.out.println("httpSession"+httpSession);
        System.out.println("request"+request.getParameterMap().get("name"));
        request.getParameterMap().forEach((k,v)->httpSession.setAttribute(k, v));
        
        sec.getUserProperties().put(HttpSession.class+"",httpSession);
    }
    
}