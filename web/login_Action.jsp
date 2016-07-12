<%
    String pass = request.getParameter("pass").toString();
    if (pass.equals("yogesh")) {
        response.sendRedirect("listProduct.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }
%>