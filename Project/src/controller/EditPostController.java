package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PostDAO;
import model.Post;
import service.BlogService;

public class EditPostController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("utf-8");
		PostDAO dao = new PostDAO();
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		String content = req.getParameter("editor1");
		LocalDateTime time = java.time.LocalDateTime.now();
		int id = Integer.parseInt(req.getParameter("id"));
		try {
			String author = dao.getPostById(id).getAuthor();
			Post post = new Post(id, title, description, content, time, author);
			BlogService.getInstance().setContent(post);
			ArrayList<String> listErr = BlogService.getInstance().checkPost(post);
			//if error exists, return create post page include list errors, post created info
			if (!listErr.isEmpty()) {
				req.setAttribute("errors", listErr);
				req.setAttribute("post", post);
				req.getRequestDispatcher("/editPost.jsp").forward(req, resp);
			} else {// if error not exist, forward to posts page and save post info
				dao.editPost(post);
				req.getRequestDispatcher("/posts.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
