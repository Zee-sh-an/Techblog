<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>! Something went wrong....</title>
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
	<div class="container text-center bt-20">
		<img src="img/warning.png" class="img-fluid mt-3" height="400" width="400">
		<h3 class="display-3">!Something went wrong....</h3>
		<%=exception %>
		<br>
		<a href="index.jsp"><button class="btn primary-background btn-lg text-white mt-3">Home</button></a>
	</div>
</body>
</html>