package jl.info.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jl.info.datebase.DBConn;
import jl.info.domain.Item;

public class ItemDAO {
	public void delete(String id) throws Exception {
		//String sqlA = "DELETE FROM T_CONTENT WHERE ITEMID=?";
		String sqlB = "DELETE FROM T_ITEM WHERE ITEMID=?";
		PreparedStatement pstmt = null;
		DBConn dbc = null;
		dbc = new DBConn();
		try {
			//pstmt = dbc.getConnection().prepareStatement(sqlA);
			//pstmt.setString(1, id);
			//pstmt.executeUpdate();
			pstmt = dbc.getConnection().prepareStatement(sqlB);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}

	}

	public void insert(Item item) throws Exception {
		String sql = "INSERT INTO T_ITEM(ITEMID,ITEMNAME)VALUES('IT'||lpad(S_ITEM.nextval,4,'0'),?)";
		PreparedStatement pstmt = null;
		DBConn dbc = null;
		dbc = new DBConn();
		try {
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, item.getItemname());
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}
	}

	/**
	 * 查询全部栏目
	 */
	public List queryAll() throws Exception {
		List all = new ArrayList();
		String sql = "SELECT ITEMID,ITEMNAME FROM T_ITEM";
		PreparedStatement pstmt = null;
		DBConn dbc = null;
		dbc = new DBConn();
		try {
			pstmt = dbc.getConnection().prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Item item = new Item();
				item.setItemid(rs.getString(1));
				item.setItemname(rs.getString(2));
				all.add(item);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}
		return all;
	}

	public Item queryById(String id) throws Exception {
		Item item = null;
		String sql = "SELECT ITEMID,ITEMNAME FROM T_ITEM WHERE ITEMID = ?";
		PreparedStatement pstmt = null;
		DBConn dbc = null;
		dbc = new DBConn();
		try {
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				item = new Item();
				item.setItemid(rs.getString(1));
				item.setItemname(rs.getString(2));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}
		return item;
	}
	
	public Item queryByName(String name) throws Exception {
		Item item = null;
		String sql = "SELECT ITEMID,ITEMNAME FROM T_ITEM WHERE ITEMNAME = ?";
		PreparedStatement pstmt = null;
		DBConn dbc = null;
		dbc = new DBConn();
		try {
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				item = new Item();
				item.setItemid(rs.getString(1));
				item.setItemname(rs.getString(2));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}
		return item;
	}

	public void update(Item item) throws Exception {
		String sql = "UPDATE T_ITEM SET ITEMNAME=? WHERE ITEMID=?";
		PreparedStatement pstmt = null;
		DBConn dbc = null;
		dbc = new DBConn();
		try {
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, item.getItemname());
			pstmt.setString(2, item.getItemid());
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}

	}
}
