<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.CurriculumVitae" %>
<%@ page import="model.WorkExperience" %>
<%@ page import="model.Education" %>
<%@ page import="model.KnowledgeAndSkills" %>
<html>
<head>
    <title>Curriculum vitae</title>
    <script src="https://kit.fontawesome.com/292572bb7b.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>

<div class="container">


<%
    CurriculumVitae cv = (CurriculumVitae) request.getSession().getAttribute("curriculum");
%>

<div>

<p><%= cv.getFirstname() + " " + cv.getLastname()%></p>
<p><%= cv.getProfession()%></p
<p><%= cv.getShort_description()%></p
</div>

<h1>Work experiences</h1>

<button class="btn btn-light" type="button" data-bs-toggle="collapse" data-bs-target="#addWorkExperienceCollapse" aria-expanded="false" aria-controls="addWorkExperienceCollapse"><i class="fa-solid fa-plus"></i></button>
<div class="collapse" id="addWorkExperienceCollapse">
<form id="addWorkExperience" method="post" action="SvAddWorkExperience">
    <label for="enterprise">Enterprise</label>
    <input type="text" id="enterprise" name="enterprise">
    <label for="startDate">Start date</label>
    <input type="date" id="startDate" name="startDate">
    <label for="endDate">Start date</label>
    <input type="date" id="endDate" name="endDate">
    <label for="postDescription">Post description</label>
    <input type="text" id="postDescription" name="postDescription">
    <input type="submit" value="Accept">
</form>
</div>

<div class="d-flex flex-wrap w-100">
    <jsp:include page="workexperiences.jsp"></jsp:include>
</div>




<div>
    <h1>Education</h1>
    <button>Agregar</button>
    <% for (Education education : cv.getEducations()){ %>
    <p><b>Course name:</b> <%= education.getName()%></p>
    <p><b>Institution:</b> <%= education.getInstitution()%></p>
    <p><b>Description:</b> <%= education.getDescription()%></p>
    <% }%>
</div>

<div>
    <h1>Knowledge and skills</h1>
    <button>Agregar</button>
    <% for (KnowledgeAndSkills knowledgeAndSkills : cv.getKnowledgeAndSkills()){ %>
    <p><b><%= knowledgeAndSkills.getName()%></b></p>
    <p><%= knowledgeAndSkills.getDescription()%></p>
    <% }%>
</div>


</div>
</body>
</html>
