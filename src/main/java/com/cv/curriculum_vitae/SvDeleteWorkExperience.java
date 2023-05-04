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

@WebServlet(name = "SvDeleteWorkExperience", value = "/SvDeleteWorkExperience")
public class SvDeleteWorkExperience extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = request.getServletContext();
        FileReader file = new FileReader(context.getRealPath("/curriculum.json"));
        try {
            JSONObject curriculumJSON = (JSONObject) new JSONParser().parse(file);
            JSONArray experiences = (JSONArray) curriculumJSON.get("workExperiences");
            JSONArray filtered = new JSONArray();

            for (Object experience : experiences){
                JSONObject experienceJSON = (JSONObject) experience;
                if(!experienceJSON.get("uid").equals(request.getParameter("uid"))){
                    filtered.add(experienceJSON);
                }
            }

            curriculumJSON.replace("workExperiences", filtered);
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
}
