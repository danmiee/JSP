package sqlcon;

public class buytbl {

	private int num;
	private String userId;
	private String prodName;
	private int price;
	private int amount;

	public buytbl() {
		super();
		// TODO Auto-generated constructor stub
	}
	public buytbl(String userId, String prodName, int price, int amount) {
		super();
		this.userId = userId;
		this.prodName = prodName;
		this.price = price;
		this.amount = amount;
	}
	public buytbl(int num, String userId, String prodName, int price, int amount) {
		super();
		this.num = num;
		this.userId = userId;
		this.prodName = prodName;
		this.price = price;
		this.amount = amount;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "(" + num + ", " + userId + ", " + prodName + ", " + price + ", " + amount + ")";
	}
}
