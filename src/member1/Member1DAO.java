package member1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class Member1DAO {

	public String getFname(String id) {
		String fname = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  select fname ");
		sql.append("  from member1 ");
		sql.append(" where id = ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				fname = rs.getString("fname");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return fname;

	}

	public boolean loginCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = (String) map.get("id");
		String passwd = (String) map.get("passwd");
		StringBuffer sql = new StringBuffer();
		sql.append("   select count(*)       ");
		sql.append("   from member1       ");
		sql.append("   where id = ?       ");
		sql.append("   and passwd = ?       ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				int cnt = rs.getInt(1);
				if (cnt > 0)
					flag = true;

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return flag;

	}

	public boolean delete(String id) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("   delete from member1       ");
		sql.append("    where id = ?      ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;

	}

	public boolean update(Member1DTO dto) {

		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update member1  ");
		sql.append("  set tel = ? , ");
		sql.append(" email = ? , zipcode = ? ,  ");
		sql.append(" address1 = ? , address2 = ?   ");
		sql.append("  where id = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTel());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getId());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;

	}

	public boolean updatePw(Map map) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		String passwd = (String) map.get("passwd");
		String id = (String) map.get("id");

		StringBuffer sql = new StringBuffer();
		sql.append(" update member1          ");
		sql.append("  set passwd = ?         ");
		sql.append("  where id = ?         ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, passwd);
			pstmt.setString(2, id);
			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;

	}

	public boolean updateFile(Map map) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		String fname = (String) map.get("fname");
		String id = (String) map.get("id");
		StringBuffer sql = new StringBuffer();
		sql.append(" update member1        ");
		sql.append("   set fname = ?      ");
		sql.append("    where id = ?     ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setString(2, id);

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}
	
	public Member1DTO read(String id){
		Member1DTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  select *      ");
		sql.append("  from member1      ");
		sql.append("  where id = ?      ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new Member1DTO();
				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setZipcode(rs.getString("zipcode"));
				dto.setFname(rs.getString("fname"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return dto;
		
	}

	public boolean create(Member1DTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append("      insert into member1(id,passwd,mname,tel,              ");
		sql.append("     email,zipcode,address1,address2,fname)               ");
		sql.append("     values(?,?,?,?,?,?,?,?,?)               ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getMname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getFname());
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0)flag= true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(pstmt, con);
			
		}
		return flag;
	}
	
	public boolean duplicateEmail(String email){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append("  select(email) as cnt   ");
		sql.append("   from member1   ");
		sql.append("   where email=?  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			
			rs =pstmt.executeQuery();
			
			rs.next();
			
			int cnt = rs.getInt("cnt");
			if(cnt>0)flag =true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return flag;
	}
	
	public boolean duplicateId(String id){

		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  select count(id) as cnt    ");
		sql.append("  from member1 where id = ?    ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			int cnt = rs.getInt("cnt");
					
					if(cnt>0)flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return flag;
		
		
		
	}
	
	public List<Member1DTO> list(Map map){
		List<Member1DTO> list = new ArrayList<Member1DTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno =(Integer)map.get("sno");
		int eno =(Integer)map.get("eno");
		
		StringBuffer sql = new StringBuffer();
		sql.append("   select id,mname,tel,email,fname,r      ");
		sql.append("  from(         ");
		sql.append("    select id,mname,tel,,email,fname  ,rownum as r     ");
		sql.append("     from(      ");
		sql.append("      select id,mname,tel,email, fname    ");
		sql.append("      from member1     ");
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%' )  ");
		sql.append("    )where r >= ? and r<=?       ");
		
		
		try {
			int i = 0;
			pstmt =con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(++i, word);
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Member1DTO dto = new Member1DTO();
				dto.setId(rs.getString("id"));
				dto.setMname(rs.getString("mname"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setFname(rs.getString("fname"));
				list.add(dto);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return list;
		
		
		
	}
	public int total(Map map) {

		int total = 0;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		StringBuffer sql = new StringBuffer();

		sql.append(" select count(*) ");
		sql.append(" from member1 ");
		if (word.trim().length() > 0)
			sql.append(" where " + col + " like '%'||?||'%'");

		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0) 
				pstmt.setString(1, word);

			rs = pstmt.executeQuery();

			rs.next();

			total = rs.getInt(1); 

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return total;

	}

}
