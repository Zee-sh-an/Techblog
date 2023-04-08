<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>

</head>
<body>
	<!-- navbar -->

	<%@include file="normal_navbar.jsp"%>

	<!-- //banner -->

	<div class="container-fluid p-0 m-0">
		<div class="jumbotron primary-background text-white banner-background">
			<div class="container ">
				<h3 class="display-3">Welcome to TechBlog</h3>
				<p>Welcome to technical blog, world of technology A programming
					language is a type of written language that tells computers what to
					do. Examples are: Python, Ruby, Java, JavaScript, C, C++, and C#.
					Programming languages are used to write all computer programs and
					computer software. A programming language is like a set of
					instructions that the computer follows to do something.</p>

				<button class="btn btn-outline-light btn-lg">
					<span class="fa fa-external-link"></span> Start ! its Free
				</button>
				<a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span
					class="fa fa-user-circle fa-spin"></span> login
				</a>
			</div>
		</div>

		<!-- //cards -->
		<div class="container">

			<div class="row mb-2">
				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">java programing</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn primary-background text-white">Read
								more</a>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">java programing</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn primary-background text-white">Read
								more</a>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">java programing</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn primary-background text-white">Read
								more</a>
						</div>
					</div>
				</div>

			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">java programing</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn primary-background text-white">Read
								more</a>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">java programing</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn primary-background text-white">Read
								more</a>
						</div>
					</div>
				</div>

				<div class="col-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="card-title">java programing</h5>
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
							<a href="#" class="btn primary-background text-white">Read
								more</a>
						</div>
					</div>
				</div>

			</div>

		</div>

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

		<script type="text/javascript" src="js/myjs.js"></script>
</body>
</html>