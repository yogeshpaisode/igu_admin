<%@page import="com.hibconfig.Artist"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.criterion.Restrictions"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%
    try {
        int id = Integer.parseInt(request.getParameter("id").toString());
        String photo = request.getParameter("photo").toString();
        String name = request.getParameter("name").toString();
        String contact = request.getParameter("contact").toString();
        String address = request.getParameter("address").toString();
        String gender = request.getParameter("gender").toString();
        String dob = request.getParameter("dob").toString();
        String summary = request.getParameter("summary").toString();
        String facebook = request.getParameter("facebook").toString();
        String qualification = request.getParameter("qualification").toString();
        String award = request.getParameter("award").toString();
        String solo = request.getParameter("solo").toString();
        String groupShow = request.getParameter("groupShow").toString();
        String collection = request.getParameter("collection").toString();

        SessionFactory sessionFactory = com.hibconfig.HibernateUtil.getSessionFactory();
        Session hibsession = sessionFactory.openSession();
        Transaction transaction = hibsession.beginTransaction();

        Criteria cr = hibsession.createCriteria(com.hibconfig.Artist.class);
        cr.add(Restrictions.eq("id", id));
        com.hibconfig.Artist a = (com.hibconfig.Artist) cr.list().get(0);

        if(!(photo.equals("null"))){
            a.setPhoto(photo);
        }
        
        a.setName(name);
        a.setContact(contact);
        a.setAddress(address);
        a.setAward(award);
        a.setCollection(collection);
        a.setDob(dob);
        a.setGender(gender);
        a.setSummary(summary);
        a.setQualification(qualification);
        a.setGroupShow(groupShow);
        a.setSolo(solo);
        
        hibsession.save(a);
        transaction.commit();
        hibsession.close();

    } catch (Exception e) {
        out.print(e.toString());
    }
%>