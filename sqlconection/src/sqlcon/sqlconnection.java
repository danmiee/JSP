package sqlcon;

import java.sql.*;
import java.util.Scanner;

// SQL 관련 클래스는 java.sql .*에 포함되어 있다.
public class sqlconnection {
	Connection con;
	Scanner scan;
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

	public void insertQuery() {
		scan = new Scanner(System.in);
		System.out.println("추가할 학과번호, 학과명, 전화번호를 입력하세요.");
		String num = scan.next();
		String name = scan.next();
		String tel = scan.next();
		department newone = new department(num, name, tel);
		
//		String query = "INSERT INTO 학과sqlconTest(학과번호, 학과명, 전화번호) VALUES (?,?,?)"; /* SQL 문 */
		try {
//			PreparedStatement ps = con.prepareCall(query);
//			ps.setInt(1, newone.getNum());
//			ps.setString(2, newone.getName());
//			ps.setString(3, newone.getTel());
//			ps.executeUpdate();
			CallableStatement cs = con.prepareCall("{call 학과insert(?,?,?)}");
			cs.setString(1, newone.getNum());
			cs.setString(2, newone.getName());
			cs.setString(3, newone.getTel());
			cs.execute();
			System.out.println("insert: " + newone);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateQuery() {
		scan = new Scanner(System.in);
		System.out.println("수정할 학과번호, 학과명, 전화번호를 입력하세요.");
		String num = scan.next();
		String name = scan.next();
		String tel = scan.next();
		department newone = new department(num, name, tel);

//		String query = "UPDATE 학과sqlconTest set 학과명=?, 전화번호=? WHERE 학과번호=?";
		try {
//			PreparedStatement ps = con.prepareStatement(query);
//			ps.setString(1, newone.getName());
//			ps.setString(2, newone.getTel());
//			ps.setString(3, newone.getNum());
//			ps.executeUpdate();
			CallableStatement cs = con.prepareCall("{call 학과update(?,?,?)}");
			cs.setString(1, newone.getNum());
			cs.setString(2, newone.getName());
			cs.setString(3, newone.getTel());
			cs.execute();
			System.out.println("Update: " + newone);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteQuery() {
		scan = new Scanner(System.in);
		System.out.println("삭제할 학과번호를 입력하세요.");
		String num = scan.next();
//		String query = "DELETE FROM 학과sqlconTest where 학과번호=?"; /* SQL 문 */
		try {
//			PreparedStatement ps = con.prepareCall(query);
//			ps.setInt(1, num);
//			ps.executeUpdate();
			CallableStatement cs = con.prepareCall("{call 학과delete(?)}");
			cs.setString(1, num);
			cs.execute();
			System.out.println("delete: " + num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 접속 객체 con을 DriverManager.getConnection 함수로 생성한다.
	// 접속이 성공하면 "데이터베이스 연결 성공"을 출력하도록 한다.
	// 문자열 query에 수행할 SQL 문을 입력한다.
	private void selectQuery() {
		String query = "SELECT * FROM 학과sqlconTest"; /* SQL 문 */
		try { /* 데이터베이스에 질의 결과를 가져오는 과정 */
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				System.out.print("\t" + rs.getInt(1));
				System.out.print("\t" + rs.getString(2));
				System.out.println("\t" + rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String args[]) {
		sqlconnection sc = new sqlconnection();
		Scanner scan = new Scanner(System.in);
		int choice;
		while (true) {
			System.out.println("Press (1)Insert (2)Update (3)Delete (4)Select (5)Quit");
			choice = scan.nextInt();

			if (choice == 5)
				break;

			switch (choice) {
			case 1:
				sc.insertQuery();
				break;

			case 2:
				sc.updateQuery();
				break;

			case 3:
				sc.deleteQuery();
				break;

			case 4:
				sc.selectQuery();
				break;
			case 5:
				System.out.println("프로그램 종료");
				break;
			default:
				System.out.println("잘못된 선택입니다.");
				break;
			}
		}
		scan.close();
	}
}