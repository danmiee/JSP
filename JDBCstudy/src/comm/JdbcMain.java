package comm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

public class JdbcMain {

	@SuppressWarnings("unused")
	public static void main(String[] args) throws SQLException, ClassNotFoundException {

		// driver 위치 확인
		String driver = "com.mysql.cj.jdbc.Driver";
		
		String url = "jdbc:mysql://localhost:3306/world";
		String sql = "select * from city";

		// driver load
		Class.forName(driver);
		// getConnection(url, user, password)
		Connection con = DriverManager.getConnection(url, "musthave", "tiger");
		// Statement : query 전송하는 객체
		Statement st = con.createStatement();
		// executeQuery : 데이터를 가져옴
		ResultSet rs = st.executeQuery(sql);

		// 날짜 출력 포맷 정의
		// yyyy/MM/dd hh:mm:ss
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		// 숫자 출력 포맷 정의
		DecimalFormat df = new DecimalFormat("##,###.##");

		// world - countrylanguage 데이터
//		while(rs.next()) {
//			System.out.println(String.format("%s|%s|%s|%d",
//					rs.getString("countrycode"),
//					rs.getString("language"),
//					rs.getString("isofficial"),
//					rs.getInt("percentage")
//					));
//		}

		// world - city 데이터
		while(rs.next()) {
		System.out.println(String.format("%d|%s|%s|%s|%s",
		rs.getInt("ID"),
		rs.getString("name"),
		rs.getString("countrycode"),
		rs.getString("district"),
		df.format(rs.getInt("population"))
		));
}

		// world - country 데이터
//		while(rs.next()) {
//			System.out.println(String.format("%s|%s|%s|%s|%d|%d|%s|%s|%s", 
//					rs.getString("code"),
//					rs.getString("name"), 
//					rs.getString("continent"), 
//					// format return값은  String!!
//					df.format(rs.getInt("surfacearea")), 
//					rs.getInt("indepyear"),
//					rs.getInt("population"),
//					df.format(rs.getInt("gnp")),
//					rs.getString("localname"), 
//					rs.getString("headofstate")
//					));
//		}

		// musthave 데이터
//		while(rs.next()) {
//			System.out.println(String.format("%d|%s|%s|%s|%s|%s", 
//					rs.getInt("num"),
//					rs.getString("title"), 
//					rs.getString("content"), 
//					rs.getString("id"), 
//					sf.format(rs.getDate("postdate")),
//					df.format(rs.getInt("visitcount"))
//					));
//			
//			System.out.printf("%d\t%s\t%s\t%s\n", 
//					rs.getInt("num"), rs.getString("title"), rs.getString("content"), rs.getString("id"));
//		}
		
		rs.close();
		st.close();
		con.close();

	}

}
