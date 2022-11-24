package pnusw18_test;

import java.util.Scanner;

public class mainConn {

	public static void main(String[] args) {
		int choice;

		while (true) {
			System.out.println("작업내용 선택 (1)조회 (2)학과CRUD (3)학생CRUD (4)강좌CRUD (5)성적CRUD (6)종료");
			Scanner sc = new Scanner(System.in);
			choice = sc.nextInt();

			switch (choice) {
			case 1:
				selectConn.main(args);
				break;
			case 2:
				departmentConn.main(args);
				break;
			case 3:
				studentConn.main(args);
				break;
			case 4:
				lectureConn.main(args);
				break;
			case 5:
				listConn.main(args);
				break;
			case 6:
				System.out.println("프로그램 종료");
				System.exit(0);
				break;
			default:
				System.out.println("잘못된 선택입니다.");
				break;
			}
			sc.close();
		}
	}

}
