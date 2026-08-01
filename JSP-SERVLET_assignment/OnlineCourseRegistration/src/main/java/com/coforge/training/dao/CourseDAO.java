package com.coforge.training.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.coforge.training.model.Course;

public class CourseDAO {

	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	// ==========================
	// Get All Courses
	// ==========================

	public List<Course> getAllCourses() {

		List<Course> courseList = new ArrayList<>();

		try {

			con = DBConnection.getConnection();

			String sql = "SELECT * FROM courses";

			ps = con.prepareStatement(sql);

			rs = ps.executeQuery();

			while (rs.next()) {

				Course course = new Course();

				course.setCourseId(rs.getInt("course_id"));
				course.setCourseName(rs.getString("course_name"));
				course.setDescription(rs.getString("description"));
				course.setInstructor(rs.getString("instructor"));
				course.setDuration(rs.getString("duration"));
				course.setLevel(rs.getString("level"));
				course.setCategory(rs.getString("category"));
				course.setImageUrl(rs.getString("image_url"));

				courseList.add(course);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return courseList;
	}

	// ==========================
	// Get Course By ID
	// ==========================

	public Course getCourseById(int courseId) {

		Course course = null;

		try {

			con = DBConnection.getConnection();

			String sql = "SELECT * FROM courses WHERE course_id=?";

			ps = con.prepareStatement(sql);

			ps.setInt(1, courseId);

			rs = ps.executeQuery();

			if (rs.next()) {

				course = new Course();

				course.setCourseId(rs.getInt("course_id"));
				course.setCourseName(rs.getString("course_name"));
				course.setDescription(rs.getString("description"));
				course.setInstructor(rs.getString("instructor"));
				course.setDuration(rs.getString("duration"));
				course.setLevel(rs.getString("level"));
				course.setCategory(rs.getString("category"));
				course.setImageUrl(rs.getString("image_url"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return course;
	}

	// ==========================
	// Add Course
	// ==========================

	public boolean addCourse(Course course) {

		boolean status = false;

		try {

			con = DBConnection.getConnection();

			String sql = "INSERT INTO courses(course_name,description,instructor,duration,level,category,image_url) VALUES(?,?,?,?,?,?,?)";

			ps = con.prepareStatement(sql);

			ps.setString(1, course.getCourseName());
			ps.setString(2, course.getDescription());
			ps.setString(3, course.getInstructor());
			ps.setString(4, course.getDuration());
			ps.setString(5, course.getLevel());
			ps.setString(6, course.getCategory());
			ps.setString(7, course.getImageUrl());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	// ==========================
	// Update Course
	// ==========================

	public boolean updateCourse(Course course) {

		boolean status = false;

		try {

			con = DBConnection.getConnection();

			String sql = "UPDATE courses SET course_name=?,description=?,instructor=?,duration=?,level=?,category=?,image_url=? WHERE course_id=?";

			ps = con.prepareStatement(sql);

			ps.setString(1, course.getCourseName());
			ps.setString(2, course.getDescription());
			ps.setString(3, course.getInstructor());
			ps.setString(4, course.getDuration());
			ps.setString(5, course.getLevel());
			ps.setString(6, course.getCategory());
			ps.setString(7, course.getImageUrl());
			ps.setInt(8, course.getCourseId());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	// ==========================
	// Delete Course
	// ==========================

	public boolean deleteCourse(int courseId) {

		boolean status = false;

		try {

			con = DBConnection.getConnection();

			// Delete enrollments first
			String sql1 = "DELETE FROM enrollments WHERE course_id=?";
			ps = con.prepareStatement(sql1);
			ps.setInt(1, courseId);
			ps.executeUpdate();

			// Delete the course
			String sql2 = "DELETE FROM courses WHERE course_id=?";
			ps = con.prepareStatement(sql2);
			ps.setInt(1, courseId);

			int rows = ps.executeUpdate();

			if (rows > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

}