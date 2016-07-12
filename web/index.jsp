<%-- 
    Document   : index
    Created on : Jul 12, 2016, 5:22:42 PM
    Author     : yogesh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Log In</title>
    </head>
    <body>
        <div style="position: absolute;left:40%;top:30%;">
            <form method="post" action="login_Action.jsp">
                Password: <input type="password" name="pass"/>
                <input type="submit" value="Log In">
            </form>
        </div>
    </body>
</html>
