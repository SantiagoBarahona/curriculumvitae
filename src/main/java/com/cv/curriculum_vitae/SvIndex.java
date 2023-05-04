package com.cv.curriculum_vitae;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.FileReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet(name = "SvIndex", value = "/index.jsp")
public class SvIndex extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            ServletContext context = request.getServletContext();
            FileReader file = new FileReader(context.getRealPath("/curriculum.json"));
            JSONObject curriculumJSON = (JSONObject) new JSONParser().parse(file);
            CVService.loadCV(curriculumJSON);
            CVService.update(request.getSession());
            response.sendRedirect("summary.jsp");

        }catch (ParseException ex){
            Logger.getLogger(SvCurriculumVitae.class.getName()).log(Level.SEVERE, "Error : " + ex.getMessage(), ex);
        }

    }
}
