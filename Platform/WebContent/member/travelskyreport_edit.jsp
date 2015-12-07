<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="webwork" prefix="ww"%>
<%
/**
 * 版权所有, 允风文化
 * Author: 允风文化 项目开发组
 * copyright: 2012
 */
 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><ww:if test="travelskyreport.id>0">编辑</ww:if><ww:else>新增</ww:else>航空公司报表导入</title>

<style type="text/css">
<!--
.STYLE2 {font-size: 12}
-->
</style>
</head>
<link href="style/base.css" rel="stylesheet" />
<link href="style/text.css" rel="stylesheet" />

<body>
<div id="member">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" class="box">
  <tr>
    <td width="100%" height="29" class="box-bottom bg"><b class="anse"><span class="font-blue-cu">&nbsp;&nbsp;&nbsp;<ww:if test="travelskyreport.id>0">编辑</ww:if><ww:else>新增</ww:else>航空公司报表导入</span></b></td>
  </tr>
  <tr>
    <td  valign="top">
<form action="travelskyreport!<ww:if test="travelskyreport.id>0">edit.action?id=<ww:property value="id"/>&<ww:property value="url"/></ww:if><ww:else>add.action?<ww:property value="url"/></ww:else>" name="form1" method="POST" onSubmit="return Validator.Validate(this,3)">



<table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="100%"><table width="100%" cellpadding="0" cellspacing="0">
      <tr>
        <td width="196" height="18">&nbsp;</td>
        <td width="569">&nbsp;</td>
      </tr>
        
      
	

 
	 <tr><td height="28" align="right"><span>票号：</span></td><td><input type="text" require="true" dataType="Require"   msg="票号不能为空" name="tktnumber" value='<ww:property value="travelskyreport.tktnumber"/>'" style="width:350px" /></td>  </tr>
	
				 
 
	 <tr><td height="28" align="right"><span>行程：</span></td><td><input type="text" require="true" dataType="Require"   msg="行程不能为空" name="origsest" value='<ww:property value="travelskyreport.origsest"/>'" style="width:350px" /></td>  </tr>
	
				 
 
	 <tr><td height="28" align="right"><span>票价：</span></td><td><input type="text" require="true" dataType="Require"   msg="票价不能为空" name="ticketprice" value='<ww:property value="travelskyreport.ticketprice"/>'" style="width:350px" /></td>  </tr>
	
				 
 
	 <tr><td height="28" align="right"><span>税费：</span></td><td><input type="text" require="true" dataType="Require"   msg="税费不能为空" name="taxs" value='<ww:property value="travelskyreport.taxs"/>'" style="width:350px" /></td>  </tr>
	
				 
 
	 <tr><td height="28" align="right"><span>返点：</span></td><td><input type="text" require="true" dataType="Require"   msg="返点不能为空" name="comm" value='<ww:property value="travelskyreport.comm"/>'" style="width:350px" /></td>  </tr>
	
				 
 
	 <tr><td height="28" align="right"><span>PNR：</span></td><td><input type="text" require="true" dataType="Require"   msg="PNR不能为空" name="pnr" value='<ww:property value="travelskyreport.pnr"/>'" style="width:350px" /></td>  </tr>
	
				 
 
	 <tr><td height="28" align="right"><span>代理人：</span></td><td><input type="text" require="true" dataType="Require"   msg="代理人不能为空" name="agent" value='<ww:property value="travelskyreport.agent"/>'" style="width:350px" /></td>  </tr>
	
				 
 
	 <tr><td height="28" align="right"><span>状态：</span></td><td><input type="text" require="true" dataType="Require"   msg="状态不能为空" name="status" value='<ww:property value="travelskyreport.status"/>'" style="width:350px" /></td>  </tr>
	
				 
      
   	    
      
      <tr class="font-blue-xi">
        <td height="54" rowspan="2"> </td>
        <td height="46" scrolling="no"><input type="submit" class="button_d font-bai" value="提交"/> <input type="button" class="button_d font-bai" onclick="window.location.href='travelskyreport.action?<ww:property value="url"/>';"  name="Submit2" value=" 返回 " /> </td>
      </tr>
      <tr>
        <td height="17">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>



	

</form>
</td>
   </tr>
   </table>
</div>
</body>
</html>

