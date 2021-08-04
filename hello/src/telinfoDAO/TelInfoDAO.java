package telinfoDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import telinfoDBConn.TelInfoDBConn;
import telinfoVO.TelInfoVO;

public class TelInfoDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public TelInfoDAO() throws ClassNotFoundException, SQLException{
		con= new TelInfoDBConn().getConnection();
	}
	
	public ArrayList<TelInfoVO> getAllInfo() throws SQLException{
		ArrayList<TelInfoVO> tiarray=new ArrayList<TelInfoVO>();
		String sql="SELECT * FROM TelTable5 ORDER BY id";
		
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			int id=rs.getInt("id");
			String name=rs.getString("name");
			String tel=rs.getString("tel");
			Date d=rs.getDate("d");
			
			TelInfoVO tv=new TelInfoVO(id,name,tel,d);
			tiarray.add(tv);
	         //작업의 결과는 db에 있는 사원 3명을 꺼내 resultset이라는 종이박스에 넣고
	         //이것을 하나씩 꺼내서 객체로 만든다음 ArrayList <TelInfoVO>라는 컬렉션에
	         //3명 다 넣은것 (즉, db에 있는 사원명단을 메모리로 복사한 개념)

		}
		return tiarray;
	}
	
	
	public boolean insert_nametel(int id, String name, String tel, String sDate) {
	    String sql = "insert into TelTable5 values(?,?,?,?)";
	        try {
	            pstmt=con.prepareStatement(sql);
	            pstmt.setInt(1, id);
	            pstmt.setString(2, name);
	            pstmt.setString(3, tel);
	            
	            int year = Integer.parseInt(sDate.substring(0,4))-1900;
	            int month = Integer.parseInt(sDate.substring(4,6))-1;
	            int day = Integer.parseInt(sDate.substring(6,8));
	            Date d = new Date(year,month,day); //해당 년월일에 대한 날짜를 만들고
	            pstmt.setDate(4, d); //날짜로 입력 (즉, 문자로 넘어온 인자가 db에 날짜로 저장)
	            pstmt.executeUpdate();
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            System.out.println("insert Exception");
	            return false;
	         }
	         return true;
	   }
	
	
	public TelInfoVO search_nametel(String oriName) //홍길동
					throws SQLException{
		TelInfoVO tv=null;
		String sql="SELECT * FROM TelTable5 where name=?";
		// ? : 원하는 사람 이름
		pstmt =con.prepareStatement(sql);
		pstmt.setString(1,oriName);
		rs=pstmt.executeQuery();
		
		if(rs.next()) {
			int id=rs.getInt("id");
			String name=rs.getString("name");
			String tel=rs.getString("tel");
			Date d=rs.getDate("d");
			tv=new TelInfoVO(id,name,tel,d);
		
		}else {
			tv=null;
			}
		return tv;	   
	}
	
	
	
	public boolean delete_nametel(String name) {
	    String sql = "delete from TelTable5 where name=?";
	        try {
	            pstmt=con.prepareStatement(sql);
	            pstmt.setString(1, name);
	            pstmt.executeUpdate();
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            System.out.println("delete Exception");
	            return false;
	         }
	         return true;
	   }
	
	
	
	public boolean update_nametel(String tel2,String name2) {
	    String sql = "update TelTable5 set tel=? where name=?";
	        try {
	            pstmt=con.prepareStatement(sql);
	            pstmt.setString(1, tel2);
	            pstmt.setString(2, name2);
	            pstmt.executeUpdate();
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            System.out.println("update Exception");
	            return false;
	         }
	         return true;
	   }
	
	
}
