package edu;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class Test1 {

	// 파일에 데이터 작성
	public void write(String fname) {

		// 변수 선언
		FileOutputStream fos = null;

		try {
			// data 만들기
			fos = new FileOutputStream(fname);
			// abcd 작성 (write는 byte를 받아서 작성함)
			fos.write("abcd".getBytes());

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				// 완료되면 FileOutputStream 닫기
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("End");
	}

	// 파일을 읽어서 콘솔에 출력
	public void printdata(String fname) throws Exception {
		FileInputStream fis = new FileInputStream(fname);
		
		while (true) {
			// read에 매개변수 없으면 1byte만 읽음
			// int r = ASCII값으로 반환
			int r = fis.read();
			// 더이상 읽을 것이 없으면 -1 반환됨
			if (r == -1)
				break;
			System.out.print("r : " + r + " : ");
			System.out.println(Character.toChars(r));
		}
		fis.close();
	}

	public static void main(String[] args) {
		Test1 tt = new Test1();
		// tt.write("test.dat");
		try {
			tt.printdata("test.dat");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
