package pnusw18_test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class listConn {
	private Connection con;
	private ResultSet rs;
	private CallableStatement cs;

	static Scanner sc = new Scanner(System.in);
		
	public listConn() {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/pnusw18";
		String userid = "root";
		String pwd = "tiger";
		
		try { /* 드라이버를 찾는 과정 */
			Class.forName(driver);
			System.out.println("드라이버 로드 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try { /* 데이터베이스를 연결하는 과정 */
			System.out.println("데이터베이스 연결 준비...");
			con = DriverManager.getConnection(url, userid, pwd);
			System.out.println("데이터베이스 연결 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void ListInsert() {
		System.out.println("추가할 정보를 입력하세요");
		System.out.print("학생번호: ");	int num = sc.nextInt();
		System.out.print("강좌명: ");		String name = sc.next();
		System.out.print("성적: ");		Double score = sc.nextDouble();

		try {
			cs = con.prepareCall("{call ListInsert(?,?,?)}");
			cs.setInt(1, num);
			cs.setString(2, name);
			cs.setDouble(3, score);
			cs.execute();
			System.out.println("Insert Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void ListUpdate() {
		System.out.println("수정할 정보를 입력하세요");
		System.out.print("학생번호: ");	int num = sc.nextInt();
		System.out.print("강좌명: ");		String name = sc.next();
		System.out.print("성적: ");		Double score = sc.nextDouble();

		try {
			cs = con.prepareCall("{call ListUpdate(?,?,?)}");
			cs.setInt(1, num);
			cs.setString(2, name);
			cs.setDouble(3, score);
			cs.execute();
			System.out.println("Update Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void ListDelete() {
		System.out.println("삭제할 정보를 입력하세요");
		System.out.print("학생번호: ");	int num = sc.nextInt();
		System.out.print("강좌명: ");		String name = sc.next();
		
		try {
			cs = con.prepareCall("{call ListDelete(?,?)}");
			cs.setInt(1, num);
			cs.setString(2, name);
			cs.execute();
			System.out.println("Delete Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void ListSelectAll() {
		System.out.println("전체 수강 조회");

		try {
			cs = con.prepareCall("{call ListSelectAll()}");
			rs = cs.executeQuery();
			while (rs.next()) {
				System.out.printf("%s / %s / %.1f\n", rs.getString(1), rs.getString(2), rs.getDouble(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void main(String args[]) {
		listConn lic = new listConn();
		int choice;
		while (true) {
			System.out.println("Press (1)Insert (2)Update (3)Delete (4)SelectAll (5)Quit");
			choice = sc.nextInt();

			switch (choice) {
			case 1:
				lic.ListInsert();
				break;
			case 2:
				lic.ListUpdate();
				break;
			case 3:
				lic.ListDelete();
				break;
			case 4:
				lic.ListSelectAll();
				break;
			case 5:
				mainConn.main(args);
				break;
			default:
				System.out.println("잘못된 선택입니다.");
				break;
			}
		}
	}
}
