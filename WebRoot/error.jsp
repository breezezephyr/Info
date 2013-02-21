<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<base href="<%=basePath%>">

		<title>操作出错</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link href="css/defaulterror.css" rel="stylesheet" type="text/css"
			media="screen" />
	</head>
	<body>
		<!-- start header -->
		<div id="header">
			<div id="logo">
				<h1>&nbsp;
					
				</h1>
			</div>
			<div id="menu">
			</div>
		</div>
		<!-- end header -->
		<hr />
		<!-- start page -->
		<div id="page">
			<!-- start content -->
			<div id="content">
				<div class="post">
					
					<tr>
						<%
							String userpopedom = (String) session.getAttribute("userpopedom");
							if (userpopedom != null) {
								if (userpopedom.equals("01")) {
						%>
						<td align=left valign="middle" bordercolor="#ECE9D8">
							<p class="highlight">
								<span class="STYLE18"><font class=highlight>&nbsp;&nbsp;</font>
									</span><span class="STYLE23"><font class=highlight> 操作失败， 2秒后返回人员管理界面</font>如果没有跳转请点击
								<a href="user.jsp" class="STYLE26">这里</a></span><span
									class="STYLE18"> 
									<%
									response.setHeader("refresh",
 					               "2;URL=user.jsp");
                            		} else if (userpopedom.equals("02")) {
                                    %>
									<td align=left valign="middle" bordercolor="#ECE9D8">
										<p class="highlight">
											<span class="STYLE18"><font class=highlight>&nbsp;&nbsp;</font>
											</span><span class="STYLE23"><font class=highlight>操作失败，2秒后返回栏目管理界面</font>如果没有跳转请点击
											<a href="item.jsp" class="STYLE26">这里</a></span><span
												class="STYLE18">
												<%
 	                                            response.setHeader("refresh",
 					                            "2;URL=item.jsp");
 		                                        } else if (userpopedom.equals("03")) {
                                                %>
												<td align=left valign="middle" bordercolor="#ECE9D8">
													<p class="highlight">
														<span class="STYLE18"><font class=highlight>&nbsp;&nbsp;</font>
														</span><span class="STYLE23"><font class=highlight>操作失败，2秒后返回内容管理界面</font>如果没有跳转请点击
														<a href="message.jsp" class="STYLE26">这里</a></span><span
															class="STYLE18"> 
															<%
														 	response.setHeader("refresh",
														 					"2;URL=message.jsp");
														 		}
														 	} else {
                                                             %>
															<td align=left valign="middle" bordercolor="#ECE9D8">
																<p class="highlight">
																	<span class="STYLE18"><font class=highlight>&nbsp;&nbsp;</font>
																	</span><span class="STYLE23"><font class=highlight>用户名或密码错误，2秒后将自动返回</font>如果没有跳转请点击
																	<a	href="index.jsp" class="STYLE26">这里</a></span><span
																		class="STYLE18"> 
																		<%
																		 	response.setHeader("refresh", "2;URL=index.jsp");
																		 	}
																		 %> </span>
																</p>
															</td>
					</tr>
					<div class="bgbottom" style="clear: both;"></div>
				</div>
				<div id="contentbar">
				</div>
			</div>
			<!-- end content -->
			<!-- start sidebar -->
			<div id="sidebar">
				<ul>
					<li id="search" class="widget widget_search">
						<form id="searchform" method="get" action="">
							<a href="index.jsp">返回主页</a>
						</form>
					</li>
				</ul>
			</div>
			<!-- end sidebar -->
		</div>
		<!-- end page -->
		<hr />
		<!-- start footer -->
		<!-- end footer -->
	</body>
</html>

