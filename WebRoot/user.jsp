<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
		<meta http-equiv="content-type"
			content="text/html; charset=GBK" />
		<title>����Աҳ��</title>
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

		<div id="header">
			<div id="header_inner">
				<div class="STYLE16" id="slogan">
					ϵͳ����Աҳ��
				</div>
			</div>
		</div>

		<div id="main">

			<div id="lcol">
				<div id="menu">
					<ul>
						<li>
							<a href="createuser.jsp" class="STYLE14">�����û�</a>
						</li>
						<li>
							<a href="user?change=selectall_d">ɾ���û�</a>
						</li>
						<li>
							<a href="user?change=selectall_u">�޸��û�</a>
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
							<a href="user?change=logout" class="STYLE12">������ҳ</a>
						</li>
					</ul>
				</div>
			</div>

			<div id="rcol">
				<div id="rcontent">
					<h2 class="STYLE1">
						&nbsp;
					</h2>
					<form id="form7" method="post" action="user">
						<div align="center">
							�����������
						</div>
						<p>
							<label>
								<span class="STYLE13"><br /> </span>
							</label>
						</p>

					</form>
				</div>
			</div>
		</div>
	</body>
</html>