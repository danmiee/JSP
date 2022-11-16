package edu.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

// 파일 전송을 위한 설정 어노테이션
// jsp에서 form의 인코딩 타입(enctype) 이 multipart/form-data인 경우
// 이 어노테이션과 매칭되어 있어야 제대로 동작함.
@MultipartConfig (
		fileSizeThreshold = 1024*1024,		// 1M가 넘어가면 메모리가 아닌 디스크에 임시 저장
		maxFileSize = 1024*1024 * 5,		// 한번에 전달가능한 파일의 크기가 5M
		maxRequestSize = 1024*1024 * 5 * 5	// 최대 5개까지 전송 가능
)
@WebServlet("/uploadfile")
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 파일을 저장할 폴더를 확인하고 없으면 생성하는 메소드
	private void makeUploadFolder(String path) {
		File f = new File(path);
		
		// 경로가 없다면 생성
		if (!f.exists())	f.mkdirs();
	}
	
	// 1byte씩 읽어서 저장하는 예제 메서드
	private void saveFile1(Part part, String fname) throws IOException {
		InputStream is = part.getInputStream();
		FileOutputStream fos = new FileOutputStream(fname);
		
		int r;
		while((r = is.read()) != -1) {
			fos.write(r);
		}
		is.close();
		fos.close();
	}

	// nbyte씩 읽어서 저장하는 예제 메서드
	private void saveFile2(Part part, String fname) throws IOException {
		InputStream is = part.getInputStream();
		FileOutputStream fos = new FileOutputStream(fname);
		
		int rcnt;
		byte[] bytes = new byte[1024];
		while((rcnt = is.read(bytes)) != -1) {
			fos.write(bytes, 0, rcnt);
		}
		is.close();
		fos.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 한글처리
		req.setCharacterEncoding("UTF-8");
		
		// 파라미터 읽기
		String title = req.getParameter("title");
		System.out.println("title : " + title);

		// 실제 저장될 경로 설정
		String path = req.getServletContext().getRealPath("/upload");
		System.out.println("path : " + path);
		
		// upload 폴더가 없다면 생성
		makeUploadFolder(path);

		// JSP 결과뷰에 보낼 문자열을 저장하기 위한 임시 변수
		String saveFileNames = "";
		
		// request를 통해서 전달되어온 Part
		Collection<Part> parts = req.getParts();
		for (Part p : parts) {
			// 파일이 아니면 스킵, 파일이면 파일명 콘솔 화면에 출력
			if (!p.getName().equals("fname"))
				continue;
			else
				System.out.println("p:" + p.getSubmittedFileName());

			// 파일이 아니면 스킵, 파일이면 파일명 콘솔 화면에 출력
			if(!p.getName().equals("fname") || p.getSubmittedFileName().equals(""))
				continue;
			
			// Part와 저장할 파일명을 파라미터로 하는 메서드를 호출
			saveFile1(p, path + "/" + p.getSubmittedFileName());
//			saveFile2(p, path + File.separator + p.getSubmittedFileName());

			// JSP 결과뷰에 보낼 문자열을 저장
			if (saveFileNames.equals(""))	saveFileNames = p.getSubmittedFileName();
			else							saveFileNames += ("," + p.getSubmittedFileName());
		}
		
		// JSP 결과뷰에 보낼 문자열을 request 객체에 저장
		req.setAttribute("saveFileNames", saveFileNames);

		// 업로드 성공을 보이기 위한 뷰로 포워딩
		req.getRequestDispatcher("uploadSuccess.jsp").forward(req, resp);
	}
}
