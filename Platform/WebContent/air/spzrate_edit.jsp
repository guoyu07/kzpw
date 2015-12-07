<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="webwork" prefix="ww"%>
<%
/**
 * 版权所有, 允风文化
 * Author: 允风文化 项目开发组
 * copyright: 2012
 */ 
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="style/text.css" rel="stylesheet" type="text/css" />
<link href="style/base.css" rel="stylesheet" />
<link href="style/CommonX.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="js/jquery1.3.2.js"></script>
</head>

<body style="font-family: tahoma;">
<div id="member">
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	align="center" class="box">
	<tr>

	<td width="100%" height="26"  class="box-bottom bg" >
    <span class="font-blue-cu" style="display: block; float: left;">&nbsp;&nbsp;&nbsp;添加特价政策</span>
       
    </td>
	
	</tr>
	<tr>
		<td valign="top">
		<form
			action="spzrate!<ww:if test="spzrate.id>0">edit.action?id=<ww:property value="id"/>&<ww:property value="url"/></ww:if><ww:else>add.action?<ww:property value="url"/></ww:else>"
			name="form1" method="post" onsubmit="return form_validate()"
			enctype="multipart/form-data">

		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			align="center">

			<tr>
				<td valign="top">
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">

					<tr>
						<td valign="top">
						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="100%" valign="top">
								<table width="100%" border="0" cellspacing="0" cellpadding="0"
									style="line-height: 28px;">
									<tr>
										<td colspan="2" align="left" valign="top"><div class="main_04">
										<div class="tab_bg">
										<input type="hidden" value="0" name="spzratetype" id="s_spzratetype"/>
										<ul class="tab01">
											<li><a <ww:if test="spzrate.zratetype!=null&&spzrate.zratetype>0">class="btn_2"</ww:if><ww:else>class="btn_01"</ww:else> id="tab1"
												href="javascript:changespzrate(0)" cursor="pointer" hidefocus
												generate>出港政策</a></li>
											<li><a <ww:if test="spzrate.zratetype!=null&&spzrate.zratetype>0">class="btn_01"</ww:if><ww:else>class="btn_2"</ww:else> id="tab2" href="javascript:changespzrate(1)"
												cursor="pointer" hidefocus generate>入港政策</a></li>
										</ul>
										</div>
										</div>
								
										<div class="level3_list">
										<div class="level3_list_list">
										<table width="100%" border="0" cellpadding="0" cellspacing="1"
											bgcolor="#99ccff">
											<!--DWLayoutTable-->
											<tr>
												<td width="10%" class="level3_textright"><span
													class="integrant"></span>航空公司</td>
												<td width="40%"><select id="aircompanycode"
													style="width: 230px;" name="aircompanycode" onchange="showcabin()">
													<ww:iterator value="listAircompany">
														<option value="<ww:property value="aircomcode"/>"
															<ww:if test="spzrate.aircompanycode==aircomcode">selected="selected"</ww:if>>
															<ww:property value="aircomcode" /><ww:property
															value="aircomcnname" /></option>
													</ww:iterator>
												</select></td>
												<td width="10%" class="level3_textright"><span
													class="integrant"></span>行程类型</td>
												<td width="40%"><input id="rbtSingle"
													class="radio_input" type="radio"
													<ww:if test="spzrate.traveltype==1||spzrate.traveltype==null">checked="checked"</ww:if>
													value="1" name="traveltype" generate />单程&nbsp; <input
													id="rbtSingleOrTrip" class="radio_input" type="radio"
													style="vertical-align: middle;" value="2" name="traveltype"
													<ww:if test="spzrate.traveltype==2">checked="checked"</ww:if>
													generate />单程/往返&nbsp; <input id="rbtTrip"
													class="radio_input" style="vertical-align: middle;"
													type="radio" value="3" name="traveltype"
													<ww:if test="spzrate.traveltype==3">checked="checked"</ww:if>
													generate />往返&nbsp; <input id="rbtMulti"
													class="radio_input" style="vertical-align: middle;"
													type="radio" value="4" name="traveltype"
													<ww:if test="spzrate.traveltype==4">checked="checked"</ww:if>
													generate />联程</td>
											</tr>
											<!--  <tr>
												<td class="level3_textright"><span class="integrant"></span>利润方式
												</td>
												<td><input name="outpattern" id="outpattern"
													type="radio" class="radio_input"
													style="vertical-align: middle;" value="0"
													<ww:if test="spzrate.outpattern==\"0\"||spzrate.outpattern==null">checked="checked"</ww:if> />
												<label>留点</label> <input name="outpattern" id="outpattern"
													type="radio" class="radio_input"
													style="vertical-align: middle;" value="1"
													<ww:if test="spzrate.outpattern==\"1\"">checked="checked"</ww:if> /><label>留钱</label></td>
												<td class="level3_textright"><span class="integrant"></span>留点/留钱
												</td>
												<td><input id="s_keepnum" style="width: 120px"
													maxlength="6" name="s_keepnum"
													value="<ww:property value="s_keepnum"/>" /><span id="s_keepnumstr" class="font-red">*</span></td>
											</tr>
											-->

											<tr>
												<td height="30" class="level3_textright"><span
													class="integrant"></span>政策类型</td>
												<td valign="top"><input id="BentiBSP"
													class="radio_input" type="radio" checked="checked"
													value="1" name="tickettype"
													<ww:if test="spzrate.tickettype==1||spzrate.tickettype==null">checked="checked"</ww:if>
													generate /><label for="BentiBSP">BSP政策</label> <input
													id="BentiB2B" class="radio_input" type="radio" value="2"
													name="tickettype"
													<ww:if test="spzrate.tickettype==2">checked="checked"</ww:if>
													generate /><label for="BentiB2B">B2B政策</label> 
												</td>
												<td height="30" class="level3_textright">	
													是否自动出票<br/>是否需转换记录</td>
												<td><input id="BentiBSP"
													class="radio_input" type="radio" checked="checked"
													value="1" name="isauto"
													<ww:if test="spzrate.isauto==1||spzrate.isauto==null">checked="checked"</ww:if>
													generate /><label for="BentiBSP">是</label> <input
													id="BentiB2B" class="radio_input" type="radio" value="2"
													name="isauto"
													<ww:if test="spzrate.isauto==2">checked="checked"</ww:if>
													generate /><label for="BentiB2B">否</label><br/>
												<input id="BentiBSP"
													class="radio_input" type="radio" checked="checked"
													value="1" name="ischange"
													<ww:if test="spzrate.ischange==1||spzrate.ischange==null">checked="checked"</ww:if>
													generate /><label for="BentiBSP">是</label> <input
													id="BentiB2B" class="radio_input" type="radio" value="2"
													name="ischange"
													<ww:if test="spzrate.ischange==2">checked="checked"</ww:if>
													generate /><label for="BentiB2B">否</label>
												</td>
											</tr>

										</table>
										</div>
										</div>
										<div class="level3_list">
										<div class="level3_list_list">
										<table width="100%" border="0" cellpadding="0" cellspacing="1"
											bgcolor="#99ccff">
											<tr>
												<td width="10%" class="level3_textright"><span
													class="integrant"></span><span id="fromCity"><ww:if test="spzrate.zratetype!=null&&spzrate.zratetype>0">到达</ww:if><ww:else>出发</ww:else>城市</span>
												</td>
												<td colspan="2" valign="middle"><select
													name="departureport">
													<ww:iterator value="listCityairport">
														<option value="<ww:property value="airportcode"/>"
															<ww:if test="spzrate.departureport==airportcode">selected="selected"</ww:if>>
															<ww:property value="SubString(airportcode,1)" /> <ww:property value="cityname" /> <ww:property value="airportcode" /></option>
													</ww:iterator>
												</select><!--<input type="checkbox"
											id="chkShare" class="radio_input" generate /><label
											for="chkShare">同城机场共享此政策</label> -->
											</tr>
											<tr>
												<td class="level3_textright"><span class="integrant"></span><span id="toCity"><ww:if test="spzrate.zratetype!=null&&spzrate.zratetype>0">出发</ww:if><ww:else>到达</ww:else>城市</span></td>
												<td>
												<table style="font-size: 9pt" cellspacing="0"
													cellpadding="0" border="0">
													<tr>
														<td style="width: 100%" colspan="3"><input
															style="width: 364px" id="arrivalport" name="arrivalport"
															value="<ww:property value="spzrate.arrivalport"/>" /><span id="arrivalportstr" class="font-red">*</span>
														</td>
													</tr>
													<tr>
														<td><select style="width: 140px" multiple="multiple"
															size="8" id="fb_list" name="fb_list"></select></td>
														<td style="padding-right: 5px; padding-left: 5px"><input
															type="button" value="&lt;&lt;添加" id="btnAdd"
															class="button_h font-red" /> <br />
														<br />
														<br />
														<input type="button" value="删除&gt;&gt;" id="btnDel"
															class="button_h font-red" /></td>
														<td><select name="citylist" id="citylist" size="8"
															style="width: 140px;" multiple="multiple">
															<ww:iterator value="listCityairport">
																<option value="<ww:property value="airportcode"/>"
																	<ww:if test="spzrate.arrivalport==airportcode">selected="selected"</ww:if>>
																	<ww:property value="SubString(airportcode,1)" /> <ww:property value="cityname" /> <ww:property value="airportcode" /></option>
															</ww:iterator>
														</select></td>
													</tr>
												</table>
												</td>
												<td width="485"><span class="STYLE2">以下两种方式您可任选一种录入方式。<br />
												1、您可在横向输入框中直接录入城市三字码,多个城市请用“/”分隔。如“CTU/PEK”；<br />
												2、您也可以在横向输入框下面的右选择框中选中相应城市双击或单击“&lt;&lt;添加”<br />
												把选中的城市添加到左边列表框中，当您要删除到达城市时，在左边列表中选择要删除的城市，点击“删除&gt;&gt;”即可；<br />
												小技巧：当您删除或添加多个城市时；请按&quot;Crtl&quot;不放，然后选择您要删除或添加的城市，点击“添加”或“删除”按钮</span></td>
											</tr>
											<!--<tr>
										<td class="level3_textright">班期限制</td>
										<td colspan="2" id="weeks" generate><input
											id="chklWeek_1" value="1" class="radio_input" type="checkbox"
											checked="checked" generate /><label for="chklWeek_1">周一</label>
										<input id="chklWeek_2" value="2" class="radio_input"
											type="checkbox" checked="checked" generate /><label
											for="chklWeek_2">周二</label> <input id="chklWeek_3" value="3"
											class="radio_input" type="checkbox" checked="checked"
											generate /><label for="chklWeek_3">周三</label> <input
											id="chklWeek_4" value="4" class="radio_input" type="checkbox"
											checked="checked" generate /><label for="chklWeek_4">周四</label>
										<input id="chklWeek_5" value="5" class="radio_input"
											type="checkbox" checked="checked" generate /><label
											for="chklWeek_5">周五</label> <input id="chklWeek_6" value="6"
											class="radio_input" type="checkbox" checked="checked"
											generate /><label for="chklWeek_6">周六</label> <input
											id="chklWeek_7" value="7" class="radio_input" type="checkbox"
											checked="checked" generate /><label for="chklWeek_7">周日</label>&nbsp;&nbsp;&nbsp;&nbsp;<span
											class="STYLE2">不选择将默认为全选.功能尚未实现</span></td>
									</tr>
								-->
										</table>
										</div>
										</div>
										<div class="level3_list">
										<div class="level3_list_list">
										<table width="100%" border="0" cellpadding="0" cellspacing="1"
											bgcolor="#99ccff">
											<!--DWLayoutTable-->
											<tr>
												<td width="10%" class="level3_textright"><span class="integrant"></span>政策适用航班</td>
												<td><input id="type" type="radio" class="radio_input"
													value="0" name="type" onclick="flightnumbercheck(true)"
													<ww:if test="spzrate.type==0||spzrate.type==null">checked="checked"</ww:if> />适用所有航班
												<input id="type" class="radio_input" type="radio" value="1"
													name="type" onclick="flightnumbercheck(false)"
													<ww:if test="spzrate.type==1">checked="checked"</ww:if> />仅适用于以下航班
												<input id="type" class="radio_input" type="radio" value="2"
													name="type" onclick="flightnumbercheck(false)"
													<ww:if test="spzrate.type==2">checked="checked"</ww:if> />不适用于以下航班<br />
												航班号: <input id=s_flightnumber type="text" size="40"
													<ww:if test="spzrate.type==0||spzrate.type==null">disabled="disabled"</ww:if> name="s_flightnumber"
													value="<ww:property value="s_flightnumber"/>" /><span id="s_flightnumberstr" class="font-red">*</span> <span
													class="STYLE2">航班号只能为数字多航班输入请用&quot;/&quot;隔开,如：15825/12456</span>
												</td>
											</tr>
											<tr>
												<td class="level3_textright"><span class="integrant"></span>舱位码</td>
												<td><input id="id_cabincode" style="width: 200px" name="cabincode"
													value="<ww:property value="spzrate.cabincode"/>" /><span id="cabincodestr" class="font-red">*如果不包含哪个舱位请手动删除</span>
											</tr>
											<tr>
												<td class="level3_textright"><span class="integrant"></span>有效日期</td>
												<td><input id="s_begindate" type="text" size="13"
													class="edate" value="<ww:property value="s_begindate"/>"
													readonly="true" name="s_begindate" onClick="WdatePicker()" />
												- <input id="s_enddate" type="text" size="13"
													class="edate" value="<ww:property value="s_enddate"/>"
													readonly="true" name="s_enddate" onClick="WdatePicker()" />
												<span class="STYLE2">在此时间范围内起飞的航班才适用本政策</span><span id="s_begindatestr" class="font-red">*</span></td>
											</tr>
											<tr>
												<td class="level3_textright"><span class="integrant"></span>出票日期
												</td>
												<td><input id="s_issuedstartdate" type="text" size="13"
													class="edate"
													value="<ww:property value="s_issuedstartdate"/>"
													readonly="true" name="s_issuedstartdate"
													onClick="WdatePicker()" /> - <input id="s_issuedendate"
													type="text" size="13" class="edate"
													value="<ww:property value="s_issuedendate"/>"
													readonly="true" name="s_issuedendate"
													onClick="WdatePicker()" /> <span class="STYLE2">在此时间范围内出票的航班才适用本政策</span><span id="s_issuedstartdatestr" class="font-red">*</span></td>
											</tr>
										</table>
										</div>
										</div>
										<div class="level3_list">
										<div class="level3_list_list">
										<table width="100%" border="0" cellpadding="0" cellspacing="1"
											bgcolor="#99ccff">
											<!--DWLayoutTable-->
											<tr>
												<td width="10%" class="level3_textright"><span class="integrant"></span>返点</td>
												<td>本地分销政策 <input id="ratevalue" name="ratevalue"
													style="width: 100px"
													value="<ww:property value="spzrate.ratevalue"/>" /><span id="ratevaluestr" class="font-red">*</span>
												平台政策 <input id="localspzrate" name="localspzrate"
													style="width: 100px"
													value="<ww:property value="spzrate.localspzrate"/>" />&nbsp;
													加返 <input id="addratevalue" name="addratevalue"
													style="width: 100px"
													value="<ww:property value="spzrate.addratevalue"/>" />&nbsp;	
													<span
													class="STYLE2"></span>
												</td>
											</tr>
											<tr>
												<td class="level3_textright">业务组别<span class="integrant"></span></td>
												<td><input name="general" id="general" type="radio"
													class="radio_input" value="1"
													<ww:if test="spzrate.general==1||spzrate.general==null">checked="checked"</ww:if> />
												<label>普通</label> <input name="general" id="general"
													type="radio" class="radio_input" value="0"
													<ww:if test="spzrate.general==0">checked="checked"</ww:if> /><label>特殊</label>
												</td>
											</tr>
											<tr>
												<td class="level3_textright">付款方式<span class="integrant"></span></td>
												<td><input name="poll"  type="radio"
													class="radio_input" value="0"
													<ww:if test="spzrate.poll==0||spzrate.poll==null">checked="checked"</ww:if> />
												<label>见舱销售</label> <input name="poll" 
													type="radio" class="radio_input" value="1"
													<ww:if test="spzrate.poll==1">checked="checked"</ww:if> /><label>需审核</label>
													<input name="poll" 
													type="radio" class="radio_input" value="2"
													<ww:if test="spzrate.poll==2">checked="checked"</ww:if> /><label>需申请</label>
												</td>
											</tr>
											
											<tr>
												<td class="level3_textright">备注<span class="integrant"></span></td>
												<td><textarea id="remark" rows="5" cols="100" name="remark"><ww:property
													value="spzrate.remark" /></textarea><span id="remarkstr" class="font-red">*</span></td>
											</tr>
										</table>
										</div>
										</div>
										<div class="level3_list_list" align="center"><br />
										<!--		<img src="../images/cp17.gif" width="130" height="32" border="0" alt="保存信息" class="hand" id="btnSave" generate/>&nbsp;&nbsp;&nbsp;&nbsp;
		<img src="../images/cp12.gif" width="130" height="32" border="0" alt="返回列表" class="hand" id="btnBack" generate/>-->
										<input type="submit" name="button" class="button_d font-white"
											style="margin-right: 40px;" value="提&nbsp;交" /> <input
											type="button" onclick="javascript:window.history.go(-1)"
											class="button_d font-white" name="button2" value="返&nbsp;回" />
										<br />
										</div>
										</td>
									</tr>

								</table>
								</td>
							</tr>
						</table>
						</td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		</form>
		</td>
	</tr>
</table>
</div>
</body>
</html>
<script type="text/javascript">
<!--适用类型单选框-->
function flightnumbercheck(flag)
{
	document.getElementById("s_flightnumber").disabled=flag;
} 
function   goSave(){ 
var   length   =   document.form1.fb_list.options.length; 
var   optionObjs   =   document.form1.fb_list.options; 
var   ids= ""; 
for(i=0;i <length-1;i++){ 
ids   +=optionObjs[i].value+ "/"; 
} 
if(length>0)
{
ids+=optionObjs[length-1].value;
}else
{
ids="";
}
document.getElementById("arrivalport").value=ids;
} 
$(function(){
　　$("#btnAdd").click(function(){
　　　　　　　if($("#citylist option:selected").length>0)
　　　　　　　{
　　　　　　　　　　　$("#citylist option:selected").each(function(){
　　　　　　　　　　　　　　$("#fb_list").append("<option value='"+$(this).val()+"'>"+$(this).text()+"</option");
　　　　　　　　　　　　　　$(this).remove();　
　　　　　　　　　　　})
　　　　　　　}
　　　　　　　else
　　　　　　　{
　　　　　　　　　　　alert("请选择要添加的城市！");
　　　　　　　}
			goSave()
　　　})
})
$(function(){
　　　　　　$("#btnDel").click(function(){
　　　　　　　　　　　if($("#fb_list option:selected").length>0)
　　　　　　　　　　　{
　　　　　　　　　　　　　　　$("#fb_list option:selected").each(function(){
　　　　　　　　　　　　　　　　　　　　　$("#citylist").append("<option value='"+$(this).val()+"'>"+$(this).text()+"</option");
　　　　　　　　　　　　　　　　　　　　　$(this).remove();　
　　　　　　　　　　　　　　　})
　　　　　　　　　　　}
　　　　　　　　　　　else
　　　　　　　　　　　{
　　　　　　　　　　　　　　　alert("请选择要删除的城市！");
　　　　　　　　　　　}
			goSave()
　　　　　})
})
</script>
<script>
function form_validate() {
		var validate = true ;
		ratevalue = document.getElementById('ratevalue');
		if(ratevalue.value=="") {
			document.getElementById("ratevaluestr").innerHTML="*航空公司返点不能为空";
			ratevalue.focus();
			validate = false ;
		} else {
			document.getElementById("ratevaluestr").innerHTML="*";
		}
		
		
		s_issuedstartdate = document.getElementById('s_issuedstartdate');
		s_issuedendate = document.getElementById('s_issuedendate');
		if(s_issuedstartdate.value==""||s_issuedendate.value=="") {
			document.getElementById("s_issuedstartdatestr").innerHTML="*出票时间不能为空";
			s_issuedstartdate.focus();
			s_issuedendate.focus();
			validate = false ;
		} else {
			document.getElementById("s_issuedstartdatestr").innerHTML="*";
		}
		
		
		s_begindate = document.getElementById('s_begindate');
		s_enddate = document.getElementById('s_enddate');
		if(s_begindate.value==""||s_enddate.value=="") {
			document.getElementById("s_begindatestr").innerHTML="*有效日期不能为空";
			s_begindate.focus();
			s_enddate.focus();
			validate = false ;
		} else {
			document.getElementById("s_begindatestr").innerHTML="*";
		}
		
		
		cabincode = document.getElementById('cabincode');
		if(cabincode.value=="") {
			document.getElementById("cabincodestr").innerHTML="*仓位码不能为空";
			cabincode.focus();
			validate = false ;
		} else {
			document.getElementById("cabincodestr").innerHTML="*";
		}
		
		
		s_flightnumber = document.getElementById('s_flightnumber');
		if(s_flightnumber.value==""&&!s_flightnumber.disabled) {
			document.getElementById("s_flightnumberstr").innerHTML="*航班号不能为空";
			s_flightnumber.focus();
			validate = false ;
		} else {
			document.getElementById("s_flightnumberstr").innerHTML="*";
		}
		
		arrivalport = document.getElementById('arrivalport');
		if(arrivalport.value=="") {
			document.getElementById("arrivalportstr").innerHTML="*到达城市不能为空";
			arrivalport.focus();
			validate = false ;
		} else {
			document.getElementById("arrivalportstr").innerHTML="*";
		}
		
		
		s_keepnum = document.getElementById('s_keepnum');
		if(s_keepnum.value=="") {
			document.getElementById("s_keepnumstr").innerHTML="*留点/留钱不能为空";
			s_keepnum.focus();
			validate = false ;
		} else {
			document.getElementById("s_keepnumstr").innerHTML="*";
		}
		
		
		return validate;
}
function changespzrate(id)
{
	document.getElementById("s_spzratetype").value=id;
	if(id=="0")
	{
		document.getElementById("fromCity").innerHTML="出发城市";
		document.getElementById("toCity").innerHTML="到达城市";
		document.getElementById("tab1").className="btn_01";
		document.getElementById("tab2").className="btn_2";
	}else
	{
		document.getElementById("fromCity").innerHTML="<span style='color:red;'>到达城市</span>";
		document.getElementById("toCity").innerHTML="出发城市";
		document.getElementById("tab1").className="btn_2";
		document.getElementById("tab2").className="btn_01";
	}
}
function showcabin()
{
	var cabincode=document.getElementById("aircompanycode").value;
	$.post("zrate!getCabinstr.action", {s_ezm:cabincode}, function (datacabin) {
			if (datacabin) {
				document.getElementById("id_cabincode").value=datacabin;
			}
		});
}
<ww:if test="spzrate.id>0">
</ww:if>
<ww:else>
showcabin();
</ww:else>
</script>
