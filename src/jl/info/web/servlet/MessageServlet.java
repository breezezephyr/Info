package jl.info.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.info.dao.MessageDAO;
import jl.info.domain.Message;



public class MessageServlet extends HttpServlet{
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
			String itemid = request.getParameter("itemid");;
			//String userid = (String)request.getSession().getAttribute("i_loginid");
			String title = request.getParameter("i_title");
			String content = request.getParameter("i_content");
			String author = request.getParameter("i_author");
			
			Message message = new Message();
			message.setItemid(itemid);
			message.setTitle(title);
			message.setContent(content);
			message.setAuthor(author);
	
			try {
				MessageDAO messageDAO = new MessageDAO();
				messageDAO.insert(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			path = "success.jsp" ;
		}
	
	
	if(change.equals("delete")){
		String id = request.getParameter("d_messageid") ;
		try
		{
			MessageDAO messageDAO = new MessageDAO();
			messageDAO.delete(id);
			
		}
		catch (Exception e){
			e.printStackTrace();
		}
		path = "success.jsp" ;
	}

				
	if(change.equals("selectall"))
	{
		String id = request.getParameter("itemid");
		try
		{
			MessageDAO messageDAO = new MessageDAO();
			request.setAttribute("contentall",messageDAO.queryAll(id)) ;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}if(request.getSession().getAttribute("userid") != null){
			path = "deletemessage.jsp" ;
		}else
		{
			path = "newstitle.jsp";
		}
	}
	
	
	if(change.equals("selectid"))
	{
		String id = request.getParameter("d_messageid") ;
		try
		{
			MessageDAO messageDAO = new MessageDAO();
			request.setAttribute("content",messageDAO.queryById(id)) ;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		if(request.getSession().getAttribute("userid") != null){
			path = "updatemessageall.jsp" ;
		}else
		{
			path = "news.jsp" ;
		}
	}
	
	if(change.equals("update"))
	{
		
		String id = request.getParameter("contentid") ;
		String itemid = request.getParameter("itemid");
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String content = request.getParameter("content");
		
		Message message = new Message();
		message.setMessageid(id);
		message.setItemid(itemid);
		message.setTitle(title);
		message.setAuthor(author);
		message.setContent(content);
		
		try
		
		{
			MessageDAO messageDAO = new MessageDAO();
			messageDAO.update(message) ;
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
		path = "success.jsp" ;
	}
	
	if(change.equals("selectbylike"))
	{
		String cond = request.getParameter("keywords") ;
		request.getSession().setAttribute("keywords", cond);
		try
		{
			MessageDAO messageDAO = new MessageDAO() ;
			request.setAttribute("contentall",messageDAO.queryByLike(cond)) ;
		}
		catch (Exception e)
		{
		}
		path = "newstitle.jsp" ;
	}
}	
	request.getRequestDispatcher(path).forward(request,response) ;
}

}
