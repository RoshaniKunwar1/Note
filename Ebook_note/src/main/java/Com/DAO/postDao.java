package Com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Com.User.post;

public class postDao{
	private Connection con;

	public postDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean AddNotes( String ti, String cont,int ui) {
		boolean f = false;
		
		try {
			String query = "insert into post(title, content,uid) values(?,?,?)";
			PreparedStatement pstmt  = con.prepareStatement(query);
			pstmt.setString(1, ti);
			pstmt.setString(2, cont);
			pstmt.setInt(3, ui);

			if(pstmt.executeUpdate() == 1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	public List<post> getData(int id){
		List<post> list = new ArrayList<post>();
		post po;
		try {
			String query = "Select * from post where uid=? order by id DESC";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				po = new post();
				po.setId(rs.getInt(1));
				po.setTitle(rs.getString(2));
				po.setContent(rs.getString(3));
				po.setPdate(rs.getTimestamp(4));
				list.add(po);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;	
	}
	
	public post getDataById(int note_id) {
		post p = null;
		try {
			String query = "Select * from post where id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, note_id);
			
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				p = new post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return p;
	}
	
	public boolean postUpdate(int nid, String ti, String cont) {
		boolean f = false;
		try {
			String query = "Update post set title=?, content=? where id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, ti);
			pstmt.setString(2, cont);
			pstmt.setInt(3, nid);
			
			if(pstmt.executeUpdate() == 1) {
				System.out.println("Updated");
				f=true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;	
	}
	
	public boolean deletePost(int nid) {
		boolean f = false;
		
		try {
			String query ="Delete from post where id= ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, nid);
			if(pstmt.executeUpdate() ==1) {
				f=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}