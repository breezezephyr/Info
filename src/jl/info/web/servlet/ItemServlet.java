package jl.info.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.info.dao.ItemDAO;
import jl.info.dao.UserDAO;
import jl.info.domain.Item;



public class ItemServlet extends HttpServlet{

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GBK") ;
		String path = "error.jsp" ;
		// 接收要操作的参数值，根据不同的“change”值，选择Servlet不同的方法
		String change = request.getParameter("change") ;
		
		if(change != null){
			if(change.equals("insert")){
				String itemname = request.getParameter("i_itemname");
				int i = 0;//标记
				ItemDAO itemDAO = new ItemDAO();
				try {
				Item item =	itemDAO.queryByName(itemname);
				if(item == null){
					Item item1 = new Item();
					item1.setItemname(itemname);
					ItemDAO itemDAO1 = new ItemDAO();
					itemDAO1.insert(item1);
					path = "success.jsp" ;
					}else
					{
						i = 1;
						path = "createitem.jsp";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("flag", i);
			}
		}
		
		if(change.equals("delete"))
		{
			String id = request.getParameter("d_itemid") ;
			try
			{
				ItemDAO itemDAO = new ItemDAO();
				itemDAO.delete(id) ;
				
			}
			catch (Exception e){
				e.printStackTrace();
			}
			path = "success.jsp" ;
		}
		
		
		if(change.equals("selectid"))
		{
			String id = request.getParameter("u_itemid") ;
	
			Item item = new Item();
			item.setItemid(id);
			
			try
			{
				ItemDAO itemDAO = new ItemDAO();
				request.setAttribute("item",itemDAO.queryById(id)) ;
				
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}				
			path = "updateitem.jsp" ;
		}
		if(change.equals("update"))
		{
			
			String id = request.getParameter("u_Itemid") ;
			
			String u_Itemname = request.getParameter("u_Itemname") ;
			
			Item item = new Item();
			item.setItemid(id);
			item.setItemname(u_Itemname);
			
			try
			{
				ItemDAO itemDAO = new ItemDAO();
				itemDAO.update(item) ;
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			path = "success.jsp" ;
		}
		
		
		if(change.equals("selectall_d"))
		{
			try
			{
				ItemDAO itemDAO = new ItemDAO();
				request.setAttribute("all",itemDAO.queryAll()) ;
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			path = "deleteitem.jsp" ;
		}
		if(change.equals("selectall_u"))
		{
			try
			{
				ItemDAO itemDAO = new ItemDAO();
				request.setAttribute("all",itemDAO.queryAll()) ;
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			path = "updateitemmessage.jsp" ;
		}
		request.getRequestDispatcher(path).forward(request,response) ;
	}
}
