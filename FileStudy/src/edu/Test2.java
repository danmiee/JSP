package edu;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

public class Test2 {

	public void writeObject(String fname) throws Exception {
		// 기본스트림
		FileOutputStream fos = new FileOutputStream(fname);
		// 보조스트림 (기본 스트림을 만든 후 사용 가능)
		ObjectOutputStream oos = new ObjectOutputStream(fos);

		for (int i = 10; i <= 20; i++) {
			Member m = new Member("홍길동" + i, i);
			oos.writeObject(m);
		}

		oos.close();
		fos.close();
	}

	public void printObject(String fname) throws Exception {
		FileInputStream fis = new FileInputStream(fname);
		ObjectInputStream ois = new ObjectInputStream(fis);

		for (int i = 10; i <= 20; i++) {
			Member m = (Member) ois.readObject();
			if(m == null)	break;
			System.out.println("print: " + m);
		}
		ois.close();
		fis.close();
	}

	public static void main(String[] args) throws Exception {
		Test2 tt = new Test2();
		tt.writeObject("testobj.dat");
		tt.printObject("testObj.dat");
		System.out.println("Done");
	}
}
