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

		<title>栏目管理</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<style type="text/css">
<!--

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
.STYLE22 {color: #FF0000}
-->
        </style>
	</head>
	<body>
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
						<li>
							<a
								href="user?change=selectmyid&userid=<%=session.getAttribute("userid")%>">修改自己资料</a>
						</li>
					</ul>
				</div>
				<div id="menu_end"></div>

				<div id="lcontent">
					<h3 class="first">&nbsp;
						
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
				  <div align="center" class="STYLE22">请谨慎操作！				  </div>
				</div>
			</div>
		</div>

	</body>
</html>