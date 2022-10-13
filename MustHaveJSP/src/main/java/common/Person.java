package common;

public class Person {
	
//	필드 정의
	private String name;
	private int age;
	
//	기본 생성자
	public Person() {}
	
//	매개변수 생성자
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

//	게터세터
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

}
