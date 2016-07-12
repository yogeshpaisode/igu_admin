<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%
    //http://upchar.esy.es/truncate.php

    URL url = new URL("http://upchar.esy.es/truncate.php");
    URLConnection yc = url.openConnection();
    BufferedReader in = new BufferedReader(
            new InputStreamReader(
                    yc.getInputStream()));
    String inputLine;

    while ((inputLine = in.readLine()) != null) {
        out.println(inputLine);
    }
    in.close();
    SessionFactory sessionFactory = com.hibconfig.HibernateUtil.getSessionFactory();
    Session hibsession = sessionFactory.openSession();
    hibsession.createQuery("delete from Product").executeUpdate();
    hibsession.close();
    out.print("Success...");
    response.sendRedirect("listProduct.jsp");
%>