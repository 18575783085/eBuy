package com.ishopmall.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * 监听器监听路径
 */
public class HomePathListener implements ServletContextListener{
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        String contextPath = servletContextEvent.getServletContext().getContextPath();
        servletContextEvent.getServletContext().setAttribute("appPath", contextPath);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        servletContextEvent.getServletContext().removeAttribute("appPath");
    }
}
