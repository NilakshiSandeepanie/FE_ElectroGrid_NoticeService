package org.noticeservice.notice.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.noticeservice.notice.beans.Notice;
import org.noticeservice.notice.db.DBType;
import org.noticeservice.notice.db.DBUtil;

public class NoticeManager {
	public static List<Notice> displayAllRows() throws SQLException {
		List<Notice> list = new ArrayList<Notice>();
		String sql = "SELECT noticeId, nmessage, duration,aparty, heading FROM notices";
				try(
						Connection conn = DBUtil.getConnection(DBType.MYSQL);
						Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
						ResultSet rs = stmt.executeQuery(sql);
						) {
					while (rs.next()) {
						Notice notice = new Notice();
						int noticeId = rs.getObject("noticeId", int.class);
						String nmessage = rs.getObject("nmessage", String.class);
						String duration = rs.getObject("duration", String.class);
						String aparty = rs.getObject("aparty", String.class);
						String heading = rs.getObject("heading", String.class);
						
						notice.setNoticeId(noticeId);
						notice.setNmessage(nmessage);
						notice.setDuration(duration);
						notice.setAparty(aparty);
						notice.setHeading(heading);
						list.add(notice);
						System.out.println("Get All notice Details Sucessfully.");
						
					}
				} catch (SQLException e) {
					DBUtil.processException(e);
				} 
				
				return list;
		
	}
	
	public static Notice getRow(int noticeId) throws SQLException {
	
		String sql = "SELECT * FROM notices WHERE noticeId = ?";
		ResultSet rs = null;
		
		try(
				Connection conn = DBUtil.getConnection(DBType.MYSQL);
				PreparedStatement stmt = conn.prepareStatement(sql);
				){
			stmt.setInt(1, noticeId);
			rs = stmt.executeQuery();
			
			if (rs.next()){
				Notice notice = new Notice();
				notice.setNoticeId(noticeId);
				notice.setNmessage(rs.getObject("nmessage", String.class));
				notice.setDuration(rs.getObject("duration", String.class));
				notice.setAparty(rs.getObject("aparty", String.class));
				notice.setHeading(rs.getObject("heading", String.class));
				System.out.println("Notice rows were found");
				return notice;
				
			}else{
				System.err.println("No Notice rows were found.");
				return null;
				
			}		
			}catch(SQLException e){
			System.err.println(e);
			return null;
		}finally{
			if (rs != null){
				rs.close();
			}
		}
	}
	
	
	public static Notice insert(Notice notice) throws SQLException {
		
		String sql = "INSERT INTO notices(noticeId, nmessage,duration,aparty,heading)" + "VALUES (?,?,?,?,?)";
		ResultSet keys = null;
		try(
				Connection conn = DBUtil.getConnection(DBType.MYSQL);
				PreparedStatement stmt = conn.prepareStatement(sql);
				){		
		
			stmt.setInt(1, notice.getNoticeId());
			stmt.setString(2, notice.getNmessage());
			stmt.setString(3, notice.getDuration());
			stmt.setString(4, notice.getAparty());
			stmt.setString(5, notice.getHeading());
			stmt.executeUpdate();
			System.out.println("Notice Add Sucessfully.");
			}catch(SQLException e){
			System.err.println(e);
			return null;
		}finally{
			if (keys != null) keys.close();
		}
		return notice;
	}
	
	public static Notice update(Notice notice) throws SQLException {
		String sql = "update notices set nmessage=?,duration=?,aparty=?,heading=? where noticeId=?";
		try(
				Connection conn = DBUtil.getConnection(DBType.MYSQL);
				PreparedStatement stmt = conn.prepareStatement(sql);
				){
			stmt.setString(1, notice.getNmessage());
			
			stmt.setString(2, notice.getDuration());
			stmt.setString(3, notice.getAparty());
			stmt.setString(4, notice.getHeading());
			stmt.setInt(5, notice.getNoticeId());
			int affected = stmt.executeUpdate();
			System.out.println("Notice Update Sucessfully.");
		
			if (affected==1){
				return notice;
				
			}else{
				return null;
			}
		}
		catch(SQLException e){
			System.err.println(e);
			return null;
		}
	
	}
	public static void delete(int noticeId) throws SQLException {
		String sql = "DELETE FROM notices WHERE noticeId = ?";
		try(
				Connection conn = DBUtil.getConnection(DBType.MYSQL);
				PreparedStatement stmt = conn.prepareStatement(sql);
				){
			stmt.setInt(1, noticeId);
			int affected = stmt.executeUpdate();
			if (affected == 1){
				System.out.println("Notice Delete Sucessfully.");
			
			}else{
				System.out.println("Could not Delete Notice.");
			}
		}
		catch(SQLException e){
			System.err.println(e);
		}
	}
}
