package edu;

import java.io.Serializable;

public class Member implements Serializable {
	private static final long serialVersionUID = 1L;

	private String name;
	private int age;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Member(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	@Override
	public String toString() {
		return "Member [name=" + name + ", age=" + age + "]";
	}
	
	public static void main(String[] args) {
		
	}
	
}
