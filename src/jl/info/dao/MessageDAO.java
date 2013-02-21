package jl.info.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jl.info.datebase.DBConn;
import jl.info.domain.Message;

public class MessageDAO {
	public void delete(String id) throws Exception {
		String sql = "DELETE FROM T_MESSAGE WHERE MESSAGEID=?";
		PreparedStatement pstmt = null ;
		DBConn dbc = null ;
		dbc = new DBConn() ;
		try
		{
			pstmt = dbc.getConnection().prepareStatement(sql) ;
			pstmt.setString(1,id);
			pstmt.executeUpdate() ;
			pstmt.close() ;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			dbc.close() ;
		}
	}

	public void insert(Message message) throws Exception {
		String sql = "INSERT INTO T_MESSAGE(MESSAGEID,ITEMID,TITLE,CONTENT,AUTHOR,INFODATE)VALUES('M'||lpad(S_MESSAGE.nextval,5,'0'),?,?,?,?,sysdate)" ;
		PreparedStatement pstmt = null ;
		DBConn dbc = null ;
		dbc = new DBConn() ;
		try
		{
			pstmt = dbc.getConnection().prepareStatement(sql) ;

			pstmt.setString(1, message.getItemid());
			pstmt.setString(2,message.getTitle());
			pstmt.setString(3,message.getContent());
			pstmt.setString(4,message.getAuthor());
			pstmt.executeUpdate() ;
			pstmt.close() ;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			dbc.close() ;
		}
	}

	public List queryAll(String id) throws Exception {
		List all = new ArrayList() ;
		String sql = "SELECT MESSAGEID,ITEMID,TITLE,CONTENT,AUTHOR,TO_CHAR(INFODATE,'YYYY-MM-DD HH24:MI:SS') FROM T_MESSAGE WHERE ITEMID=?";
		PreparedStatement pstmt = null ;
		DBConn dbc = null ;
		dbc = new DBConn() ;
		try
		{
			pstmt = dbc.getConnection().prepareStatement(sql) ;
			pstmt.setString(1, id); 
			ResultSet rs = pstmt.executeQuery() ;
			while(rs.next())
			{
				Message message = new Message();
				message.setMessageid(rs.getString(1));
				message.setItemid(rs.getString(2));
				message.setTitle(rs.getString(3));
				message.setContent(rs.getString(4));
				message.setAuthor(rs.getString(5));
				message.setInfodate(rs.getString(6));
				all.add(message) ;
			}
			rs.close() ;
			pstmt.close() ;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			dbc.close() ;
		}
		return all ;
	}

	public Message queryById(String id) throws Exception {
		Message message = null ;
		String sql = "SELECT MESSAGEID,ITEMID,TITLE,CONTENT,AUTHOR,TO_CHAR(INFODATE,'YYYY-MM-DD') FROM T_MESSAGE WHERE MESSAGEID=?"; 
		PreparedStatement pstmt = null ;
		DBConn dbc = null ;
		dbc = new DBConn() ;
		try
		{
			pstmt = dbc.getConnection().prepareStatement(sql) ;
			pstmt.setString(1,id) ;
			ResultSet rs = pstmt.executeQuery() ;
			if(rs.next())
			{
			    message = new Message();
			    message.setMessageid(rs.getString(1));
			    message.setItemid(rs.getString(2));
			    message.setTitle(rs.getString(3));
			    message.setContent(rs.getString(4));
			    message.setAuthor(rs.getString(5));
			    message.setInfodate(rs.getString(6));
			}
			rs.close() ;
			pstmt.close() ;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			dbc.close() ;
		}
		return message ;
	}

	public List queryByLike(String cond) throws Exception {
		List all = new ArrayList() ;
		String sql = "SELECT MESSAGEID,ITEMID,TITLE,CONTENT,AUTHOR,TO_CHAR(INFODATE,'YYYY-MM-DD') FROM T_MESSAGE WHERE TITLE LIKE ? OR AUTHOR LIKE ? ORDER BY INFODATE DESC" ;
		PreparedStatement pstmt = null ;
		DBConn dbc = null ;
		dbc = new DBConn() ;
		try
		{
			pstmt = dbc.getConnection().prepareStatement(sql) ;
			pstmt.setString(1,"%"+cond+"%") ;
			pstmt.setString(2,"%"+cond+"%") ;
			ResultSet rs = pstmt.executeQuery() ;
			while(rs.next())
			{
				Message message = new Message();
				message.setMessageid(rs.getString(1));
				message.setItemid(rs.getString(2));
				message.setTitle(rs.getString(3));
				message.setContent(rs.getString(4));
				message.setAuthor(rs.getString(5));
				message.setInfodate(rs.getString(6));
				all.add(message) ;
			}
			rs.close() ;
			pstmt.close() ;
		}
		catch (Exception e)
		{
			System.out.println(e) ;
			throw new Exception("操作中出现错误！！！") ;
		}
		finally
		{
			dbc.close() ;
		}
		return all ;
	}

	
	public void update(Message message) throws Exception {
		String sql = "UPDATE T_MESSAGE SET ITEMID=?,TITLE=?,CONTENT=?,AUTHOR=? WHERE MESSAGEID=?";
		PreparedStatement pstmt = null ;
		DBConn dbc = null ;
		dbc = new DBConn() ;
		try
		{
			pstmt = dbc.getConnection().prepareStatement(sql) ;
			pstmt.setString(1,message.getItemid());
			pstmt.setString(2,message.getTitle());
			pstmt.setString(3,message.getContent());
			pstmt.setString(4,message.getAuthor());
			pstmt.setString(5,message.getMessageid());
			pstmt.executeUpdate() ;
			pstmt.close() ;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			dbc.close() ;
		}			
	}
}
