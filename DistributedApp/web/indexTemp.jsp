<%-- 
    Document   : index
    Created on : Apr 6, 2019, 5:57:05 AM
    Author     : Lahiru Kahawatta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
    </head>
    <body>
        <h1>User Login</h1>
        <form action="UserLogin" method="post">
            <input type="text" value="" placeholder="Username" name="username"/><br/>
            <input type="password" value="" placeholder="Password" name="password"/><br/>
            <input type="submit" value="Submit"/>
        </form>
        <br/>
        <br/>
        <br/>
        
        <h1>Load Product</h1>
        <form action="LoadProduct" method="post">
            <input type="text" value="" placeholder="Category" name="category"/><br/>
            <input type="submit" value="Submit"/>
        </form>
    </body>
</html>
