<%@ page language="java" import="jl.info.domain.*" pageEncoding="GBK"%>
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
		<meta http-equiv="content-type"
			content="text/html; charset=GBK" />
		<title>�޸Ĺ���������</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<style type="text/css">
<!--

.STYLE16 {
	color: #99CC00
}

.STYLE18 {
	color: #000066;
}
.STYLE19 {color: #FF0000}
-->
        </style>
	</head>
	<body>
		<script type="text/JavaScript">
		function checkall(){
			if(form3.username.value==""){ 
				alert("��������Ϊ��!");
				return false ;
			}
			else if(form3.userpwd1.value==""){
				alert("ԭʼ���벻��Ϊ�գ�"); 
				return false;
			}
			else if(form3.userpwd1.value!=form3.userpwd2.value){
				alert("ԭʼ�������벻��ȷ!") ;
				return false;
			}
			else if(form3.userpwd3.value==""||form3.userpwd4.value==""){
				alert("���벻��Ϊ�գ�");
				return false;	
			}
			else if(form3.userpwd3.value.length<6){
			   alert("����Ҫ����6λ��");
			   return false;
		 	}
			else if(form3.userpwd3.value!=form3.userpwd4.value){
				alert("��������������������������룡");
				return false;
			}
		}
	</script>
		<div id="header">
			<div id="header_inner">
				<div class="STYLE16" id="slogan">
					�޸Ĺ���Ա����ҳ��
				</div>
			</div>
		</div>

		<div id="main">

			<div id="lcol">
				<div id="menu">
					<ul>
						<li class="first">
							<a href="user?change=choose">���ع���</a>
						</li>
						<li>
							<a href="user?change=logout">�˳�����</a>
						</li>
					</ul>
				</div>
				<div id="rcol">
					<div id="rcontent">
						<h2 class="STYLE18">
							�޸Ĺ���������
						</h2>
						<%
							Person person = (Person) request.getAttribute("person");
							if (person != null) {
								String userid = person.getUserid();
								String username = person.getUsername();
								int age = person.getAge();
								String email = person.getEmail();
						%>
						<form name="form3" method="post" action="user"
							onsubmit="return checkall()">
							<table width="342" border="0" align="center">
								<tr>
									<td>
										<strong class="highlight">ԭʼ���룺</strong>									</td>
									<td>
									  <div align="left">
											<input name="userpwd1" type="password" class="success"
												size="20" id="userpwd1" />
										  <span class="advert STYLE19">*</span>
										  <input name="userpwd2" type="hidden" maxlength="20"
												value=<%=session.getAttribute("userpassword")%>
												id="userpwd2" />
</div>									</td>
								</tr>
								<tr>
									<td>
										<strong class="highlight">�����룺</strong>									</td>
									<td>
										<div align="left">
											<input name="userpwd3" type="password" class="success"
												size="20" maxlength="20" id="userpwd3" />
											<span class="advert STYLE19">*</span>										</div>									</td>
								</tr>
								<tr>
									<td>
										<strong class="highlight">����ȷ�ϣ�</strong>									</td>
									<td>
										<div align="left">
											<input name="userpwd4" type="password" class="success"
												size="20" maxlength="20" id="userpwd4" />
											<span class="advert STYLE19">*</span>										</div>									</td>
								</tr>
								<tr>
									<td width="103">
										<span class="highlight"><strong>�û�������</strong></span>									</td>
									<td width="229">
										<div align="left">
											<div align="left">
												<span class="highlight"> <input name="username"
														value=<%=username%> type="text" class="success" size="20"
														maxlength="10" id="username" /> </span><span class="highlight">
												</span>											</div>									</td>
								</tr>
								<tr>
									<td width="103">
										<span class="highlight"><strong>�Ա�</strong></span>									</td>
									<td width="229">
										<table width="140" border="0" class="success">
											<tr>
												<td width="43">
													<label>
														<div align="center">
															��														</div>
													</label>												</td>
												<td width="20">
													<input name="usersex" type="radio" value="��" checked />												</td>
												<td width="39">
													<div align="center">
														Ů													</div>												</td>
												<td width="20">
													<input type="radio" name="usersex" value="Ů" />												</td>
											</tr>
										</table>									</td>
								</tr>
								<tr>
									<td width="103">
										<span class="highlight"><strong>���䣺</strong></span>									</td>
									<td width="229">
										<span class="highlight"> <input name="userage"
												value=<%=age%> type="text" class="success" size="20"
												maxlength="6" /> </span>									</td>
								</tr>
								<tr>
									<td width="103">
										<span class="highlight"><strong>E-MAIL��</strong></span>									</td>
									<td width="229">
										<span class="highlight"> <input name="usermail"
												value=<%=email%> type="text" class="success" size="20"
												maxlength="6" /> </span>									</td>
								</tr>
								<tr>
									<td>
										<div align="right">
											<input name="userid" type="hidden" value=<%=userid%> />

											<input name="change" type="hidden" value="updateMyself" />
											<input name="Submit" type="submit" class="pagination"
												value="�ύ" />
										</div>									</td>
									<td>
										<input name="reset" type="reset" class="pagination" value="ˢ��" />									</td>
								</tr>
							</table>
						</form>
						&nbsp;
						<%
							}
						%>
					</div>
				</div>
			</div>
	</body>
</html>