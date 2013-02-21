package jl.info.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.info.dao.UserDAO;
import jl.info.domain.Person;

public class LoginServlet extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String path = "error.jsp" ;

		String loginid = request.getParameter("loginid") ;
		String password = request.getParameter("password") ;
		Person person = new Person() ;
		person.setLoginid(loginid) ;
		person.setPassword(password) ;
		try
		{
			UserDAO userDAO = new UserDAO();
			if(userDAO.login(person))
			{
				request.getSession().setAttribute("userid",person.getUserid());
				request.getSession().setAttribute("loginid",person.getLoginid());
				request.getSession().setAttribute("userpassword",person.getPassword());
				request.getSession().setAttribute("username",person.getUsername());
				request.getSession().setAttribute("userpopedom", person.getPopedom());
				if(person.getPopedom().equals("01")){
					path = "user.jsp" ;
				}
				else if(person.getPopedom().equals("02")){
					path = "item.jsp";
				}
				else if(person.getPopedom().equals("03")){
					path = "message.jsp";
				}
			}
			else
			{
				path = "error.jsp";
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		request.getRequestDispatcher(path).forward(request,response) ;
	}

}
