<%@ page language="java" import="java.util.*,jl.info.domain.*"
	pageEncoding="GBK"%>
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

		<title>删除栏目</title>
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
		function clearbutton() { if (!confirm("确定要删除吗？")) return false; }
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
					<h2 class="STYLE21">
						&nbsp;
					</h2>
					<p>
						<label></label>
						<strong>删除栏目</strong>
					</p>
					<%
						List all = (List) request.getAttribute("all");
					%>


					<table width="452" height="134" border="0">
						<tr>
							<td width="89">
								<div align="center">
									栏目序号
								</div>
							</td>
							<td width="241">
								<div align="center">
									栏目名
								</div>
							</td>
							<td width="108">
								<div align="center">
									操作
								</div>
							</td>
						</tr>
						<tr>
							<%
								int i = 0;
								Iterator iter = all.iterator();
								while (iter.hasNext()) {
									Item item = (Item) iter.next();

									String Itemid = item.getItemid();
									String Itemname = item.getItemname();
									String Itemintroduce = item.getItemintroduce();
									i++;
							%>
							<td width="120" bordercolor="#000000">
								<div align="center" class="STYLE15"><%=i%></div>
							</td>

							<td width="241" bordercolor="#000000">
								<div align="center" class="STYLE15"><%=Itemname%></div>
							</td>

							<td width="108" bordercolor="#000000" class="STYLE5">
								<div align="center" class="STYLE15">
									<a href="item?d_itemid=<%=Itemid%>&change=delete"
										onClick="return clearbutton()" class="STYLE15">删除</a>
								</div>
							</td>
						</tr>
						<%
							}
						%>


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

				</div>
			</div>
		</div>

	</body>
</html>
