package comm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcMain {

	public static void main(String[] args) throws SQLException, ClassNotFoundException {
		
		String driver = "com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/musthave";
		String sql = "select * from board";
		
		
		
		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, "musthave", "tiger");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
		while(rs.next()) {
			System.out.printf("%d\t%s\t%s\t%s\n", 
					rs.getInt("num"), rs.getString("title"), rs.getString("content"), rs.getString("id"));
		}
		
		// 에러발생 > 다시해보기
//		String sql2 = "select * from contury";
//		ResultSet rs2 = st.executeQuery(sql2);
//		while(rs.next()) {
//			System.out.println(rs2.getString("code"));
//		}
		
		rs.close();
		st.close();
		con.close();
	}
}
