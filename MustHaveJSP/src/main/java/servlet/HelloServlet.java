package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
// 어노테이션에 작성하는 경로는 web.xml에 작성하는 do 경로로 기재
@WebServlet("/13Servlet/HelloServlet.do")
public class HelloServlet extends HttpServlet {
	
	// <form> method 속성값으로 post, get, put, delete 사용하여 CRUD 가능
	// CRUD = PoGetPuD
	
	// Create (DB에서는 insert)
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost");
	}

	// Read
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("message", "Hello Servlet..!!");
		req.getRequestDispatcher("/13Servlet/HelloServlet.jsp").forward(req, resp);
		System.out.println("doGet");
	}
	
	// Update
	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPut");
	}
	
	// Delete
	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doDelete");
	}
}
