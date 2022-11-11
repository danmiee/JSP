package servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/13Servlet/LifeCycle.do")
public class LifeCycle extends HttpServlet {
	
	// 서블릿을 사용하면 이 순서로 작동됨
	
	// 객체 생성 직후 - 어노테이션으로 최초 1회 작동, 메소드명 변경가능
	@PostConstruct
	public void myPostConstruct() {
		System.out.println("myPostConstruct() 호출");
	}
	
	// 서블릿 초기화 - 최초 1회 작동
	@Override
	public void init() throws ServletException {
		System.out.println("init() 호출");
	}
	
	// 요청 처리 메소드 선택 - 요청시마다 작동
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service() 호출");
		super.service(req, resp);
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doGet() 호출");
		req.getRequestDispatcher("/13Servlet/LifeCycle.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost() 호출");
		req.getRequestDispatcher("/13Servlet/LifeCycle.jsp").forward(req, resp);
	}
	
	// 서블릿 새로 컴파일되거나 서버 종료 시 호출
	@Override
	public void destroy() {
		System.out.println("destroy() 호출");
	}
	
	// 후처리 작업(WAS가 서블릿 객체 제거) - 어노테이션으로 1회 작동, 메소드명 변경가능
	@PreDestroy
	public void myPreDestroy() {
		System.out.println("myPreDestroy() 호출");
	}
}
