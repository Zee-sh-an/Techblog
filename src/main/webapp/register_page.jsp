<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>

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

	<%@include file="normal_navbar.jsp"%>


	<main class="primary-background banner-background"
		style="padding-bottom: 90px;" >
		<div class="container">
			<div class="col-md-6 offset-md-3" >
				<div class="card" >
					<div class="card-header primary-background text-white text-center">
						<span class="fa fa-user-circle fa-3x"></span> <br>
						<p>Register here</p>
					</div>
					<div class="card-body">
						<form action="RegisterServlet" method="POST" id="reg">
							<div class="form-group">
								<label for="user_name">User name</label> <input type="text"
									class="form-control" name="user_name"
									aria-describedby="emailHelp" placeholder="Enter name">
								<small class="form-text text-muted">We'll never share
									your email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" name="user_email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email"> <small id="emailHelp"
									class="form-text text-muted">We'll never share your
									email with anyone else.</small>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" name="user_password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>

							<div class="form-group">
								<label for="gender">Select Gender</label> <br> <input
									name="user_gender" type="radio" value="male">Male <input
									name="user_gender" name="user_gender" type="radio"
									value="female">Female
							</div>

							<div class="form-group">
								<textarea rows="5" name="about" id=""
									placeholder="Enter something about yourself"
									class="form-control"></textarea>
							</div>

							<div class="form-check">
								<input type="checkbox" name="check" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree terms and conditions</label>
							</div>
							<br>
							<div class="container text-center" id="loader"
								style="display: none;">
								<span class="fa fa-refresh fa-spin fa-4x"></span>
								<h4>Please wait....</h4>
							</div>
							<br>
							<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
					<div class="card-footer"></div>
				</div>
			</div>

		</div>
	</main>

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
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript" src="js/myjs.js"></script>
	<script>
		$(document).ready(function() {
			console.log("loaded.....")

			$("#reg").on('submit', function(event) {
				event.preventDefault();

				let form = new FormData(this);

				$("#submit-btn").hide();
				$("#loader").show();

				$.ajax({
					url : "RegisterServlet",
					data : form,
					type : 'POST',
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						$("#submit-btn").show();
						$("#loader").hide();
						//sweet alert(website)
						
						if (data.trim()==='done') {
							
						swal("Register sucessfully...we are redirecting to login page")
						.then((value) => {
						  window.location="login_page.jsp"
						});
						}else {
							swal(data);
						}
					},
					error : function(jqXHR, textStatus, errorThrow) {
						console.log(jqXHR);
						$("#submit-btn").hide();
						$("#loader").show();
						swal("Something went wrong...try again");
					},
					processData : false,
					contentType : false
				});
			});
		});
	</script>

</body>
</html>