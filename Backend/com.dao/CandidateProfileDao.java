// CandidateProfileDao.java in com.dao
package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.entity.CandidateProfile;

public class CandidateProfileDao {
    private Connection conn;

    public CandidateProfileDao(Connection conn) {
        this.conn = conn;
    }

    public boolean saveProfile(CandidateProfile profile) {
        boolean f = false;
        try {
            String sql = "INSERT INTO candidate_profiles(user_id, full_name, email, phone, skills, experience, education, certifications, resume_path) VALUES (?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, profile.getUserId());
            ps.setString(2, profile.getFullName());
            ps.setString(3, profile.getEmail());
            ps.setString(4, profile.getPhone());
            ps.setString(5, profile.getSkills());
            ps.setString(6, profile.getExperience());
            ps.setString(7, profile.getEducation());
            ps.setString(8, profile.getCertifications());
            ps.setString(9, profile.getResumePath());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public CandidateProfile getProfileByUserId(int userId) {
        CandidateProfile profile = null;
        try {
            String sql = "SELECT * FROM candidate_profiles WHERE user_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                profile = new CandidateProfile();
                profile.setId(rs.getInt("id"));
                profile.setUserId(rs.getInt("user_id"));
                profile.setFullName(rs.getString("full_name"));
                profile.setEmail(rs.getString("email"));
                profile.setPhone(rs.getString("phone"));
                profile.setSkills(rs.getString("skills"));
                profile.setExperience(rs.getString("experience"));
                profile.setEducation(rs.getString("education"));
                profile.setCertifications(rs.getString("certifications"));
                profile.setResumePath(rs.getString("resume_path"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return profile;
    }

    public boolean updateProfile(CandidateProfile profile) {
        boolean f = false;
        try {
            String sql = "UPDATE candidate_profiles SET full_name=?, email=?, phone=?, skills=?, experience=?, education=?, certifications=?, resume_path=? WHERE user_id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, profile.getFullName());
            ps.setString(2, profile.getEmail());
            ps.setString(3, profile.getPhone());
            ps.setString(4, profile.getSkills());
            ps.setString(5, profile.getExperience());
            ps.setString(6, profile.getEducation());
            ps.setString(7, profile.getCertifications());
            ps.setString(8, profile.getResumePath());
            ps.setInt(9, profile.getUserId());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}