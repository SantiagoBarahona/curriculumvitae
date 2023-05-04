package model;

import java.util.ArrayList;

public class CurriculumVitae {

    private String firstname, lastname, short_description, profession, photo;
    private final ArrayList<WorkExperience> workExperiences;
    private final ArrayList<Education> educations;
    private final ArrayList<KnowledgeAndSkills> knowledgeAndSkills;

    public CurriculumVitae(){
        workExperiences = new ArrayList<>();
        educations = new ArrayList<>();
        knowledgeAndSkills = new ArrayList<>();
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getShort_description() {
        return short_description;
    }

    public void setShort_description(String short_description) {
        this.short_description = short_description;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public ArrayList<WorkExperience> getWorkExperiences() {
        return workExperiences;
    }

    public ArrayList<Education> getEducations() {
        return educations;
    }

    public ArrayList<KnowledgeAndSkills> getKnowledgeAndSkills() {
        return knowledgeAndSkills;
    }


}
