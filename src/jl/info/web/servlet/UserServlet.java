package jl.info.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jl.info.dao.UserDAO;
import jl.info.domain.Person;

public class UserServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
		String path = "error.jsp";
		// 接收要操作的参数值，根据不同的“change”值，选择Servlet不同的方法
		String change = request.getParameter("change");

		if (change != null) {
			
			if (change.equals("insert")) {
				String loginid = request.getParameter("loginid");
				String reuserpwd = request.getParameter("reuserpwd");
				String popedom = request.getParameter("popedom");
				int i = 0;
				UserDAO userDAO0 = new UserDAO();
				try {
					Person person0 = userDAO0.queryByLoginID(loginid);
					if (person0 == null) {
						
						Person person = new Person();
						person.setLoginid(loginid);
						person.setPassword(reuserpwd);
						person.setPopedom(popedom);
						
						UserDAO userDAO = new UserDAO();
						userDAO.insert(person);
						path = "success.jsp";
					}else
					{
						i = 1;
						path = "createuser.jsp";
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				request.setAttribute("flag",i );
			}

			
			if (change.equals("delete")) {
				String id = request.getParameter("d_userid");
				try {
					UserDAO userDAO = new UserDAO();
					userDAO.delete(id);

				} catch (Exception e) {
					e.printStackTrace();
				}
				path = "success.jsp";
			}

			
			if (change.equals("selectid")) {
				String id = request.getParameter("userid");
				try {
					UserDAO userDAO = new UserDAO();
					request.setAttribute("person", userDAO.queryById(id));
				} catch (Exception e) {
					e.printStackTrace();
				}
				path = "updateusermessage.jsp";
			}

			
			if (change.equals("updateOther")) {

				String id = request.getParameter("uo_userid");

				String loginid = request.getParameter("uo_loginid");
				String userpassword = request.getParameter("uo_userpwd");
				String popedom = request.getParameter("uo_popedom");
				Person person = new Person();
				person.setLoginid(loginid);
				person.setUserid(id);
				person.setPassword(userpassword);
				person.setPopedom(popedom);
				try {
					UserDAO userDAO = new UserDAO();
					userDAO.updateOther(person);
				} catch (Exception e) {
					e.printStackTrace();
				}
				path = "success.jsp";
			}

			if (change.equals("selectmyid")) {
				String id = request.getParameter("userid");
				try {
					UserDAO userDAO = new UserDAO();
					request.setAttribute("person", userDAO.queryById(id));
				} catch (Exception e) {
					e.printStackTrace();
				}
				path = "updatemanager.jsp";
			}
			if (change.equals("updateMyself")) {
				String userid = request.getParameter("userid");
				String userpassword = request.getParameter("userpwd4");

				String username = request.getParameter("username");
				int userage = Integer.parseInt(request.getParameter("userage"));
				String usersex = request.getParameter("usersex");
				String useremail = request.getParameter("usermail");

				Person person = new Person();
				person.setUserid(userid);
				person.setPassword(userpassword);
				person.setUsername(username);
				person.setAge(userage);
				person.setSex(usersex);
				person.setEmail(useremail);
				try {
					UserDAO userDAO = new UserDAO();
					userDAO.updateMyself(person);
					request.getSession().setAttribute("username",
							person.getUsername());
					request.getSession().setAttribute("userpassword",
							person.getPassword());
					path = "success.jsp";
				} catch (Exception e) {
					e.printStackTrace();
				}

			}

			
			if (change.equals("selectall_d")) {
				try {
					UserDAO userDAO = new UserDAO();
					request.setAttribute("all", userDAO.queryAll());
				} catch (Exception e) {
					e.printStackTrace();
				}
				path = "deleteuser.jsp";
			}

			if (change.equals("selectall_u")) {
				try {
					UserDAO userDAO = new UserDAO();
					request.setAttribute("all", userDAO.queryAll());
				} catch (Exception e) {
					e.printStackTrace();
				}
				path = "updateuser.jsp";
			}
			if (change.equals("choose")) {
				if (request.getSession().getAttribute("userpopedom").equals(
						"01")) {
					path = "user.jsp";
				} else if (request.getSession().getAttribute("userpopedom")
						.equals("02")) {
					path = "item.jsp";
				} else if (request.getSession().getAttribute("userpopedom")
						.equals("03")) {
					path = "message.jsp";
				} else {
					path = "error.jsp";
				}
			}
			
			if (change.equals("logout")) {
				request.getSession().invalidate();
				path = "index.jsp";
			}

		} else {
			path = "error.jsp";
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

}
