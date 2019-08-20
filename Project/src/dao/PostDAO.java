package dao;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.Post;
import util.HibernateUtil;

public class PostDAO {
	
	//get all posts from database
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<Post> getAllPosts() throws Exception {
		ArrayList<Post> list = new ArrayList<>();
		Session session = null;
        try {
            session = HibernateUtil.getSession();
            String queryStr = "select p from Post p order by publictime desc";
            Query query = session.createQuery(queryStr);
            list = (ArrayList<Post>) query.list();
        } catch(Exception ex) {
            ex.printStackTrace();
            // handle exception here
        } finally {
            try {if(session != null) session.close();} catch(Exception ex) {}
        }
		return list;
	}
	
	//add new post to data
	public void addPost(Post post) throws Exception {
		Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSession();
            transaction = session.beginTransaction();
            session.save(post);
            transaction.commit();
        } catch(Exception ex) {
            ex.printStackTrace();
            // handle exception here
            if(transaction != null) transaction.rollback();
        } finally {
            try {if(session != null) session.close();} catch(Exception ex) {}
        }
	}
	
	//get post using id
	public Post getPostById(int id) throws Exception {
		 Session session = null;
	        Post post = null;
	        try {
	            session = HibernateUtil.getSession();
	            post = session.get(Post.class, id);
	        } catch(Exception ex) {
	            ex.printStackTrace();
	            // handle exception here
	        } finally {
	            try {if(session != null) session.close();} catch(Exception ex) {}
	        }
		return post;
	}
	
	//update post
	public void editPost(Post post) throws Exception {
		Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSession();
            transaction = session.beginTransaction();
            session.update(post);
            transaction.commit();
        } catch(Exception ex) {
            ex.printStackTrace();
            // handle exception here
            if(transaction != null) transaction.rollback();
        } finally {
            try {if(session != null) session.close();} catch(Exception ex) {}
        }
	}
}
