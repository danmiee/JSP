package sqlcon;

public class department {

	private String num;
	private String name;
	private String tel;
	
	public department() {
		super();
		// TODO Auto-generated constructor stub
	}

	public department(String num, String name, String tel) {
		super();
		this.num = num;
		this.name = name;
		this.tel = tel;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Override
	public String toString() {
		return "department [num=" + num + ", name=" + name + ", tel=" + tel + "]";
	}

}
