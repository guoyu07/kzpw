//************ͨ�ú���************//
function $F(fctId){
	return document.getElementById(fctId);
}

//ȡ��ĳ�������ṩID�µĶ��󲻴������Զ�����
function c$(fctId,fctClassName){
	var varTempDivObj=$F(fctId);
	if(!varTempDivObj){
		GetPyzyIframe("ifm"+fctId);
		varTempDivObj=document.createElement("div");
		varTempDivObj.id=fctId;
		if(fctClassName && fctClassName!="")varTempDivObj.className=fctClassName;
		document.body.appendChild(varTempDivObj);
	}
	return varTempDivObj;
}

//ȡ��ĳID��iframe�����������ڸ�ID�Ķ������Զ�����
function GetPyzyIframe(fctIfmId,fctVisibility,fctTop,fctLeft,fctWidth,fctHeight){
	var varTempIfmObj=$F(fctIfmId);
	if(!varTempIfmObj){
		varTempIfmObj=document.createElement("iframe");
		varTempIfmObj.id=fctIfmId;
		varTempIfmObj.style.position="absolute";
		varTempIfmObj.style.zIndex="1";
		varTempIfmObj.style.display="none";
		document.body.appendChild(varTempIfmObj);
	}
	if(fctVisibility=="hidden") fctVisibility="none";
	if(fctVisibility=="visible") fctVisibility="";
	if(fctTop)varTempIfmObj.style.top=fctTop+"px";
	if(fctLeft)varTempIfmObj.style.left=fctLeft+"px";
	if(fctWidth)varTempIfmObj.style.width=fctWidth+"px";
	if(fctHeight)varTempIfmObj.style.height=fctHeight+"px";
	if(fctVisibility)varTempIfmObj.style.display=(document.all?fctVisibility:"none");
	if($("#divAddressMenu").css("display")=='block')
	{
		hideselect('c123_');
	}else{
		showselect('c123_');
	}
	return varTempIfmObj;
}

//ȡ��ĳ���������λ�á�����
function getPosition(obj){
	var top=0;
	var left=0;
	var width=obj.offsetWidth;
	var height=obj.offsetHeight;
	while(obj.offsetParent){
		top+=obj.offsetTop;
		left+=obj.offsetLeft;
		obj=obj.offsetParent;
	}
	return{"top":top,"left":left,"width":width,"height":height};
}

//ȡ�ñ���洢�����
function GetValueToInputObj(fctThisObj){
	if(!fctThisObj)return null;
	var varThisObjAutoInput=(fctThisObj.getAttributeNode("value_to_input")?fctThisObj.getAttributeNode("value_to_input").value:"");
	if(varThisObjAutoInput=="")return null;
	return $F(varThisObjAutoInput);
}

//�Զ�������һ�������Act�¼�
function AutoNextInputAct(fctThisObj,fctAct){
	var varNextInput=fctThisObj.getAttributeNode("nextinput");
	if(varNextInput && varNextInput!=""){
		if(document.all){
			eval("$F('"+varNextInput.value+"')."+fctAct+"()");
		}else{
			var evt = document.createEvent("MouseEvents");
			evt.initEvent(fctAct,true,true);
			$F(varNextInput.value).dispatchEvent(evt);
		}
		$F(varNextInput.value).focus();
	}
}

//��ĳ�����ĳ�¼����Ӵ�����AddFunToObj(document,"onclick","alert('1');")
function AddFunToObj(fctObj,fctAct,fctFunction){
	if(fctObj.addEventListener){ //!IE
		fctObj.addEventListener(fctAct.replace("on",""),function(e){
			e.cancelBubble=!eval(fctFunction);
		},false);
	}else if(fctObj.attachEvent){ //IE
		fctObj.attachEvent(fctAct,function(){
			return eval(fctFunction);
		});
	}
}
document.write('\
	<style type="text/css">\
		#divAddressMenu {position:absolute;dispaly:none;z-index:10000;overflow:hidden;width:156px;background-color:#faf7e7;border:solid #666 1px;font-size:12px;}\
		#divAddressMenu h4{text-align:left;border-bottom:solid #666 1px;color:#999999;font-size:12px;line-height:20px; font-weight:100; padding:2px 3px; margin:0;color:#70bd20;}\
		#divAddressMenu div{padding:3px 0;}\
		#divAddressMenu a {display:block;width:156px!important;width:100%;padding:1px 2px 2px 2px;cursor:default;text-decoration:none;color:#333;border:solid #ffffff 1px;background-color:none;text-align:left;}\
		#divAddressMenu a span{float:right;}\
		#divAddressMenu a:hover {background-color:#eee5b4;color:#990000;}\
		#divAddressMenu p{margin:3px; padding:0;font-size:12px;line-height:20px;}\
	</style>\
');
var varPageId=0;
	
//���ɲ���ʾ�����������˵�
function GetCityList(fctThisObj){

//��������
//��������
	//$("#Carstorediv_e").hide();
	//$("#regiondiv_e").hide();
	
	//$("#Carstorediv_s").hide();
	//$("#regiondiv_s").hide();
	
//	
//
	var varMenuObj=c$("divAddressMenu");
	var varThisObj=fctThisObj;
	if(varThisObj.id=="menuPageS"||varThisObj.id=="menuPageE"){
		varThisObj=varMenuObj.obj;
	}else{
		varPageId=0;
	}
	//�����ѡ����Value
	var varThisObjAutoInput=GetValueToInputObj(varThisObj); //ȡ�ó��б���ֵ�洢����
	if(varThisObjAutoInput)varThisObjAutoInput.value="";
	//ȡ�ó������ݲ����Ϊ����
	var varObjValue=varThisObj.value;
	var varThisObjAdd=(varThisObj.getAttributeNode("mod_address_suggest")?varThisObj.getAttributeNode("mod_address_suggest").value:"");
	var varData=(varObjValue==""?(varThisObjAdd==""?varAddress2:varThisObjAdd):varAddress2);
	//varAddress2="����#beijing%bj&607,";
	var varHtmlStr="",varCityDataSplit=varData.split(","),varCityDataSplitI,varCityDataSplitIu,varNextPageStr="";
	//�洢��ǰ��������
	varMenuObj.obj=varThisObj;
	var varPageRCount=(varThisObj.getAttributeNode("pagecount")?parseInt(varThisObj.getAttributeNode("pagecount").value,10):8);
	var varThisPageI=0
	for(var i=0;i<varCityDataSplit.length-1;i++){
		varCityDataSplitI=varCityDataSplit[i];
		if(varCityDataSplitI.toUpperCase().indexOf(varObjValue.toUpperCase())>=0 || varObjValue=="" || i==varObjValue){ // || varCityDataSplitI.toLowerCase().indexOf(varObjValue.toLowerCase())>=0
			varThisPageI+=1;
			if(varThisPageI>varPageId*varPageRCount && varThisPageI<=(varPageId+1)*varPageRCount){
				varCityDataSplitISplit=varCityDataSplitI.split("#");
				varHtmlStr+="<a href='javascript:;' onclick='WriteCity(\""+varCityDataSplitI.split("&")[1]+"|"+varCityDataSplitISplit[0]+"\")' id='menuA"+varThisPageI+"' title='"+varCityDataSplitI.split("%")[0].split("#")[1] +'|'+varCityDataSplitISplit[0] +"'><span id='menuA"+varThisPageI+"'9'>"+varCityDataSplitISplit[0]+"&nbsp;&nbsp;</span>"+varCityDataSplitI.split("%")[0].split("#")[1]+"</a>";
			}
		}
	}
	if(varThisPageI>varPageRCount){
		varNextPageStr="<P style='display:none' >&nbsp;<b id=menuPageS style="+(varPageId>0?"cursor:pointer;":"color:#666666;")+">&lt;&lt;��һҳ��</b>"
		varNextPageStr+="<b id=menuPageE style="+(varThisPageI>(varPageId+1)*varPageRCount?"cursor:pointer;":"color:#666666;")+">��һҳ&gt;&gt;</b></p>";
	}
	var varThisObjPosition=getPosition(varThisObj); //ȡ���¼��������ؼ�����
	with(varMenuObj){
		style.top=varThisObjPosition.top+varThisObjPosition.height+"px";
		style.left=varThisObjPosition.left+"px";
		style.display="";
		innerHTML="<div><h4>�������ƴ��/���֡�</h4>"+(varHtmlStr==""?"<nobr>û���ҵ��������Ϣ��"+varObjValue+"����</nobr>":varHtmlStr+varNextPageStr)+"</div>";
	}
	GetPyzyIframe("ifm"+varMenuObj.id,"visible",(varThisObjPosition.top+varThisObjPosition.height),varThisObjPosition.left,varMenuObj.offsetWidth,varMenuObj.offsetHeight); //ȡIframe
	return false;
}
//ѡ��ĳ����
function WriteCity(fctI){
	
	varMenuValue=fctI.split("|");
	//$("#city_spotline_hide").val(varMenuValue[0]);
	//$("#txtspotlinecity").val(varMenuValue[1]);
	document.getElementById("city_spotline_hide").value=varMenuValue[0];
	document.getElementById("txtspotlinecity").value=varMenuValue[1];
}
function GetCityList2(fctThisObj){

//��������
//��������
	//$("#Carstorediv_e").hide();
	//$("#regiondiv_e").hide();
	
	//$("#Carstorediv_s").hide();
	//$("#regiondiv_s").hide();
	
//	
//
	var varMenuObj=c$("divAddressMenu");
	var varThisObj=fctThisObj;
	if(varThisObj.id=="menuPageS"||varThisObj.id=="menuPageE"){
		varThisObj=varMenuObj.obj;
	}else{
		varPageId=0;
	}
	//�����ѡ����Value
	var varThisObjAutoInput=GetValueToInputObj(varThisObj); //ȡ�ó��б���ֵ�洢����
	if(varThisObjAutoInput)varThisObjAutoInput.value="";
	//ȡ�ó������ݲ����Ϊ����
	var varObjValue=varThisObj.value;
	var varThisObjAdd=(varThisObj.getAttributeNode("mod_address_suggest")?varThisObj.getAttributeNode("mod_address_suggest").value:"");
	var varData=(varObjValue==""?(varThisObjAdd==""?varAddress2:varThisObjAdd):varAddress2);
	//varAddress2="����#beijing%bj&607,";
	var varHtmlStr="",varCityDataSplit=varData.split(","),varCityDataSplitI,varCityDataSplitIu,varNextPageStr="";
	//�洢��ǰ��������
	varMenuObj.obj=varThisObj;
	var varPageRCount=(varThisObj.getAttributeNode("pagecount")?parseInt(varThisObj.getAttributeNode("pagecount").value,10):8);
	var varThisPageI=0
	for(var i=0;i<varCityDataSplit.length-1;i++){
		varCityDataSplitI=varCityDataSplit[i];
		if(varCityDataSplitI.toUpperCase().indexOf(varObjValue.toUpperCase())>=0 || varObjValue=="" || i==varObjValue){ // || varCityDataSplitI.toLowerCase().indexOf(varObjValue.toLowerCase())>=0
			varThisPageI+=1;
			if(varThisPageI>varPageId*varPageRCount && varThisPageI<=(varPageId+1)*varPageRCount){
				varCityDataSplitISplit=varCityDataSplitI.split("#");
				varHtmlStr+="<a href='javascript:;' onclick='WriteCity2(\""+varCityDataSplitI.split("&")[1]+"|"+varCityDataSplitISplit[0]+"\")' id='menuA"+varThisPageI+"' title='"+varCityDataSplitI.split("%")[0].split("#")[1] +'|'+varCityDataSplitISplit[0] +"'><span id='menuA"+varThisPageI+"'9'>"+varCityDataSplitISplit[0]+"&nbsp;&nbsp;</span>"+varCityDataSplitI.split("%")[0].split("#")[1]+"</a>";
			}
		}
	}
	if(varThisPageI>varPageRCount){
		varNextPageStr="<P style='display:none' >&nbsp;<b id=menuPageS style="+(varPageId>0?"cursor:pointer;":"color:#666666;")+">&lt;&lt;��һҳ��</b>"
		varNextPageStr+="<b id=menuPageE style="+(varThisPageI>(varPageId+1)*varPageRCount?"cursor:pointer;":"color:#666666;")+">��һҳ&gt;&gt;</b></p>";
	}
	var varThisObjPosition=getPosition(varThisObj); //ȡ���¼��������ؼ�����
	with(varMenuObj){
		style.top=varThisObjPosition.top+varThisObjPosition.height+"px";
		style.left=varThisObjPosition.left+"px";
		style.display="";
		innerHTML="<div><h4>�������ƴ��/���֡�</h4>"+(varHtmlStr==""?"<nobr>û���ҵ��������Ϣ��"+varObjValue+"����</nobr>":varHtmlStr+varNextPageStr)+"</div>";
	}
	GetPyzyIframe("ifm"+varMenuObj.id,"visible",(varThisObjPosition.top+varThisObjPosition.height),varThisObjPosition.left,varMenuObj.offsetWidth,varMenuObj.offsetHeight); //ȡIframe
	return false;
}
//ѡ��ĳ����
function WriteCity2(fctI){
	
	varMenuValue=fctI.split("|");
	//$("#city_spotline_hide2").val(varMenuValue[0]);
	//$("#txtspotlinecity2").val(varMenuValue[1]);
	document.getElementById("city_spotline_hide2").value=varMenuValue[0];
	document.getElementById("txtspotlinecity2").value=varMenuValue[1];
}
//���س����б�
function _Hidden(e){
	e=e?e:event;
	var varMenuObj=c$("divAddressMenu");
	var varThisObj=varMenuObj.obj;
	if(varMenuObj.style.display!="none"){
		if(e){
			var EventOBJ=(e.srcElement?e.srcElement:e.target);
			if(EventOBJ.id=="menuPageS" && EventOBJ.style.color==""){ //�������ǡ���һҳ�������Ϸ�ҳ
				varPageId=varPageId-1;
				GetCityList(EventOBJ);
			}
			if(EventOBJ.id=="menuPageE" && EventOBJ.style.color==""){ //�������ǡ���һҳ�������·�ҳ
				varPageId=varPageId+1;
				GetCityList(EventOBJ);
			}
			if(varThisObj==EventOBJ || EventOBJ.id.indexOf("menuPage")==0 || EventOBJ.id.indexOf("divAddressMenu")==0) return false;
		}
		
		var varThisObjAutoInput=GetValueToInputObj(varThisObj); //ȡ�ó��б���ֵ�洢����
		if($F("menuA1")){ //��������˵��д��ڵ�һ������
			if(!varThisObjAutoInput)varThisObjAutoInput=varThisObj;
			if(varThisObjAutoInput.value=="" || varThisObjAutoInput==varThisObj){ //���������ֵ
				//WriteCity("1");
			}
		}else if(EventOBJ.id.indexOf("menuA")<0){ //��������˵��в��������������ĳ���
			if(varThisObj)varThisObj.value="";
		}
		varMenuObj.style.display="none";
		GetPyzyIframe("ifm"+varMenuObj.id,"hidden");
	}
}
document.write('\
	<style type="text/css">\
		.DateListBox{float:left;border:solid #FC7A7D 1px;width:147px !important;width:142px;height:168px !important;height:186px;font-size:12px;text-align:center;}\
		.DateListBox h1{width:100%;background-color:#FFF4F4;color:#B42929;font-size:12px;height:20px;font-weight:bold;line-height:20px;vertical-align:middle;margin:0px;}\
		.DateListBox div{float:left;border:solid #EB696C 1px;background-color:#EB696C;color:#FFFFFF;width:19px !important;width:17px;height:20px;font-size:12px;font-weight:bold;line-height:20px;vertical-align:middle;}\
		.DateListBox a{float:left;color:#990000;border:solid #ffffff 1px;background-color:#ffffff;width:19px !important;width:17px;height:19px !important;height:22px;font-size:12px;line-height:20px;vertical-align:middle;}\
		.DateListBox a:hover{border:solid #F2C2BD 1px;background-color:#FBEDEC;}\
		.DateListBox .aSelect{cursor:pointer;border:solid #DEB4B4 1px;background-color:#FAE0CF;color:#FF0000;}\
		.PyzyDateBox{position:absolute;z-index:10000;dispaly:none;background-color:#FFFFFF;border:solid #EBcccC 1px;height:170px;width:298px !important;width:290px;}\
	</style>\
');

//ȡ�������б��ú��������������Ҫ����������õ��ض��������У��縡���㡢�̶�DIV��
function GetMonthHTML(fctStaDate,fctDate){
	if(!fctDate)fctDate=new Date(); //Ĭ��Ϊ��ǰ����
	var varYear=fctDate.getFullYear();
	var varMonth=fctDate.getMonth();
	var varNextMonth=new Date(varYear,varMonth+1,1);
	var varThisMonthButDay = new Date(varNextMonth-86400000); //�������һ��

	var varThisDate,varThisWeekDay,varThisMonthHTML="";
	varThisMonthHTML+="<h1>"+varYear+"��"+(varMonth+1)+"��</h1>"
	varThisMonthHTML+="<div>��</div><div>һ</div><div>��</div><div>��</div><div>��</div><div>��</div><div>��</div>"
	for(var DayI=1;DayI<=varThisMonthButDay.getDate();DayI++){
		varThisDate=new Date(varYear,varMonth,DayI);
		varThisWeekDay=varThisDate.getDay();
		if(DayI==1){
			for(var spcI=0;spcI<varThisWeekDay;spcI++){
				varThisMonthHTML+="<a></a>"
			}
		}
		varThisMonthHTML+="<a "+((fctStaDate && fctStaDate!="")?(varThisDate<fctStaDate?"old":""):"")+" href=javascript:; onclick='SelectDate(this)' title='"+varYear+"-"+(varMonth+1)+"-"+DayI+"'>"+DayI+"</a>";
	}
	return '<div class="DateListBox">'+varThisMonthHTML+'</div>';
}
//ѡ������
function SelectDate(fctAObj){
	if(fctAObj.href||fctAObj.className=="aSelect"){
		var varValueObj=$F("divPyzyDateBox").Obj;
		var varValueToObj=GetValueToInputObj(varValueObj);
		if(varValueToObj)varValueObj=varValueToObj;
		if(varValueObj.value==fctAObj.title){
			varValueObj.value="";
		}else{
			varValueObj.value=fctAObj.title;
		}
		$F("divPyzyDateBox").style.display="none";
		$F("divPyzyDateBox").bodyclick="";
		GetPyzyIframe("ifmdivPyzyDateBox","hidden");
		//AutoNextInputAct($F("divPyzyDateBox").Obj,"click");
	}
}
//��������
function HiddenDateBox(){
	if($F("divPyzyDateBox")){
		if($F("divPyzyDateBox").style.display!="none" && $F("divPyzyDateBox").bodyclick=="1"){
			$F("divPyzyDateBox").style.display="none";
			$F("divPyzyDateBox").bodyclick="";
			GetPyzyIframe("ifmdivPyzyDateBox","hidden");
		}else{
			$F("divPyzyDateBox").bodyclick="1";
		}
	}
}
//��ʾ����
function ShowTwoMonthList(fctThisObj,fctJNum,fctStaDate){
	if(!fctJNum)fctJNum=0;
	if(!fctThisObj)fctThisObj="";
	var varStaDate=null,varTheDate=new Date();
	if(fctStaDate||fctStaDate==""){
		varStaDate=new Date(new Date()-86400000); //���û�ж�������ʹ�õĿ�ʼʱ�����Զ���Ϊ����
		var varStaDateSplit=fctStaDate.split("-");
		if(varStaDateSplit.length==3){
			varStaDate=new Date(varStaDateSplit[0],parseInt(varStaDateSplit[1],10)-1,varStaDateSplit[2]);//fctStaDate=new Date();
		}
		varTheDate=varStaDate;
		if(fctStaDate=="")fctStaDate=varStaDate.getFullYear()+"-"+(varStaDate.getMonth()+1)+"-"+varStaDate.getDate();
	}
	var varShowTwoMonthHTML="";
	for(var i=0+fctJNum;i<2+fctJNum;i++){
		varShowTwoMonthHTML+=GetMonthHTML((varStaDate?varStaDate:""),new Date(varTheDate.getFullYear(),varTheDate.getMonth()+i,1));
	}
	if(varStaDate)varShowTwoMonthHTML=varShowTwoMonthHTML.replace(/old href/g,"style=color:#999 old");
	if(fctThisObj.value!=""){ //����ѡ������ʽ���иı�
		if(/^((\d{4})|(\d{2}))-(\d{1,2})-(\d{1,2})$F/g.test(fctThisObj.value))varShowTwoMonthHTML=varShowTwoMonthHTML.replace(fctThisObj.value,fctThisObj.value+"' class='aSelect");
	}
	var varDateBoxObj = c$("divPyzyDateBox","PyzyDateBox");
	varDateBoxObj.bodyclick="";
	if(fctThisObj!=""){ //�������굽����λ��
		var varThisObjPosition=getPosition(fctThisObj);
		varDateBoxObj.style.top=(varThisObjPosition.top+varThisObjPosition.height)+"px";
		varDateBoxObj.style.left=varThisObjPosition.left+"px";
		varDateBoxObj.style.display=""; //hidden
		varDateBoxObj.Obj=fctThisObj;
	}
	varDateBoxObj.innerHTML=varShowTwoMonthHTML+'<div style="margin-top:'+(document.all?'-180':'-1')+'px;color:#B42929;font-size:12px;font-weight:bold;line-height:8px;">&nbsp;<span style="padding-right:'+(document.all?'220':'232')+'px;cursor:pointer;" onclick="ShowTwoMonthList(null,'+(fctJNum-1)+(fctStaDate?',\''+fctStaDate+'\'':'')+')" title="����"><<</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="cursor:pointer;" onclick="ShowTwoMonthList(null,'+(fctJNum+1)+(fctStaDate?',\''+fctStaDate+'\'':'')+')" title="����">>></span></div>';
	GetPyzyIframe("ifmdivPyzyDateBox","visible",(varThisObjPosition.top+varThisObjPosition.height),varThisObjPosition.left,varDateBoxObj.offsetWidth,varDateBoxObj.offsetHeight);//ȡIframe
}
AddFunToObj(window,"onload","AddFunToObj(document,'onclick','_Hidden("+(document.all?"":"e")+");HiddenDateBox();');");
function hideselect(per)
{
	var _version = $.browser.version;
	if ( _version == 6.0 ) {
		$("select",document).each(function(){
			if($(this).attr('name'))
			{
				if($(this).attr('name').substring(0,5)==per)
				{
					name = $(this).attr('name').substring(5);
					$(this).attr('name',name);
					$(this).css('display','');
				}
				if($(this).css('display')!='none')
				{
					name = per+$(this).attr('name');
					$(this).attr('name',name);
				}
				$(this).css('display','none');
			}
		});
	}
}
function showselect(per)
{
	var _version = $.browser.version;
	if ( _version == 6.0 ) {
		$("select",document).each(function(){
			if($(this).attr('name'))
			{
				if($(this).attr('name').substring(0,5)==per)
				{
					name = $(this).attr('name').substring(5);
					$(this).attr('name',name);
					$(this).css('display','');
				}
			}
		});
	}
}