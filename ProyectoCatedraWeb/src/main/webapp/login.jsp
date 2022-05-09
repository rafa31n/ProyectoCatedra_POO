<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>Telecomunicaciones Login</title>
</head>
<body>
<div class="contenedor">
    <div class="contenido">
        <h2>Telecomunicaciones Login</h2>
        <form action="ControladorLogin?operacion=login" method="POST">
            <div class="form-group">
                <label for="username" class="form-label">Usuario:</label><br>
                <input type="text" name="username" id="username" class="form-control" required>
            </div>

            <div class="form-group">
                <label for="password" class="form-label">Password:</label><br>
                <input type="password" name="password" id="password" class="form-control" required>
            </div>
            <br>

            <div class="form-group">
                <input type="submit" name="operacion" class="btn btn-success" value="Ingresar">
            </div>

        </form>
    </div>
</div>
<style>
    .contenedor {
        width: 100%;
    }

    .contenido {
        width: 60%;
        margin: 0 auto;
        margin-top: 150px;
    }
    h2{
        text-align: center;
        margin-bottom: 15px;
    }
</style>
</body>
</html>