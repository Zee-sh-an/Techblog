package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class EditServlet
 */
@MultipartConfig
@WebServlet("/EditServlet")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//
//		String userName = request.getParameter("user_name");
//		String userEmail = request.getParameter("user_email");
//		String userPassword = request.getParameter("user_password");
//		String userAbout = request.getParameter("user_about");
//		Part part = request.getPart("image");
//		String imageName = part.getSubmittedFileName();
//
////		get the user from the session...
//		HttpSession s = request.getSession();
//		User user = (User) s.getAttribute("currentUser");
//		user.setName(userName);
//		user.setEmail(userEmail);
//		user.setPassword(userPassword);
//		user.setAbout(userAbout);
//		user.setProfile(imageName);
//
//		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
//		boolean ans = userDao.updateUser(user);
//		if (ans) {
////			out.println("updated to db");
//
//			String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
//
//			if (Helper.saveFile(part.getInputStream(), path)) {
////				out.println("profile updated...");
//				Message msg = new Message("Profile details updated", "success", "alert-success");
//				s.setAttribute("msg", msg);
//				response.sendRedirect("profile.jsp");
//			} else {
//				Message msg = new Message("Something went wrong ", "error", "alert-error");
//				s.setAttribute("msg", msg);
//				response.sendRedirect("profile.jsp");
//			}
//
//		} else {
////			out.println("not updated to db");
//			Message msg = new Message("Something went wrong", "error", "alert-error");
//			s.setAttribute("msg", msg);
//			response.sendRedirect("profile.jsp");
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String userName = request.getParameter("user_name");
		String userEmail = request.getParameter("user_email");
		String userPassword = request.getParameter("user_password");
		String userAbout = request.getParameter("user_about");
		Part part = request.getPart("image");
		String imageName = part.getSubmittedFileName();

//		get the user from the session...
		HttpSession s = request.getSession();
		User user = (User) s.getAttribute("currentUser");
		user.setName(userName);
		user.setEmail(userEmail);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		String oldfile = user.getProfile();
		user.setProfile(imageName);

		UserDao userDao = new UserDao(ConnectionProvider.getConnection());
		boolean ans = userDao.updateUser(user);
		if (ans) {
//			out.println("updated to db");

//			String path = request.getServletContext().getRealPath("/") + "pics" + File.separator + user.getProfile();
//			String path = getServletContext().getRealPath("/") + "pics" + File.separator + user.getProfile();
			String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
			String oldpath = request.getRealPath("/") + "pics" + File.separator + oldfile;
//			String path = "C:\\Users\\hp\\eclipse-workspace\\TechBlog\\src\\main\\webapp\\pics";

			if (oldfile.equals("default.png.jpg")) {

//				delete old profile pic	
				Helper.deleteFile(oldpath);
			}

			if (Helper.saveFile(part.getInputStream(), path)) {
//				out.println("profile updated...");
				Message msg = new Message("Profile details updated", "success", "alert-success");
				s.setAttribute("msg", msg);
				response.sendRedirect("profile.jsp");
			} else {
				Message msg = new Message("Something went wrong ", "error", "alert-error");
				s.setAttribute("msg", msg);
				response.sendRedirect("profile.jsp");
			}

		} else {
//			out.println("not updated to db");
			Message msg = new Message("Something went wrong", "error", "alert-error");
			s.setAttribute("msg", msg);
			response.sendRedirect("profile.jsp");
		}
	}

}
