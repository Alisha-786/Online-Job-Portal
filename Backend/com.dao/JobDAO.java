package com.dao;

import java.sql.*;
import java.util.*;

import com.DB.DBConnect;
import com.entity.jobs;

public class JobDAO {
    private Connection conn;

    public JobDAO(Connection conn) {
        this.conn = conn;
    }

    public List<jobs> getAllJobs() {
        List<jobs> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM jobs ORDER BY posted_date DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                jobs j = new jobs();
                j.setId(rs.getInt("id"));
                j.setTitle(rs.getString("title"));
                j.setDescription(rs.getString("description"));
                j.setSalary(rs.getString("salary"));
                j.setLocation(rs.getString("location"));
                j.setExperience(rs.getString("experience"));
                j.setIndustry(rs.getString("industry"));
                j.setJobType(rs.getString("job_type"));
                j.setCompanyName(rs.getString("company_name"));
                j.setWebsite(rs.getString("website"));
                j.setLogo(rs.getString("logo"));
                j.setPostedBy(rs.getString("posted_by"));
                j.setPostedDate(rs.getTimestamp("posted_date"));
                j.setStatus(rs.getString("status"));
                list.add(j);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteJob(int id) {
        boolean f = false;
        try {
            String sql = "DELETE FROM jobs WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int i = ps.executeUpdate();
            if (i == 1) f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public boolean updateJob(jobs j) {
        boolean f = false;
        try {
            String sql = "UPDATE jobs SET title=?, description=?, salary=?, location=?, experience=?, industry=?, job_type=?, company_name=?, website=?, logo=?, posted_by=?, status=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, j.getTitle());
            ps.setString(2, j.getDescription());
            ps.setString(3, j.getSalary());
            ps.setString(4, j.getLocation());
            ps.setString(5, j.getExperience());
            ps.setString(6, j.getIndustry());
            ps.setString(7, j.getJobType());
            ps.setString(8, j.getCompanyName());
            ps.setString(9, j.getWebsite());
            ps.setString(10, j.getLogo());
            ps.setString(11, j.getPostedBy());
            ps.setString(12, j.getStatus());
            ps.setInt(13, j.getId());
            int i = ps.executeUpdate();
            if (i == 1) f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public jobs getJobById(int id) {
        jobs j = null; // Start with null
        try {
            String sql = "SELECT * FROM jobs WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                j = new jobs(); // Only create object if job is found
                j.setId(rs.getInt("id"));
                j.setTitle(rs.getString("title"));
                j.setDescription(rs.getString("description"));
                j.setSalary(rs.getString("salary"));
                j.setLocation(rs.getString("location"));
                j.setExperience(rs.getString("experience"));
                j.setIndustry(rs.getString("industry"));
                j.setJobType(rs.getString("job_type"));
                j.setCompanyName(rs.getString("company_name"));
                j.setWebsite(rs.getString("website"));
                j.setLogo(rs.getString("logo"));
                j.setPostedBy(rs.getString("posted_by"));
                j.setPostedDate(rs.getTimestamp("posted_date"));
                j.setStatus(rs.getString("status"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return j;
    }
    public boolean addJob(jobs job) {
        boolean success = false;
        try {
            String sql = "INSERT INTO jobs(title, description, recruiter_id, ...) VALUES (?, ?, ?, ...)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, job.getTitle());
            ps.setString(2, job.getDescription());
            ps.setInt(3, job.getRecruiterId());  // Critical parameter
            ps.setString(3, job.getSalary());
            ps.setString(4, job.getLocation());
            ps.setString(5, job.getExperience());
            ps.setString(6, job.getIndustry());
            ps.setString(7, job.getJobType());
            ps.setString(8, job.getCompanyName());
            ps.setString(9, job.getWebsite());
            ps.setString(10, job.getLogo());
            ps.setString(11, job.getPostedBy());
            ps.setString(12, job.getStatus());
            ps.setInt(13, job.getId());
            
            int rowsAffected = ps.executeUpdate();
            success = rowsAffected > 0;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
 // For Advanced Search
    public List<jobs> searchJobs(String title, String location, String experience, String company) {
        List<jobs> list = new ArrayList<>();
        String sql = "SELECT * FROM jobs WHERE 1=1";
        
        if(title != null && !title.isEmpty()) {
            sql += " AND title LIKE '%" + title + "%'";
        }
        if(location != null && !location.isEmpty()) {
            sql += " AND location = '" + location + "'";
        }
        if(experience != null && !experience.isEmpty()) {
            sql += " AND experience = '" + experience + "'";
        }
        if(company != null && !company.isEmpty()) {
            sql += " AND company_name = '" + company + "'";
        }
        
        try (Connection conn = DBConnect.getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
            	jobs j = new jobs();
                j.setId(rs.getInt("id"));
                j.setTitle(rs.getString("title"));
                j.setDescription(rs.getString("description"));
                j.setLocation(rs.getString("location"));
                j.setExperience(rs.getString("experience"));
                j.setCompanyName(rs.getString("company_name"));
                // Set other fields as needed
                list.add(j);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // For Category Listings
    public List<jobs> getJobsByIndustry(String industry) {
        List<jobs> list = new ArrayList<>();
        String sql = "SELECT * FROM jobs WHERE industry = ?";
        
        try (Connection conn = DBConnect.getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             
            ps.setString(1, industry);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                jobs j = new jobs();
                // Set all job properties from result set
                j.setId(rs.getInt("id"));
                j.setTitle(rs.getString("title"));
                j.setDescription(rs.getString("description"));
                j.setSalary(rs.getString("salary"));
                j.setLocation(rs.getString("location"));
                j.setExperience(rs.getString("experience"));
                j.setIndustry(rs.getString("industry"));
                j.setJobType(rs.getString("job_type"));
                j.setCompanyName(rs.getString("company_name"));
                j.setWebsite(rs.getString("website"));
                j.setLogo(rs.getString("logo"));
                j.setPostedBy(rs.getString("posted_by"));
                j.setPostedDate(rs.getTimestamp("posted_date"));
                j.setStatus(rs.getString("status"));
                list.add(j);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<String> getAllLocations() {
        List<String> locations = new ArrayList<>();
        String sql = "SELECT DISTINCT location FROM jobs";
        
        try (Connection conn = DBConnect.getConn();
             PreparedStatement ps = conn.prepareStatement(sql)) {
             
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                locations.add(rs.getString("location"));
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return locations;
    }
    

}
