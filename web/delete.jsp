<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String table = request.getParameter("table");
    SessionFactory sessionFactory = com.hibconfig.HibernateUtil.getSessionFactory();
    Session hibsession = sessionFactory.openSession();
    Transaction transaction = hibsession.beginTransaction();

    if (table.equals("artist")) {
        Criteria cr = hibsession.createCriteria(com.hibconfig.Artist.class);
        cr.add(Restrictions.eq("id", id));
        com.hibconfig.Artist a = (com.hibconfig.Artist) cr.list().get(0);
        hibsession.delete(a);
        transaction.commit();
        hibsession.close();
        response.sendRedirect("listArtist.jsp");
    } else {
        Criteria cr = hibsession.createCriteria(com.hibconfig.Product.class);
        cr.add(Restrictions.eq("id", id));
        com.hibconfig.Product a = (com.hibconfig.Product) cr.list().get(0);
        hibsession.delete(a);
        transaction.commit();
        hibsession.close();
        response.sendRedirect("listProduct.jsp");
    }

%>