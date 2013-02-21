<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
		<title>内容管理</title>
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

.STYLE14 {
	font-family: "??";
	font-size: large;
}

.STYLE16 {
	color: #99CC00
}
.STYLE17 {color: #000000; font-weight: bold; }
-->
        </style>
	</head>
	<body>

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
                <li> <a href="createmessage.jsp" class="STYLE14">增加内容</a> </li>
                <li> <a href="message?change=selectall">修改内容</a></li>
                <li> <a
							href="user?userid=<%=session.getAttribute("userid")%>&change=selectmyid">修改自己资料</a> </li>
              </ul>
            </div>
            <div id="menu_end"></div>
            <div id="lcontent">
              <ul class="divided">
                <li class="first"> <a href="user?change=logout" class="STYLE12">返回首页</a> </li>
              </ul>
            </div>
          </div>
          <div id="rcol">
            <div id="rcontent">
              
                <%
								String view = null;
								if (session.getAttribute("username") == null) {
									view = (String) session.getAttribute("loginid");
								} else {
									view = (String) session.getAttribute("username");
								}
							%>
              
              <h2 class="STYLE1">内容撰写员：<%=view%></h2>
              <p class="STYLE1">&nbsp;</p>
            </div>
          </div>
        </div>
	</body>
</html>