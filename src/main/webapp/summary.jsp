<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.CurriculumVitae" %>
<%@ page import="com.cv.curriculum_vitae.SvCurriculumVitae" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</head>
<body>
    <%
        CurriculumVitae cv = (CurriculumVitae) request.getSession().getAttribute("curriculum");
    %>
    <div class="card container">
        <img alt="photo" src="photo.jpeg" class="rounded-circle align-self-center" height="250" width="300">
        <div class="card-header">
            <h1><%= cv.getFirstname() + " " + cv.getLastname()%> </h1>
            <p><%= cv.getShort_description() %> </p>
        </div>
        <div class="card-footer">
        <form action="SvCurriculumVitae" method="get" class="w-100 d-block">
            <input type="submit" value="Details" class="btn btn-primary w-100">
        </form>
        </div>
    </div>
</body>
</html>