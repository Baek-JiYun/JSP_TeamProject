package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dto.MovieMemberVO;

public class MovieMemberDAO {
	private ArrayList<MovieMemberVO> dtos;
	private Connection con;
	private Statement st;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public MovieMemberDAO() {
		dtos = new ArrayList<MovieMemberVO>();
		try {
			String user = "system";
			String pw = "1234";
			String url = "jdbc:oracle:thin:@cyzhsss.iptime.org:1521:XE";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection(url, user, pw);
			st = con.createStatement();
		} catch (Exception e) {
			System.out.println("데이터베이스 연결 오류:" + e.getMessage());
		}
	}

	public ArrayList<MovieMemberVO> getAllMembers() {
		dtos = new ArrayList<MovieMemberVO>();// dtos 초기화
		String SQL = "SELECT * FROM MovieMember"; // 전체회원조회
		try {
			rs = st.executeQuery(SQL);
			while (rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				int born = rs.getInt("born");
				MovieMemberVO VO = new MovieMemberVO(id, pw, born);
				dtos.add(VO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dtos;
	}

	public ArrayList<MovieMemberVO> insertMovieMembers(String id, String pw, int born) {
		String SQL = "INSERT INTO MovieMember (id,pw,born) values (?,?,?)";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setInt(3, born);
			pstmt.executeUpdate();
			System.out.println("가입 완료!");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dtos;
	}

	public ArrayList<MovieMemberVO> deleteMovieMembers(String id) {
		String SQL = "delete from MovieMember where id=? ";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dtos;
	}

	public ArrayList<MovieMemberVO> updateMovieMembers(String pw, int born, String id) {
		String SQL = "update MovieMember set pw=?,born=? where id=? ";
		try {
			pstmt = con.prepareStatement(SQL);			
			pstmt.setString(1, pw);
			pstmt.setInt(2, born);
			pstmt.setString(3, id);			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	public boolean memberSelect(String input_id,String input_pw){
		dtos = new ArrayList<MovieMemberVO>();// dtos 초기화
		//ArrayList<MemberDTO> dtoList=new ArrayList<MemberDTO>(); 
		PreparedStatement pstmt=null;
		//Statement stmt=null;
		ResultSet rs=null;
		String SQL="SELECT pw FROM MovieMember where id=?";
		
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, input_id);
			//stmt = con.createStatement();
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				String pw = rs.getString("pw");
				if(pw.equals(input_pw)==true) {
					return true;
				}
			}
		} catch(Exception e){
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	

}
