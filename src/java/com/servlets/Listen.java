/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 *
 * @author iobelika
 */
public class Listen implements  HttpSessionListener{
    
    private static int sessionCount = 0;
 
    /**
     *
     * @param event
     */
    @Override
    public void sessionCreated(HttpSessionEvent event) {
        sessionCount++;
    }
 
    /**
     *
     * @param event
     */
    @Override
    public void sessionDestroyed(HttpSessionEvent event) {
            sessionCount--;
    }
    public static int getNumberOfSessions(){
        return sessionCount;
    }
    
}
