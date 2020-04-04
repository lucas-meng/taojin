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

    table.orderListItemTable {
        border: 2px solid #ECECEC;
        width: 100%;
        margin: 20px 0px;
        font-size: 12px;
    }

    table.orderListItemTable:hover {
        border: 2px solid #aaa !important;
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

<script>
    var deleteOrder = false;
    var deleteOrderid = 0;

    $(function () {
        $("a[orderStatus]").click(function () {
            var orderStatus = $(this).attr("orderStatus");
            if ('all' == orderStatus) {
                $("table[orderStatus]").show();
            }
            else {
                $("table[orderStatus]").hide();
                $("table[orderStatus=" + orderStatus + "]").show();
            }

            $("div.orderType div").removeClass("selectedOrderType");
            $(this).parent("div").addClass("selectedOrderType");
        });

        $("a.deleteOrderLink").click(function () {
            deleteOrderid = $(this).attr("oid");
            deleteOrder = false;
            $("#deleteConfirmModal").modal("show");
        });

        $("button.deleteConfirmButton").click(function () {
            deleteOrder = true;
            $("#deleteConfirmModal").modal('hide');
        });

        $('#deleteConfirmModal').on('hidden.bs.modal', function (e) {
            if (deleteOrder) {
                var page = "deleteOrder";
                $.post(
                    page,
                    {"order_id": deleteOrderid},
                    function (result) {
                        if ("success" == result) {
                            $("table.orderListItemTable[oid=" + deleteOrderid + "]").hide();
                        }
                        else {
                            location.href = "login.jsp";
                        }
                    }
                );

            }
        })

        $(".ask2delivery").click(function () {
            var link = $(this).attr("link");
            $(this).hide();
            page = link;
            $.ajax({
                url: page,
                success: function (result) {
                    alert("卖家已秒发，刷新当前页面，即可进行确认收货")
                }
            });

        });
    });

</script>

<div class="boughtDiv">
    <div class="orderType">
        <div><a orderStatus="all" href="personalCenter">用户信息设置</a></div>
        <div class="selectedOrderType"><a href="personalAddress">收货地址管理</a></div>
        <div><a href="bought">订单详情管理</a></div>
        <div><a href="cart">购物车</a></div><div class="orderTypeLastOne"><a class="noRightborder"> </a></div>
    </div>
    <div style="clear:both"></div>
    <div class="orderListTitle">
        <table class="orderListTitleTable">
            <tr>
            	<td width="2%">编号</td>
                <td width="10%">收货人</td>
                <td>地址</td>
                <td width="20%">电话</td>
                <td width="20%">操作</td>
            </tr>
        </table>

    </div>

    <div class="orderListItem">
    	<c:forEach items="${listAddress }" var="address">
            <table class="orderListItemTable">
                <tr class="orderListItemFirstTR">
                	<td width="2%">
                        <span id="address_id">${address.id }</span>
                    </td>
                    <td width="10%">
                        <b>${address.name }</b>
                    </td>
                    <td>${address.address }</td>
                    <td width="20%">
                    	<b>${address.phone }</b>
                    </td>
                    <td class="orderItemDeleteTD" width="20%">
                        <a class="deleteOrderLink" href="delAddress?id=${address.id }">
                            <span class="orderListItemDelete glyphicon glyphicon-trash"></span>
                        </a>
                    </td>
                </tr>
            </table>
		</c:forEach>
	<div align="right">
        <a href="addAddress"><button class="orderListItemConfirm" style="font-size: 13px;">增 加 收 货 地 址</button></a>
    </div>
    </div>

</div>


<%@include file="include/footer.jsp" %>
