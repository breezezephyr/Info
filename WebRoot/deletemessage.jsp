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
		<base href="<%=basePath%>" />
		<meta http-equiv="content-type" content="text/html; charset=GBK" />
		<title>内容</title>
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

.STYLE9 {
	font-size: large color :             #FF9933
}

.STYLE11 {
	color: #0000FF;
	font-size: large;
	font-weight: bold;
}

.STYLE24 {
	color: #FF9933
}

.STYLE25 {
	color: #FF0000;
	font-size: large;
	font-weight: bold;
}

.STYLE26 {
	color: #FF0000
}
-->
</style>
	</head>
	<body>
		<script type="text/JavaScript">
			function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function clearbutton()
{
if (!confirm("确定要删除吗？")) return false;
}
			</script>
		<div id="header">
			<div id="header_inner">
				<div class="STYLE16" id="slogan">
					内容撰写员页面
				</div>
			</div>
		</div>

		<div id="main">

			<div id="lcol">
				<div id="menu">
					<ul>
						<li>
							<a href="createmessage.jsp" class="STYLE14">增加内容</a>						</li>
						<li>
						<a href="message?change=selectall">修改内容</a></li>
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
						修改内容
					</h2>
					<form name="form" method="post" action="message">
						<span class="STYLE9">请选择栏目名称：</span>
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
							<option value="message?itemid=<%=Itemid%>&amp;change=selectall"><%=Itemname%></option>
							<%
								}
							%>
						</select>
					</form>
					<table width="477" border="0" align="left">
						<tr>
							<td width="44">
								<div align="center" class="STYLE1">
									序号								</div>							</td>
							<td width="63">
								<div align="center" class="STYLE1">
									作者								</div>							</td>
							<td width="182">
								<div align="center" class="STYLE1">
									标题								</div>							</td>
							<td width="117">
								<div align="center" class="STYLE1">
									发布日期								</div>							</td>
							<td width="49">
							<div align="center" class="STYLE26"></div>							</td>
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
							<div align="center" class="STYLE25"><%=i%>								</div>							</td>
							<td width="63">
							<div align="center" class="STYLE26"><%=author%></div>							</td>
							<td width="182">
								<div align="center" class="STYLE24">
									<a href="message?d_messageid=<%=id%>&amp;change=selectid"><%=title%></a>								</div>							</td>
							<td width="117">
							<div align="center" class="STYLE26"><%=date%>								</div>							</td>
							<td width="49">
								<div align="center" class="STYLE11">
									<a href="message?d_messageid=<%=id%>&amp;change=delete"
										onclick="return clearbutton()"> 删除 </a>								</div>							</td>
						</tr>
						<%
							}
						%>
					</table>
					<p>
						<label>
							<span class="STYLE13"><br /> <br /> <br /> </span>
						</label>
					</p>
				</div>
			</div>
		</div>
	</body>
</html>