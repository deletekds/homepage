package memo1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class Memo1DAO {
	public int total(Map map){
		int total = 0;
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append("       SELECT count(*)  ");
		sql.append("       FROM memo1   ");
		
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%'  ");
		
		try {
			
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(1, word);
			
			
			rs = pstmt.executeQuery();
			
			rs.next();
			total = rs.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs,pstmt,con);
		}
		
		
		
		
		
		return total;
		
		
	}
	
	public boolean getRefnum(int memono){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select count(*) ");
		sql.append("  from memo1 where refnum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			if(cnt > 0) flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		
		return flag;
	}
	
	public boolean replyCreate(Memo1DTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" insert into memo1(memono,title,content,wdate,grpno,indent,ansnum,refnum) ");
		sql.append(" values(memo_seq.nextval,?,?,sysdate, ");
		sql.append(" ?,?,?,?) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getGrpno()); 
			pstmt.setInt(4, dto.getIndent()+1); 
			pstmt.setInt(5, dto.getAnsnum()+1);
			pstmt.setInt(6, dto.getMemono());
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	public void upAnsnum(Map map){
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" update memo1 ");
	 	sql.append(" set ansnum = ansnum + 1 ");
	 	sql.append(" where grpno = ? and ansnum > ? ");
	 	
	 	int grpno = (Integer)map.get("grpno");
	 	int ansnum = (Integer)map.get("ansnum");
	 	try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
		 	pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
	}
	
	public Memo1DTO replyRead(int memono){
		Memo1DTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select memono,title,grpno,indent,ansnum ");
		sql.append("  from memo1 where memono = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new Memo1DTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setTitle(rs.getString("title"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}
	
	public List<Memo1DTO> list(Map map){
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		int sno =(Integer)map.get("sno");
		int eno =(Integer)map.get("eno");
		List<Memo1DTO> list = new ArrayList<Memo1DTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  SELECT memono, title, wdate, viewcnt ,  ");
		sql.append("  grpno ,indent ,ansnum, r  ");
		sql.append("  from(  ");
		sql.append("        SELECT memono, title, wdate, viewcnt ,  ");
		sql.append("        grpno ,indent ,ansnum, rownum as r  ");
		sql.append("        from(  ");
		sql.append("            SELECT memono, title, wdate, viewcnt ,  ");
		sql.append("            grpno ,indent ,ansnum ");
		sql.append("            FROM memo1   ");
		
		
		
		if(word.trim().length()>0)
			sql.append(" where "+col+" like '%'||?||'%'  ");
		sql.append("  order by grpno DESC, ansnum asc  ");
		sql.append("  ) ");
		sql.append("  )where r>=? and r<=?  ");
		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(++i, word);
			
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Memo1DTO dto = new Memo1DTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setTitle(rs.getString("title"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs,pstmt,con);
		}
		return list;
	}
	public void upViewcnt(int memono){
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" update memo1 ");
	 	sql.append(" set viewcnt = viewcnt + 1 ");
	 	sql.append(" where memono = ? ");
	 	
	 	try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
		 	pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
	}
	
	public Memo1DTO read(int memono) {
		Memo1DTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" select memono,title,content, ");
		sql.append(" to_char(wdate,'yyyy-mm-dd') wdate,viewcnt from memo where memono = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new Memo1DTO();
				dto.setMemono(rs.getInt("memono"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWdate(rs.getString("wdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}
	public boolean create(Memo1DTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" insert into memo1(memono,title,content,wdate,grpno) ");
		sql.append(" values(memo_seq.nextval,?,?,sysdate, ");
		sql.append(" (select nvl(max(grpno),0)+1 from memo1)) ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	public boolean update(Memo1DTO dto){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		
		sql.append(" update memo1 set title = ?, content = ? where memono = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getMemono());
			int cnt = pstmt.executeUpdate();
			if(cnt > 0){
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
		return flag;
	}
	
	public boolean delete(int memono){
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from memo1 where memono = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, memono);
			
			int cnt = pstmt.executeUpdate();
			if(cnt > 0) flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con); 
		}
		return flag;
	}
	

}
