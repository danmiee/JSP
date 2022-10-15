package edu.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("unused")
@WebServlet("/calc3")
public class Calculator3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String value = req.getParameter("exp");

		String result = String.valueOf(Calculator.calc(value));

		System.out.println("[calc3]exp : " + value);
		System.out.println("[calc3]result : " + result);

		HttpSession session = req.getSession();
		session.setAttribute("exp", result);

		resp.sendRedirect("calc3.jsp");
	}
}
