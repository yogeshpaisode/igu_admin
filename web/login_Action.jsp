<%
    String pass = request.getParameter("pass").toString();
    if (pass.equals("yogesh")) {
        response.sendRedirect("listProduct.jsp");
        session.setAttribute("isvalid","yes");
    } else {
        response.sendRedirect("index.jsp");
    }
%>