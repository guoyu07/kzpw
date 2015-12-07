<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="webwork" prefix="ww"%>
<%
	 /**
	 * 版权所有, 允风文化
	 * Author: 允风文化 项目开发组
	 * copyright: 2012
	 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户所有账单查询</title>
<link href="style/base.css" rel="stylesheet" />
<link href="style/text.css" rel="stylesheet" />
<script src="<%=request.getContextPath() %>/js/jquery1.3.2.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/My97DatePicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="js/resources/css/ext-all.css" />
<script type="text/javascript" src="js/adapter/ext/ext-base.js"></script>
<script type="text/javascript" src="js/ext-all.js"></script>
<script>
Ext.onReady(function(){ 
  var comboxWithTree = new Ext.form.ComboBox({  
       store:new Ext.data.SimpleStore({fields:[],data:[[]]}),  
       editable:false,         
       mode: 'local',  
       triggerAction:'all',  
       maxHeight: 240, 
       width:170,
	   tpl: "<tpl for='.'><div style='height:240px ; width:170px'><div id='tree'></div></div></tpl>",  
       selectedClass:'',  
       onSelect:Ext.emptyFn  
    });  
	<ww:property value="deptstr"/>	
	var tree = new Ext.tree.TreePanel({           
          root:root,
          rootVisible:false
       }); 	
		comboxWithTree.setValue("<ww:property value="companyname"/>");
       tree.on('click',function(node){   
           
             comboxWithTree.setValue(node.text);  
            Ext.get('parentid').set({value:node.id});
            comboxWithTree.collapse();              
       });     	  
	  comboxWithTree.on('expand',function(){  
			tree.render('tree');
			tree.getRootNode().expand();  
			tree.getRootNode().collapseChildNodes();//是否展开子菜单			
		});
	
    comboxWithTree.render('comboxWithTree'); 
});
function feiyong(id){
 if(id==1){
  $("#id1").show();
  $("#id2").hide();
  $("#id3").hide();
 }
 if(id==2){
  $("#id2").show();
  $("#id1").hide();
  $("#id3").hide();
 
 }
 if(id==3){
  $("#id3").show();
  $("#id1").hide();
  $("#id2").hide();
 
 }
}

function expexcels(){
alert("导出Excel");
//jQuery.post("passenger!expAllBilltoexcel.action",{'pageinfo.pagenum':<ww:property value="pageinfo.pagenum"/>},function(){});

var oXL = new ActiveXObject("Excel.Application");   
var oWB = oXL.Workbooks.Add();   
var oSheet = oWB.ActiveSheet;   
var sel=document.body.createTextRange();   
sel.moveToElementText("excel1");   
//sel.select();   
sel.execCommand("Copy");   
oSheet.Paste();   
oXL.Visible = true;   

}
</script>

<SCRIPT LANGUAGE="javascript"> 
var idTmr ;


function method1(tableid) {//整个表格拷贝到EXCEL中 

    var curTbl = document.getElementById(tableid); 
    var oXL = new ActiveXObject("Excel.Application"); 
    //创建AX对象excel 
    var oWB = oXL.Workbooks.Add(); 
    //获取workbook对象 
    var xlsheet = oWB.Worksheets(1);
    //激活当前sheet 
    var sel = document.body.createTextRange(); 
    sel.moveToElementText(curTbl); 
    //把表格中的内容移到TextRange中 
    sel.select(); 
    //全选TextRange中内容 
    sel.execCommand("Copy"); 
    //复制TextRange中内容  
    xlsheet.Paste(); 
    //粘贴到活动的EXCEL中       
    oXL.Visible = true; 
    //设置excel可见属性 

    try{
        var fname = oXL.Application.GetSaveAsFilename("save.xls", "Excel Spreadsheets (*.xls), *.xls");
    }catch(e){
        print("Nested catch caught " + e);
    }finally{
        oWB.SaveAs(fname);

        oWB.Close(savechanges=false);
         //xls.visible = false;
        oXL.Quit();
        oXL=null;
         //结束excel进程，退出完成
         //window.setInterval("Cleanup();",1);
        idTmr = window.setInterval("Cleanup();",1);
    }
} 
function Cleanup() {
    window.clearInterval(idTmr);
    CollectGarbage();
  }
</SCRIPT> 

</head>
<body>
<div id="member">
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	align="center" class="box">
	<tr>
		<td width="100%" height="29" class="box-bottom bg"><b
			class="anse"><span class="font-blue-cu">&nbsp;&nbsp;&nbsp;客户所有账单查询</span></b></td>
	</tr>
	<tr>
		<td valign="top">
		<table width="100%" border="0" cellpadding="0" cellspacing="0"
			align="center">
			<tr>
				<td valign="top">
				<table width="100%" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td valign="top">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td>

								<form name="form1"  method="post" action="passenger.action">
								<table width="760" border="0" align="center" cellpadding="0"
									cellspacing="0">
									<tr>
									<td width="120" height="20" align="right">选择大客户：</td>
										<td><span style="HEIGHT: 71px" style="WIDTH: 150px">
										<div id='comboxWithTree'></div>
										<input type="hidden" id="parentid" name="s_department"
											value='<ww:property value="s_department"/>' /> </span></td>
									
										

										<td width="120" height="20" align="right">还款状态：</td>
										<td><span style="HEIGHT: 71px"> <select
											name="s_state" style="WIDTH: 155px">
											<option value="0">所有账单</option>
											<option value="1" <ww:if test="s_state==1">selected</ww:if>>未还款</option>
											<option value="2" <ww:if test="s_state==2">selected</ww:if>>已还款</option>
											<option value="3" <ww:if test="s_state==3">selected</ww:if>>已部分还款</option>
										</select> </span></td>



									</tr>
									<tr>
										<td width="120" height="20" align="right">联&nbsp;系&nbsp;人：</td>
										<td><span style="HEIGHT: 71px"> <input
											id="startnum" style="WIDTH: 150px" name="username"
											value="<ww:property value="username"/>" /> </span></td>
										<td width="120" height="20" align="right">预&nbsp;订&nbsp;人：</td>
										<td><input type="text" name="s_operator"
											style="WIDTH: 150px" value="<ww:property value="s_operator"/>" />
											</td>
											
											
											
									</tr>
									<tr>
										<td width="120" height="20" align="right">乘&nbsp;机&nbsp;人：</td>
										<td><span style="HEIGHT: 71px"> 
										<input id="startnum" style="WIDTH: 150px" name="s_passengername"
											value="<ww:property value="s_passengername"/>" /> </span></td>
									  <td width="120" height="20" align="right">&nbsp;类&nbsp;型：</td>
										<td>										
										<select name="s_internal" style="width:155px">
										<option value="-1" <ww:if test="s_internal==-1">selected=selected</ww:if>></option>
										<option value="0" <ww:if test="s_internal==0">selected=selected</ww:if> >国内票</option>
										<option value="1" <ww:if test="s_internal==1">selected=selected</ww:if>>国际票</option>
										</select>
										</td>
											
											
									</tr>
									
									<!-- 日期查询 -->
									<tr>
										<td width="120" height="20" align="right">出票日期：</td>
										<td><span style="HEIGHT: 65px">
									<input id="Text2" style="width: 75px" name="issue_begintime"
									   value="<ww:property value="issue_begintime"/>" onfocus="WdatePicker({skin:'whyGreen'})" />-
									<input id="Text2" style="width: 75px" name="issue_endtime"
									   value="<ww:property value="issue_endtime"/>" onfocus="WdatePicker({skin:'whyGreen'})" />
								            </span></td>
										<td width="120" height="20" align="right">航班日期：</td>
										<td><span style="HEIGHT: 65px">
									<input id="Text2" style="width: 75px" name="flight_begintime"
									   value="<ww:property value="flight_begintime"/>" onfocus="WdatePicker({skin:'whyGreen'})" />-
									<input id="Text2" style="width: 75px" name="flight_endtime"
									   value="<ww:property value="flight_endtime"/>" onfocus="WdatePicker({skin:'whyGreen'})" />
								            </span></td>
									</tr>

									<tr>
										<td colspan="4" align="center" width="100%;">
										<input type="submit" 
										onclick="document.form1.action='passenger.action';document.form1.submit()" class="button_d font-bai" value="查询"
											style="margin-top: 20px;" />&nbsp;&nbsp;&nbsp;
										<input type="button" onclick="document.form1.action='passenger!expRepayedBilltoExcel.action';document.form1.submit()" 
										class="button_d font-bai" value="导出Excel"/>											
										</td>
									</tr>

								</table>
								</form>

								</td>
							</tr>
							<tr>
								<td height="40">
								<table width="99%" border="0" cellspacing="0" cellpadding="0">
									<!--
              <tr>
                <td height="27" align="center"><div align="right">
                <a href="#" onclick="toadd()"><input type="button" value="新增" class="button_h font-red"></a>
                &nbsp;&nbsp;&nbsp;<a href="#" onclick="updateItem()"><input type="button" value="修改" class="button_h font-red"></a>
                &nbsp;&nbsp;&nbsp;<a href="#" onclick="deleteItem()"><input type="button" value="删除" class="button_h font-red"></a>
                &nbsp;&nbsp;&nbsp;<a href="#" onclick="checkItem()"><input type="button" value="审核" class="button_h font-red"></a></div></td>
              </tr>
            -->
								</table>
								</td>
							</tr>
						</table>
						</td>
					</tr>
					<tr>
					<td>
					&nbsp;<input type="button" class="button_d font-bai" onclick="feiyong(1)" value="机票费用" />
					<input type="button" class="button_d font-bai"  onclick="feiyong(2)"value="退废改签" />
				    <input type="button" class="button_d font-bai"  onclick="feiyong(3)" value="杂项费用" />
					</td>
				  </tr>
					<tr>
						<td valign="top">
						<div id="id1">
						<form name="mainform" action="" method="post">
						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="100%">
								<table id="menutable" name="excel1" id="excel1" width="99%" border="1" align="center"
									class="table_color">
									<tbody>
										<tr class="tbody_color">
											<th class="table_color">订单编号</th>
											<th class="table_color">票号</th>
											<th class="table_color">联系人</th>
											<th class="table_color">预订人</th>
											<th class="table_color">乘机人</th>
										<!-- 航班号、航程 起飞日期、起飞时刻、机票价格、机建费、燃油费、总计、还款状态-->											
											<th class="table_color">航班号</th>											
											<th class="table_color">航程</th>
											<th class="table_color">航班时间</th>
											<th class="table_color">机票价格</th>
											<th class="table_color">税</th>
											<th class="table_color">保险费</th>
											<th class="table_color">欠款总计</th>											
											<th class="table_color">还款状态</th>
										</tr>

										<ww:iterator value="listPassenger">
											<tr  id="<ww:property value="id"/>" align="center"
												onmouseover="currentcolor=this.style.backgroundColor;this.className='colortrin',this.style.fontWeight='';"
												onmouseout="this.className='colortrout',this.style.fontWeight='';">
												<td class="table_color">
								             	<a target="_blank" href='orderinfo!toshowb2c.action?id=<ww:property value="orderid"/>'
													<ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==2">style="color:#0356A6"</ww:if> >
													<ww:property value="getordercode(orderid)" /></a>
													</td>
													<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="ticketnum" /></td>
											
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property
													value="getlinkManName(orderid)" /></td>
													
													
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property
													value="getOrderName(orderid)" /></td>
													
												<td class="table_color"
													<ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property
													value="name" /></td>
													<!-- 航班号 -->
												<td class="table_color"
													<ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property
													value='getSegmentInfo(orderid,"getFlightnumber")' /></td>
													
											
													
												
												<!-- 航程 -->
													
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="getFlight(orderid)" /></td>
													<!-- 航班时间 -->
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="getFlighttime(orderid)" /></td>
													
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="price" /></td>
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
												
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="converNull(airportfee,0f)+converNull(fuelprice,0f)+converNull(anjianfee,0f)+converNull(Otherfee,0f)" /></td><!-- 税 -->
												<!-- <td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="fuelprice" /></td>-->
			
													<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="getInsuranceFeeById(converNull(insurance,0l))" /></td>
													<!-- 总计 -->
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="haiqian" /></td>
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:if test="hkstate==1">未还款</ww:if>
												<ww:if test="hkstate==2">已还款</ww:if> <ww:if
													test="hkstate==3">已还款部分</ww:if></td>
											</tr>
										</ww:iterator>
										<tr>
										<td class="table_color" colspan="1">费用小计</td>
										<td class="table_color" colspan="13" style="text-align: left;padding-left: 10px">
										   已还：${allrepay};&nbsp;&nbsp;&nbsp;待还：${needrepay }</td>
										
										</tr>
									</tbody>
									<!-- 记录查询条件 -->
									<input type="hidden" name="s_department" value='<ww:property value="s_department"/>' />
									<input type="hidden" name="s_state" value='<ww:property value="s_state"/>' />
									<input type="hidden" name="username"	value="<ww:property value="username"/>" />
									<input type="hidden" name="s_operator" value="<ww:property value="s_operator"/>" />
									<input type="hidden" name="issue_begintime" value="<ww:property value="issue_begintime"/>"  />
									<input type="hidden" name="issue_endtime" value="<ww:property value="issue_endtime"/>" />
									<input type="hidden" name="flight_begintime" value="<ww:property value="flight_begintime"/>"  />
									<input type="hidden" name="flight_endtime" value="<ww:property value="flight_endtime"/>"/>
									<input type="hidden" name="s_passengername" value="<ww:property value="s_passengername"/>"/>
									<input type="hidden" name="s_internal" value="<ww:property value="s_internal"/>"/>
									
									
								</table>
								<div style="text-align: center; width: 100%; padding-top: 10px;">
								<ww:property value='getPagetwo(pageinfo,"pageinfo","passenger.action","mainform")' /></div>
								</td>
							</tr>
						</table>
						</form>
						</div>
						</td>
					</tr>					
					<!-- 退改签 -->
					<tr><td>					
					<div id="id2" style=" display: none">
						<form action="" name="formother" method="post">
						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="100%">
								<table id="menutable" width="99%" border="1" align="center"
									class="table_color">
									<tbody>
										<tr class="tbody_color">
										<!-- 订单编号、票号、联系人、预订人、乘机人、航班号、出发城市、目的城市、起飞日期、起飞时刻、机票价格、机建费、燃油费、退废改签费、总计、还款状态、机票状态； -->
										    <th class="table_color">订单编号</th>
										    <th class="table_color">票号</th>
										    <th class="table_color">联系人</th>
											<th class="table_color">预订人</th>
											<th class="table_color">乘机人</th>
											<th class="table_color">航班号</th>
											<th class="table_color">航程</th>
											<th class="table_color">航班时间</th>
											<th class="table_color">票价</th>
											<th class="table_color">税</th>
											<th class="table_color">保险费</th>
											<th class="table_color">退废改签费</th>
											<th class="table_color">欠款总计</th>
											<th class="table_color">还款状态</th>
											<th class="table_color">机票状态</th>
										</tr>
										<ww:iterator value="otherlistPassenger" status="state">
											<tr id="t<ww:property value="id"/>" align="center"
												onmouseover="currentcolor=this.style.backgroundColor;this.className='colortrin',this.style.fontWeight='';"
												onmouseout="this.className='colortrout',this.style.fontWeight='';">

												<td class="table_color">
									<a target="_blank" href='orderinfo!toshowb2c.action?id=<ww:property value="orderid"/>'
													<ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==2">style="color:#0356A6"</ww:if> >
													<ww:property value="getordercode(orderid)" /></a>
													</td>													
												<td class="table_color"
													<ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property
													value="ticketnum" /></td>
													
														<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property
													value="getlinkManName(orderid)" /></td>
													
													
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property
													value="getOrderName(orderid)" /></td>
													
												<td class="table_color"
													<ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property
													value="name" /></td>
												<td class="table_color"
													<ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property
													value='getSegmentInfo(orderid,"getFlightnumber")' /></td>
													<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="getFlight(orderid)" /></td>
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="getFlighttime(orderid)" /></td>
													
													<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="price" /></td>
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="converNull(airportfee,0f)+converNull(fuelprice,0f)+converNull(anjianfee,0f)+converNull(Otherfee,0f)" /></td>

													<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="getInsuranceFeeById(converNull(insurance,0l))" /></td>
													<!-- 退改签 -->
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="tuifee" /></td>
													<!-- 总计 -->
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:property value="haiqian" /></td>
													
												<!-- <td class="table_color"
													<ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:if
													test="hkstate==3">
													总：<ww:property value="haiqian+yihai" />，待还：<ww:property
														value="haiqian" />
												</ww:if><ww:else>
														总：<ww:property value="haiqian" />
												</ww:else></td>-->
												<td class="table_color"
													<ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>><ww:if
													test="hkstate==1 || hkstate==null">未还款</ww:if> <ww:if
													test="hkstate==2">已还款</ww:if> <ww:if test="hkstate==3">还款部分</ww:if>
												</td>
												<td class="table_color" <ww:if test="hkstate==1 || hkstate==null">style="color:#990000"</ww:if>
													<ww:if test="hkstate==3">style="color:#999999"</ww:if>>
													<ww:property value="getpassstate(state)" />
													</td>
										</ww:iterator>
										<tr>
										<td class="table_color" colspan="1">费用小计</td>
										<td class="table_color" colspan="16" style="text-align: left;padding-left: 10px">
										   已还：${otherallrepay }&nbsp;&nbsp;&nbsp;待还：${otherneedrepay }</td>
										
										</tr>

									</tbody>
									<input type="hidden" name="agentid" value='<ww:property value="agentid"/>' />
									<!-- 记录查询条件 -->
									<input type="hidden" name="s_department" value='<ww:property value="s_department"/>' />
									<input type="hidden" name="s_state" value='<ww:property value="s_state"/>' />
									<input type="hidden" name="username"	value="<ww:property value="username"/>" />
									<input type="hidden" name="s_operator" value="<ww:property value="s_operator"/>" />
									<input type="hidden" name="issue_begintime" value="<ww:property value="issue_begintime"/>"  />
									<input type="hidden" name="issue_endtime" value="<ww:property value="issue_endtime"/>" />
									<input type="hidden" name="flight_begintime" value="<ww:property value="flight_begintime"/>"  />
									<input type="hidden" name="flight_endtime" value="<ww:property value="flight_endtime"/>"/>
									<input type="hidden" name="s_passengername" value="<ww:property value="s_passengername"/>"/>
									<input type="hidden" name="s_internal" value="<ww:property value="s_internal"/>"/>
								</table>
								<!-- 分页 -->
								<div style="text-align: center; width: 100%; padding-top: 10px;">
								<ww:property value='getPagetwo(pageother,"pageother","passenger.action","formother")' /></div>
								</td>
							</tr>
						</table>
						<input  type="hidden" name="pageinfo.pagenum" value="<ww:property value="pageinfo.pagenum"/>" />
						<input  type="hidden" name="pagezafei.pagenum" value="<ww:property value="pagezafei.pagenum"/>" />
						<input  type="hidden" name="repayname" value="other"/>
						</form>
						
					</div>
					
					
					</td></tr>
					<!-- 杂项费用 -->
                      <tr><td>					
						<div id="id3" style=" display: none">
						<form action="" name="formzaxiang" method="post" >
						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="100%">
								<table id="menutable" width="99%" border="1" align="center"
									class="table_color">
									<tbody>
									<!-- 部门、联系人、旅客姓名、费用、费用发生日期、备注、还款状态 -->
										<tr class="tbody_color">
											<th class="table_color">部门</th>
											<th class="table_color">联系人</th>
											<th class="table_color">旅客姓名</th>
											<th class="table_color">费用</th>
											<th class="table_color">消费时间</th>
											<th class="table_color">备注</th>
											<th class="table_color">还款状态</th>

										</tr>
										<ww:iterator value="listMiscellaneous" status="state">
											<tr id="t<ww:property value="id"/>" align="center"
												onmouseover="currentcolor=this.style.backgroundColor;this.className='colortrin',this.style.fontWeight='';"
												onmouseout="this.className='colortrout',this.style.fontWeight='';">

												<td class="table_color"
												<ww:if test="state==1 || state==null">style="color:#990000"</ww:if>
													<ww:if test="state==3">style="color:#999999"</ww:if>><ww:property
													value="getDeptNameByID(department)"/></td>
												<td class="table_color"
												<ww:if test="state==1 || state==null">style="color:#990000"</ww:if>
													<ww:if test="state==3">style="color:#999999"</ww:if>><ww:property value="getusername(customerid)" /></td>
												<td class="table_color"
												<ww:if test="state==1 || state==null">style="color:#990000"</ww:if>
													<ww:if test="state==3">style="color:#999999"</ww:if>><ww:property value="name" /></td>
												<td class="table_color"
												<ww:if test="state==1 || state==null">style="color:#990000"</ww:if>
													<ww:if test="state==3">style="color:#999999"</ww:if>><ww:property value="price" /></td>
												<td class="table_color"
												<ww:if test="state==1 || state==null">style="color:#990000"</ww:if>
													<ww:if test="state==3">style="color:#999999"</ww:if>><ww:property value="spenddate" /></td>
												<td class="table_color" 
												    <ww:if test="state==1 || state==null">style="color:#990000"</ww:if>
													<ww:if test="state==3">style="color:#999999"</ww:if>><ww:property value="description" /></td>
												<td class="table_color"
													<ww:if test="state==1 || state==null">style="color:#990000"</ww:if>
													<ww:if test="state==3">style="color:#999999"</ww:if>><ww:if
													test="state==1 ||state==null">未还款</ww:if> <ww:if
													test="state==2">已还款</ww:if> <ww:if test="state==3">还款部分</ww:if>
												</td>
											</tr>
										</ww:iterator>
										<tr>
										<td class="table_color" colspan="1">费用小计</td>
										<td class="table_color" colspan="12" style="text-align: left;padding-left: 10px">
										   已还：${mallrepay }&nbsp;&nbsp;&nbsp;待还：${mneedrepay }</td>
										
										</tr>
										<input type="hidden" name="agentid" value='<ww:property value="agentid"/>'  />
										<!-- 记录查询条件 -->
									<input type="hidden" name="s_department" value='<ww:property value="s_department"/>' />
									<input type="hidden" name="s_state" value='<ww:property value="s_state"/>' />
									<input type="hidden" name="username"	value="<ww:property value="username"/>" />
									<input type="hidden" name="s_operator" value="<ww:property value="s_operator"/>" />
									<input type="hidden" name="issue_begintime" value="<ww:property value="issue_begintime"/>"  />
									<input type="hidden" name="issue_endtime" value="<ww:property value="issue_endtime"/>" />
									<input type="hidden" name="flight_begintime" value="<ww:property value="flight_begintime"/>"  />
									<input type="hidden" name="flight_endtime" value="<ww:property value="flight_endtime"/>"/>
									<input type="hidden" name="s_passengername" value="<ww:property value="s_passengername"/>"/>
									<input type="hidden" name="s_internal" value="<ww:property value="s_internal"/>"/>
									</tbody>
								</table>
								<!-- 分页 -->
								<div style="text-align: center; width: 100%; padding-top: 10px;">
								<ww:property value='getPagetwo(pagezafei,"pagezafei","passenger.action","formzaxiang")' /></div>
								</td>
							</tr>
						</table>
						<input  type="hidden" name="pageinfo.pagenum" value="<ww:property value="pageinfo.pagenum"/>" />
						<input  type="hidden" name="pageother.pagenum" value="<ww:property value="pageother.pagenum"/>" />
						<input  type="hidden" name="repayname" value="zafei"/>
						</form>
					</div>					
					</td></tr>
					
				</table>
				</td>
			</tr>
		</table>

		</td>
	</tr>
</table>
</div>
</body>
<%=request.getAttribute("repayjs") %><!-- 用于选中选项卡 -->
</html>


<script language="JavaScript">
	function toadd(){
		window.location="passenger!toadd.action?<ww:property value="url"/>";
	}
	function deleteItem(){
			var length=document.form1.selectid.length;
			
			//唯一项
			if(length== undefined){
			
				if(document.form1.selectid.checked ==true)
				{
						var temp = confirm('确认删除吗？');
						if(temp==true){
						
							document.form1.action="passenger!delete.action?id="+document.form1.selectid.value;
							document.form1.submit();
						}
						return;
				}
			}
			
			  	 if ( length == null || length==0 ){
					  	 
					  	  	 alert("你未选择任何内容");
					          return;
				  }else{
					   	 var len=0;
					   	 var uvalue=0;
					     for (var i = 0; i < length; i++)
					      {
					         
					         if( document.form1.selectid[i].checked ==true){
								uvalue=document.form1.selectid[i].value;
								len++;					         
					         }
						      
					      }
					      
					     
					      if(len==1){
					      	var temp = confirm('确认删除吗？');
							if(temp==true){
								document.form1.action="passenger!delete.action?id="+uvalue;
								document.form1.submit();
							}
							return;
					      }else if (len>1){
					      	var temp = confirm('确认删除吗？');
					      	if(temp==true){
					      		document.form1.action="passenger!batch.action?opt=1";
								document.form1.submit();
							}
							return;
					      
					      }
					      
				 }	
				
			alert("无效操作,你未选择任何内容!");
			return;
  }

 function updateItem(){
			var length=document.form1.selectid.length;
			
			//唯一项
			if(length== undefined){
			
				if(document.form1.selectid.checked ==true)
				{
						
						document.form1.action="passenger!toedit.action?id="+document.form1.selectid.value;
						document.form1.submit();
						
						return;
				}
			}
			
			  	 if ( length == null || length==0 ){
					  	 
					  	  	 alert("你未选择任何内容");
					          return;
				  }else{
					   	 var len=0;
					   	 var uvalue=0;
					     for (var i = 0; i < length; i++)
					      {
					         
					         if( document.form1.selectid[i].checked ==true){
								uvalue=document.form1.selectid[i].value;
								len++;					         
					         }
						      
					      }
					      
					     
					      if(len==1){
					      		document.form1.action="passenger!toedit.action?id="+uvalue;
								document.form1.submit();
								return;
					      }else if (len>1){
					      	var temp = confirm('只能选择一项进行操作？');
							return;
					      
					      }
					      
				 }	
				
			alert("无效操作,你未选择任何内容!");
			return;
  }
	
 function checkItem(){
			var length=document.form1.selectid.length;
			
			//唯一项
			if(length== undefined){
			
				if(document.form1.selectid.checked ==true)
				{
						
						document.form1.action="passenger!tocheck.action?id="+document.form1.selectid.value;
						document.form1.submit();
						
						return;
				}
			}
			
			  	 if ( length == null || length==0 ){
					  	 
					  	  	 alert("你未选择任何内容");
					          return;
				  }else{
					   	 var len=0;
					   	 var uvalue=0;
					     for (var i = 0; i < length; i++)
					      {
					         
					         if( document.form1.selectid[i].checked ==true){
								uvalue=document.form1.selectid[i].value;
								len++;					         
					         }
						      
					      }
					      
					     
					      if(len==1){
					      		document.form1.action="passenger!tocheck.action?id="+uvalue;
								document.form1.submit();
								return;
					      }else if (len>1){
					      	var temp = confirm('只能选择一项进行操作？');
							return;
					      
					      }
					      
				 }	
				
			alert("无效操作,你未选择任何内容!");
			return;
  }
 
			
function unselectall()
{
    if(document.form1.all.checked){
	document.form1.all.checked = document.form1.all.checked&0;
    }
}

function selectall1()
{
    var length=document.form1.selectid.length;
    document.form1.all1.checked = document.form1.all1.checked|0;
  

   if ( length ==undefined &&  document.form1.selectid!=null ){
    	  document.form1.selectid.checked=document.form1.all1.checked ;
          return;
    }


    if (length>1)
    {
      for (var i = 0; i < length; i++)
       {
          document.form1.selectid[i].checked = document.form1.all1.checked;
	      document.form1.getElementsByTagName("*").checked=document.form1.all1.checked;
       }
    }
}


</script>




