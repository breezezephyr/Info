<%@ page language="java" import="java.util.*,jl.info.domain.*"
	pageEncoding="GBK"%>
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
	<script type="text/JavaScript">
		function checkall(){
			if(form.uo_loginid.value==""){
				alert("用户ID不能为空！");
				return false;	
			}
			else if(form.userpwd.value==""||form.uo_userpwd.value==""){
				alert("密码不能为空！");
				return false;	
			}
			else if(form.userpwd.value.length<6){
			   alert("密码要大于6位！");
			   return false;
		 	}
			else if(form.userpwd.value!=form.uo_userpwd.value){
				alert("两次输入的密码有误，请重新输入！");
				return false;
			}
		}
	</script>
		<meta http-equiv="content-type"
			content="text/html; charset=GBK" />
		<title>修改用户详细资料</title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" type="text/css" href="css/default.css" />
		<style type="text/css">
<!--

.STYLE12 {
	font-family: "??";
	font-size: 16px;
}

.STYLE16 {
	color: #99CC00
}

.STYLE17 {
	color: #00FFFF
}
.STYLE19 {color: #FF0000}
-->
        </style>
	</head>
	<body>
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
							<a href="createuser.jsp" class="STYLE8">增加用户</a>
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
					<h3 class="first">&nbsp;
						

					</h3>
					<ul class="divided">
						<li class="first">
							<a href="user?change=logout" class="STYLE12">返回首页</a>
						</li>
					</ul>
				</div>
			</div>

<%
			Person person = (Person)request.getAttribute("person") ;
			if(person != null)
			{
				String uo_userid = person.getUserid();
				String uo_loginid = person.getLoginid() ;
				String uo_username = person.getUsername();
				String uo_sex = person.getSex();
				int uo_age = person.getAge();
				String uo_email = person.getEmail();
				
			%>
			<div id="rcol">
			<form name="form" method="post" action="user" onsubmit="return checkall()">
				<table width="342" border="0" align="center">
				  <tr>
                    <td width="132"><span class="highlight"><strong>用户名：</strong></span></td>
                    <td width="200"><table width="144" border="1" bordercolor="#999999">
                        <tr>
                          <td><div align="center" class="success"><%=uo_username%></div></td>
                        </tr>
                    </table></td>
                  </tr>
				  <tr>
                    <td width="132"><span class="highlight"><strong>性别：</strong></span></td>
                    <td width="200"><table width="144" border="1" bordercolor="#999999">
                        <tr>
                          <td><div align="center" class="success"><%=uo_sex%></div></td>
                        </tr>
                    </table></td>
                  </tr>
				  <tr>
                    <td width="132"><span class="highlight"><strong>年龄：</strong></span></td>
                    <td width="200"><table width="144" border="1" bordercolor="#999999">
                        <tr>
                          <td><div align="center" class="success"><%=uo_age%></div></td>
                        </tr>
                    </table></td>
                  </tr>
				  <tr>
                    <td width="137"><span class="highlight"><strong>E-MAIL：</strong></span></td>
                    <td width="195"><table width="144" border="1" bordercolor="#999999">
                        <tr>
                          <td><div align="center" class="success"><%=uo_email%></div></td>
                        </tr>
                      </table></td>
                  </tr>
                  <tr>
                    <td width="132"><span class="highlight"><strong>用户ID：</strong><%if(request.getAttribute("flag")!=null){
									if(request.getAttribute("flag").equals(1)){ %>用户ID已存在<%}} %></span></td>
                    <td width="200"><span class="highlight">
                      <input name="uo_loginid" type="text" class="success" size="20" maxlength="6" value="<%=uo_loginid%>"/>
                    </span><span class="advert STYLE19">*</span></td>
                  </tr>
                  <tr>
                    <td><strong class="highlight">新密码
		            ：</strong></td>
                    <td><input name="userpwd" type="password" class="success" size="20" />
                      <span class="advert STYLE19">*</span></td>
                  </tr>
                  <tr>
                    <td><strong class="highlight">密码确认：</strong></td>
                    <td><input name="uo_userpwd" type="password" class="success" size="20"/>
                      <span class="advert STYLE19">*</span></td>
                  </tr>
                  <tr>
                    <td><strong class="highlight">用户权限：</strong></td>
                    <td><span class="highlight"><strong>
                      <select name="uo_popedom" size="1" class="advert">
                        <option value="01" selected>系统管理员</option>
                        <option value="02">栏目维护员</option>
                        <option value="03">内容撰写员</option>
                      </select>
                    </strong></span><span class="advert STYLE19">*</span></td>
                  </tr>
                  <tr>
                    <td>
                      <div align="right">
                      	<input name="uo_userid" type="hidden" value="<%=uo_userid%>"/>
                      	<input name="change" type="hidden" value="updateOther"/>
                        <input name="submit" type="submit" class="pagination" value="提交"/>
                      </div></td>
                    <td><input name="reset" type="reset" class="pagination" value="重置"/></td>
                  </tr>
              </table>
				</form>
			</div>
		</div>
		<%
			}
		%>
	</body>
</html>