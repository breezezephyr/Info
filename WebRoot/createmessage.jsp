<%@ page language="java" import="java.util.*,jl.info.dao.*,jl.info.domain.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
		<title>�������</title>
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
				if(form.i_title.value==""){
					alert("���ⲻ��Ϊ��!")
					return false
				}
				else if(form.i_author.value==""){
					alert("���߲���Ϊ��!")
					return false
				}
				else if(form.i_content.value==""){
					alert("���ݲ���Ϊ��!")
					return false
				}
			}
			</script>
		<div id="header">
			<div id="header_inner">
				<div class="STYLE16" id="slogan">
					����׫дԱҳ��				</div>
			</div>
		</div>

		<div id="main">

			<div id="lcol">
				<div id="menu">
					<ul>
						<li>
							<a href="createmessage.jsp" class="STYLE14">��������</a>						</li>
						<li>
						<a href="message?change=selectall">�޸�����</a></li>
					</ul>
				</div>
				<div id="menu_end"></div>

				<div id="lcontent">

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
						�������
					</h2>
					<form name="form" method="post" action="message" onsubmit="return checks()">
						<table width="342" border="1" align="center">
								<tr>
									<td width="107">
										<div align="center">
											<span class="highlight"><strong>��Ŀ����</strong>��</span>
										</div>
									</td>
									<td width="225">
										<label>
											<select name="itemid" size="1" class="highlight">
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
												<option value=<%=Itemid%>><%=Itemname%></option>

												<%
													}
												%>
											</select>
										</label>
									</td>
								</tr>
								<tr>
									<td width="107">
										<div align="center">
											<span class="highlight"><strong>���ű���</strong>��</span>
										</div>
									</td>
									<td width="225">
										<span class="highlight"> <input name="i_title"
												type="text" size="30" maxlength="30"/> </span>
									</td>
								</tr>
								<tr>
									<td width="107">
										<div align="center">
											<span class="highlight"><strong>��&nbsp;&nbsp;&nbsp;&nbsp;��</strong>��</span>
										</div>
									</td>
									<td width="225">
										<span class="highlight"> <input name="i_author"
												type="text" size="30" maxlength="20"/> </span>
									</td>
								</tr>
								<tr>
									<td>
										<div align="center">
											<strong class="highlight">��&nbsp;&nbsp;&nbsp;&nbsp;�ݣ�</strong>
										</div>
									</td>
									<td>
										<label>
											<textarea name="i_content" cols="30" rows="20"
												class="highlight"></textarea>
										</label>
									</td>
								</tr>
								<tr>
									<td>
										<div align="right">
											<input name="submit" type="submit" class="pagination"
												value="�ύ"/>
										</div>
									</td>
									<td>
										<input name="reset" type="reset" class="pagination" value="ˢ��"/>
										<input name="change" type="hidden" value="insert"/>
									</td>
								</tr>
							</table>
							</form>
						<p>
							<label>
								<span class="STYLE13"><br /> </span>
							</label>
						</p>
					
				</div>
			</div>
		</div>
	</body>
</html>