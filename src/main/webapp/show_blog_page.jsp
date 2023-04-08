
<%@page import="com.tech.blog.entities.Like"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%
User user = (User) session.getAttribute("currentUser");

if (user == null) {
	response.sendRedirect("login_page.jsp");
}
%>
<%
int post_id = Integer.parseInt(request.getParameter("post_id"));

PostDao d = new PostDao(ConnectionProvider.getConnection());
post p = d.getPostbyid(post_id);
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=p.getpTitle()%></title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous" />

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="css/mystyle.css">

<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 82%, 61% 99%, 32% 90%, 0 94%, 0 0);
}

.post-title {
	font-weight: 100;
	font-size: 30px;
}

.post-content {
	font-weight: 100;
	font-size: 25px;
}

.post-code {
	font-weight: 100;
	font-size: 20px;
}

.post-date {
	font-style: italic;
	font-weight: bold;
}

.post-user-info {
	font-weight: 200;
	font-size: 20px;
}

.row-user {
	border: 1px solid #e2e2e2;
	padding-top: 15px;
}
</style>
</head>
<body>

	<!-- normal navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"> <span
			class="fa fa-asterisk"></span> Tech Blog
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="profile.jsp"> <span class="fa fa-bell-o"></span> Learn
						code with durgesh <span class="sr-only">(current)</span>
				</a></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span class="fa fa-check-square-o"></span>
						Categories
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Project Implementation</a> <a
							class="dropdown-item" href="#">Programming Language</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Data Structure</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"> <span
						class="fa fa-address-book"></span> Contact
				</a></li>

				<!-- Button trigger modal -->
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#exampleModal"> <span
						class="fa fa-asterisk"></span> Do Post
				</a></li>
			</ul>
			<ul class="navbar-nav mr-right">

				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"> <span
						class="fa fa-user-circle"></span> <%=user.getName()%>
				</a></li>

				<li class="nav-item"><a class="nav-link" href="LogoutServlet	">
						<span class="fa fa-user-plus"></span> Log out
				</a></li>
			</ul>
		</div>
	</nav>
	<!-- end of navbar -->

	<!--  Modal -->
	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white ">
					<h5 class="modal-title" id="exampleModalLabel">Tech blog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px;">
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=user.getName()%></h5>
						<!-- details -->

						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">EMAIL</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">NAME</th>
										<td><%=user.getName()%></td>

									</tr>
									<tr>
										<th scope="row">GENDER</th>
										<td><%=user.getGender()%></td>

									</tr>

									<tr>
										<th scope="row">STATUS</th>
										<td><%=user.getAbout()%></td>

									</tr>

									<tr>
										<th scope="row">REGISTER ON</th>
										<td><%=user.getDateTime()%></td>

									</tr>
								</tbody>
							</table>
						</div>
						<!-- profile edit -->

						<div id="profile-edit" style="display: none;">
							<h2 class="mt-2">Please Edit Carefully</h2>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>EMAIL :</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>NAME :</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>PASSWORD :</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>GENDER</td>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<td>STATUS</td>
										<td><textarea rows="5" class="form-control"
												name="user_about">
										<%=user.getAbout()%>
										</textarea></td>
									</tr>
									<tr>
										<td>REGISTER ON</td>
										<td><%=user.getDateTime()%></td>
									</tr>
									<tr>
										<td>NEW PROFILE PIC :</td>
										<td><input type="file" class="form-control" name="image"></td>
									</tr>
								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>

							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end of profile Modal -->

	<!-- add post modal -->


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Provide the
						post details..</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="AddPostServlet" id="add-post" method="post">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>--Select Category--</option>
								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>
								<%
								}
								%>


							</select>
						</div>

						<div class="form-group">
							<input type="text" name="pTitle" class="form-control"
								placeholder="Enter post Title">
						</div>
						<div class="form-group">
							<textarea placeholder="Enter your content" name="pContent"
								class="form-control" style="height: 200px"></textarea>
						</div>
						<div class="form-group">
							<textarea placeholder="Enter your program(if any)"
								class="form-control" name="pCode" style="height: 200px"></textarea>
						</div>
						<div class="form-group">
							<label>Select your pic..</label> <br> <input type="file"
								name="pic">
						</div>
						<div align="center">
							<button type="submit" class="btn btn-primary">Post</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- end of post modal -->

	<div class="continer">

		<div class="row my-4">
			<div class="col-md-6 offset-md-3 ">
				<div class="card">
					<div class="card-header primary-background text-white">
						<h4 class="post-title"><%=p.getpTitle()%></h4>
					</div>
					<div class="card-body">
						<img class="card-img" alt="Card img cap"
							src="blog_pics/<%=p.getpPic()%>">

						<div class="row row-user my-2">

							<div class="col-md-7">
								<%
								UserDao u = new UserDao(ConnectionProvider.getConnection());
								User us = u.getUserByUserId(p.getUserId());
								%>
								<p>
									<a class="post-user-info" href="#" data-toggle="modal"
										data-target="#profilemodal"><%=us.getName()%></a> has posted
								</p>
							</div>
							<div class="col-md-5 mt-2">
								<a class="post-date"><%=DateFormat.getDateInstance().format(p.getpDate())%></a>
							</div>
						</div>

						<p class="post-content"><%=p.getpContent()%></p>
						<pre class="post-code"><%=p.getpCode()%></pre>
					</div>
					<div class="card-footer primary-background">
						<!-- js script(reference) of js file must be here below -->
						<%
						LikeDao lDao=new LikeDao(ConnectionProvider.getConnection());
						 int l=lDao.countLikeOnPost(post_id);
						%>
						<a id="re" href="#"
							onclick="dolike(<%=post_id%>,<%=user.getId()%>)"
							class="btn btn-outline-light  btn-sm"><i
							class="fa fa-thumbs-o-up"></i><span><%=l%></span></a> <a href="#"
							class="btn btn-outline-light btn-sm"><i
							class="fa fa-commenting-o"></i><span>20</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- post user Modal -->
	<!-- Button trigger modal -->

	<!-- Modal -->
	<div class="modal fade" id="profilemodal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white ">
					<h5 class="modal-title" id="exampleModalLabel">Tech blog</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=us.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px;">
						<h5 class="modal-title mt-3" id="exampleModalLabel"><%=us.getName()%></h5>
						<!-- details -->

						<div id="profile-details">
							<table class="table">

								<tbody>
									<tr>
										<th scope="row">ID</th>
										<td><%=us.getId()%></td>

									</tr>
									<tr>
										<th scope="row">EMAIL</th>
										<td><%=us.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">NAME</th>
										<td><%=us.getName()%></td>

									</tr>
									<tr>
										<th scope="row">GENDER</th>
										<td><%=us.getGender()%></td>

									</tr>

									<tr>
										<th scope="row">STATUS</th>
										<td><%=us.getAbout()%></td>

									</tr>

									<tr>
										<th scope="row">REGISTER ON</th>
										<td><%=us.getDateTime()%></td>

									</tr>
								</tbody>
							</table>
						</div>
						<!-- end of post user profile modal -->


						<!-- javascript -->

						<script src="https://code.jquery.com/jquery-3.6.3.min.js"
							integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
							crossorigin="anonymous"></script>

						<script
							src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
							integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
							crossorigin="anonymous">
							
						</script>
						<script
							src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js"
							integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
							crossorigin="anonymous"></script>

						<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

						<script type="text/javascript" src="js/me.js"></script>

						<script>
							$(document).ready(function() {
								let editStatus = false;

								$('#edit-profile-button').click(function() {
									if (editStatus == false) {
										$("#profile-details").hide()
										$("#profile-edit").show();
										$(this).text("Back")
										editStatus = true;
									} else {
										$("#profile-details").show()
										$("#profile-edit").hide();
										$(this).text("Edit")
										editStatus = false;
									}
								})
							})
						</script>

						<script>
							$(document)
									.ready(
											function(e) {
												//console.log("page is ready.....")

												$("#add-post")
														.on(
																"submit",
																function(event) {
																	event
																			.preventDefault();

																	let form = new FormData(
																			this);

																	$
																			.ajax({
																				url : "AddPostServlet",
																				data : form,
																				type : 'post',
																				success : function(
																						data,
																						textStatus,
																						jqXHR) {
																					console
																							.log(data);

																					if (data
																							.trim() == 'done') {
																						swal(
																								"Good job!",
																								"saved successfully",
																								"success");
																					} else {
																						swal(
																								"Error!!",
																								"Something went wrong try again...",
																								"error");
																					}
																				},
																				error : function(
																						jqXHR,
																						textStatus,
																						errorThrown) {
																					swal(
																							"Error!!",
																							"Something went wrong try again...",
																							"error");
																				},

																				processData : false,
																				contentType : false
																			})
																})
											})
						</script>

						<script>
							function getPosts(catId, temp) {
								$("#loader").show();
								$("#post-container").hide();
								$(".c-link").removeClass('active');

								$
										.ajax({
											url : "load_posts.jsp",
											data : {
												cid : catId
											},
											success : function(data,
													textStatus, jqXHR) {
												$("#loader").hide();
												$("#post-container").show();
												$("#post-container").html(data);
												$(temp).addClass('active')
											}
										})
							}
							$(document).ready(function(e) {
								let allPostRef = $('.c-link')[0]
								getPosts(0, allPostRef)
							})
							</script>
</body>
</html>