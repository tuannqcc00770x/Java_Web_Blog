<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="model.Post" %>
<%@ page import="dao.PostDAO" %>
<%@ page import="java.util.ArrayList" %>
<%
	
	Post post = (Post)request.getAttribute("post");
	String title = "";
	String description = "";
	String content = "";
	int id = 0;

	@SuppressWarnings("unchecked")
	ArrayList<String> listErr = (ArrayList<String>)request.getAttribute("errors");
	if (request.getParameter("postId")!=null){
		PostDAO dao = new PostDAO();
		id = Integer.parseInt(request.getParameter("postId"));
		Post p = dao.getPostById(id);
		title = p.getTitle();
		description = p.getDescription();
		content = p.getContent();
	}
	
	
	if (post != null){
		title = post.getTitle();
		description = post.getDescription();
		content = post.getContent();
		id = post.getId();
	}
%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Edit Post</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
		<link rel="stylesheet" href="css/index.css">
		<link rel="stylesheet" href="css/post.css">
		<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	</head>
	<body>
		<%@include file = "common_jsp/header.jsp" %>
		<h1 class="title">Edit Post</h1>
		<div class="container">
			<form action="<%=request.getContextPath()%>/edit" method="post" class="">
				<h3 class="heading">Title</h3>
				<textarea class="content" rows="" cols="" name="title"><%=title%></textarea>
				<h3 class="heading">Description</h3>
				<textarea class="content" rows="" cols="" name="description"><%=description %></textarea>
				<h3 class="heading">Content</h3>
				<textarea name="editor1" required="required"><%=content%></textarea>
				<input class="invisible" name="id" value="<%=id%>">
				<div class="text-center" style="color:red;padding:10px 10%;">
				<%if (listErr!=null){%>
		     		<%=String.join("<br />", listErr)%>
				<%}%>
				</div>
				<div class="text-center">
					<button class="btn btn-primary">Submit</button> 
	            	<a href="./" class="btn btn-info">Cancel</a>
				</div>
			</form>
		</div>
		<%@include file = "common_jsp/footer.jsp" %>
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script>
           CKEDITOR.replace( 'editor1' );
        </script>
	</body>
</html>