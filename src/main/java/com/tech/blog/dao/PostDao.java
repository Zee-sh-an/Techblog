package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.post;
import java.sql.Timestamp.*;

public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {

		ArrayList<Category> list = new ArrayList<>();

		try {

			String query = "select* from categories";
			Statement st = this.con.createStatement();
			ResultSet set = st.executeQuery(query);

			while (set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				Category c = new Category(cid, name, description);
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public boolean savepost(post Post) {
		boolean f = false;
		try {
			String query = "insert into posts( pTitle,pContent,pCode,pPic,CatId,userId) Values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, Post.getpTitle());
			pstmt.setString(2, Post.getpContent());
			pstmt.setString(3, Post.getpCode());
			pstmt.setString(4, Post.getpPic());
			pstmt.setInt(5, Post.getCatID());
			pstmt.setInt(6, Post.getUserId());

			pstmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<post> getAllPosts() {
		List<post> list = new ArrayList<>();

		try {
			String query = "select * from posts";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet p = pstmt.executeQuery();

			while (p.next()) {

				Integer pid = p.getInt("pid");
				String pTitle = p.getString("pTitle");
				String pConten = p.getString("pContent");
				String pCode = p.getString("pCode");
				String pPic = p.getString("pPic");
				Timestamp pDate = p.getTimestamp("pDate");
				Integer pCatId = p.getInt("catId");
				Integer userId = p.getInt("userId");
				post c = new post(pid, pTitle, pConten, pCode, pPic, pDate, pCatId, userId);
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<post> getAllPostsbycatId(int CatId) {
		List<post> list = new ArrayList<>();

		try {
			String query = "select * from posts where CatId=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, CatId);
			ResultSet p = pstmt.executeQuery();

			while (p.next()) {

				Integer pid = p.getInt("pid");
				String pTitle = p.getString("pTitle");
				String pConten = p.getString("pContent");
				String pCode = p.getString("pCode");
				String pPic = p.getString("pPic");
				Timestamp pDate = p.getTimestamp("pDate");
				Integer userId = p.getInt("userId");
				post c = new post(pid, pTitle, pConten, pCode, pPic, pDate,userId);
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	public post getPostbyid(int postid) {
		post Post=null;
		
		try {
			PreparedStatement pstmt=con.prepareStatement("select * from posts where pid=?");
			pstmt.setInt(1, postid);
			ResultSet set =pstmt.executeQuery();
			
			if (set.next()) {
				Integer pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pConten = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp pDate = set.getTimestamp("pDate");
				Integer userId = set.getInt("userId");
				Post = new post(pid, pTitle, pConten, pCode, pPic, pDate,userId);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return Post	;
	}
}
