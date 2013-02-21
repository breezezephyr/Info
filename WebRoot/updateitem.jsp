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

		<title>修改栏目</title>
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
				if(form.u_Itemname.value==""){
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
						<strong>修改栏目</strong>
					</p>
			<form name="form" method="post" action="item" onsubmit="return checks()">		
			<table width="452" height="134" border="0">
					<%
						Item item = (Item) request.getAttribute("item");
						String itemid = item.getItemid();
						String itemname = item.getItemname();
					%>
					
						<tr>
							<td width="89">
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
							<td width="120" bordercolor="#000000">
								<div align="left" class="STYLE15">
									<span class="highlight"> <input name="u_Itemname"
											type="text" value="<%=itemname%>" class="success" size="20"
											maxlength="20" /></span>
								</div>
							</td>
							<td width="108" bordercolor="#000000" class="STYLE5">
								<div align="center" class="STYLE15">
									<input name="u_Itemid" type="hidden" value="<%=itemid%>"/>
									<input name="change" type="hidden" value="update"/>
									<input name="submit" type="submit" 
										value="提交" />
								</div>
							</td>	
						</tr>
				</table>
				</form>
				</div>
			</div>
		</div>

	</body>
</html>

