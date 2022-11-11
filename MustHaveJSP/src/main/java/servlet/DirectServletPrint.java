package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/13Servlet/DirectServletPrint.do")
public class DirectServletPrint extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter writer = resp.getWriter();
		
		writer.println("<%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\"");
        writer.println("pageEncoding=\"UTF-8\"%>");
        writer.println("<!DOCTYPE html>");
        writer.println("<html>");
        writer.println("<head>");
       	writer.println("<meta charset=\"UTF-8\">");
       	writer.println("<title>DirectServletPrint.jsp</title>");
       	writer.println("</head>");
       	writer.println("<body>");
       	writer.println("<h2>어노테이션으로 매핑하여 Servlet에서 직접 출력하기</h2>");
       	writer.println("<form method=\"post\" action=\"../13Servlet/DirectServletPrint.do\">");
       	writer.println("<input type=\"submit\" value=\"바로가기\" />");
       	writer.println("</form>");
       	writer.println("</body>");
       	writer.println("</html>");
	}
	
}
