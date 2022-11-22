package pnusw18_test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class lectureConn {
	private Connection con;
	private ResultSet rs;
	private CallableStatement cs;

	static Scanner sc = new Scanner(System.in);

	public lectureConn() {
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

	public void LecInsert() {
		System.out.println("추가할 강좌 정보를 입력하세요");
		System.out.print("강좌명: ");		String name = sc.next();
		System.out.print("강의실: ");		String room = sc.next();

		try {
			CallableStatement cs = con.prepareCall("{call LecInsert(?,?)}");
			cs.setString(1, name);
			cs.setString(2, room);
			cs.execute();
			System.out.println("Insert Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void LecUpdate() {
		System.out.println("수정할 강좌 정보를 입력하세요");
		System.out.print("강좌명: ");		String name = sc.next();
		System.out.print("강의실: ");		String room = sc.next();

		try {
			CallableStatement cs = con.prepareCall("{call LecUpdate(?,?)}");
			cs.setString(1, name);
			cs.setString(2, room);
			cs.execute();
			System.out.println("Update Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void LecDelete() {
		System.out.println("삭제할 강좌명을 입력하세요");
		System.out.print("강좌명: ");		String name = sc.next();

		try {
			CallableStatement cs = con.prepareCall("{call LecDelete(?)}");
			cs.setString(1, name);
			cs.execute();
			System.out.println("Delete Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void LecSelectAll() {
		System.out.println("전체 강좌 조회");

		try {
			cs = con.prepareCall("{call LecSelectAll()}");
			rs = cs.executeQuery();
			while (rs.next()) {
				System.out.printf("%s(%s)\n", rs.getString(1), rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void main(String args[]) {
		lectureConn lec = new lectureConn();
		int choice;
		while (true) {
			System.out.println("Press (1)Insert (2)Update (3)Delete (4)SelectAll (5)Quit");
			choice = sc.nextInt();

			if (choice == 5)
				break;

			switch (choice) {
			case 1:
				lec.LecInsert();
				break;

			case 2:
				lec.LecUpdate();
				break;

			case 3:
				lec.LecDelete();
				break;

			case 4:
				lec.LecSelectAll();
				break;
			case 5:
				System.out.println("프로그램 종료");
				break;
			default:
				System.out.println("잘못된 선택입니다.");
				break;
			}
		}
		sc.close();
	}
}
