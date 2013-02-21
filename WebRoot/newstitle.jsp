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

.STYLE14 {
	font-family: "??";
	font-size: large;
}
.STYLE13 {
	font-family: "宋体";
	font-size: xx-large;
	font-weight: bold;
}
.STYLE19 {color: #000000; font-size: 12; }
.STYLE22 {font-family: "宋体"; font-size: 24px; }
-->
        </style>
	</head>
	<body>

		<div id="header">
		  <div id="header_inner"></div>
		</div>

        <div id="main">
          <div id="lcol">
            <div id="menu">
              <ul>
                <li> <a href="index.jsp" class="STYLE14">返回首页</a> </li>
              </ul>
            </div>
            <div id="menu_end"></div>
          </div>
          <div id="rcol">
            <div id="rcontent">
              <h2 class="STYLE1">
    
              </h2>
              <table width="611" border="0">
              
              <%
              					String keywords = request.getParameter("keywords");
								List allcontent = (List) request.getAttribute("contentall");
								int i = 0;
								Iterator it = allcontent.iterator();
								while (it.hasNext()) {
									Message message = (Message) it.next();
									String id = message.getMessageid();
									String title = message.getTitle();
									String author = message.getAuthor();
									String date = message.getInfodate();
									if (keywords != null) {
									// 需要将数据返红
									title = title.replaceAll(keywords, "<font color=\"red\">"
											+ keywords + "</font>");
									author = author.replaceAll(keywords, "<font color=\"red\">"
											+ keywords + "</font>");

								}
							%>
					
                <tr>
                  <td><div align="left"><span class="STYLE19">标题：<a href="message?d_messageid=<%=id%>&change=selectid"><%=message.getTitle()%></a></span></div></td>
                  <td>&nbsp;</td>
                </tr>
                <tr>
                  <td width="284"><div align="left"><span class="STYLE19">作者：<%=message.getAuthor() %></span></div></td>
                  <td width="317"><span class="STYLE19">发布时间：<%=message.getInfodate() %></span></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                
                <%} %>
              </table>
              
              <p align="center" class="STYLE1">&nbsp;</p>
              <p align="center" class="STYLE1">&nbsp;&nbsp;</p>
              
            </div>
          </div>
        </div>
	</body>
</html>