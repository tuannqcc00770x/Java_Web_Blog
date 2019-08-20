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
import model.User;
import service.BlogService;

public class CreatePostController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("utf-8");
		User author = (User) req.getSession().getAttribute("logged");
		String title = req.getParameter("title");
		String description = req.getParameter("description");
		String content = req.getParameter("editor1");
		LocalDateTime time = java.time.LocalDateTime.now();
		Post post = new Post(title, description, content, time, author.getUsername());
		BlogService.getInstance().setContent(post);
		try {
			ArrayList<String> listErr = BlogService.getInstance().checkPost(post);
			//if error exists, return create post page include list errors, post created info
			if (!listErr.isEmpty()) {
				req.setAttribute("errors", listErr);
				req.setAttribute("post", post);
				req.getRequestDispatcher("/createPost.jsp").forward(req, resp);
			} else {// if error not exist, forward to posts page and save post info
				PostDAO dao = new PostDAO();
				dao.addPost(post);
				req.getRequestDispatcher("/posts.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
