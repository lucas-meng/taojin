<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
	String pay_id=request.getParameter("pay_id");
	String param=request.getParameter("param"); 
	float money=Float.parseFloat(request.getParameter("money")); 
	if(param.equals("tj.jsp")){ 
		response.sendRedirect("payed?order_id="+pay_id+"&total="+money);
	}else{
		out.print("支付失败！");
	}
%>