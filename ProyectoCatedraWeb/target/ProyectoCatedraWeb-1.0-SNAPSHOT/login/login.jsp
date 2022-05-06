<%@ page import="modelos.ConexionJava" %>
<%@ page import="modelos.Login" %>

<%@ page import="modelos.Session" %><%--
  Created by IntelliJ IDEA.
  User: Fernando
  Date: 14/4/2022
  Time: 16:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>login</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body class="container" >

<div id="login" >
    <h1 class="text-center text-white pt-5">Universidad Don Bosco</h1>
    <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div id="login-box" class="col-md-12">
                    <form id="login-form" action="/Login" class="form"  method="post">
                        <h3 class="text-center text-info">Login</h3>
                        <div class="form-group">
                            <label for="username" class="text-info">Usuario:</label><br>
                            <input type="text" name="usuario" id="username" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="password" class="text-info">Password:</label><br>
                            <input type="password" name="password" id="password" class="formcontrol">
                        </div>
                        <div class="form-group">
                            <input type="submit" name="operacion" class="btn btn-info btn-md"
                                   value="logueo">
                        </div>
                        <br>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>