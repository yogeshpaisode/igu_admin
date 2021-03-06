<%@page import="com.hibconfig.Artist"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%
    try {
        String photo = request.getParameter("photo").toString();        
        String name = request.getParameter("name").toString();
        String contact = request.getParameter("contact").toString();
        String address = request.getParameter("address").toString();
        String gender = request.getParameter("gender").toString();
        String dob = request.getParameter("dob").toString();
        String summary = request.getParameter("summary").toString();
        String facebook = request.getParameter("facebook").toString();
        String twitter = "";
        String google = "";
        String email = "";
        String qualification = request.getParameter("qualification").toString();
        String award = request.getParameter("award").toString();
        String solo = request.getParameter("solo").toString();
        String groupShow = request.getParameter("groupShow").toString();
        String collection = request.getParameter("collection").toString();
        
        SessionFactory sessionFactory=com.hibconfig.HibernateUtil.getSessionFactory();
        Session hibsession=sessionFactory.openSession();
        Transaction transaction=hibsession.beginTransaction();
        
        com.hibconfig.Artist artist=new Artist(1, photo, name, contact, address, gender, dob, summary, facebook, twitter, google, email, qualification, award, solo, groupShow, collection);
        hibsession.save(artist);
        transaction.commit();
        hibsession.close();
        
    } catch (Exception e) {
        out.print(e.toString());
    }
%>