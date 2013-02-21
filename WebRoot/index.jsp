<%@ page language="java" import="java.util.*,jl.info.domain.*,jl.info.dao.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<link type="text/css" media="screen" rel="stylesheet" href="css/style.css" />
<title>主页</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: large;
	color: #CC6633;
}
.STYLE2 {color: #0000FF}
-->
</style>
</head>

<body>

<div id="container">

	<div id="header">
		<form id="form1" method="post" action="message">
		<input class="STYLE1" type="text" name="keywords" value=" Search For..." />
		<input name="change" type="hidden" value="selectbylike" />
		<input class="button" type="submit" name="Submit" value="GO" />
		</form>
		<h1>供求信息网（电联：123）</h1>
	</div>
	
	<div id="menu">
		<ul>
		<li ><a href="#">Home</a></li>
		<li id="current"><a href="#">News</a></li>
		<li><a href="#">Products</a></li>
		<li><a href="#">About</a></li>
		<li><a href="#">Contact</a></li>		
		</ul>
	</div>
	
  <div id="sidebar">
	<br /><h3>Login</h3>
	<form action="login" method="post" name="form2" id="form2">
	  <p>
	     用户名：<input type="text" name="loginid" />
	  	 密码：<input type="password" name="password" />
	    <input type="submit" name="Submit" value="Login" />
      </p>
	  <p>&nbsp;  </p>
	</form>
	<p>&nbsp;</p>
	<p>&nbsp;</p>
	<p>
	<h3>&nbsp;</h3>
</div>
	
	<div id="content">
	  <h2>Welcome</h2>
	  <h2><br />
	  
				<%
			try {
			    ItemDAO itemDAO = new ItemDAO();
				request.setAttribute("all", itemDAO.queryAll());
			} catch (Exception e) {
				e.printStackTrace();
			}
				List all = (List) request.getAttribute("all");
				Iterator iter = all.iterator();
				while (iter.hasNext()) {
					Item item = (Item) iter.next();
					String Itemid = item.getItemid();
					String Itemname = item.getItemname();
	
		%> 
        <a href="message?change=selectall&itemid=<%=Itemid %>" class="story_title"><img src="images/title_link.gif" border="0" /><%=Itemname %></a> 
      </h2>
        <%	try {
				 MessageDAO messageDAO = new MessageDAO();
				request.setAttribute("contentall", messageDAO.queryAll(Itemid));
			} catch (Exception e) {
				e.printStackTrace();
			}
				List contentall = (List) request.getAttribute("contentall");
				int j = 1;
				Iterator it = contentall.iterator();
				while (it.hasNext()) {
					Message message = (Message)it.next();
					String title= message.getTitle();
					String date = message.getInfodate();
					String id = message.getMessageid();
					%>
					<li class="STYLE2"><a href="message?d_messageid=<%=id%>&change=selectid"><%=title %></a>&nbsp;&nbsp;&nbsp;&nbsp;<%=date%></li>
	  
	  
	  <%
	  	j++;
	  if(j>5){break;}
	  		} 
	  		%>
	  		<p align="right" ><a href="message?change=selectall&itemid=<%=Itemid %>" class="STYLE1">more..</a></p>
	  		<%
	  	}%>
	<br />
	
</div>

</body>
</html>
