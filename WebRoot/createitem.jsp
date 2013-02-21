<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

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
		<base href="<%=basePath%>"/>

		<title>增加栏目</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<style type="text/css">
<!--
.STYLE1 {
	color: #000000;
	font-weight: bold;
	font-size: 14px;
}

.STYLE12 {
	font-family: "??";
	font-size: 16px;
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

.STYLE21 {
	color: #000000;
	font-size: 14px;
}
-->
</style>
	</head>
	<body>
		<script type="text/JavaScript">
			function checks(){
				if(form.i_itemname.value==""){
					alert("栏目名不能为空!");
					return false;
				}
			}
			</script>
		<div id="header">
			<div id="header_inner">
				<div class="STYLE16" id="slogan">
					栏目管理员页面
				</div>
			</div>
		</div>

		<div id="main">

			<div id="lcol">
				<div id="menu">
					<ul>
						<li>
							<a href="createitem.jsp" class="STYLE14">增加栏目</a>
						</li>
						<li>
							<a href="item?change=selectall_d">删除栏目</a>
						</li>
						<li>
							<a href="item?change=selectall_u">修改栏目</a>
						</li>
						<li></li>
						<li></li>
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
					<%
						String view = null;
						if (session.getAttribute("username") == null) {
							view = (String) session.getAttribute("loginid");
						} else {
							view = (String) session.getAttribute("username");
						}
					%><h2 class="STYLE24">
						栏目管理员:<%=view%></h2>
						<p>
						</p>
					<form name="form" method="post" action="item" onsubmit="return checks()">
						<table width="439" border="0">
							<tr>
								<td width="93" height="43">
									增加栏目名
								</td>
								<td width="336">
									<label>
										<input type="text" name="i_itemname" maxlength="20" />
									<%if(request.getAttribute("flag")!=null){
									if(request.getAttribute("flag").equals(1)){ %>栏目名已存在<%}}%></label>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>
							</tr>
							<tr>
								<td height="37">
									<label>
										<input name="change" type="hidden" value="insert" />
										<input name="Submit" type="submit" class="STYLE14" value="提交" />
									</label>
								</td>
								<td>
									<input name="Submit2" type="reset" class="STYLE14" value="刷新" />
								</td>
							</tr>
						</table>
						<p class="STYLE1">
							&nbsp;
						</p>
						<p>
							<label></label>
						</p>
						<p>
							<label></label>
							<label></label>
						</p>
						<p>
							&nbsp;
						</p>
						<p>
							&nbsp;
						</p>
						<p>
							&nbsp;
						</p>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>