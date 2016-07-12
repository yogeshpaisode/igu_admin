<%-- 
    Document   : listArtist
    Created on : Jul 12, 2016, 11:52:44 AM
    Author     : yogesh
--%>

<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@ include file="/import/head.jsp"%>

    <table class = "table">
        <caption>Artist List</caption>

        <thead>
            <tr>
                <th>Name</th>
                <th>Size</th>
                <th>Update Action</th>
                <th>Delete Action</th>
            </tr>
        </thead>

        <tbody>

            <%
                SessionFactory sessionFactory = com.hibconfig.HibernateUtil.getSessionFactory();
                Session hibsession = sessionFactory.openSession();
                Criteria cr = hibsession.createCriteria(com.hibconfig.Product.class);
                List list = cr.list();

                for (Object o : list) {
                    com.hibconfig.Product a = (com.hibconfig.Product) o;
            %>

            <tr>
                <td><%= a.getName()  %></td>
                <td><%= a.getSizeP()%></td>
                <td><a href="updateProduct.jsp?id=<%=a.getId()%>"><button>Update</button></a></td>
                <td><a href="deleyeProduct.jsp?id=<%=a.getId()%>"><button>Delete</button></a></td>
            </tr>
            <%
                }

            %>
        </tbody>
    </table>

</body>
</html>
