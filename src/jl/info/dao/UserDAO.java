package jl.info.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jl.info.datebase.DBConn;
import jl.info.domain.Person;

public class UserDAO {
	public boolean login(Person person) throws Exception{
		boolean flag = false ;
		String sql = "SELECT USERID,POPEDOM,USERNAME FROM T_USERMANAGE WHERE LOGINID=? and PASSWORD=?" ;
		PreparedStatement pstmt = null ;
		DBConn dbc = null ;
		dbc = new DBConn() ;
		try
		{
			pstmt = dbc.getConnection().prepareStatement(sql) ;
			pstmt.setString(1,person.getLoginid()) ;
			pstmt.setString(2,person.getPassword()) ;
			ResultSet rs = pstmt.executeQuery() ;
			if(rs.next())
			{
				flag = true ;
				person.setUserid(rs.getString(1));
				person.setPopedom(rs.getString(2));
				person.setUsername(rs.getString(3));
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
		return flag ;
	}

	
	public void insert(Person person) throws Exception {
		String sql = "INSERT INTO T_USERMANAGE(USERID,LOGINID,PASSWORD,POPEDOM)VALUES('P'||lpad(S_PERSON.nextval,5,'0'),?,?,?)" ;
		PreparedStatement pstmt = null ;
		DBConn dbc = null ;
		dbc = new DBConn() ;
		try
		{
			pstmt = dbc.getConnection().prepareStatement(sql) ;
			pstmt.setString(1,person.getLoginid()) ;
			pstmt.setString(2,person.getPassword()) ;
			pstmt.setString(3,person.getPopedom()) ;
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
		

	
	public void delete(String id) throws Exception {
		String sql = "DELETE FROM T_USERMANAGE WHERE USERID=?" ;
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
	
	
	
	public List queryAll() throws Exception {
		List all = new ArrayList() ;
		String sql = "SELECT USERID,LOGINID,POPEDOMNAME,nvl(USERNAME,'没有填写') FROM T_USERMANAGE,T_POPEDOM " +
						"WHERE T_USERMANAGE.POPEDOM = T_POPEDOM.POPEDOM AND T_USERMANAGE.POPEDOM <> '01' ";
		PreparedStatement pstmt = null ;
		DBConn dbc = null ;
		dbc = new DBConn() ;
		try
		{
			pstmt = dbc.getConnection().prepareStatement(sql) ;
			ResultSet rs = pstmt.executeQuery() ;
			while(rs.next())
			{
				Person person = new Person() ;
				person.setUserid(rs.getString(1));
				person.setLoginid(rs.getString(2)) ;
				person.setPopedomname(rs.getString(3)) ;
				person.setUsername(rs.getString(4)) ;
				all.add(person) ;
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

	
	
	public Person queryById(String id) throws Exception {
		Person person = null ;
		String sql = "SELECT LOGINID,POPEDOM,nvl(USERNAME,'没有填写'),nvl(SEX ,'没有填写'),nvl(AGE ,0),nvl(EMAIL,'没有填写') FROM T_USERMANAGE WHERE USERID = ?"; 
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
				person = new Person() ;
				person.setUserid(id);
				person.setLoginid(rs.getString(1));
				person.setPopedom(rs.getString(2));
				person.setUsername(rs.getString(3)) ;
				person.setSex(rs.getString(4));
				person.setAge(rs.getInt(5));
				person.setEmail(rs.getString(6));
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
		return person ;
	}
	
	public Person queryByLoginID(String loginid) throws Exception {
		Person person = null ;
		String sql = "SELECT LOGINID FROM T_USERMANAGE WHERE LOGINID = ?"; 
		PreparedStatement pstmt = null ;
		DBConn dbc = null ;
		dbc = new DBConn() ;
		try
		{
			pstmt = dbc.getConnection().prepareStatement(sql) ;
			pstmt.setString(1,loginid) ;
			ResultSet rs = pstmt.executeQuery() ;
			if(rs.next())
			{
				person = new Person() ;
				person.setLoginid(rs.getString(1));
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
		return person ;
	}
	
	
	public void updateOther(Person person) throws Exception {
		String sql = "UPDATE T_USERMANAGE SET LOGINID=?,PASSWORD=?,POPEDOM=? WHERE USERID=?" ;
		PreparedStatement pstmt = null ;
		DBConn dbc = null ;
		dbc = new DBConn() ;
		try
		{
			pstmt = dbc.getConnection().prepareStatement(sql) ;
			pstmt.setString(1,person.getLoginid()) ;
			pstmt.setString(2,person.getPassword()) ;
			pstmt.setString(3,person.getPopedom()) ;
			pstmt.setString(4,person.getUserid()) ;
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
	
	
	public void updateMyself(Person person) throws Exception {
		String sql = "UPDATE T_USERMANAGE SET PASSWORD=?,USERNAME=?,SEX=?,AGE=?,EMAIL=? WHERE USERID=?" ;
		PreparedStatement pstmt = null ;
		DBConn dbc = null ;
		dbc = new DBConn() ;
		try
		{
			pstmt = dbc.getConnection().prepareStatement(sql) ;
			pstmt.setString(1,person.getPassword()) ;
			pstmt.setString(2,person.getUsername()) ;
			pstmt.setString(3,person.getSex()) ;
			pstmt.setInt(4,person.getAge());
			pstmt.setString(5,person.getEmail());
			pstmt.setString(6,person.getUserid());
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
