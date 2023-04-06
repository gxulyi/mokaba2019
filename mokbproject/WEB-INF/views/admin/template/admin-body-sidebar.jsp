<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<base>
<script type="text/javascript" src="js/jquery-1.7.1.js"></script>
</head>
<body>
<div class="admin-sidebar">
    <ul class="am-list admin-sidebar-list">
    <li><a href="admin/index"><span class="am-icon-home"></span>&nbsp;&nbsp;首页</a> </li>
     <li><a href="admin_integr/toRefusingToMakeMoney"><span class="am-icon-file"></span>&nbsp;&nbsp;打款申请</a> </li>
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#store'}"><span class="am-icon-file"></span>&nbsp;&nbsp;商城管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="store">
          <li><a href="admin_store/toFindStore" class="am-cf">商品增删</a></li>
          <li><a href="admin_order/find">${name1}订单管理</a></li>
          <li><a href="admin_order/adminSendOrder" class="am-cf">发货</a></li>
        </ul>
      </li>
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#collapse-nav1'}"><span class="am-icon-file"></span>&nbsp;&nbsp;会员信息<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="collapse-nav1">
          <li><a href="admin_user/toUserGradeIndex">会员等级</a></li>
          <li><a href="admin_user/index" class="am-cf">会员管理</a></li>
          <li><a href="admin_user/toFindTeamInformation" class="am-cf"><span class=""></span>团队资料</a></li>
          <li><a href="admin_expert/iframeAddExpert" class="am-cf">添加专家</a></li>
          <li><a href="admin_expert/toAdminFindExpert" class="am-cf">查看专家</a></li>
        </ul>
      </li>
      
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#collapse-nav2'}"><span class="am-icon-file"></span>&nbsp;&nbsp;交易流水<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="collapse-nav2">
          <li><a href="admin_integr/toAdminCapitalAccount" class="am-cf">购买记录</a></li>
          <li><a href="admin_integr/toAdminFindTradingFlow">提现记录</a></li>
          <li><a href="admin_integr/toAdminFindIntegr">积分记录</a></li>
          <li><a href="invoice/toInvoice">发票索取</a></li>
        </ul>
      </li>
      
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#apply'}"><span class="am-icon-file"></span>&nbsp;&nbsp;积分兑换审核<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="apply">
          <!-- 
          <li><a href="admin_integr/toBonusExtractApply" class="am-cf">奖金提现申请</a></li>
           -->
           <li><a href="admin_integr/toBonusExtractApply">奖金兑换申请</a></li>
          
        </ul>
      </li>
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#news'}"><span class="am-icon-file"></span> 首页功能管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="news">
        <li><a href="admin_news/toAddNews">新增</a></li>
        <li><a href="admin_news/toFindnews">知识</a></li>
        <li><a href="admin_news/toFindDynamic">动态</a></li>
        <li><a href="admin_news/toFindFunds">基金</a></li>
        <li><a href="admin_news/toFindEssence">精华</a></li>
        <li><a href="admin_news/toFindViews">视频</a></li>
        </ul>
      </li> 
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target:'#examine'}"><span class="am-icon-file"></span>&nbsp;&nbsp;审核管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="examine">
        <li><a href="admin_examine/toAdminExamineAdd">首页功能新增审核</a></li>
        <li><a href="admin_examine/toAdminExFindNews">首页功能评论审核</a></li>
        <li><a href="admin_examine/toAdminExamineByStatus">新增商品审核</a></li>
        <li><a href="admin_examine/toAdminExStoreEvl">商品评论审核</a></li>
        <li><a href="admin_examine/toAdminFindViews">视频评论审核</a></li>
        <li><a href="admin_examine/toAdminExSugesstion">意见审核</a></li>
        <li><a href="admin_company/tofindCompanyBasics">公司审核</a></li>
        <li><a href="admin_examine/toAdminExSowing">app轮播图审核</a></li>
        <li><a href="admin_examine/toAdminExBankManage">银行管理审核</a></li>
         <li><a href="admin_examine/toAdminExExpertConsult">专家咨询审核</a></li>
        </ul>
      </li> 
      
     <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#kdsjf'}"><span class="am-icon-file"></span>&nbsp;&nbsp;微信回复管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="kdsjf">
          <li><a href="weixinAdminController/iframeAutoReturn" class="am-cf">自动回复列表</a></li>
          <li><a href="weixinAdminController/iframeAddAutoReturn">新增自动回复</a></li>
          <li><a href="weixinAdminController/iframeCompanyProfile" class="am-cf">公司简介列表</a></li>
          <li><a href="weixinAdminController/iframeAddCompanyProfile">新增公司简介</a></li>
          <li><a href="weixinAdminController/iframeWebpageList" class="am-cf"><span class=""></span>消息管理</a></li>
          <li><a href="weixinAdminController/iframeAddCompanyProfile">新建消息</a></li>
        </ul>
      </li>
      
      
       <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#kdsjf12'}"><span class="am-icon-file"></span>&nbsp;&nbsp;轮播图管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="kdsjf12">
          <li><a href="weixinAdminController/iframeCarouselFigure" class="am-cf">轮播图列表</a></li>
          <li><a href="weixinAdminController/iframeAddCarouselFigure">新增轮播图</a></li>
          <li><a href="admin_sowing/toAdminFindSowing">app轮播图列表</a></li>
        </ul>
      </li>
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#kdsjf12'}"><span class="am-icon-file"></span>&nbsp;&nbsp;销售管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="kdsjf12">
          <li><a href="sale_gold/findGoldPool" class="am-cf">奖金池</a></li>
        </ul>
      </li>
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#collapse-nav3'}"><span class="am-icon-file"></span>&nbsp;&nbsp;服务系统<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="collapse-nav3">
          <li><a href="admin_personal/toFindPersonalSver" class="am-cf">查询服务</a></li>
          <li><a href="admin_personal/toFindPersonalType">查询服务方式</a></li>
          <li><a href="admin_personal/toFindPersonalMode">查询服务类型</a></li>
          <li><a href="admin_personal/iframePersonalSverBag">新增服务包</a></li>
        </ul>
      </li>
      
      
     <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#pagestructure'}"><span class="am-icon-file"></span> 页面菜单结构 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="pagestructure">
          <li><a href="adminPageStructure/menu" class="am-cf"><span class=""></span>后台页面菜单栏<span class=""></span></a></li>
          <li><a href="admin_personal/toFindPersonalType"><span class=""></span> 微信端页面</a></li>
          <li><a href="admin_personal/toFindPersonalMode"><span class=""></span> pc端页面</a></li>
          <li><a href="admin_personal/toAddPersonalSverBag"><span class=""></span> app页面</a></li>
        </ul>
      </li>
       
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#filiale'}"><span class="am-icon-file"></span>&nbsp;&nbsp;企业管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="filiale">
          <li><a href="admin_company/adminAddCompany" class="am-cf">添加公司</a></li>
          <li><a href="admin_company/toCompanyBasicsDetails" class="am-cf">公司详情</a></li>
          <li><a href="admin_company/toAdminAddCoFounder" class="am-cf">添加品牌大使</a></li>
        </ul>
      </li>
      
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#suggest'}"><span class="am-icon-file"></span>&nbsp;&nbsp;意见反馈管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
      	<ul class="am-list am-collapse admin-sidebar-sub " id="suggest">
          <li><a href="admin_opinion/toAdminSugFindByStatus" class="am-cf">意见反馈列表</a></li>
        </ul>
      </li>
      
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#protocol'}"><span class="am-icon-file"></span>&nbsp;&nbsp;协议管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
      	<ul class="am-list am-collapse admin-sidebar-sub " id="protocol">
          <li><a href="admin_protocol/toAdminFindProtocol" class="am-cf">协议列表</a></li>
        </ul>
      </li>
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#real'}"><span class="am-icon-file"></span>&nbsp;&nbsp;用户个人资料<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="real">
          <li><a href="admin_user/toFindInformation" class="am-cf"><span class=""></span>基本资料</a></li>
          <li><a href="admin_bank/toAdminFindBank">银行卡</a></li>
          <li><a href="admin_bankManage/toAdminFindBankManage">银行管理</a></li>
        </ul>
      </li>
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target:'#privilege'}"><span class="am-icon-file"></span>&nbsp;&nbsp;权限管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
        <ul class="am-list am-collapse admin-sidebar-sub " id="privilege">
        <!-- <li><a href="admin_privilege/toUser">用户权限设置</a></li> -->
        <li><a href="admin_privilege/toAdministrative">管理组权限</a></li>
        <li><a href="admin_privilege/toPrivilegeGroupIndex">权限接口组</a></li>
        <li><a href="admin_privilege/toPrivilegeIndex">权限接口</a></li>
        <li><a href="operation_log/toFindAllOperationLog">用户操作日志</a></li>
       </ul>
      </li> 
      <li class="admin-parent">
        <a class="am-cf" data-am-collapse="{target: '#consult'}"><span class="am-icon-file"></span>&nbsp;&nbsp;专家咨询管理<span class="am-icon-angle-right am-fr am-margin-right"></span></a>
      	<ul class="am-list am-collapse admin-sidebar-sub " id="consult">
          <li><a href="admin_expertConsult/toAdminFindExpertConsult" class="am-cf">专家咨询列表</a></li>
        </ul>
      </li>
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
  