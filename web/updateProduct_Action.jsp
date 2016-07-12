<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="com.hibconfig.Product"%>
<%@page import="com.hibconfig.Artist"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%
    try {
        int id = Integer.parseInt(request.getParameter("id").toString());
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

        Criteria cr = hibsession.createCriteria(com.hibconfig.Product.class);
        cr.add(Restrictions.eq("id", id));
        com.hibconfig.Product p = (com.hibconfig.Product) cr.list().get(0);

        if(!(featureImg.equals("null"))){
            p.setFeatureImg(featureImg);
        }       
        
        if(!(cartImg.equals("null"))){
            p.setCartImg(cartImg);
        }
        
        p.setArtistId(artistId);
        p.setConditionP(conditionP);
        p.setMedium(medium);
        p.setName(name);
        p.setPrice(price);
        p.setSizeP(sizeP);
        p.setSoldBy(soldBy);        
        
        hibsession.save(p);
        transaction.commit();
        hibsession.close();

    } catch (Exception e) {
        out.print(e.toString());
    }
%>