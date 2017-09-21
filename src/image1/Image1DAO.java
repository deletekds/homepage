package image1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import image1.Image1DTO;
import utility.DBClose;
import utility.DBOpen;

public class Image1DAO {

	public Image1DTO read(int imageno) {
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Image1DTO dto = new Image1DTO();
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from image1 where imageno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imageno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setImageno(rs.getInt("imageno"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFname(rs.getString("fname"));
				dto.setContent(rs.getString("content"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return dto;

	}

	public List<Image1DTO> list(Map map) {
		List<Image1DTO> list = new ArrayList<Image1DTO>();
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("   select imageno,name,title,content,passwd,mdate,fname,grpno,indent,ansnum,r   ");
		sql.append("    from(  ");
		sql.append("    select imageno,name,title,content,passwd,mdate,fname,grpno,indent,ansnum,rownum r  ");
		sql.append("    from(  ");
		sql.append("     select imageno,name,title,content,passwd,mdate,fname,grpno,indent,ansnum ");
		sql.append("    from image1  ");
		if (word.trim().length() > 0)
			sql.append("  where " + col + "  like '%'||?||'%' ");

		sql.append(" order by grpno desc,ansnum asc ");
		sql.append(" ) ");
		sql.append(" )where r>=? and r<=? ");

		try {
			int i = 0;
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(++i, word);
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Image1DTO dto = new Image1DTO();
				dto.setImageno(rs.getInt("imageno"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setMdate(rs.getString("mdate"));
				dto.setFname(rs.getString("fname"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return list;

	}

	public boolean getRefnum(int imageno) {
		boolean flag = false;
		List<Image1DTO> list = new ArrayList<Image1DTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*)  ");
		sql.append(" from image1  ");
		sql.append("  where refnum = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imageno);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);

			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return flag;
	}

	public boolean delete(int imageno) {
		boolean flag = false;
		List<Image1DTO> list = new ArrayList<Image1DTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" delete from image1 where imageno= ?  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imageno);
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

	public boolean passwdCheck(Map map) {
		boolean flag = false;
		List<Image1DTO> list = new ArrayList<Image1DTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(imageno)  ");
		sql.append("  from image1 ");
		sql.append("  where imageno = ? and passwd = ? ");

		int imageno = (Integer) map.get("imageno");
		String passwd = (String) map.get("passwd");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imageno);
			pstmt.setString(2, passwd);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			if (cnt > 0)
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return flag;

	}

	public int total(Map map) {
		int total = 0;
		String col = (String) map.get("col");
		String word = (String) map.get("word");

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  select count(*)   ");
		sql.append("  from image1 ");
		if (word.trim().length() > 0)
			sql.append(" where " + col + " like '%'||?||'%'  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(1, word.trim());
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

	public boolean replyCreate(Image1DTO dto) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  insert into image1(imageno,name,title,content, mdate,fname,grpno,indent,ansnum,refnum,passwd)  ");
		sql.append(" values((select nvl(max(imageno),0) + 1 as imageno from image1),  ");
		sql.append(" ?,?,?,sysdate,?,?,?,?,?,?)  ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getFname());
			pstmt.setInt(5, dto.getGrpno());
			pstmt.setInt(6, dto.getIndent() + 1);
			pstmt.setInt(7, dto.getAnsnum() + 1);
			pstmt.setInt(8, dto.getImageno());
			pstmt.setString(9, dto.getPasswd());

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

	public void upAnsum(Map map) {
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  update image1         ");
		sql.append("   set ansnum = ansnum +1        ");
		sql.append("    where grpno = ? and ansnum > ?      ");
		int grpno = (Integer) map.get("grpno");
		int ansnum = (Integer) map.get("ansnum");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public Image1DTO replyRead(int imageno) {
		Image1DTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  select imageno, name,title,grpno,indent,ansnum ");
		sql.append("  from image1 ");
		sql.append("  where imageno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imageno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new Image1DTO();
				dto.setImageno(rs.getInt("imageno"));
				dto.setName(rs.getString("name"));
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

	public boolean create(Image1DTO dto) {
		boolean flag = false;
		PreparedStatement pstmt = null;
		Connection con = DBOpen.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("   insert into image1(imageno,name,title,        ");
		sql.append("   content,passwd,mdate,fname,grpno)        ");
		sql.append("   values        ");
		sql.append("   ((select nvl(max(imageno),0)+1 from image1),?,?,?,?,        ");
		sql.append("    sysdate,?,(select nvl(max(grpno),0)+1 from image1))       ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setString(5, dto.getFname());

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

	public boolean update(Image1DTO dto) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append("  update image1 set name =?,   ");
		sql.append("  title =?, content =? , passwd = ?   ");
		sql.append("  where imageno = ?   ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getImageno());

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
		int imageno = (Integer) map.get("imageno");
		String fname = (String) map.get("fname");
		StringBuffer sql = new StringBuffer();
		sql.append(" update image1 set  ");
		sql.append("     fname = ?  ");
		sql.append(" where imageno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, fname);
			pstmt.setInt(2, imageno);

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

	public List<Integer> imgList() {
		List<Integer> list = new ArrayList<Integer>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select imageno ");
		sql.append(" from image1 ");
		sql.append(" order by imageno asc ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getInt("imageno"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return list;

	}

	public boolean replyUpdate(Image1DTO dto) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" update image1 set imageno = (imageno + (SELECT MAX(imageno) FROM image1)) ");
		sql.append(" where grpno > ? or grpno = ? and ");
		sql.append(" indent <(SELECT MAX(indent) FROM image1 where grpno=?) ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, dto.getGrpno());
			pstmt.setInt(2, dto.getGrpno());
			pstmt.setInt(3, dto.getGrpno());

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
}
