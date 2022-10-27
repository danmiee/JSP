package comm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class JdbcMain2 {

	// BoardDTO
//	private static List<BoardDTO> getData(ResultSet rs) throws SQLException {
//		List<BoardDTO> list = new ArrayList<>();
//		
//		// Collection 읽어오기
//		while(rs.next()) { 
//			list.add(new BoardDTO(rs.getInt("num"),
//					rs.getString("title"),
//					rs.getString("content")));
//		}
//		return list;
//	}
//
//	// print
//	private static void printData(List<BoardDTO> list) {
//		for (BoardDTO b : list) {
//			System.out.println(b.toString());
//		}
//	}

	// CityDTO
	private static List<CityDTO> getData(ResultSet rs) throws SQLException {
		List<CityDTO> list = new ArrayList<>();

		// Collection 읽어오기
		while (rs.next()) {
			list.add(new CityDTO(rs.getInt("id"), 
					rs.getString("name"), rs.getString("countrycode"),
					rs.getString("district"), rs.getInt("population")));
		}
		return list;
	}

	// print
	private static void printData(List<CityDTO> list) {
		for (CityDTO b : list) {
			System.out.println(b.toString());
		}
	}

	@SuppressWarnings("unused")
	public static void main(String[] args) throws SQLException, ClassNotFoundException {

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

		// BoardDTO
//		List<BoardDTO> list = null;
//		try {
//			list = getData(rs);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		printData(list);

		// CityDTO
		List<CityDTO> list = null;
		try {
			list = getData(rs);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 출력하기 전에 닫기!
		rs.close();
		st.close();
		con.close();

		printData(list);
	}

}
