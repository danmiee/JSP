package pnusw18_test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class selectConn {
	private Connection con;
	private ResultSet rs;
	private CallableStatement cs;

	static Scanner sc = new Scanner(System.in);
	 	
	public selectConn() {
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
	
	public void SelectAll() {
		System.out.println("전체 조회");
		try {
			cs = con.prepareCall("{call SelectAll()}");
			rs = cs.executeQuery();
			while (rs.next()) {
				System.out.printf("(%s) %s / %s / %s / %s / %s / %s / %s\n", rs.getString(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void SelectStd() {
		System.out.println("학생번호로 성적 조회");
		System.out.print("조회할 학생번호: ");		int num = sc.nextInt();
		
		try {
			cs = con.prepareCall("{call SelectStd(?)}");
			cs.setInt(1, num);
			rs = cs.executeQuery();
			while (rs.next()) {
				System.out.printf("%s / %s\n", rs.getString(1), rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void SelectDep() {
		System.out.println("학과명으로 학생 조회");
		System.out.print("조회할 학과명: ");		String name = sc.next();
		
		try {
			cs = con.prepareCall("{call SelectDep(?)}");
			cs.setString(1, name);
			rs = cs.executeQuery();
			while (rs.next()) {
				System.out.printf("%s / %s\n", rs.getString(1), rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void SelectLec() {
		System.out.println("강좌명으로 수강생 조회");
		System.out.print("조회할 강좌명: ");		String name = sc.next();
		
		try {
			cs = con.prepareCall("{call SelectLec(?)}");
			cs.setString(1, name);
			rs = cs.executeQuery();
			while (rs.next()) {
				System.out.printf("%s / %s / %s\n", 
						rs.getString(1), rs.getString(2), rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void main(String args[]) {
		selectConn sel = new selectConn();
		int choice;
		while (true) {
			System.out.println("Press (1)SelectAll (2)SelectStd (3)SelectDep (4)SelectLec (5)Quit");
			choice = sc.nextInt();

			switch (choice) {
			case 1:
				sel.SelectAll();
				break;

			case 2:
				sel.SelectStd();
				break;

			case 3:
				sel.SelectDep();
				break;

			case 4:
				sel.SelectLec();
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
