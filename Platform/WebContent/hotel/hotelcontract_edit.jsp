<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="webwork" prefix="ww"%>
<%/**
			 * ��Ȩ����, �ʷ��Ļ�
			 * Author: B2BJOY ��Ŀ������
			 * copyright: 2009
			 *
			 *
			 *  HISTORY
			 *  
			 *  2009/08/14 ����
			 *
			 */

		%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><ww:if test="hotelcontract.id>0">�༭</ww:if><ww:else>����</ww:else>�Ƶ��ͬ</title>
<link href="../css/base.css" rel="stylesheet" />
<!--<script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
--><style type="text/css">
<!--
.STYLE2 {font-size: 12}
-->
</style>
</head>
<!-- ֧�ֶ����Կ�ʼ �滻��Ӧ������ ���Action toeditlanguage���� �������ݲο�toadd ��toedit-->
<script type="text/javascript">
function addlanguage(ucode,language)
{
	document.getElementById("language").value=language;
	document.form1.action="hotelcontract!toeditlanguage.action";
	document.form1.submit();
}
</script>
<!-- ֧�ֶ����Խ��� -->


<body>
<form enctype="multipart/form-data" onsubmit="return checkall();"
	action="hotelcontract!<ww:if test="hotelcontract.id>0">edit.action?id=<ww:property value="hotelcontract.id"/>&<ww:property value="url"/></ww:if><ww:else>add.action?<ww:property value="url"/></ww:else>"
	name="form1" method="POST" onSubmit="return Validator.Validate(this,3)"><input type="hidden" name="hotelId"
	value="<ww:property value="hotelId"/>">
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:1px solid #99CBED; margin-bottom:4px;">
	
		<td width="100%" height="29" class="box-bottom bg"><span class="font-blue-cu">&nbsp;&nbsp;&nbsp;<ww:if
			test="hotelcontract.id>0">�༭</ww:if><ww:else>����</ww:else>�Ƶ��ͬ</span></td>
	
	<!-- ֧�ֶ����Կ�ʼ �滻��Ӧ������ ע���滻�ؼ��еȵ�����-->
	<!-- 
	<tr>
		<td width="100%" height="29" class="box-bottom bg"><span
			class="font-blue-cu" style="float: left; display:block;">&nbsp;&nbsp;&nbsp;<ww:if
			test="hotelcontract.id>0">�༭</ww:if><ww:else>����</ww:else>�Ƶ��ͬ</span>
		<span
			style="display: block; float: right;">
		<table border="0" cellpadding="0" cellspacing="0"
			style="text-align: center; width: 396px;">
			<tr>
				<ww:if test="hotelcontract.id>0||hotelcontract.language>0">
				<td width="25%"><a href="#" onclick="addlanguage(<ww:property value="hotelcontract.ucode"/>,0)" <ww:if test="hotelcontract.language==0">class="add"</ww:if>><img
					src="../images/jian.gif" width="27px" height="26px;"
					align="absmiddle" style="margin-right: 15px;">����</a></td>
				<td width="20%"><a href="#" onclick="addlanguage(<ww:property value="hotelcontract.ucode"/>,1)" <ww:if test="hotelcontract.language==1">class="add"</ww:if>><img src="../images/fan.gif"
					width="27px" height="26px;" align="absmiddle"
					style="margin-right: 15px;">����</a></td>
				<td width="25%"><a href="#" onclick="addlanguage(<ww:property value="hotelcontract.ucode"/>,2)" <ww:if test="hotelcontract.language==2">class="add"</ww:if>><img src="../images/ri.gif"
					width="27px" height="26px;" align="absmiddle"
					style="margin-right: 15px;">����</a></td>
				<td><a href="#" onclick="addlanguage(<ww:property value="hotelcontract.ucode"/>,3)" <ww:if test="hotelcontract.language==3">class="add"</ww:if>><img src="../images/yin.gif" width="27px"
					height="26px;" align="absmiddle" style="margin-right: 15px;">EINGLISH</a>&nbsp;&nbsp;</td>
				</ww:if>
				<ww:else>
				<td width="100%" align="right"><a href="#" class="add"><img
					src="../images/jian.gif" width="27px" height="26px;"
					align="absmiddle" style="margin-right: 15px;">����</a>&nbsp;&nbsp;&nbsp;</td>
				</ww:else>
			</tr>
		</table>
		
		</span></td>
	</tr>
	 -->
	<!-- ֧�ֶ����Խ��� -->
	<tr>
		<td height="100%">
		<table width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<td width="196" height="18">&nbsp;</td>
				<td width="569">&nbsp;</td>
			</tr>





			<tr class="font-blue-xi">
				<td height="28" align="right"><span class="STYLE2">�Ƶ����ƣ�</span></td>
				<td><ww:property value="hotelName" /></td>
			</tr>



			<tr class="font-blue-xi">
				<td height="28" align="right"><span class="STYLE2">��ͬ��ţ�</span></td>
				<td><ww:property value="hotelcontract.code"/>
				<input type="hidden" name="code" value='<ww:property value="hotelcontract.code"/>'/></td>
			</tr>



			<tr class="font-blue-xi">
				<td height="28" align="right"><span class="STYLE2">ǩԼ���ڣ�</span></td>
				<td><input type="text" require="true" dataType="Require" msg="ǩԼ���ڲ���Ϊ��" name="subDateStr" id="subDateStr"
					value="<ww:property value="subDateStr"/>"  onchange="checkqtime();" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
					style="width:350px" /><span id="qtime" style="color: #ff8080"></span></td>
			</tr>



			<tr class="font-blue-xi">
				<td height="28" align="right"><span class="STYLE2">��ֹ���ڣ�</span></td>
				<td><input type="text"  name="availDateStr" id="availDateStr"
					value="<ww:property value="availDateStr"/>" onchange="checkztime();"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"
					style="width:350px" /><span id="ztime" style="color: #ff8080"></span></td>
			</tr>



			<tr class="font-blue-xi">
				<td height="28" align="right"><span class="STYLE2">�Ƶ�ǩԼ�ˣ�</span></td>
				<td><input type="text" require="true" dataType="Require" msg="�Ƶ�ǩԼ�˲���Ϊ��" name="hotelsigner" id="hotelsigner" onchange="checkperson();" 
					value='<ww:property value="hotelcontract.hotelsigner"/>' " style="width:350px" /><span id="hperson" style="color: #ff8080"></span></td>
			</tr>



			<tr class="font-blue-xi">
				<td height="28" align="right"><span class="STYLE2">��˾ǩԼ�ˣ�</span></td>
				<td><input type="text" id="compsigner" name="compsigner" onchange="comperson();" 
					value='<ww:property value="hotelcontract.compsigner"/>' style="width:350px" /><span id="cperson" style="color: #ff8080"></span></td>
			</tr>



			<tr class="font-blue-xi">
				<td height="28" align="right"><span class="STYLE2">��ͬ�ļ��ϴ���</span></td>
				<td><input type="file"  name="files" id="files"  onchange="confile();"
					value='<ww:property value="hotelcontract.filepath"/>' " style="width:350px" /><span id="file" style="color: #ff8080"></span></td>
			</tr>


			<tr class="font-blue-xi">
				<td height="50" align="right"><span class="STYLE2">��ͬ���ݣ�</span></td>
				<td><textarea name="content" cols="48"><ww:property value="hotelcontract.content" /></textarea><!-- <input type="text" require="true" dataType="Require"   msg="��ͬ���ݲ���Ϊ��" name="content" value='<ww:property value="hotelcontract.content"/>'" style="width:350px" /></td>  -->
			</tr>
	<!-- ֧�ֶ����Կ�ʼ �滻��Ӧ������-->
	<!--  
			<ww:if test="hotelcontract.language>0">
			<input id="language" type="hidden" name="language" value="<ww:property value="hotelcontract.language"/>"/>
			</ww:if>
			<ww:else>
			<input id="language" type="hidden" name="language" value="0"/>
			</ww:else>
			<input id="ucode"  type="hidden" name="ucode" value="<ww:property value="hotelcontract.ucode"/>"/>
	 -->
			<!-- ֧�ֶ����Խ��� -->


			<tr class="font-blue-xi">
				<td height="54" rowspan="2"></td>
				<td height="46" scrolling="no"><div style=" position: relative;"><input type="submit" class="button_d font-white" value="�ύ" /> <input type="button" class="button_d font-white"
					onclick="window.location.href='hotelcontract!tabs.action?hotelId=<ww:property value="hotelId"/>&tabtype=cancelcontract&<ww:property value="url"/>';" name="Submit2" value=" ȡ������ " />
				<!--  
				<ww:iterator value="actionMessages">
					<div id="tishi" style=" position: absolute; top:-55px; left:0px; "><img src="../images/gg.png" width="149" height="60" /></div>
					<script type="text/javascript">
						setTimeout("showclose()",2000); 
						function showclose()
						{
							document.getElementById("tishi").style.display="none";
						}
					</script>
					</ww:iterator>
					 -->
				</div>	
				
				</td>
			</tr>
			<tr>
				<td height="17">&nbsp;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</form>
</body>
<script type="text/javascript">

function checkall(){
	var z = document.getElementById("availDateStr").value;
	var q = document.getElementById("subDateStr").value;
	var p = document.getElementById("hotelsigner").value;
	var c = document.getElementById("compsigner").value;
	var f = document.getElementById("files").value
 	if( z=='' || q == '' || p == '' || c == ''|| f == '' ){
		checkztime();
		checkqtime();
		checkperson();
		comperson();
		confile();
		return false;
	}
}

 function checkztime(){
 
 	if(document.getElementById("availDateStr").value==''){
 		document.getElementById("ztime").innerHTML= "ǩԼ���ڲ���Ϊ�գ�";
 		return false;
 	}else{
 		document.getElementById("ztime").innerHTML="";
	 }
}

 function checkqtime(){
 
 	if(document.getElementById("subDateStr").value==''){
 	
 		document.getElementById("qtime").innerHTML="��ֹ���ڲ���Ϊ�գ�";
 		return false;
 	}else{
 		document.getElementById("qtime").innerHTML="";
	 }
}

function checkperson(){
	if(document.getElementById("hotelsigner").value==''){
		document.getElementById("hperson").innerHTML="�Ƶ�ǩԼ�˲���Ϊ��";
		return false;
	}else{
		document.getElementById("hperson").innerHTML="";
	}
}

function comperson(){

	if(document.getElementById("compsigner").value==''){
		document.getElementById("cperson").innerHTML="��˾ǩԼ�˲���Ϊ��";
		return false;
	}else{
		document.getElementById("cperson").innerHTML="";
	}

}

function confile(){
	if(document.getElementById("files").value==''){
		document.getElementById("file").innerHTML="��ͬ�ļ�·������Ϊ��";
		return false;
	}else{
		document.getElementById("file").innerHTML="";
	}
}
</script>
</html>


