package model;

import java.time.LocalDateTime;

public class Post {
	int id;
	String title;
	String description;
	String content;
	LocalDateTime time;
	String author;
	public Post(int id, String title, String description, String content, LocalDateTime time, String author) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.content = content;
		this.time = time;
		this.author = author;
	}
	public Post(String title, String description, String content, LocalDateTime time, String author) {
		super();
		this.title = title;
		this.description = description;
		this.content = content;
		this.time = time;
		this.author = author;
	}
	public Post() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public LocalDateTime getTime() {
		return time;
	}
	public void setTime(LocalDateTime time) {
		this.time = time;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
}
