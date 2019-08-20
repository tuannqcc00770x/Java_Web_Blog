<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dao.PostDAO"%>
<%@ page import="model.Post"%>
<%@ page import="model.User"%>
<%
PostDAO dao = new PostDAO();
ArrayList<Post> list = dao.getAllPosts();
User user = (User) session.getAttribute("logged");
boolean hasPost = false;
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Your Posts</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/index.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<%@include file = "common_jsp/header.jsp" %>
		<h1 class="title">Your Posts</h1>
		<div class="container">
			<%if(!list.isEmpty()){
			for (Post post:list){
				if (user != null){
					if (post.getAuthor().equals(user.getUsername())) {
					hasPost = true;
					%>
						<h3 style="color:maroon;font-style: italic"><span><i class="fa fa-address-card" aria-hidden="true"></i></span><%=post.getTitle()%></h3>
						<p>
						<span><i class="fa fa-clock-o" aria-hidden="true"></i></span>
						<span><%=post.getTime()+""%></span>
						<span>||</span>
						<span><i class="fa fa-user-o" aria-hidden="true"></i></span>
						<span><%=post.getAuthor()%></span>
						</p>
						<p><%=post.getDescription()%></p>
						<p>
						<a class="btn btn-info" href="./postDetail.jsp?postId=<%=post.getId()%>"><i class="fa fa-eye" aria-hidden="true"></i>Detail...</a>
						<a class="btn btn-danger" href="./editPost.jsp?postId=<%=post.getId()%>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>Edit</a>
						</p>
						<hr>
					<%}%>
				<%}%>
			<%}%>
		<%}%>
		<%if (!hasPost)%> <h3 style="text-align: center; color: maroon;">You haven't created post yet!</h3>
		</div>
		<%@include file = "common_jsp/footer.jsp" %>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	</body>
</html>