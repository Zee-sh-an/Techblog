package com.tech.blog.dao;

import java.security.PublicKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tech.blog.entities.Like;

public class LikeDao {

	Connection con;

	public LikeDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean saveLike(int pid, int uid) {
		boolean f = false;

		try {
			String q="insert into liked (pid,uid) values(?,?)";
			PreparedStatement pstmt = con.prepareStatement(q);
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();
			f=true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
			
	}

	public int countLikeOnPost(int pid) {
		int count=0;
		try {
			PreparedStatement pstmt=con.prepareStatement("select count(*) from liked where pid=?");
			pstmt.setInt(1,pid);
			ResultSet set =pstmt.executeQuery();
			if (set.next()) {
				count=set.getInt("count(*)");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public boolean isLikedByUser(int pid,int uid) {
		boolean delete=false;
		try {
			PreparedStatement pstmt=con.prepareStatement("delete from liked where pid=? and uid=?");
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return delete;
	}
}
