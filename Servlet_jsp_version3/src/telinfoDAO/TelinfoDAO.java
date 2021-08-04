package telinfoDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import telinfoDBConn.TelinfoDBConn;
import telinfoVO.TelinfoVO;

public class TelinfoDAO {

	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public TelinfoDAO() throws ClassNotFoundException, SQLException {
		con = new TelinfoDBConn().getConnection();
	}
	
	
	
	//전체검색 
	public ArrayList<TelinfoVO> getAllInfo() throws SQLException{
		ArrayList<TelinfoVO> tiarray = new ArrayList<TelinfoVO>();
		String sql = "select * from teltable5 order by id";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int id = rs.getInt(1);//컬럼명, 순번, alias 
			String name = rs.getString(2);
			String tel = rs.getString(3);
			Date d = rs.getDate(4);
	
			TelinfoVO tv = new TelinfoVO(id,name,tel,d);
			tiarray.add(tv);
		}
		return tiarray;
	}
	
	//새로운 전화번호 및 수정대상 이름은 jsp로부터 온다 
	public boolean update_nametel
	            (int id1,String name1, String tel1, String d1, String name2){
	//public boolean update_nametel(String tel1,String name2){
		//수정은 이름조건에 대하여 전화번호만 수정, 그리고 DB테이블로 저장
         String sql	
         ="update teltable5 set id=?, name=?, tel=?, D=TO_DATE(?,'YYYY-MM-DD') where name=?";
		//String sql = "update teltable5 set tel=? where name=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id1);
			pstmt.setString(2, name1);
			pstmt.setString(3, tel1);
			pstmt.setString(4, d1);
			pstmt.setString(5, name2);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("update Exception");
			return false;
		}
		return true;
	}
	//한명검색 
	public TelinfoVO getInfo(String name1) throws SQLException {
		TelinfoVO tv = null;
		String sql = "select * from teltable5 where name = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, name1);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			int id = rs.getInt(1);
			String name = rs.getString(2);
			String tel = rs.getString(3);
			Date d = rs.getDate(4);
			tv = new TelinfoVO(id,name,tel,d);
		}else {
			tv = null;
		}
		return tv;
	}
	
	//한명입력
	public boolean insertInfo(int id, String name, String tel, String d) {
		String sql = "insert into teltable5 values (?,?,?,TO_DATE(?,'YYYY-MM-DD'))";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, tel);
			pstmt.setString(4,d);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("insert Exception");
			return false;
		}
		return true;
	}
	
	//한명 삭제 
	public boolean deleteInfo(String name) {
		String sql = "delete from teltable5 where name = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}
	
	public ArrayList<String> selectName() throws SQLException{
		ArrayList<String> narray = new ArrayList<String>();
		String sql = "select name from teltable5 order by id";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			String name = rs.getString(1);
			narray.add(name);
		}
		return narray;
	}
	
}
