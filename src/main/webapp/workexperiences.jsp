<%@ page import="model.WorkExperience" %>
<%@ page import="model.CurriculumVitae" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    CurriculumVitae cv = (CurriculumVitae) request.getSession().getAttribute("curriculum");
    int i = 0;
    for (WorkExperience workExperience : cv.getWorkExperiences()){ %>
<div class="card w-50">
    <div class="card-header">
        <!-- Button trigger modal edit experience-->
        <button type="button" class="btn btn-outline-dark" data-bs-toggle="modal" data-bs-target="#editWorkExperienceModal<%=String.valueOf(i)%>">
            <i class="fa-regular fa-pen-to-square"></i>
        </button>

        <!-- Modal edit experience-->
        <div class="modal fade" id="editWorkExperienceModal<%=String.valueOf(i)%>" tabindex="-1" aria-labelledby="editWorkExperienceModalLabel<%=String.valueOf(i)%>" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="editWorkExperienceModalLabel<%=String.valueOf(i)%>">Edit work experience</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="editWorkExperience<%=String.valueOf(i)%>" method="post" action="SvEditWorkExperience" class="d-flex flex-column">
                            <input hidden="hidden" name="uid" value="<%= workExperience.getId() %>" type="text">
                            <label for="enterprise">Enterprise</label>
                            <input type="text" id="enterprise" name="enterprise" value="<%= workExperience.getName()%>">
                            <label for="startDate">Start date</label>
                            <input type="date" id="startDate" name="startDate" value="<%= workExperience.getStart()%>">
                            <label for="endDate">End date</label>
                            <input type="date" id="endDate" name="endDate" value="<%= workExperience.getEnd()%>">
                            <label for="postDescription">Post description</label>
                            <input type="text" id="postDescription" name="postDescription" value="<%= workExperience.getDescription()%>">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" value="Accept" form="editWorkExperience<%=String.valueOf(i)%>" class="btn btn-primary">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Button trigger modal delete experience-->
        <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteWorkExperienceModal<%=String.valueOf(i)%>">
            <i class="fa-solid fa-trash"></i>
        </button>

        <!-- Modal delete experience-->
        <div class="modal fade" id="deleteWorkExperienceModal<%=String.valueOf(i)%>" tabindex="-1" aria-labelledby="deleteWorkExperienceModalLabel<%=String.valueOf(i)%>" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="deleteWorkExperienceModalLabel<%=String.valueOf(i)%>">Are you sure do you want to delete this experience?</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        <form id="deleteWorkExperience<%=String.valueOf(i)%>" method="post" action="SvDeleteWorkExperience" class="d-flex flex-column" hidden="hidden">
                            <input hidden="hidden" name="uid" value="<%= workExperience.getId() %>" type="text">
                        </form>
                    </div>
                    <div class="modal-footer">
                        <input type="submit" value="Accept" form="deleteWorkExperience<%=String.valueOf(i)%>" class="btn btn-danger">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card-body">
    <p><b>Enterprise:</b> <%= workExperience.getName()%></p>
    <p><b>Start date:</b> <%= workExperience.getStart()%></p>
    <p><b>End date:</b> <%= workExperience.getEnd()%></p>
    <p><b>Post description:</b> <%= workExperience.getDescription()%></p>
    </div>
</div>
<% i++; }%>
</html>
