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
		<title>����û�</title>
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
				alert("�û�������Ϊ��!")
				return false
			}
			else if(form.userpwd.value==""){
				alert("���벻��Ϊ��!")
				return false
			}
			else if(form.userpwd.value.length<6){
			   alert("����Ҫ����6λ��")
			   return false
		 	}
			else if(form.reuserpwd.value==""){
				alert("ȷ�����벻��Ϊ��!")
				return false
			}
			else if(form.userpwd.value!=form.reuserpwd.value){
				alert("����������������,����������!")
				return false
			}
		}
	</script>
		<div id="header">
			<div id="header_inner">
				<div class="STYLE16" id="slogan">
					ϵͳ����Աҳ��
				</div>
			</div>
		</div>

		<div id="main">

			<div id="lcol">
				<div id="menu">
					<ul>
						<li>
							<a href="createuser.jsp" class="STYLE14">�����û�</a>
						</li>
						<li>
							<a href="user?change=selectall_d">ɾ���û�</a>
						</li>
						<li>
							<a href="user?change=selectall_u">�޸��û�</a>
						</li>
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
						����û�
					</h2>
					<form name="form" method="post" action="user" onsubmit="return checks()">
						<table width="442" height="277" border="0" bordercolor="#999999">
							<tr>
								<td width="91" height="38" bordercolor="#FFFFFF">
									<span class="STYLE13">�û�ID:</span>
								</td>
								<td width="341" bordercolor="#FFFFFF">
									<label>
										<input name="loginid" type="text" size="15" />
									</label>
									<span class="STYLE18"> *<%
									if(request.getAttribute("flag")!=null){
									if(request.getAttribute("flag").equals(1)){ %>�û����Ѿ�����<%}} %></span>
								</td>
							</tr>
							<tr>
								<td height="55" bordercolor="#FFFFFF">
									<span class="STYLE13">����:</span>
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
									<span class="STYLE13">ȷ������:</span>
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
									<span class="STYLE13">�û�Ȩ��:</span>
								</td>
								<td bordercolor="#FFFFFF">
									<select name="popedom">
										<option value="01">
											ϵͳ����Ա
										</option>
										<option value="02">
											��Ŀ����Ա
										</option>
										<option value="03">
											����׫дԱ
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
										<input name="Submit" type="submit" class="STYLE13" value="�ύ" />
									</div>
								</td>
								<td bordercolor="#FFFFFF">
									<input name="Submit2" type="reset" class="STYLE13" value="ˢ��" />
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