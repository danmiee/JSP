package edu;

import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Test3 {

	public void copyfile(String sourceName, String destName) throws Exception {
		FileInputStream fis = new FileInputStream(sourceName);
		FileOutputStream fos = new FileOutputStream(destName);

		// fis에서 하나씩 읽어서 fos에 작성
		int r;
		while ((r = fis.read()) != -1) {
			fos.write((char) r);
		}
		fos.close();
		fis.close();
	}

	public static void main(String[] args) throws Exception {

		Test3 tt = new Test3();

		tt.copyfile("testobj.dat", "destobj.dat");

		System.out.println("Done");
	}
}
