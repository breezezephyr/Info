<%@ page language="java" import="java.util.*,jl.info.domain.*" pageEncoding="GBK"%>
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
		<base href="<%=basePath%>" />

		<title>�޸���Ŀ</title>
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

		<div id="header">
			<div id="header_inner">
				<div class="STYLE16" id="slogan">
					��Ŀ����Աҳ��
				</div>
			</div>
		</div>

		<div id="main">

			<div id="lcol">
				<div id="menu">
					<ul>
						<li>
							<a href="createitem.jsp" class="STYLE14">������Ŀ</a>
						</li>
						<li>
							<a href="ditem?change=selectall_d">ɾ����Ŀ</a>
						</li>
						<li>
							<a href="ditem?change=selectall_u">�޸���Ŀ</a>
						</li>
					</ul>
				</div>
				<div id="menu_end"></div>

				<div id="lcontent">
					<h3 class="first">&nbsp;
						

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
					<h2 class="STYLE21">
						<strong>�޸���Ŀ</strong>
				  </h2>
					<%
						List all = (List) request.getAttribute("all");
					%>


					<table width="210"  border="0" align="center">
					<%
								Iterator iter = all.iterator();
								while (iter.hasNext()) {
									Item item = (Item) iter.next();

									String Itemid = item.getItemid();
									String Itemname = item.getItemname();
							%>
						<tr>
							<td width="89">
								<div align="center">��Ŀ��:</div>	</td>	
							
							<td width="120" bordercolor="#000000">
								<div align="left" class="STYLE15"><span class="highlight">
								<a href="item?u_itemid=<%=Itemid %>&change=selectid" class="success"><%=Itemname%></a>
                                </span></div>							</td>
						</tr>
						<%
							}
						%>
					</table>
					<p>
						<label></label>
					</p>
					<p>
						<label></label>
						<label></label>
					</p>

				</div>
			</div>
		</div>

	</body>
</html>
