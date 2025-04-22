package com.dao;

import java.sql.*;
import java.util.*;
import com.entity.Job;
import com.entity.jobs;

public class ManageJobDao {
    private Connection conn;

    public ManageJobDao(Connection conn) {
        this.conn = conn;
    }

    public List<Job> getAllJobs() {
        List<Job> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM jobs ORDER BY posted_date DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Job j = new Job();
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

    public boolean updateJob(Job j) {
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

    public Job getJobById(int id) {
    	Job j = null; // Start with null
        try {
            String sql = "SELECT * FROM jobs WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                j = new Job(); // Only create object if job is found
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
    public List<Job> getJobsByEmployer(int employerId) {
        List<Job> list = new ArrayList<Job>();
        try {
            String sql = "SELECT * FROM jobs WHERE posted_by = ? ORDER BY posted_date DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, employerId);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Job j = new Job();
                j.setId(rs.getInt("id"));
                j.setTitle(rs.getString("title"));
                // Set all other fields...
                list.add(j);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Job> getJobsByRecruiterId(int recruiterId) {
        List<Job> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM jobs WHERE recruiter_id = ? ORDER BY posted_date DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, recruiterId);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Job j = new Job();
                j.setId(rs.getInt("id"));
                j.setTitle(rs.getString("title"));
                j.setDescription(rs.getString("description"));
                j.setLocation(rs.getString("location"));
                j.setJobType(rs.getString("job_type"));
                j.setStatus(rs.getString("status"));
                j.setPostedDate(rs.getDate("posted_date"));
                list.add(j);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
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

}
