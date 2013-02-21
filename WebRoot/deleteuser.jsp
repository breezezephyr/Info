<%@ page language="java" import="java.util.*,jl.info.domain.*"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--

	curiously.green1.0 by nodethirtythree design
	http://www.nodethirtythree.com
	hope you enjoy it :)

-->
<html>
<%if(request.getSession().getAttribute("userid") == null){
	response.sendRedirect("index.jsp");
}%>
	<head>
		<meta http-equiv="content-type" content="text/html; charset=GBK" />
		<title>删除用户</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<style type="text/css">
<!--
.STYLE1 {
	color: #000000
}

.STYLE7 {
	color: #666666
}

.STYLE12 {
	font-family: "??";
	font-size: 16px;
}

.STYLE13 {
	font-family: "??";
	font-size: 16px;
	color: #666666;
	font-weight: bold;
}

.STYLE14 {
	font-family: "??";
	font-size: large;
}

.STYLE15 {
	color: #FF0000
}

.STYLE16 {
	color: #99CC00
}
-->
</style>
	</head>
	<body>
		<script type="text/JavaScript">
		function clearbutton()
		{
		if (!confirm("确定要删除吗？")) return false;
		}
		</script>
		<div id="header">
			<div id="header_inner">
				<div class="STYLE16" id="slogan">
					系统管理员页面
				</div>
			</div>
		</div>

		<div id="main">

			<div id="lcol">
				<div id="menu">
					<ul>
						<li>
							<a href="createuser.jsp" class="STYLE14">增加用户</a>
						</li>
						<li>
							<a href="user?change=selectall_d">删除用户</a>
						</li>
						<li>
							<a href="user?change=selectall_u">修改用户</a>
						</li>
					</ul>
				</div>
				<div id="menu_end"></div>

				<div id="lcontent">

					<ul class="divided">
						<li class="first">
							<a href="user?change=logout" class="STYLE12">返回首页</a>
						</li>
					</ul>
				</div>
			</div>

			<div id="rcol">
				<div id="rcontent">
					<h2 class="STYLE1">
						删除用户
					</h2>
					<%
						List all = (List) request.getAttribute("all");
					%>

					<form id="form7" method="post" action="user">
						<table width="445" height="67" border="0">
							<tr>
								<td width="88" height="38">
									<div align="center">
										用户ID
									</div>
								</td>
								<td width="137">
									<div align="center">
										用户权限
									</div>
								</td>
								<td width="119">
									<div align="center">
										用户名
									</div>
								</td>
								<td width="83">&nbsp;
									
								</td>
							</tr>
							<%
								Iterator iter = all.iterator();
								while (iter.hasNext()) {
									Person person = (Person) iter.next();
							%>
							<tr>
								<td height="23"><div align="center"><%=person.getLoginid()%></div></td>
								<td><div align="center"><%=person.getPopedomname()%></div></td>
								<td><div align="center"><%=person.getUsername()%></div></td>
								<td>
									<a href="user?d_userid=<%=person.getUserid()%>&change=delete"
									onClick="return clearbutton()">删除</a>
								</td>

							</tr>
							<%
								}
							%>
						</table>
					</form>

				</div>
			</div>
		</div>

	</body>
</html>