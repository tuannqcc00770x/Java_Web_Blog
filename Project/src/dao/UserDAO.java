package dao;
import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import model.User;
import util.HibernateUtil;

public class UserDAO {
	
	//get all users in data
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList<User> getAllUsers() throws Exception{
		ArrayList<User> list = new ArrayList<>();
		Session session = null;
        try {
            session = HibernateUtil.getSession();
            String queryStr = "select u from User u";
            Query query = session.createQuery(queryStr);
            list = (ArrayList<User>) query.list();
        } catch(Exception ex) {
            ex.printStackTrace();
            // handle exception here
        } finally {
            try {if(session != null) session.close();} catch(Exception ex) {}
        }
		return list;
	}
	
	//add new user to data
	public void addUser(User user) throws Exception {
		Session session = null;
        Transaction transaction = null;
        try {
            session = HibernateUtil.getSession();
            transaction = session.beginTransaction();
            session.save(user);
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
