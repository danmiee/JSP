package edu.common;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/calc2")
public class Calculator2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String value = req.getParameter("exp");

		String result = String.valueOf(Calculator.calc(value));

		System.out.println("[calc2]exp : " + value);
		System.out.println("[calc2]result : " + result);

		Cookie expCookie = new Cookie("exp", result);

		resp.addCookie(expCookie);
		resp.sendRedirect("calc2.jsp");
	}
}
