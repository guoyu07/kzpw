<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="webwork" prefix="ww"%>
<%
	/**
	 * ��Ȩ����, �ʷ��Ļ�
	 * Author: �ʷ��Ļ� ��Ŀ������
	 * copyright: 2012
	 */
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><ww:if test="airflight.id>0">�༭</ww:if><ww:else>����</ww:else>���������Ϣ��</title>
<script language="javascript" type="text/javascript"
	src="js/My97DatePicker/WdatePicker.js"></script>
<style type="text/css">
<!--
.STYLE2 {
	font-size: 12
}
-->
</style>
<link href="style/base.css" rel="stylesheet" />
<link href="style/text.css" rel="stylesheet" />
<script language="javascript">
	function form_validate() {
		var validate = true ;
		
		eairportcode = document.getElementById('eairportcode');
		if(eairportcode.value == '') {
			document.getElementById("eairportcodeSp").innerHTML="*������������벻��Ϊ��";
			validate = false ;
			eairportcode.focus();
		} else if(eairportcode.value.length != 3) {
			document.getElementById("eairportcodeSp").innerHTML="*���ȱ���Ϊ3��Ӣ���ַ�";
			validate = false ;
			eairportcode.focus();
		} else {
			document.getElementById("eairportcodeSp").innerHTML="*";
		}
		
		sairportcode = document.getElementById('sairportcode');
		if(sairportcode.value == '') {
			document.getElementById("sairportcodeSp").innerHTML="*�������������벻��Ϊ��";
			validate = false ;
			sairportcode.focus();
		} else if(sairportcode.value.length != 3) {
			document.getElementById("sairportcodeSp").innerHTML="*���ȱ���Ϊ3��Ӣ���ַ�";
			validate = false ;
			sairportcode.focus();
		} else {
			document.getElementById("sairportcodeSp").innerHTML="*";
		}
		
		flightnumber = document.getElementById('flightnumber');
		if(flightnumber.value == '') {
			document.getElementById("flightnumberSp").innerHTML="*����Ų���Ϊ��";
			validate = false ;
			flightnumber.focus();
		} else {
			document.getElementById("flightnumberSp").innerHTML="*";
		}
		
		aircompanycode = document.getElementById('aircompanycode');
		if(aircompanycode.value == '') {
			document.getElementById("aircompanycodeSp").innerHTML="*��˾�����벻��Ϊ��";
			validate = false ;
			aircompanycode.focus();
		} else if(aircompanycode.value.length != 2) {
			document.getElementById("aircompanycodeSp").innerHTML="*���ȱ���Ϊ2��Ӣ���ַ�";
			validate = false ;
			aircompanycode.focus();
		} else {
			document.getElementById("aircompanycodeSp").innerHTML="*";
		}
		
		return validate;
	}
	
</script>
</head>
<body>
<div id="member">
<table width="100%" border="0" cellpadding="0" cellspacing="0"
	align="center" class="box">
	<tr>
		<td width="100%" height="29" class="box-bottom bg"><b
			class="anse"><span class="font-blue-cu">&nbsp;&nbsp;&nbsp;<ww:if
			test="airflight.id>0">�༭</ww:if><ww:else>����</ww:else>���������Ϣ��</span></b></td>
	</tr>
	<tr>
		<td valign="top">
		<form
			action="airflight!<ww:if test="airflight.id>0">edit.action?id=<ww:property value="id"/>&<ww:property value="url"/></ww:if><ww:else>add.action?<ww:property value="url"/></ww:else>"
			name="form1" method="POST"
			onsubmit="return form_validate()">
		<table width="99%" border="0" cellpadding="0" cellspacing="0"
			style="margin: 0 auto;">
			<tr>
				<td height="100%">
				<table border="0" cellpadding="0" cellspacing="0" width="100%"
					style="border-collapse: collapse;">
					<tr>
						<td colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td height="28" align="right" width="15%" class="table_color_r colortrin"><span>��˾�����룺</span></td>
						<td class="table_color_l" width="35%"><input type="text" name="aircompanycode" id="aircompanycode"
							value='<ww:property value="airflight.aircompanycode"/>'
							style="width: 150px;margin-right: 5px;" /><span id="aircompanycodeSp" class="font-red">*</span></td>
						<td height="28" align="right" width="15%" class="table_color_r colortrin"><span>����ţ�</span></td>
						<td class="table_color_l"><input type="text" name="flightnumber" id="flightnumber"
							value='<ww:property value="airflight.flightnumber"/>'
							style="width: 150px;margin-right: 5px;" /><span id="flightnumberSp" class="font-red">*</span></td>
					</tr>
					<tr>
						<td height="28" align="right"" class="table_color_r colortrin"><span>�������������룺</span></td>
						<td class="table_color_l"><input type="text" name="sairportcode" id="sairportcode"
							value='<ww:property value="airflight.sairportcode"/>'
							style="width: 150px;margin-right: 5px;" /><span id="sairportcodeSp" class="font-red">*</span></td>
						<td height="28" align="right"" class="table_color_r colortrin"><span>������������룺</span></td>
						<td class="table_color_l"><input type="text" name="eairportcode" id="eairportcode"
							value='<ww:property value="airflight.eairportcode"/>'
							style="width: 150px;margin-right: 5px;" /><span id="eairportcodeSp" class="font-red">*</span></td>
					</tr>
					<tr>
						<td height="28" align="right"" class="table_color_r colortrin"><span>״̬��</span></td>
						<td class="table_color_l" colspan="3">
							<ww:if test="airflight.isenable==0">
								<input type="radio" name="isenable" value="1" />����&nbsp;
								<input type="radio" name="isenable" value="0" checked="checked" />����
							</ww:if> 
							<ww:else>
								<input type="radio" name="isenable" value="1" checked="checked" />����&nbsp;
								<input type="radio" name="isenable" value="0" />����
							</ww:else> </td>
					</tr>
					<tr class="font-blue-xi">
						<td height="46" colspan="4" align="center"><input type="submit"
							class="button_d font-bai" value="�ύ" /> <input type="button"
							class="button_d font-bai"
							onclick="window.location.href='airflight.action?<ww:property value="url"/>';"
							name="Submit2" value=" ���� " /></td>
					</tr>
					<tr>
						<td height="17">&nbsp;</td>
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


