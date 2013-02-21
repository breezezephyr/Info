<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--

	curiously.green1.0 by nodethirtythree design
	http://www.nodethirtythree.com
	hope you enjoy it :)

-->
<html>

	<head>
		<meta http-equiv="content-type" content="text/html; charset=GBK" />
		<title>操作成功</title>
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

.STYLE17 {
	color: #00FFFF
}

.STYLE18 {
	color: #FF0000;
}

.STYLE19 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
	</head>
	<body>

		<div id="header">
			<div id="header_inner"></div>
		</div>

		<div id="main">
			<div id="rcol">
				<div id="rcontent">
					<tr>
						<%
							if (session.getAttribute("userpopedom").equals("01")) {
						%>
						<td height="102" align=left valign="middle" bordercolor="#ECE9D8">
							<p class="success">
								<span class="STYLE23"><font class=red_3>操作成功，2秒后返回</font>
								</span>
							</p>
							<p align="right" class="success">
								<span class="STYLE17"><font class=red_3>
									<br class="STYLE21"/>
								</font>
								</span><span class="STYLE16">如果没有跳转，请点击<a
									href="user.jsp">这里</a><span class="STYLE17">
										<%
											response.setHeader("refresh", "2;URL=user.jsp");
										%> </span>
								</span>
							</p>
						</td>
						<%
							} else if (session.getAttribute("userpopedom").equals("02")) {
						%>
						<td height="102" align=left valign="middle" bordercolor="#ECE9D8">
							<p class="success">
								<span class="STYLE23"><font class=red_3>操作成功，2秒后返回</font>
								</span>
							</p>
							<p align="right" class="success">
								<span class="STYLE17"><font class=red_3>
									<br class="STYLE21"/>
								</font>
								</span><span class="STYLE16">如果没有跳转，请点击<a
									href="item.jsp">这里</a><span class="STYLE17">
										<%
											response.setHeader("refresh", "2;URL=item.jsp");
										%> </span>
								</span>
							</p>
						</td>
						<%
							} else if (session.getAttribute("userpopedom").equals("03")) {
						%>
						<td height="102" align=left valign="middle" bordercolor="#ECE9D8">
							<p class="success">
								<span class="STYLE23"><font class=red_3>操作成功，2秒后返回</font>
								</span>
							</p>
							<p align="right" class="success">
								<span class="STYLE17"><font class=red_3>
									<br class="STYLE21"/>
								</font>
								</span><span class="STYLE16">如果没有跳转，请点击<a
									href="message.jsp">这里</a><span class="STYLE17">
										<%
											response.setHeader("refresh", "2;URL=message.jsp");
										%> </span>
								</span>
							</p>
						</td>
						<%
							}
						%>
					</tr>
				</div>
			</div>
		</div>
	</body>
</html>