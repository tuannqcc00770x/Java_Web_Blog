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
String invisible = "invisible";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Posts</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/index.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<%@include file = "common_jsp/header.jsp" %>
		<h1 class="title">All Posts Here</h1>
		<% 
         	if (session.getAttribute("firstLoad")!=null){
         		 if ((boolean)session.getAttribute("firstLoad")) {
                     session.setAttribute("firstLoad", false);
                     %>
                     <h3 style="color:blue;text-align:center">Welcome to the Board, <%= user.getUsername() %></h3>
                     
                     <% } else { %>
                     <h3 style="color:blue;text-align:center">Welcome back, <%= user.getUsername() %></h3>
                     <% } %>
         <% } %>
		<div class="container">
			<%if(!list.isEmpty()){
			for (Post post:list){
				if (user != null){
					if (post.getAuthor().equals(user.getUsername())) {
						invisible = "";
					} else invisible = "invisible";
				}
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
			<a class="btn btn-danger <%=invisible%>" href="./editPost.jsp?postId=<%=post.getId()%>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>Edit</a>
			</p>
			<hr>
			<%}%>
		<%}else {%><h3 style="text-align: center; color: maroon;">There is no post, please login and create posts!</h3><%}%>
		</div>
		<%@include file = "common_jsp/footer.jsp" %>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	</body>
</html>