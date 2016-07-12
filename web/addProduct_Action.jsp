<%@page import="com.hibconfig.Product"%>
<%@page import="com.hibconfig.Artist"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%
    try {
        String sizeP = request.getParameter("size_p").toString();
        String name = request.getParameter("name").toString();
        String medium = request.getParameter("medium").toString();
        String conditionP = request.getParameter("condition_p").toString();
        String soldBy = request.getParameter("sold_By").toString();
        String price = request.getParameter("price").toString();
        String featureImg = request.getParameter("feature_Img").toString();
        String cartImg = request.getParameter("cart_Img").toString();
        int artistId = Integer.parseInt(request.getParameter("artistId").toString());

        SessionFactory sessionFactory = com.hibconfig.HibernateUtil.getSessionFactory();
        Session hibsession = sessionFactory.openSession();
        Transaction transaction = hibsession.beginTransaction();
        com.hibconfig.Product p = new com.hibconfig.Product(artistId, name, sizeP, medium, conditionP, soldBy, price, featureImg, cartImg);
        hibsession.save(p);
        transaction.commit();
        hibsession.close();

    } catch (Exception e) {
        out.print(e.toString());
    }
%>