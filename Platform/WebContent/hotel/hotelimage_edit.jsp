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
<title><ww:if test="hotelimage.id>0">�༭</ww:if><ww:else>����</ww:else>�Ƶ�ͼƬ</title>
<style type="text/css">
<!--
.STYLE2 {font-size: 12}
-->
</style>
</head>
<link href="../css/base.css" rel="stylesheet" />
<script type="text/javascript" src="../js/validator.js"></script>

<body>
<form enctype="multipart/form-data"
	action="hotelimage!<ww:if test="hotelimage.id>0">edit.action?id=<ww:property value="id"/>&<ww:property value="url"/></ww:if><ww:else>add.action?<ww:property value="url"/>&hotelId=<ww:property value="hotelId"/></ww:else>"
	name="form1" method="POST" onsubmit="return littelImage();">
	<input type="hidden" name="hotelId" id="hotelId" value='<ww:property value="hotelId"/>' />
	<input type="hidden" name="hotelid" id="hotelId" value='<ww:property value="hotelId"/>' />
	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center" style="border:1px solid #99CBED; margin-bottom:4px;">
		
			<td width="100%" height="29" class="box-bottom bg" ><span class="font-blue-cu">&nbsp;&nbsp;&nbsp;<ww:if
				test="hotelimage.id>0">�༭</ww:if><ww:else>����</ww:else>�Ƶ�ͼƬ</span></td>
		
		
		<tr>
			<td height="100%">
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="196" height="18">&nbsp;</td>
					<td width="569">&nbsp;</td>
				</tr>

				<tr class="font-blue-xi">
					<td height="28" align="right"><span class="STYLE2">���ͣ�</span></td>
					<td>
						<ww:if test="hotelimage.id>0">
						<input input type="hidden" name="type" id="type" value='<ww:property value="hotelimage.type"/>'/>
						<ww:if test="hotelimage.type==1">Сͼ��</ww:if>
						<ww:if test="hotelimage.type==2">ͼƬ��</ww:if>
						<ww:if test="hotelimage.type==3">�Ƽ�ͼƬ</ww:if> 
						</ww:if>
						<ww:else>
						<select name="type" id="type">
						<option value="2">ͼƬ��</option>
						<option value="3">�Ƽ�ͼƬ</option>
						<option value="1">Сͼ��</option>
						</select>
						</ww:else>
					
					</td>
				</tr>
				<ww:if test="hotelimage.id>0">
					<tr class="font-blue-xi">
						<td height="28" align="right"><span class="STYLE2">�ϴ�ͼƬ��</span></td>
						<td><img src="<ww:property value="getImgPath(hotelimage.path)"/>" alt=""  width=80px  height=70px/><ww:property
							value="formatFilePath(hotelimage.filepath)" />&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:"
							onclick="document.getElementById('uploadTr').style.display=''">����ͼƬ</a></td>
					</tr>
					<tr class="font-blue-xi" style="display: none" id="uploadTr" >
						<td>&nbsp;</td>
						<td height="28"><input type="file" require="true" dataType="Require" msg="��ַ����Ϊ��" name="files"  id="files"
							value='<ww:property value="hotelimage.path"/>'/><span id="imagefiles" style="color:#ff8080"></span></td>
					</tr>
				</ww:if>
				<ww:else>
					<tr class="font-blue-xi">
						<td height="28" align="right"><span class="STYLE2">�ϴ�ͼƬ��</span></td>
						<td><input type="file" require="true" dataType="Require" msg="��ַ����Ϊ��" name="files" id="files"
							value='<ww:property value="hotelimage.path"/>'  style="width:350px" /><span id="imagefiles" style="color:#ff8080"2"></span></td>		
				</ww:else>
				<tr class="font-blue-xi">
					<td height="28" align="right"><span class="STYLE2">������</span></td>
					<td><textarea name="description" cols="50" rows="5"><ww:property value="hotelimage.description" /></textarea></td>
				</tr>
	
				<tr class="font-blue-xi">
					<td height="54" rowspan="2"></td>
					<td height="46" scrolling="no"><div style=" position: relative;">
					<input type="button" onclick="littelImage();" class="button_d font-white" value="�ύ" /> <input type="button"
						class="button_d font-white"
						onclick="window.location.href='hotelimage!tabs.action?hotelId=<ww:property value="hotelId"/>&tabtype=cancelhotelimag&<ww:property value="url"/>';"
						name="Submit2" value=" ȡ������ " />
						
						</td>
				</tr>
				<tr>
					<td height="17">ע��:Сͼ���ϴ�ͼƬ���Ϊ:134*210,ͼƬ���ϴ�ͼƬ���Ϊ:159*192</td>
				</tr>
			</table>	
			</td>
		</tr>
	</table>
</form>
</body>
<script type="text/javascript">
	//�Ƿ񸲸�СͼƬ
	function littelImage(){
		var IsExist = true;
		var typeImage = $('#type').val();
		var f = $("#files").val();
		<ww:if test="hotelimage.id==0">
			if(f == ''){
				$("#imagefiles").html(" ͼƬ��ַ����Ϊ��!");
				IsExist=false;
			}else{
				$("#imagefiles").html("");
				if(typeImage==1){
					$.post("hotelimage!add.action",{type:typeImage,flag:"jssubmit",hotelid:document.getElementById("hotelId").value},function(responseMessage){
						if(responseMessage == "exist"){
					 		if(window.confirm("Сͼ���Ѵ��ڣ�ȷ��Ҫ�滻��ǰСͼ����")){
					 			document.forms.form1.submit();
					 		}else{
					 			IsExist=false;
					 		}
					 	}else{
					 		document.forms.form1.submit();
					 	}
					});
					return IsExist;
				}else{
					document.forms.form1.submit();
				}
			}
		</ww:if>
		<ww:else>
			document.forms.form1.submit();
		</ww:else>
	}
</script>
</html>


