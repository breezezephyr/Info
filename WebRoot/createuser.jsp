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
		<meta http-equiv="content-type"
			content="text/html; charset=GBK" />
		<title>添加用户</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<style type="text/css">
<!--
.STYLE1 {
	color: #000000
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

.STYLE18 {
	color: #FF0000;
	font-weight: bold;
}

.STYLE19 {
	color: #00FFFF
}
-->
</style>
	</head>
	<body>
<script type="text/JavaScript">
		function checks(){
			if(form.loginid.value==""){
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
				alert("确认密码不能为空!")
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
						添加用户
					</h2>
					<form name="form" method="post" action="user" onsubmit="return checks()">
						<table width="442" height="277" border="0" bordercolor="#999999">
							<tr>
								<td width="91" height="38" bordercolor="#FFFFFF">
									<span class="STYLE13">用户ID:</span>
								</td>
								<td width="341" bordercolor="#FFFFFF">
									<label>
										<input name="loginid" type="text" size="15" />
									</label>
									<span class="STYLE18"> *<%
									if(request.getAttribute("flag")!=null){
									if(request.getAttribute("flag").equals(1)){ %>用户名已经存在<%}} %></span>
								</td>
							</tr>
							<tr>
								<td height="55" bordercolor="#FFFFFF">
									<span class="STYLE13">密码:</span>
								</td>
								<td bordercolor="#FFFFFF">
									<input name="userpwd" type="password" size="20" />
									<label>
									</label>
									<span class="STYLE18"> *</span>
								</td>
							</tr>
							<tr>
								<td height="37" bordercolor="#FFFFFF">
									<span class="STYLE13">确定密码:</span>
								</td>
								<td bordercolor="#FFFFFF">
									<input name="reuserpwd" type="password" size="20" />
									<label>
									</label>
									<span class="STYLE18"> *</span>
								</td>
							</tr>
							<tr>
								<td height="48" bordercolor="#FFFFFF">
									<span class="STYLE13">用户权限:</span>
								</td>
								<td bordercolor="#FFFFFF">
									<select name="popedom">
										<option value="01">
											系统管理员
										</option>
										<option value="02">
											栏目管理员
										</option>
										<option value="03">
											内容撰写员
										</option>
									</select>
									<label>
									</label>
									<span class="STYLE18"> *</span>
								</td>
							</tr>
							<tr>
								<td height="41" bordercolor="#FFFFFF">

									<div align="right">
										<input name="change" type="hidden" value="insert" />
										<input name="Submit" type="submit" class="STYLE13" value="提交" />
									</div>
								</td>
								<td bordercolor="#FFFFFF">
									<input name="Submit2" type="reset" class="STYLE13" value="刷新" />
								</td>
							</tr>
						</table>
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