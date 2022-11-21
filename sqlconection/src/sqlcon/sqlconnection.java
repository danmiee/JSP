package sqlcon;

import java.sql.*;
import java.util.Scanner;

// SQL 관련 클래스는 java.sql .*에 포함되어 있다.
public class sqlconnection {
	static Connection con;

// 클래스 list를 선언한다. java.sql의 Connection 객체 con을 선언한다.  	
	public sqlconnection() {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://10.125.121.242:3306/pnusw18db";
		String userid = "pnusw18";
		String pwd = "pnusw18";
// 접속변수를 초기화한다. url은 자바 드라이버 이름, 호스트명(localhost), 포트번호를 입력한다
// userid는 관리자, pwd는 사용자의 비밀번호를 입력한다.    
		try { /* 드라이버를 찾는 과정 */
			Class.forName(driver);
			System.out.println("드라이버 로드 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
// Class.forName()으로 드라이버를 로딩한다. 드라이버 이름을 Class.forName에 입력한다.      
		try { /* 데이터베이스를 연결하는 과정 */
			System.out.println("데이터베이스 연결 준비...");
			con = DriverManager.getConnection(url, userid, pwd);
			System.out.println("데이터베이스 연결 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

// 접속 객체 con을 DriverManager.getConnection 함수로 생성한다. 
// 접속이 성공하면 "데이터베이스 연결 성공"을 출력하도록 한다.  
// 문자열 query에 수행할 SQL 문을 입력한다.
	private void selectQuery() {
		String query = "SELECT * FROM testcon"; /* SQL 문 */
		try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			System.out.println("select");
			while (rs.next()) {
				System.out.print("\t" + rs.getInt(1));
				System.out.print("\t" + rs.getString(2));
				System.out.print("\t" + rs.getString(3));
				System.out.print("\t" + rs.getInt(5));
				System.out.println("\t" + rs.getInt(6));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void insertQuery(buytbl newone) {
		String query = "INSERT INTO testcon(userId, prodName, price, amount) VALUES (?,?,?,?)"; /* SQL 문 */
		PreparedStatement ps;
		try {
			ps = con.prepareCall(query);
			ps.setString(1, newone.getUserId());
			ps.setString(2, newone.getProdName());
			ps.setInt(3, newone.getPrice());
			ps.setInt(4, newone.getAmount());
			ps.executeUpdate();
			System.out.println("insert");
			System.out.println(newone);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void deleteQuery(int num) {
		String query = "DELETE FROM testcon where num=?"; /* SQL 문 */
		try {
			PreparedStatement ps = con.prepareCall(query);
			ps.setInt(1, num);
			ps.executeUpdate();
			System.out.println("deleted: " + num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void updateQuery(buytbl newone) {
		String query = "UPDATE testcon set userID=?, prodName=?, price=?, amount=? where num=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, newone.getUserId());
			ps.setString(2, newone.getProdName());
			ps.setInt(3, newone.getPrice());
			ps.setInt(4, newone.getAmount());
			ps.setInt(5, newone.getNum());
			ps.executeUpdate();
			System.out.println("Updated: " + newone);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String args[]) {
		sqlconnection sc = new sqlconnection();
		Scanner scan = new Scanner(System.in);
		
		while(true) {
			System.out.println("Press (1)Insert (2)SelectAll (3)Update (4)Delete (0)Quit");
			int select = scan.nextInt();
			if(select==0)
				break;
			
			int num;
			String userId;
			String prodName;
			int price;
			int amount;

			switch (select) {
			case 1:
				System.out.println("Write to insert userId, prodName, price, amount");
				userId = scan.next();
				prodName = scan.next();
				price = scan.nextInt();
				amount = scan.nextInt();
				buytbl new1 = new buytbl(userId, prodName, price, amount);
				insertQuery(new1);
				break;

			case 2:
				sc.selectQuery();
				break;

			case 3:
				System.out.println("Write to update num, userId, prodName, price, amount");
				num = scan.nextInt();
				userId = scan.next();
				prodName = scan.next();
				price = scan.nextInt();
				amount = scan.nextInt();
				buytbl new2 = new buytbl(num, userId, prodName, price, amount);
				updateQuery(new2);
				break;

			case 4:
				System.out.println("Write to delete num");
				num = scan.nextInt();
				deleteQuery(num);
				break;

			}
		}
		scan.close();
	}
}