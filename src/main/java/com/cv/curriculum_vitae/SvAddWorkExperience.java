package com.cv.curriculum_vitae;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "SvAddWorkExperience", value = "/SvAddWorkExperience")
public class SvAddWorkExperience extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = request.getServletContext();
        FileReader file = new FileReader(context.getRealPath("/curriculum.json"));
        try {
            JSONObject curriculumJSON = (JSONObject) new JSONParser().parse(file);
            JSONArray experiences = (JSONArray) curriculumJSON.get("workExperiences");
            JSONObject experience = new JSONObject();
            experience.put("uid", UUID.randomUUID().toString());
            experience.put("enterprise", request.getParameter("enterprise"));
            experience.put("startDate", request.getParameter("startDate"));
            experience.put("endDate", request.getParameter("endDate"));
            experience.put("postDescription", request.getParameter("postDescription"));
            experiences.add(experience);
            curriculumJSON.replace("workExperiences", experiences);
            FileWriter fileWriter = new FileWriter(context.getRealPath("/curriculum.json"));
            fileWriter.write(curriculumJSON.toJSONString());
            fileWriter.close();
            CVService.loadCV(curriculumJSON);
            CVService.update(request.getSession());
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        response.sendRedirect("curriculum_vitae.jsp");
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Hacer put");
    }
}
