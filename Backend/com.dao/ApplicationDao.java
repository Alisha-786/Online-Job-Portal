package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.Application;

public class ApplicationDao {
    private Connection conn;

    public ApplicationDao(Connection conn) {
        this.conn = conn;
    }

    // Get all applications (with job title)
    public List<Application> getAllApplications() {
        List<Application> list = new ArrayList<>();
        try {
            String sql = "SELECT a.*, j.title FROM applications a JOIN jobs j ON a.job_id = j.id";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Application app = new Application();
                app.setId(rs.getInt("id"));
                app.setJobId(rs.getInt("job_id"));
                app.setCandidateId(rs.getInt("candidate_id"));
                app.setResume(rs.getString("resume"));
                app.setCoverLetter(rs.getString("cover_letter"));
                app.setStatus(rs.getString("status"));
                app.setAppliedDate(rs.getTimestamp("applied_date"));
                app.setJobTitle(rs.getString("title"));
                list.add(app);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}