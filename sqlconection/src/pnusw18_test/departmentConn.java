package pnusw18_test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

public class departmentConn {
	private Connection con;
	private ResultSet rs;
	private CallableStatement cs;

	static Scanner sc = new Scanner(System.in);

	public departmentConn() {
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

	public void DpmInsert() {
		System.out.println("추가할 학과의 정보를 입력하세요.");
		System.out.print("학과명: ");
		String name = sc.next();
		System.out.print("학과사무실: ");
		String room = sc.next();

		try {
			cs = con.prepareCall("{call DpmInsert(?,?)}");
			cs.setString(1, name);
			cs.setString(2, room);
			cs.execute();
			System.out.println("Insert Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void DpmUpdate() {
		System.out.println("수정할 학과의 정보를 입력하세요.");
		System.out.print("학과명: ");
		String name = sc.next();
		System.out.print("학과사무실: ");
		String room = sc.next();

		try {
			cs = con.prepareCall("{call DpmUpdate(?,?)}");
			cs.setString(1, room);
			cs.setString(2, name);
			cs.execute();
			System.out.println("Update Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void DpmDelete() {
		System.out.println("삭제할 학과명을 입력하세요.");
		String name = sc.next();

		try {
			cs = con.prepareCall("{call DpmDelete(?)}");
			cs.setString(1, name);
			cs.execute();
			System.out.println("Delete Success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void DpmSelectAll() {
		System.out.println("전체 학과 조회");
		try {
			cs = con.prepareCall("{call DpmSelectAll()}");
			rs = cs.executeQuery();
			while (rs.next()) {
				System.out.printf("%s(%s)\n", rs.getString(1), rs.getString(2));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void main(String args[]) {
		departmentConn dc = new departmentConn();
		int choice;
		while (true) {
			System.out.println("Press (1)Insert (2)Update (3)Delete (4)SelectAll (5)Quit");
			choice = sc.nextInt();

			if (choice == 5)
				break;

			switch (choice) {
			case 1:
				dc.DpmInsert();
				break;

			case 2:
				dc.DpmUpdate();
				break;

			case 3:
				dc.DpmDelete();
				break;

			case 4:
				dc.DpmSelectAll();
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
