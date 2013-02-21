<%@ page language="java"
	import="java.util.*,jl.info.dao.*,jl.info.domain.*" pageEncoding="GBK"%>
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
		<meta http-equiv="content-type"
			content="text/html; charset=iso-8859-1" />
		<title>修改内容</title>
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

.STYLE9 {
	font-size: large color :           #FF9933
}

.STYLE11 {
	color: #0000FF;
	font-size: large;
	font-weight: bold;
}

.STYLE19 {
	color: #FF9933
}

.STYLE20 {
	color: #FF0000;
	font-size: large;
	font-weight: bold;
}

.STYLE15 {
	color: #000000;
}

.STYLE21 {
	color: #FF0000
}
-->
</style>

	</head>
	<body>

		<div id="header">
			<div id="header_inner">
				<div class="STYLE16" id="slogan">
					内容管理员页面
				</div>
			</div>
		</div>

		<div id="main">

			<div id="lcol">
				<div id="menu">
					<ul>
						<li>
							<a href="message.jsp">返回管理</a>
						</li>
					</ul>
				</div>
				<div id="menu_end"></div>

			</div>
			<div id="rcol">
				<div id="rcontent">
					<h2 class="STYLE18">
						修改内容
					</h2>
					<p class="STYLE18">
						&nbsp;
					</p>
					<form name="form" method="post" action="message">
						<label>
							<span class="STYLE9">选择栏目名称</span>
							<select name="itemname" size="1" class="pagination"
								onchange="MM_jumpMenu('parent',this,0)">
								<option>
									栏目名称
								</option>
								<%
									try {
										ItemDAO itemDAO = new ItemDAO();
										request.setAttribute("all", itemDAO.queryAll());
									} catch (Exception e) {
										e.printStackTrace();
									}

									List all = (List) request.getAttribute("all");
									Iterator iter = all.iterator();
									while (iter.hasNext()) {
										Item item = (Item) iter.next();
										String Itemid = item.getItemid();
										String Itemname = item.getItemname();
								%>
								<option
									value="message?u_itemid=<%=Itemid%>&amp;change=selectid"><%=Itemname%></option>
								<%
									}
								%>
							</select>
						</label>
					</form>
					<table width="627" border="0" align="left">
						<tr>
							<td width="44">
								<div align="center" class="STYLE15">
									序号
								</div>
							</td>
							<td width="74">
								<div align="center" class="STYLE15">
									作者
								</div>
							</td>
							<td width="261">
								<div align="center" class="STYLE15">
									标题
								</div>
							</td>
							<td width="165">
								<div align="center" class="STYLE15">
									发布日期
								</div>
							</td>
							<td width="61">
								<div align="center" class="STYLE21"></div>
							</td>
						</tr>
						<tr>
							<%
								List allcontent = (List) request.getAttribute("contentall");
								int i = 0;
								Iterator it = allcontent.iterator();
								while (it.hasNext()) {
									Message message = (Message) it.next();
									String id = message.getMessageid();
									String title = message.getTitle();
									String author = message.getAuthor();
									String date = message.getInfodate();
									i++;
							%>
							<td width="44">
								<div align="center" class="STYLE20"><%=i%>
								</div>
							</td>
							<td width="74">
								<div align="center" class="STYLE21"><%=author%></div>
							</td>
							<td width="261">
								<div align="center" class="STYLE19">
									<a href="message?u_messageid=<%=id%>&amp;change=selectid"><%=title%></a>
								</div>
							</td>
							<td width="165">
								<div align="center" class="STYLE21"><%=date%>
								</div>
							</td>
							<td width="61">
								<a href="message?u_messageid=<%=id%>&amp;change=update">
									<div align="center" class="STYLE11">
										修改
									</div> </a>
							</td>
						</tr>
						<%
							}
						%>
					</table>
					<p class="STYLE18">
						&nbsp;
					</p>
				</div>
			</div>
		</div>

	</body>
</html>
