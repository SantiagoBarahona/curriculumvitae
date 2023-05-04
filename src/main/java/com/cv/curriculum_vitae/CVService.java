package com.cv.curriculum_vitae;

import jakarta.servlet.http.HttpSession;
import model.CurriculumVitae;

import model.Education;
import model.KnowledgeAndSkills;
import model.WorkExperience;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class CVService {

    private static CurriculumVitae curriculum;

    public static void loadCV(JSONObject json) {

        curriculum = new CurriculumVitae();
        curriculum.setFirstname((String) json.get("firstName"));
        curriculum.setLastname((String) json.get("lastName"));
        curriculum.setShort_description((String) json.get("shortDescription"));
        curriculum.setProfession((String) json.get("profession"));

        JSONArray workExperiencesJSON= (JSONArray) json.get("workExperiences");

        for(int i=0; i<workExperiencesJSON.size(); i++){
            JSONObject objArray = (JSONObject) workExperiencesJSON.get(i);
            WorkExperience workExperience = new WorkExperience();

            workExperience.setName((String)objArray.get("enterprise"));
            workExperience.setStart((String)objArray.get("startDate"));
            workExperience.setEnd((String)objArray.get("endDate"));
            workExperience.setDescription((String)objArray.get("postDescription"));
            workExperience.setId((String)objArray.get("uid"));

            curriculum.getWorkExperiences().add(workExperience);
        }

        JSONArray educationJSON = (JSONArray) json.get("education");

        for(int i=0; i<educationJSON.size(); i++){
            JSONObject objArray = (JSONObject) educationJSON.get(i);
            Education education = new Education();

            education.setInstitution((String)objArray.get("institution"));
            education.setName((String)objArray.get("courseName"));
            education.setDescription((String)objArray.get("courseDescription"));

            curriculum.getEducations().add(education);
        }


        JSONArray knowledgeAndSkillsJSON = (JSONArray) json.get("knowledgeAndSkills");

        for(int i=0; i<knowledgeAndSkillsJSON.size(); i++){
            JSONObject objArray = (JSONObject) knowledgeAndSkillsJSON.get(i);
            KnowledgeAndSkills knowledgeAndSkills = new KnowledgeAndSkills();

            knowledgeAndSkills.setName((String)objArray.get("name"));
            knowledgeAndSkills.setDescription((String)objArray.get("description"));
            curriculum.getKnowledgeAndSkills().add(knowledgeAndSkills);
        }
    }

    public static void update(HttpSession httpSession){
        if(httpSession.getAttribute("curriculum") != null)
            httpSession.removeAttribute("curriculum");

        httpSession.setAttribute("curriculum" , CVService.getCurriculum());
    }

    public static CurriculumVitae getCurriculum() {
        return curriculum;
    }
}
