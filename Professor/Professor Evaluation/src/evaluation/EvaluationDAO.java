package evaluation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EvaluationDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public EvaluationDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/ProfessorEvaluation?serverTimezone=Asia/Seoul&useSSL=false";
			String dbID = "root";
			String dbPassword = "4651";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int write(EvaluationDTO evaluationDTO) {
		PreparedStatement pstmt = null;
		
		try {
			String SQL = "INSERT INTO EVALUATION VALUES (NULL, ?, ?, ?, ? ,? ,? ,?);";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, evaluationDTO.getUserID().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(2, evaluationDTO.getProfessorName().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setInt(3, evaluationDTO.getLectureYear());
			pstmt.setString(4, evaluationDTO.getSemesterDivide().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(5, evaluationDTO.getEvaluationContent().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(6, evaluationDTO.getScore().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			pstmt.setString(7, evaluationDTO.getLectureDivide().replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\r\n", "<br>"));
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public ArrayList<EvaluationDTO> getList(String LectureDivide, String searchType, String search, int pageNumber){
		if(LectureDivide.equals("??????")) {
			LectureDivide = "";
		}
		ArrayList<EvaluationDTO> evaluationList = null;
		PreparedStatement pstmt = null;
		String SQL = "";
		try {
			if(searchType.equals("?????????")) {
				SQL = "SELECT * FROM EVALUATION WHERE Score LIKE ? AND CONCAT(professorName, evaluationContent)"
						+ "LIKE ? ORDER BY evaluationID DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			} else if(searchType.equals("?????????")) {
				SQL = "SELECT * FROM EVALUATION WHERE Score LIKE ? AND CONCAT(professorName, evaluationContent)"
						+ "LIKE ? ORDER BY likeCount DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			}
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + LectureDivide + "%");
			pstmt.setString(2, "%" + search + "%");
			rs = pstmt.executeQuery();
			evaluationList = new ArrayList<EvaluationDTO>();
			while(rs.next()) {
				EvaluationDTO evaluation = new EvaluationDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getInt(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7),
						rs.getString(8)
						);
				evaluationList.add(evaluation);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return evaluationList;
	}
	
	
	public int delete(String evaluationID) {
		PreparedStatement pstmt = null;
		try {
			String SQL = "DELETE FROM EVALUATION WHERE evaluationID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public String getUserID(String evaluationID) {
		PreparedStatement pstmt = null;
		try {
			String SQL = "SELECT userID FROM EVALUATION WHERE evaluationID = ?";
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				return rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
