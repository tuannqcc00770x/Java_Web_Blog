<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.PostDAO"%>
<%@ page import="model.Post"%>
<%@ page import="model.User"%>
<%
Post post = new Post();
if (request.getParameter("postId")!=null){
	PostDAO dao = new PostDAO();
	post = dao.getPostById(Integer.parseInt(request.getParameter("postId")));
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Post Detail</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/index.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<%@include file = "common_jsp/header.jsp" %>
		<h1 class="title">Post Detail</h1>
		<div class="container">
			<%if(post != null){
			%>
			<h3 style="color:maroon;font-style: italic"><span><i class="fa fa-address-card" aria-hidden="true"></i></span><%=post.getTitle()%></h3>
			<p>
			<span><i class="fa fa-clock-o" aria-hidden="true"></i></span>
			<span><%=post.getTime()%></span>
			<span>||</span>
			<span><i class="fa fa-user-o" aria-hidden="true"></i></span>
			<span><%=post.getAuthor()%></span>
			</p>
			<p><%=post.getDescription()%></p>
			<p><%=post.getContent()%></p>
			<hr>
			<%}%>
		</div>
		<%@include file = "common_jsp/footer.jsp" %>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	</body>
</html>