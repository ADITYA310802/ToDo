package com.Entities;

import java.util.Date;

import javax.persistence.Entity;

//import javax.persistence.Embeddable;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
//import java.util.Random;



@Entity
public class ToDo {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int TodoId;

	private String title;
	private String content;
	private Date dateAdded;

	public ToDo(String title, String content, Date dateAdded) {
		super();
		//this.TodoId= new Random().nextInt(10000);
		this.title = title;
		this.content = content;
		this.dateAdded = dateAdded;
	}
	
//	public int getTodoId() {
//		return TodoId;
//	}
//
//	public void setTodoId(int todoId) {
//		TodoId = todoId;
//	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return this.getTitle() + ":" + this.content + ":" + this.dateAdded;
	}

	public ToDo() {
		super();
		// TODO Auto-generated constructor stub
	}

}
