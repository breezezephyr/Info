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
		<title>�����޸�</title>
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
	font-size: large color :             #FF9933
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

.STYLE6 {
	font-size: large
}
-->
</style>
	</head>
	<body>
		<script type="text/JavaScript">
			function checks(){
				if(form.title.value==""){
					alert("���ⲻ��Ϊ��!")
					return false
				}
				else if(form.author.value==""){
					alert("���߲���Ϊ��!")
					return false
				}
				else if(form.content.value==""){
					alert("���ݲ���Ϊ��!")
					return false
				}
				}
			</script>

		<div id="header">
			<div id="header_inner">
				<div class="STYLE16" id="slogan">
					���ݹ���Աҳ��
				</div>
			</div>
		</div>

		<div id="main">

			<div id="lcol">
				<div id="menu">
					<ul>
						<li>
							<a href="user?change=choose">���ع���</a>
						</li>
					</ul>
				</div>
				<div id="menu_end"></div>

			</div>
			<div id="rcol">
			<form name="form" method="post" action="message" onsubmit="return checks()">
				<div id="rcontent">
					<h2 class="STYLE18">
						�޸�����
					</h2>
					<p class="STYLE18">
						&nbsp;

					</p>
					<p>
						ѡ����Ŀ����
						<select name="itemid" size="1" class="pagination">
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
							<option value="<%=Itemid%>"><%=Itemname%></option>
							<%
								}
							%>
						</select>
					</p>
					<%
						Message message = (Message) request.getAttribute("content");
					%>
					<p>
						<span class="advert STYLE6">����:</span>
						<input name="title" type="text" class="STYLE6"
							value="<%=message.getTitle()%>" size="15" maxlength="30" />
					</p>
					<p>
						<span class="advert STYLE6">����:</span>
						<input name="author" type="text" value="<%=message.getAuthor()%>"
							class="STYLE6" size="10" />
					</p>
					<p>
						<textarea name="content" cols="50" rows="10" class="STYLE6">&nbsp;&nbsp;&nbsp;&nbsp;<%=message.getContent()%></textarea>
						<input name="contentid" type="hidden"
							value="<%=message.getMessageid()%>" />
						<input name="change" type="hidden" value="update" />
						<input name="Submit" type="submit" class="pagination" value="�ύ" />
						<input name="Submit2" type="reset" class="pagination" value="ˢ��" />
					</p>
					<p class="STYLE18">
						&nbsp;

					</p>
				</div>
				</form>
			</div>
		</div>

	</body>
</html>
