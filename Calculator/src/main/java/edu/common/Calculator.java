package edu.common;

import java.io.IOException;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("unused")
@WebServlet("/calc")
public class Calculator extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//TODO 사칙 연산을 수행하는 재귀 메소드
	static int calc(String input) { 
		int idx; 		
		idx = input.indexOf('+'); //TODO [+] 문자의 인덱스 위치 확인
		if (idx != -1) { //TODO [+] 문자가 있으니까 -1이 아니여야 함 (indexOf는 찾을려는 문자가 없으면 -1 반환)			
			return calc(input.substring(0, idx)) + calc(input.substring(idx + 1)); 
		} else { //TODO [+] 문자가 없을 경우는 [-], [*], [/] 연산자 포함 여부를 확인합니다
			idx = input.indexOf('-'); 
			if (idx != -1) { 
				return calc(input.substring(0, idx)) - calc(input.substring(idx + 1)); 
			} else {
				idx = input.indexOf('*'); 
				if (idx != -1) {
					return calc(input.substring(0, idx)) * calc(input.substring(idx + 1)); 
				} else { 
					idx = input.indexOf('/'); 
					if (idx != -1) 
						return calc(input.substring(0, idx)) / calc(input.substring(idx + 1));
				}
			}
		}
		
		String data = input.trim();  // trim : 공백제거
		if (data == null || data.isEmpty()) return 0;
		return Integer.parseInt(data); 
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		Cookie[] cookies = req.getCookies();

		String exp = "";
		if (cookies != null) {
			for (Cookie c : cookies) {
				if (c.getName().equals("exp")) {
					exp = c.getValue();
					break;
				}
			}
		}

		String value = req.getParameter("value");
		String operator = req.getParameter("operator");

		if (operator != null) {
			if (operator.equals("=")) {
				exp = String.valueOf(calc(exp));
			} else if (operator.equals("C")){
				exp = "0";
			} else {
				exp += (operator == null)?"":operator;
			}
		} else {
			if (value != null) {
				if (exp.length() <= 1 && exp.equals("0"))
					exp = value;
				else
					exp += value;
			} else {
				exp = "0";
			}
		}

		System.out.println("[calc]exp : " + exp);

		Cookie expCookie = new Cookie("exp", exp);

		resp.addCookie(expCookie);
		resp.sendRedirect("calc.jsp");
	}
}
