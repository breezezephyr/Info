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
		<title>修改用户</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<style type="text/css">
<!--
.STYLE1 {
	color: #00FFCC
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

.STYLE16 {
	color: #99CC00
}

.STYLE17 {
	color: #00FFFF
}

.STYLE18 {
	color: #000066;
}
-->
</style>
	</head>
	<body>
		<script language="javascript">
			function checks(){
			if(form.loginname.value==""){
				alert("用户名不能为空!")
				return false
			}
			else if(form.userpwd.value==""){
				alert("密码不能为空!")
				return false
			}
			else if(form.userpwd.value.length<6){
			   alert("密码要大于6位！")
			   return false
		 	}
			else if(form.reuserpwd.value==""){
				alert("重复密码不能为空!")
				return false
			}
			else if(form.userpwd.value!=form.reuserpwd.value){
				alert("两次输入密码有误,请重新输入!")
				return false
			}
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
							<a href="createuser.jsp" class="STYLE8">增加用户 </a>
						</li>
						<li>
							<a href="user?change=selectall_d">删除用户</a>
						</li>
						<li>
							<a href="user?change=selectall_u">修改用户</a>
						</li>
						<li>
							<a
								href="user?change=selectmyid&userid=<%=session.getAttribute("userid")%>">修改管理员</a>
						</li>
					</ul>
				</div>
				<div id="menu_end"></div>

				<div id="lcontent">
					<h3 class="first">
						&nbsp;

					</h3>
					<ul class="divided">
						<li class="first">
							<a href="user?change=logout" class="STYLE12">返回首页</a>
						</li>
					</ul>
				</div>
			</div>
			<div id="rcol">
				<div id="rcontent">
					<h2 class="STYLE18">
						修改用户资料
					</h2>
					<%
						List all = (List) request.getAttribute("all");
					%>

					<form name="form" method="post" action="user">
						<table width="445" height="67" border="0">
							<tr>
								<td width="88" height="38">
									<div align="center">
										用户ID
									</div>
								</td>
								<td width="137">
									<div align="center">
										权限名
									</div>
								</td>
								<td width="119">
									<div align="center">
										姓名
									</div>
								</td>
								<td width="83">
									&nbsp;

								</td>
							</tr>
							<%
								Iterator iter = all.iterator();
								while (iter.hasNext()) {
									Person person = (Person) iter.next();
							%>
							<tr>
								<td height="23">
									<div align="center"><%=person.getLoginid()%></div>
								</td>
								<td>
									<div align="center"><%=person.getPopedomname()%></div>
								</td>
								<td>
									<div align="center"><%=person.getUsername()%></div>
								</td>
								<td>
									<a href="user?userid=<%=person.getUserid()%>&change=selectid">修改</a>
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