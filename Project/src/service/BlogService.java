package service;

import java.util.ArrayList;

import dao.UserDAO;
import model.Post;
import model.User;

public class BlogService {
	
	public static BlogService instance;
	public String msg;
	public ArrayList<String> listErr;
	
	//create instance to call method
	public static BlogService getInstance() {
		if (instance == null) return new BlogService();
		else return instance;
	}
	
	//check conditions to login
	public boolean checkLogin(User user) throws Exception {
		msg = "";
		UserDAO dao = new UserDAO();
		ArrayList<User> list = dao.getAllUsers();
		if (list.isEmpty()) {
			msg = "There is no user in data!" + "<br>" + "Please signup!";
			return false;
		}
		for (User u : list) {
			if (u.getUsername().equals(user.getUsername()) && u.getPassword().equals(user.getPassword())){
				return true;
			}
		}
		msg = "Wrong username or password";
		return false;
	}
	
	//get errors if exist when signup
	public ArrayList<String> checkSignup(User user) throws Exception {
		listErr = new ArrayList<>();
		UserDAO dao = new UserDAO();
		ArrayList<User> users = dao.getAllUsers();
		for (User u : users) {
			if (u.getUsername().equals(user.getUsername())) {
				listErr.add("Username already exist!");
				return listErr;
			}
		}
		
		if (user.getUsername().matches(".*[$#@%^&*]+.*")) {
			listErr.add("Username must not contains $#@%^&*");
		}
		if (user.getUsername().length() <= 6 || user.getUsername().length() > 100) {
			listErr.add("Username must contains at least 7 characters and no longer than 100 characters");
		}
		if (!user.getPassword().matches(".*[A-Z]+.*")) {
			listErr.add("Password must contains at least 1 uppercase character");
		}
		if (!user.getPassword().matches(".*[0-9]+.*")) {
			listErr.add("Password must contains at least 1 numbers");
		}
		if (!user.getPassword().matches(".*[$#@%^&*]+.*")) {
			listErr.add("Password must contains at least 1 of the following characters: $#@%^&*");
		}
		if (user.getPassword().length() <= 8) {
			listErr.add("Password must contains at least 9 characters");
		}
		return listErr;
	}
	
	//get errors if exist when create or edit post
	public ArrayList<String> checkPost(Post post) throws Exception {
		listErr = new ArrayList<>();
		if (post.getTitle().length() == 0 || post.getTitle().length() > 255) {
			listErr.add("Title must be filled and no longer than 255 characters");
		}
		if (post.getDescription().length() == 0 || post.getDescription().length() > 255) {
			listErr.add("Description must be filled and no longer than 255 characters");
		}
		if (post.getContent().length() == 0 || post.getContent().length() > 65535) {
			listErr.add("Content must be filled and no longer than 65535 characters");
		}
		return listErr;
	}
	
	//set content except <p> tag
	public void setContent(Post post) {
		String content = post.getContent();
		if (content.length() > 0) post.setContent(content.substring(3, content.length()-6));
	}
	
	public String getMsg() {
		return msg;
	}

	public ArrayList<String> getListErr() {
		return listErr;
	}
	
	
}
