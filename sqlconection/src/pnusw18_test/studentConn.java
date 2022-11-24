package pnusw18_test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class studentConn {
	private Connection con;
	private ResultSet rs;
	private CallableStatement cs;

	static Scanner sc = new Scanner(System.in);
	 	
	public studentConn() {
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/pnusw18";
		String userid = "root";
		String pwd = "tiger";
		
		try {
			Class.forName(driver);
			System.out.println("드라이버 로드 성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			System.out.println("데이터베이스 연결 준비...");
			con = DriverManager.getConnection(url, userid, pwd);
			System.out.println("데이터베이스 연결 성공");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void StdInsert() {
		System.out.println("추가할 학생의 정보를 입력하세요.");
		System.out.print("번호: ");		int num = sc.nextInt();
		System.out.print("이름: ");		String name = sc.next();
		sc.nextLine();
		System.out.print("주소: ");		String address = sc.nextLine();
		System.out.print("학과: ");		String dpm = sc.next();
		
		try {
			cs = con.prepareCall("{call StdInsert(?,?,?,?)}");
			cs.setInt(1, num);
			cs.setString(2, name);
			cs.setString(3, address);
			cs.setString(4, dpm);
			cs.execute();
			System.out.println("Insert Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void StdUpdate() {
		System.out.println("수정할 학생의 정보를 입력하세요.");
		System.out.print("번호: ");		int num = sc.nextInt();
		System.out.print("이름: ");		String name = sc.next();
		sc.nextLine();
		System.out.print("주소: ");		String address = sc.nextLine();
		System.out.print("학과: ");		String dpm = sc.next();
		
		try {
			cs = con.prepareCall("{call StdUpdate(?,?,?,?)}");
			cs.setInt(1, num);
			cs.setString(2, name);
			cs.setString(3, address);
			cs.setString(4, dpm);
			cs.execute();
			System.out.println("Update Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void StdDelete() {
		System.out.println("삭제할 학생의 번호를 입력하세요.");
		int num = sc.nextInt();
		
		try {
			cs = con.prepareCall("{call StdDelete(?)}");
			cs.setInt(1, num);
			cs.execute();
			System.out.println("Delete Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void StdSelectAll() {
		System.out.println("전체 학생 조회");
		try {
			cs = con.prepareCall("{call StdSelectAll()}");
			rs = cs.executeQuery();
			while (rs.next()) {
				System.out.printf("(%s) %s / %s / %s\n", rs.getString(1), rs.getString(2), rs.getString(3),
						rs.getString(4));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void main(String args[]) {
		studentConn std = new studentConn();
		int choice;
		while (true) {
			System.out.println("Press (1)Insert (2)Update (3)Delete (4)SelectAll (5)Quit");
			choice = sc.nextInt();

			switch (choice) {
			case 1:
				std.StdInsert();
				break;

			case 2:
				std.StdUpdate();
				break;

			case 3:
				std.StdDelete();
				break;

			case 4:
				std.StdSelectAll();
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
