<%
    String pass = request.getParameter("pass").toString();
    if (pass.equals("iguana@321studio")) {
        response.sendRedirect("listProduct.jsp");
        session.setAttribute("isvalid","yes");
    } else {
        response.sendRedirect("index.jsp");
    }
%>