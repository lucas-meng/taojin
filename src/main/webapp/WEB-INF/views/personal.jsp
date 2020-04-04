<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp" %>
<%@include file="include/mini-search.jsp" %>

<style>
    div.boughtDiv {
        max-width: 1013px;
        margin: 10px auto;
    }

    div.orderType div {
        border-bottom: 2px solid #E8E8E8;
        float: left;
    }

    div.orderType a {
        border-right: 1px solid #E8E8E8;
        display: inline-block;
        font-size: 16px;
        font-weight: bold;
        color: black;
        margin-bottom: 10px;
        padding: 0px 20px;
        text-decoration: none;
    }

    div.orderType a:hover {
        color: #FF0036;
        text-decoration: none;
    }

    div.orderType div.selectedOrderType {
        border-bottom: 2px solid #FF0036;
    }

    div.orderType div.selectedOrderType a {
        color: #FF0036;
    }

    div.orderTypeLastOne {
        overflow: hidden;
        float: none !important;
        border-bottom: 2px solid #E8E8E8;
        height: 35px;
    }

    a.noRightborder {
        border-right-width: 0px !important;
    }

    table.orderListTitleTable {
        border: 1px solid #E8E8E8;
        width: 100%;
        margin: 20px 0px;
        background-color: #F5F5F5;
        text-align: center;
        font-size: 12px;
    }

    table.orderListTitleTable td {
        padding: 12px 0px;
    }

    div.boughtDiv {
        max-width: 1013px;
        margin: 10px auto;
    }

    table.tablePersonalCenter {
        border: 2px solid #ECECEC;
        width: 100%;
        margin: 20px 0px;
        font-size: 12px;
    }


    table.orderListItemTable td {
        padding: 8px 10px;
    }

    tr.orderListItemFirstTR {
        background-color: #F1F1F1;
    }

    div.orderItemWangWangGif {
        display: inline-block;
        width: 67px;
        height: 22px;
        background-image: url(img/fore/wangwang.gif);
        background-repeat: no-repeat;
        background-color: transparent;
        background-attachment: scroll;
        background-position: -0px -0px;
        position: relative;
        top: 0px;
        left: 2px;
    }

    td.orderItemDeleteTD {
        text-align: right;
    }

    span.orderListItemDelete {
        display: inline-block;
        margin: 0px 10px;
        color: #999999;
        font-size: 16px;
    }

    div.orderListItemProductLinkOutDiv {
        position: relative;
        height: 80px;
    }

    div.orderListItemProductLinkInnerDiv {
        position: absolute;
        bottom: 0px;
    }

    div.orderListItemProductOriginalPrice {
        color: #999999;
        font-size: 14px;
    }

    div.orderListItemProductPrice {
        color: #3C3C3C;
        font-size: 14px;
    }

    td.orderListItemNumberTD {
        text-align: center;
    }

    td.orderItemOrderInfoPartTD {
        border: solid 1px #ECECEC;
    }

    span.orderListItemNumber {
        color: #3C3C3C;
    }

    td.orderListItemProductRealPriceTD {
        text-align: center;
    }

    div.orderListItemProductRealPrice {
        color: #3C3C3C;
        font-size: 14px;
        font-weight: bold;
    }

    div.orderListItemPriceWithTransport {
        color: #6C6C6C;
        font-size: 12px;
    }

    td.orderListItemButtonTD {
        text-align: center;
    }

    button.orderListItemReview {
        border: 1px solid #DCDCDC;
        background-color: #fff;
        border-radius: 2px;
        color: #3C3C3C;
        font-size: 12px;
        font-weight: bold;
        padding: 6px 12px;
    }

    button.orderListItemReview:hover {
        border-color: #C40000;
        color: #C40000;
    }

    button.orderListItemConfirm {
        background-color: #66B6FF;
        border-radius: 2px;
        color: white;
        font-size: 12px;
        font-weight: bold;
        border-width: 0px;
        padding: 6px 12px;
    }

    button.orderListItemConfirm:hover {
        background-color: #118ADB;
    }

    a {
        color: #999;
    }

    a:hover {
        text-decoration: none;
        color: #FF0036;
    }
</style>
<div class="boughtDiv">
    <div class="orderType">
        <div class="selectedOrderType"><a orderStatus="all" href="personalCenter">用户信息设置</a></div>
        <div><a href="personalAddress">收货地址管理</a></div>
        <div><a href="bought">订单详情管理</a></div>
        <div><a href="cart">购物车</a></div><div class="orderTypeLastOne"><a class="noRightborder"> </a></div>
    </div>
    <div align="center">
    	<form action="updatePersonalCenter" method="post">
	    	<table>
	    		<tr>
	    			<td align="right" height="50">会员名：</td>
	    			<td align="left"><input id="name" name="user_name" type="text" value="${user.name }" disabled="disabled" ></td>
	    		</tr>
	    		<tr><td></td><td></td></tr>
	    		<tr>
	    			<td align="right" height="50">密码：</td>
	    			<td align="left"><input id="name" name="user_pwd" placeholder="不修改请留空 " type="text"></td>
	    		</tr>
	    		<tr><td></td><td></td></tr>
	    		<tr>
	    			<td align="right" height="50">联系电话：</td>
	    			<td align="left"><input id="name" name="phone" placeholder="不修改请留空" type="text"></td>
	    		</tr>
	    		<tr><td></td><td></td></tr>
	    		<tr><td colspan="2" align="right"><button class="orderListItemConfirm" type="submit">确认修改</button></td></tr>
			
	    	</table>
	    	
    	</form>
    	
	</div>
		
</div>


<%@include file="include/footer.jsp" %>
