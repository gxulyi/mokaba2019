<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>

<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
</head>
<body>
<div class="admin-sidebar">
    <ul class="am-list admin-sidebar-list">
    <c:forEach items="${listUserMenu }" var="menu">
      <c:choose>
        <c:when test="${empty menu.listMenu_subordinate}">
          <c:set var="urlLength" value="${fn:length(menu.menu_url) }"/>
          <li><a href="${fn:substring(menu.menu_url, 1, urlLength)}"><span class="${menu.menu_style } am-icon-home"></span>${menu.menu_name }&nbsp;&nbsp;</a> </li>
        </c:when>
         <c:otherwise>
          <li class="${menu.menu_style }admin-parent">
           <a class="am-cf" data-am-collapse="{target: '#${menu.menu_id }'}"><span class="am-icon-file"></span>&nbsp;&nbsp;${menu.menu_name }<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
           <ul class="am-list am-collapse admin-sidebar-sub " id="${menu.menu_id }">
            <c:forEach items="${menu.listMenu_subordinate }" var="menu2">
              <c:set var="urlLength2" value="${fn:length(menu2.menu_url) }"/>
              <li><a href="${fn:substring(menu2.menu_url, 1, urlLength)}" class="${menu2.menu_style }am-cf">${menu2.menu_name }</a></li>
            </c:forEach>
           </ul>
          </li>
        </c:otherwise>
      </c:choose>
    </c:forEach>
    </ul>
    
	<!--  
    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-bookmark"></span> 公告</p>
        <p>时光静好，与君语；细水流年，与君同。—— Amaze</p>
      </div>
    </div>

    <div class="am-panel am-panel-default admin-sidebar-panel">
      <div class="am-panel-bd">
        <p><span class="am-icon-tag"></span> wiki</p>
        <p>Welcome to the Amaze</p>
      </div>
    </div>
    -->
  </div>
</body>
</html>
  