<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib uri="webwork" prefix="ww"%>
<%!
int index =0;
%>
<%!int subindex=0; %>
<%
try{
	 index = Integer.parseInt(request.getParameter("index"));
	 subindex =  Integer.parseInt(request.getParameter("subindex"));
	
}catch(Exception e){
}	
%>



<%!public String setIndex(int aindex){
	String ret = "";
	if(index == aindex){
		ret =" class=\"cui_nav_current\" ";
	}
	return ret;
}
%>
<%!public String setSubIndex(int aindex, int asubindex) {
		String ret = "";
		if (index == aindex && subindex == asubindex) {
			ret = " style=\"color: blue;\" ";
		}

		return ret;
	}%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="cache-control" content="no-cache"> 
<meta http-equiv="expires" content="0">   

<script src="js/jquery/jquery-1.4.2.min.js" type=text/javascript></script>   
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<meta property="qc:admins" content="14674104326342106375" />
<title>��������������:�Ƶ�Ԥ��,��ƱԤ����ѯ,���ζȼ�,���ù���</title>

<!-- InstanceBegin name="position" -->
<link href="css/private_index_v3_20130322.css?ws_www20130827.css"
	rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" type="text/css" href="css/top.css">
<style id="headStyleId" type="text/css" media="all">
.cui_nav li[id]:hover .cui_subnav_wrap {
	display: block;
}

.cui_nav li[id]:hover .cui_subnav_wrap {
	z-index: 10;
}
</style>

<!--[if lt IE 9]>
        <script type="text/javascript">
			    if(screen.width <= 1200) {
					    var link = document.createElement('link');
					    link.rel = "stylesheet";
					    link.type="text/css";
					    link.href="css/private_index_1000.css";
					    document.getElementsByTagName('head')[0].appendChild(link);
                 }   
        </script>
        <![endif]-->
</head>
<body>



<div class="pop_attention" id="qqcaibei" style="display: none"></div>
<div class="pop_attention" id="popup" style="display: none"></div>
<div class="pop_attention" id="bindemail" style="display: none"></div>
<!-- header start-->
<!--head-->

<!--nav-->
<!-- ͷ����ʼ -->
<div class="cui_hd_cont">
    	<div class="cui_hd" id="cui_hd">
		<!--logo-->
		<h1 class="">
		<img src="images/gd_logo.png" width="175px" height="74px" />
		
		</h1>
		<!--help center & weibo & multi lang-->
		<div class="cui_toolkit">
		
			
			<!--
			<a href="#" rel="nofollow"  class="cui_help">�ͷ�����</a>
			|
			<a href="http://weibo.com/ctrip/" rel="nofollow" class="cui_weibo" target="_blank">��עЯ��</a>
			   |
			<a class="cui_lang_en" href="http://english.ctrip.com/" rel="nofollow">English</a>
			
         
            |
			<div class="cui_lang"  onmouseover="this.className='cui_lang cui_lang_hover'" onmouseout="this.className='cui_lang'">
				<b></b>
				<div class="cui_lang_list">
					<a class="cui_lang_gb" href="http://www.ctrip.com/">�����</a>
					<a href="http://big5.ctrip.com/" class="cui_lang_big5" rel="nofollow">�����</a>
					<a class="cui_lang_jap" href="http://jp.ctrip.com/" rel="nofollow">�����</a>
					<a class="cui_lang_korea" href="http://kr.ctrip.com/" rel="nofollow">�����</a>
					<a href="http://de.ctrip.com/" class="cui_lang_de" rel="nofollow">Deutsch</a>
					<a href="http://fr.ctrip.com/" class="cui_lang_fr" rel="nofollow">Fran&#231;ais</a>
					<a href="http://es.ctrip.com/" class="cui_lang_es" rel="nofollow">Espa&#241;ol</a>
					<a href="http://ru.ctrip.com/" class="cui_lang_ru" rel="nofollow">������ܧڧ�</a>
				</div>
              
			</div>
              -->
		</div>
		<!--telphone & mobile-->
		<div class="cui_tel" onmouseover="this.className='cui_tel cui_tel_hover'" onmouseout="this.className='cui_tel'" onclick="this.className='cui_tel cui_tel_hover'">
			<b></b>
			<span class="cui_tel_in" title="�⾳�ڳ�����">�ͷ���<i>${tel}</i></span>
			<div class="cui_tel_more">
				<span class="cui_tel_in" title="��������">�ͷ���<i>${tel}</i></span>
				<span class="cui_tel_in">�ͷ���<i>${tel}</i></span>
				<span class="cui_tel_in">�ͷ���<i>${tel}</i></span>
			</div>
		</div>
		<!--wireless-->
		<div class="cui_wireless">|<a href="#" rel="nofollow">Я������</a>
		</div>
	</div>
  </div>
  
  
	    <!--nav-->
        <!-- ͷ����ʼ -->       
	    <div id="cui_nav" class="cui_nav_single">
		<div class="base_nav">
			<ul class="cui_nav">
				<li id="cui_nav_home" <%= setIndex(0)%> >
					<a href="" class="cui_nav_non"  title="��ҳ"><span>��ҳ</span></a>
				</li>
				<li class="sep"></li>
				<li id="cui_nav_flight" <%= setIndex(1)%>>
					<a href="ticticket!toTicket.jspx" class="cui_nav_flight cui_nav_has" title="��Ʊ"><span>��Ʊ</span><i class="cui_ico_triangle"></i></a>
					<div class="cui_subnav_wrap"><div class="cui_sub_nav"><a href="ticticket!toTicket.jspx" <%= setSubIndex(1,1)%>  title="���ڻ�Ʊ">���ڻ�Ʊ</a>|<a href="international!toInterNational.jspx" <%= setSubIndex(1,2)%> title="���ʻ�Ʊ">���ʻ�Ʊ</a></div></div>
				</li>
				<li class="sep"></li>
				<li id="cui_nav_hotel" <%= setIndex(2)%>>
					<a href="hotel!toindex.jspx" class="cui_nav_hotel cui_nav_has" title="�Ƶ�"><span>�Ƶ�</span><i class="cui_ico_triangle"></i></a>
					<div class="cui_subnav_wrap"><div class="cui_sub_nav"><a href="hotel!toindex.jspx" <%= setSubIndex(2,1)%> title="���ھƵ�">���ھƵ�</a></div></div>
				</li>
				<li class="sep"></li>
				<li id="cui_nav_vac" <%= setIndex(3)%>>
					<a href="spotticket.jspx" class="cui_nav_vac cui_nav_has" title="����"><span>����</span><i class="cui_ico_triangle"></i></a>
					<div class="cui_subnav_wrap"><div class="cui_sub_nav"><a href="spotline.jspx" title="������ҳ">������ҳ</a>|<a href="spotline.jspx" title="������·">������·</a>|<a href="spotticket.jspx" title="��Ʊ">��Ʊ</a>|<a href="buying.jspx" title="�Ź�">�Ź�</a>|<a href="#" title="ǩ֤">ǩ֤</a></div></div>
				</li>
				
				<li class="sep"></li>
				<li id="cui_nav_trains">
					<a href="#" class="cui_nav_non" title="��Ʊ"><span>��Ʊ</span></a>
				</li>
				<li class="sep"></li>
				<li id="cui_nav_destination" <%= setIndex(5)%>>
					<a href="index!toinformation.jspx" class="cui_nav_non" title="��Ѷ����"><span>��Ѷ����</span></a>
				</li>
				<li class="sep"></li>
				<li id="cui_nav_lpk" <%= setIndex(6)%>>
					<a href="index!tohelp.jspx" title="��������" class="cui_nav_non"><span>��������</span></a>
				</li>
				
				<li class="sep"></li>
				<li id="cui_nav_more">
					<a href="#" class="cui_nav_more cui_nav_has" title="����" rel="nofollow"><span>����</span><i class="cui_ico_triangle"></i></a>
					<div class="cui_subnav_wrap"><div class="cui_sub_nav"><a href="#" title="���ֽ���" rel="nofollow">���ֽ���</a>|<a href="#" title="������" rel="nofollow">������</a>|<a href="#" title="������" rel="nofollow">������</a>|<a href="#" title="����" rel="nofollow">����</a></div></div>
				</li>
				<ww:if test="#session.loginuser!=null">
				<li class="sep"></li>
				<li id="cui_nav_sl" <%= setIndex(-1)%>>
					<a href="login!toMyCenter.jspx" title="��������" class="cui_nav_non"><span>��������</span></a>
				</li>
				</ww:if>
				<li class="sep"></li>
				<li id="cui_nav_sl">
					<a  href="http://www.19166.com/Platform" title="������½" class="cui_nav_non"><span>������¼</span></a>
				</li>
                <li id="loginDivLi" class="cui_myctrip">
                <!--
					<a class="cui_myctrip_status" href="http://my.ctrip.com/home/myinfo.aspx" rel="nofollow">�ҵ�Я��</a>
					<div id="usernameId" class="cui_myctrip_username"></div>
					<b></b>-->
					<div class="cui_myctrip_lr">
					<ww:if test="#session.loginuser==null">
						<a id="loginBtn1" href="login!toMyCenter.jspx" class="cui_links_login" rel="nofollow">��¼</a>|<a href="login!toRegsit.jspx" class="cui_links_reg" rel="nofollow">ע��</a>
					</ww:if><ww:else>
						<a href="login!loginout.jspx" class="cui_links_login">�˳�</a>
					</ww:else>	
					</div>
					<!--��¼��-->
				</li>
				
			</ul>
		</div>
	</div>
       
       
       
        <script type="text/javascript">
            ; (function () { var D = document, $ = function (id) { return D.getElementById(id) }, st = null, st2 = null, lazyTime = 0, lis = [$('cui_nav_hotel'), $('cui_nav_vac'), $('cui_nav_flight'), $('cui_nav_more')], E = { 'onmouseenter': function (o, f) { if (D.all) { o.onmouseenter = f } else { o.onmouseover = function (e) { e.relatedTarget == null ? f() : (!(this === e.relatedTarget || this.compareDocumentPosition(e.relatedTarget) == 20) && f()) } } }, 'onmouseout': function (o, f) { if (D.all) { o.onmouseleave = f } else { o.onmouseout = function (e) { e.relatedTarget == null ? f() : (!(this === e.relatedTarget || this.compareDocumentPosition(e.relatedTarget) == 20) && f()) } } }, 'addEvent': function (el, type, handler) { if (el.addEventListener) { el.addEventListener(type, handler, false) } else if (el.attachEvent) { el.attachEvent("on" + type, handler) } else { el["on" + type] = handler } } }, F = { 'setTime': function () { E.onmouseenter($('cui_nav'), function () { setTimeout(function () { lazyTime = 150 }, 30) }); E.onmouseout($('cui_nav'), function () { lazyTime = 0 }) }, 'initEvent': function () { for (var i = 0, len = lis.length; i < len; i++) { (function () { var j = i; E.onmouseenter(lis[j], function () { F.interFn(lis[j]) }); E.onmouseout(lis[j], function () { F.outerFn(lis[j]) }) })(i) } }, 'reset': function () { for (var i = 0, len = lis.length; i < len; i++) { if (lis[i].className.indexOf('cui_nav_current') > -1) { lis[i].className = 'cui_nav_current' } else { lis[i].className = '' } } }, 'padReset': function (j) { for (var i = 0, len = lis.length; i < len; i++) { if (lis[i].className.indexOf('cui_nav_current') > -1) { lis[i].className = 'cui_nav_current' } else { if (i !== j) { lis[i].className = '' } } } }, 'interFn': function (obj) { if (st2 != null) { clearTimeout(st2); st2 = null } st = setTimeout(function () { F.reset(); if (obj.className.indexOf('cui_nav_current') > -1) { } else { obj.className = 'cui_nav_o' } }, lazyTime) }, 'outerFn': function (obj) { if (st != null) { clearTimeout(st); st = null } st2 = setTimeout(function () { F.reset(); if (obj.className.indexOf('cui_nav_current') > -1) { obj.className = 'cui_nav_current' } else { obj.className = '' } }, 250) }, 'initMobile': function () { for (var i = 0, len = lis.length; i < len; i++) { (function () { var j = i; var oneLevel = lis[j].getElementsByTagName('A')[0]; oneLevel.href = '###'; oneLevel.onmousedown = function () { F.padReset(j); if (lis[j].className.indexOf('cui_nav_current') === -1) { if (lis[j].className.indexOf('cui_nav_o') > -1) { lis[j].className = ''; oneLevel.style.visibility = 'hidden'; setTimeout(function () { oneLevel.style.visibility = 'visible' }, 10) } else { lis[j].className = 'cui_nav_o' } } } })(i) } }, 'contains': function (target) { for (var i = 0, len = lis.length; i < len; i++) { if (lis[i].compareDocumentPosition(target) - 19 > 0) { return true } } return false } }; if ($('headStyleId')) { $('headStyleId').parentNode.removeChild($('headStyleId')) } if (/ip(hone|od)|ipad/i.test(navigator.userAgent)) { F.initMobile(); E.addEvent(D.body, 'click', function (e) { var target = e.target || e.srcElement; if (!F.contains(target)) { F.reset() } }) } else { F.setTime(); F.initEvent() } })();
        </script>
<!-- header end-->
<!-- ͷ�������� -->
<!--body start-->
<div id="cui_bd" class="cui_bd">
<div class="bd_row"><!-- tab���� start -->
<div id="searchBox" class="searchbox">
<ul id="searchBoxUl" class="s_tab">
	<li styleTag="hotel" class="s_tab_current">�Ƶ�</li>
	<li styleTag="flight" class="s_tab_nocurrent">��Ʊ</li>
	<li styleTag="vacation" class="s_tab_nocurrent">����</li>
	<li styleTag="train" class="s_tab_nocurrent">��Ʊ</li>
	<li styleTag="ticket" class="s_tab_nocurrent">��Ʊ</li>
	<li styleTag="mobilePhone" class="s_tab_nocurrent">�ֻ���</li>
	
</ul>
<!-- �������Ʒ���ݿ�ʼ --> 
<script type="text/javascript">
var  searchFile = { chinaHotel: "js/HD.js", 
inteHotel: "js/HI.js", 
chinaFlight: "js/ctrip/FD.js", 
inteFlight: "js/FI.js", 
vacation: "js/VD.js", 
ticket: "js/ctrip/MP.js", 
mobilePhone: "js/ctrip/MB.js", 
train: "js/ctrip/HC.js"};</script>
<!-- �Ƶ�������ʼ -->
<div styletag="hotel" class="s_content">
<p class="s_subtab_a" id="hotelSwitch"><a href="javascript:void(0);"
	class="current" data-index="0">���ھƵ�</a> <a href="javascript:void(0);"
	data-index="1" class="">����Ƶ�</a></p>
<!-- ���ھƵ� -->
<form id="chinaHotelForm" method="post" name="chinaHotelForm"
	action="hotel!Seach.jspx">
<div class="s_item_cont">
<div class="s_item w100">��ס����<input type="text" value="����/ƴ��"
	class="w01" name="CityName" id="HD_CityName" autocomplete="off" /> <input
	type="hidden" id="HD_CityId" name="cityId" /> <input type="hidden"
	id="HD_CityPy" name="cityPY" /></div>
<div class="s_item_hotel" id="HD_SearchHistory" style="display: none">
<a class="s_history_btn" href="javascript:;"><i></i>������ʷ</a>
<div class="history_list"></div>
</div>
</div>
<div class="s_item_cont">
<div class="s_item">��ס����<input type="text" value="yyyy-mm-dd"
	name="checkIn" id="HD_CheckIn" autocomplete="off" /></div>
<div class="s_item2">�˷�����<input type="text" value="yyyy-mm-dd"
	name="checkOut" id="HD_CheckOut" autocomplete="off" /></div>
</div>
<div class="s_item_cont">
<div class="s_item">�Ƶ꼶��<select id="searchHotelLevelSelect"
	name="Star">
	<option selected="selected" value="0">����</option>
	<option value="5">���Ǽ�/����</option>
	<option value="4">���Ǽ�/�ߵ�</option>
	<option value="3">���Ǽ�/����</option>
	<option value="2">���Ǽ�����/����</option>
</select></div>
</div>
<div class="s_item_cont">
<div id="hotelAddressDiv" class="s_item w100">�ؼ��� <input
	type="text" _cqnotice="��ѡ��Ƶ���/�ر�/��Ȧ" id="HD_TxtKeyword"
	name="keywordNew" class="w01 inputSel" autocomplete="on" maxlength="50"
	style=""> <input type="hidden" id="hotelAreaName"
	name="keyword" /> <input type="hidden" id="positionArea"
	name="positionArea" /> <input type="hidden" id="positionId"
	name="positionId" /> <input type="hidden" id="zoneId" name="zoneId" />
<input type="hidden" id="locationId" name="locationId" /> <input
	type="hidden" id="metroId" name="metroId" /> <input type="hidden"
	id="landMarkId" name="landMarkId" /> <input type="hidden" id="forTW"
	name="city" /> <input type="hidden" id="district_city"
	name="district_city" /></div>
</div>
<div class="s_button_area"><input type="button" value="��ͼ����" style="display: none"
	class="cui_btn_map" title="��ͼ����" id="HD_MapBtn" /> <input
	type="submit" value="����" class="s_btn" title="����" id="sub" /></div>
</form>
<!-- ����Ƶ� -->
<form id="inteHotelForm" action="#" method="POST"
	name="inteHotelForm" 
	style="display: none;">

<div class="s_item_cont">
<div class="s_item w100">��ס����<input type="text" value="����/Ӣ��/ƴ��"
	id="inteCityName" class="w01" name="cityname" autocomplete="off" /> <input
	type="hidden" id="inteCityId" name="city" /> <input type="hidden"
	id="inteCityPy" /></div>
</div>
<div class="s_item_cont">
<div class="s_item">��ס����<input type="text" value="yyyy-mm-dd"
	id="inteCheckIn" name="checkIn" autocomplete="off" /></div>
<div class="s_item2">�˷�����<input type="text" value="yyyy-mm-dd"
	id="inteCheckOut" name="checkOut" autocomplete="off" /></div>
</div>
<div class="s_item_cont">
<div class="s_item">Ԥ������<select id="" name="rooms">
	<option value="0" selected="selected">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
</select></div>
</div>
<div class="s_item_cont">
<div class="s_item w100">�Ƶ�����<input type="text" id="inteHotelName"
	class="w01" autocomplete="off" name="hotelName" _cqnotice="ѡ��(����/ƴ��)" /></div>
</div>
<div class="s_button_area"><input type="button" value="����"
	class="s_btn" title="����" id="HI_Btn1" onclick="alert('���ʾƵ�����ά����!!!');" /></div>

</form>
</div>
<!-- �Ƶ��������� --> <!--��Ʊ������ʼ-->
<div styletag="flight" class="s_content" style="display: none;"
	flight="true">
<p class="s_subtab_a" id="flightSwitch"><a
	href="javascript:void(0);" data-index="0" class="current"
	tag="fltDomestic" faction="http://flights.ctrip.com/booking/">���ڻ�Ʊ</a>
<a href="javascript:void(0);" data-index="1" tag="fltInternational"
	faction="http://flights.ctrip.com/International/ShowFareFirst.aspx"
	class="">���ʻ�Ʊ</a></p>
<!---���ڻ�ƱHTML�ṹ��ʼ--->
<form id="FD_ChinaFlightForm" name="FD_ChinaFlightForm" action="ticticket!toTicketList.jspx" method="POST">
<input
	type="hidden" name="FlightSearchType" value="S" /> <input
	type="hidden" name="IsSingleSearchPost" value="T" /> <input
	type="hidden" name="PassengerType" value="ADU" />
<p class="s_type" id="FD_flightSubSwitch">��������<label
	class="index_label"><input name="s_traveltype" tabindex="161"
	autocomplete="off" type="radio" MM="S" value="S" checked="checked" />����</label>&nbsp;
<!--  
<label class="index_label"><input name="s_traveltype"
	tabindex="162" autocomplete="off" type="radio" MM="D" value="D" />����</label>&nbsp;
<label class="index_label"><input name="s_traveltype"
	tabindex="163" autocomplete="off" type="radio" MM="M" value="M" />����</label>
	-->
	
	</p>
<div class="s_item_cont s_item_cont_ex">
<div class="s_exchange"><a href="#">��</a></div>
<!-- ����ʱ����ʾ -->
<div class="s_item">��������<input type="text" tabindex="164"
	name="DCityName1" id="FD_StartCity" data-target="DCity1" /><input
	type="hidden" id="FD_DCity1" name="s_depcitycode"></div>
<div class="s_item2"><span id="FD_StartDateSpan">��������</span><input
	type="text" id="FD_StartDate" name="s_startdate" tabindex="168"
	autocomplete="off" /></div>
<!-- ����ʱ��"��������"��Ϊ"��1������" --></div>
<div class="s_item_cont" id="FD_TranCityDiv" style="display: none;"><!-- ����ʱ���˴���ʾ���� -->
<div class="s_item">��ת����<input type="text" id="FD_TranCity"
	tabindex="166" data-target="TransitCity" /><input type="hidden"
	id="FD_TransitCity" name="TransitCity"></div>
<div class="s_item2">��2������<input type="text" id="FD_TranDate"
	tabindex="167" /></div>
</div>
<div class="s_item_cont"><!-- ����ʱ������������������ -->
<div class="s_item">�������<input type="text" tabindex="165"
	name="ACityName1" id="FD_DestCity" data-target="ACity1" /><input
	type="hidden" id="FD_ACity1" name="s_arrcitycode"></div>
<div class="s_item2 s_disable" style="display: none" id="FD_ReturnDateDiv">��������<input
	type="text" id="FD_ReturnDate" tabindex="169" name="s_backdate" /></div>
</div>
<div class="s_options" id="FD_AdvOptions">
<div class="s_item_cont">
<div class="s_item">��������<select tabindex="170"
	name="PassengerQuantity" id="FD_PassengerQuantitySelect">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
	<option value="10">����9</option>
</select></div>
<div class="s_item2">���չ�˾<select name="s_aircompanycode"
	id="FD_AirlineSelect" tabindex="171">
	<option value="">����</option>
	<option value="CA">�й�����-CA</option>
	<option value="CZ">�Ϸ�����-CZ</option>
	<option value="MU">��������-MU</option>
	<option value="">---------------------------</option>
	<option value="BK">A-�¿����չ�˾-BK</option>
	<option value="JD">B-�����׶��������޹�˾-JD</option>
	<option value="EU">C-�ɶ��������޹�˾-EU</option>
	<option value="CN">D-���»����չ�˾-CN</option>
	<option value="NS">H-�ӱ����չ�˾-NS</option>
	<option value="HU">H-���Ϻ��չ�˾-HU</option>
	<option value="VD">H-���Ϻ������޹�˾-VD</option>
	<option value="G5">H-���ĺ��չ�˾-G5</option>
	<option value="HO">J-���麽�չ�˾-HO</option>
	<option value="KY">K-�����������޹�˾-KY</option>
	<option value="3U">S-�Ĵ����չ�˾-3U</option>
	<option value="SC">S-ɽ�����չ�˾-SC</option>
	<option value="ZH">S-���ں��չ�˾-ZH</option>
	<option value="FM">S-�Ϻ����չ�˾-FM</option>
	<option value="GS">T-��򺽿��������ι�˾-GS</option>
	<option value="PN">X-�������չ�˾-PN</option>
	<option value="JR">X-�Ҹ������������ι�˾-JR</option>
	<option value="MF">X-���ź������޹�˾-MF</option>
	<option value="8L">X-�������չ�˾-8L</option>
	<option value="KN">Z-�й����Ϻ��չ�˾-KN</option>
</select></div>
</div>
<div class="s_item_cont">
<div class="s_item">��Ʊ����<input type="text" id="FD_SendTicketCity"
	tips="��ѡ�����/ƴ��" name="SendTicketCity" tabindex="172" /></div>
<div class="s_item2">��λ�ȼ�<select name="ClassType" tabindex="173"
	id="FD_ClassLevel">
	<option value="">���ò�</option>
	<option value="CF">����/ͷ�Ȳ�</option>
</select></div>
</div>
</div>
<div class="s_item_cont"><a href="#" id="FD_AdvOptionsBtn"
	class="s_high_level"><i></i>�߼�����</a></div>
<div class="s_button_area">
<!--<input type="button" tabindex="175"
	value="������+��" class="cui_btn_pkg" title="������+��"
	id="FD_StartSearchFltHotel" />
	--><!-- ����ʱ���ظð�ť onclick="SeachTicket();" -->
	 <input type="button"
	tabindex="174" value="����" class="s_btn" onclick="SeachTicket();" title="����" id="" />
</div>
</form>
<form id="FD_ChinaFlightHotelForm" action="" target="_blank"
	method="POST"><input type="hidden" name="Adults" value="2" /> <input
	type="hidden" name="Children" value="0" /> <input type="hidden"
	name="Rooms" value="1" /> <input type="hidden" name="Night" value="" />
<input type="hidden" name="DDate" value="" /> <input type="hidden"
	name="RDate" value="" /> <input type="hidden" name="DCitySZM" value="" />
<input type="hidden" name="DCityName" value="" /> <input type="hidden"
	name="ACitySZM" value="" /> <input type="hidden" name="ACityName"
	value="" /></form>
<script type="text/json" id="FD_ChinaFlightConfig">
							{
								today: config.today,
								tomorrow: config.tomorrow,
								oneyear_today: config.oneyear_today,
								charset: cQuery.config('charset'),
								tip: {
									chinaFlight: [
										'�������ڸ�ʽ����ȷ',
										'�������ڸ�ʽ����ȷ',
										'��ѡ���������',
										'��ѡ�񵽴����',
										'�������в��ܺ͵��������ͬ',
										'��ѡ�����ĳ�������',
										'��ѡ�����ķ�������',
										'�������ڲ�������{$today}',
										'�������ڲ������ڳ�������{$startDate}',
										'ֻ�ܲ�ѯһ���ں���',
										'��ѡ����ת����',
										'��ѡ�����ĵ�2������',
										'��2�����ڸ�ʽ����ȷ',
										'��ת���в��ܺͳ���������ͬ',
										'������в��ܺ���ת������ͬ',
										'��2�̳������ڲ������ڵ�1�̳�������',
										'��1�����ڸ�ʽ����ȷ',
										'��ѡ�����ĵ�1������'
									]
								},
								notice: [
									'����/ƴ��'
								],
								msg: {
									"suggestion": "�����ų��У���ֱ��������л�ƴ��",
									'startDate': '��������',
									'firstDate': '��1������'
								}
							}
						</script> <!-- ���ڻ�ƱHTML���� --> 
<!-- ���ʻ�Ʊ -->
<form id="fl_box_search" action="" method="post" style="display: ">
<p class="s_type" id="fl_search_type">��������<label class="index_label"
	data-index="0"><input id="fl_flight_way_s" name="FlightWay"
	type="radio" value="S" />����</label>&nbsp; <label class="index_label"
	data-index="1"><input id="fl_flight_way_d" name="FlightWay"
	type="radio" value="D" checked="checked" />����</label>&nbsp; <label
	class="index_label" data-index="1"><input id="fl_flight_way_o"
	name="FlightWay" type="radio" value="M" />��̣���ȱ�ڳ̣�</label> <span
	class="s_voyage_tip" data-role="jmp"
	data-params="{options:{boundaryShow:false,css:{maxWidth:320,minWidth:300},type:'jmp_title',position:'bottomLeft-topLeft',classNames:{boxType:'jmp_title'},template:'#fl_jmp_title',content:{'txt0':'��̣���ȱ�ڣ�', 'txt1':'<strong>��̣�</strong>ʼ���ص�����Ŀ�ĵ�֮�䣬�ɾ������������ת��ͣ���ĺ��̡�<br /><strong>ȱ�ڳ̣�</strong>���ػ��ĵ�֮��ĺ��̣�ȱ����ʽ����A-B��C-D��AD��BC�ɷֱ�Ϊͬһ����Ĳ�ͬ���С�'}}}"></span>
</p>
<div class="online_single" id="fl_online_single" style="display: ">
<div class="s_item_cont s_item_cont_ex">
<div class="s_exchange"><a href="javascript:;"
	id="fl_exchangeCity">��</a></div>
<div class="s_item online_label">��������<input tabindex="200"
	name="homecity_name" type="text" id="fl_txtDCity" autocomplete="off"
	mod_address_source="flightintl_start"
	mod_address_focusnext="fl_dest_city_1" mod_notice_tip="����/ƴ��/Ӣ��"
	mod_save_id="flightintl_startcity_single" mod_save_value="true"
	mod_address_reference="fl_HomeCityID" mod="address|notice"
	mod_address_tpl="address" /> <input type="hidden" id="fl_HomeCityID"
	name="HomeCityID" /></div>
<div class="s_item2 online_label">��������<input tabindex="202"
	name="DDatePeriod1" type="text" id="fl_txtDDatePeriod1"
	mod="notice|calendar"
	mod_calendar_focusnext="fl_txtADatePeriod1~fl_txtADatePeriod1"
	mod_save_value="true" mod_save_id="flightintl_startdate_single"
	mod_notice_tip="yyyy-mm-dd" autocomplete="off" /></div>
</div>
<div class="s_item_cont">
<div class="s_item online_label">�������<input tabindex="201"
	name="destcity1_name" type="text" id="fl_dest_city_1"
	autocomplete="off" mod_address_source="flightintl_dest"
	mod_save_id="flightintl_arrivalcity_single" mod_notice_tip="����/ƴ��/Ӣ��"
	mod_save_value="true" mod_address_reference="fl_destcityID"
	mod="address|notice" mod_address_tpl="address"
	mod_address_focusnext="fl_txtDDatePeriod1" /> <input type="hidden"
	id="fl_destcityID" name="destcityID" /></div>
<div class="s_item2 online_label" id="fl_return_li">��������<input
	tabindex="203" name="ADatePeriod1" type="text" id="fl_txtADatePeriod1"
	mod="notice|calendar" mod_calendar_reference="fl_txtDDatePeriod1"
	mod_notice_tip="yyyy-mm-dd" mod_save_value="true"
	mod_save_id="flightintl_backdate_single" autocomplete="off" /></div>
</div>
<div class="s_item_cont" id="fl_label_flight">
<div class="s_item">
<div class="s_item_direct"><label class="index_label"><input
	tabindex="204" type="checkbox" id="fl_flight_direct"
	name="flight_direct" value="T" />���鿴ֱ��</label></div>
</div>
</div>
</div>
<div class="online_more" id="fl_online_more" style="display: none">
<div id="fl_flight_multiple"></div>
<!-- hoverʱ����class׷��s_add_voyage_hover���Ƴ�ʱ���� -->
<div class="s_add_voyage" id="fl_add_new_line"><i></i><a
	href="javascript:;">���Ӻ���</a></div>
</div>

<div id="fl_options_flt_in" class="s_options" style="display: none">
<div class="s_item_cont" style="height: auto">
<div class="s_item">�������� <select name="Quantity"
	id="fl_drpQuantity" tabindex="205">
	<option selected="selected" value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
	<option value="7">7</option>
	<option value="8">8</option>
	<option value="9">9</option>
</select></div>
<div class="s_item2" id="fl_airline">���չ�˾ <input type="text"
	class="input_text" id="fl_txtAirline" name="txtAirline"
	mod_address_reference="fl_Airline" mod_address_source="airline"
	mod_notice_tip="��ѡ���Ӣ��/����" mod_address_tpl="airline"
	autocomplete="off" mod="address|notice" tabindex="206" /> <input
	type="hidden" id="fl_Airline" name="Airline" /></div>
<div class="s_item2" id="fl_isType">�˿�����<select name="childtype"
	id="fl_selUserType" tabindex="207">
	<option selected="selected" value="ADT">����</option>
	<option value="CHD">��ͯ��2-12�꣩</option>
</select></div>
<div class="s_item2">��λ�ȼ�<select name="drpSubClass"
	id="fl_drpSubClass" tabindex="208">
	<option selected="selected" value="Y">���ò�</option>
	<option value="S">�������ò�</option>
	<option value="C">�����</option>
	<option value="F">ͷ�Ȳ�</option>
</select></div>
</div>
<div class="s_flt_child_tip" id="fl_childTips" style="display: none">�޳������Ķ�ͯ��ֱ���򺽿չ�˾Ԥ��</div>
</div>
<div style="display: none" id="fl_jmp_title">
<div class="jmp_hd">
<h3>${txt0}</h3>
</div>
<div class="jmp_bd" style="width: 260px">${txt1}</div>
</div>
<input type="hidden" name="hdn_enableCitySelectAjaxCall"
	id="hdn_enableCitySelectAjaxCall" value="1" />
<div class="s_item_cont"><!-- ���������searchbox���Ӹı�߶ȵ�class(�Ӳ�ͬtab���ӵ�class��ͬ)������׷��s_high_level_hover -->
<a href="javascript:;" id="fl_advancedSearch" class="s_high_level"><i></i>�߼�����</a>
</div>
<!-- hideFromCityCode -->
<div class="s_button_area"><input type="button" tabindex="209"
	value="����" class="s_btn" title="����" onclick="alert('���ʻ�Ʊģ����������ά����!');"
	id="" /></div>
<script type="text/json" id="fl_intlMessage">
							  {
								   ERROR_FLIGHT: [
										'��ѡ���{number}�̵ĳ�������', 
										'��ѡ���{number}�̵ĵ������', 
										'��ѡ��ĵ�{number}�̵ĵ�����кͳ���������ͬ��������ѡ��',
										'��ѡ���{number}�̵ĳ�������',
										'���ڸ�ʽ��������',
										'�Բ��𣬵�{number}�̵ĳ������ڲ����ڽ���֮ǰ', 
										'�Բ���ֻ�ܲ�ѯһ���ں���', 
										'�Բ��𣬵�{number}�����ڲ������ڵ�{second}������', 
										'�����б�����һ��Ϊ���ʺ��̣��������ĳ����������', 
										'��ѡ���������', 
										'��ѡ���������', 
										'��ѡ��Ŀ�ĳ���', 
										'��ѡ���Ŀ�ĳ��кͳ���������ͬ��������ѡ��', 
										'�Բ��𣬷������ڲ������ڳ�������', 
										'��ǰ���ڲ���С�ڽ���'
									],
									TIPS_MESSAGER: 'ϵͳ���ڷ�æ,�������ĵȴ�Ƭ��֮���ٲ�ѯ,лл!',
									numberList: ['һ', '��', '��', '��', '��', '��', '��'],
									ZHUANG:'ת',
									ADDRESS_SEARCHTIPS:'������Ӣ��|�������������ѡ��.',
									NO_FILTER_RESULT:' �Բ�����ƥ�䣬���������롣 ',
									FILTER_RESULT:'${val}�����ַ�˳������',
									GJM:"\"${val}\" ����������س���",
									MULTIPASS:{
										'big5':{
											startCity:'��������',
											endCity:'�������',
											startDate:'��������',
											notice:'����/Ӣ��/ƴ��'
										},
										'gb2312':{
											startCity:'��������',
											endCity:'�������',
											startDate:'��������',
											notice:'����/Ӣ��/ƴ��'
										}
									}
								}
							</script></form>
</div>
<!--��Ʊ��������--> <!--����������ʼ-->
<div styletag="vacation" class="s_content" style="display: none;">
<form id="vacationTab" name="vacationTab" action="spotline!SeachSpotline.jspx" method="post">
<div class="s_links">
<p><span>���⣺</span><a
	href="#">��Ӱ</a><a
	href="#">ɽˮ</a><a
	href="#">����</a><a
	href="#">����</a><a
	href="#">�Լ���</a><a
	href="#">��ɽ</a><a
	href="#">����</a><a
	href="#">��԰</a><a
	href="#">����</a><a
	href="#">����</a></p>
<p><span>���ڣ�</span><a
	href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">��������</a><a
	href="#"
	rel="nofollow">�Ĵ�</a><a
	href="#">����</a><a
	href="#"
	rel="nofollow">�ൺ</a><a
	href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">�żҽ�</a><a
	href="#"
	rel="nofollow">�˲�</a><a
	href="#"
	rel="nofollow">����</a></p>
<p><span>������</span><a
	href="#"
	rel="nofollow">�۰�̨</a><a
	href="#"
	rel="nofollow">̩��</a><a
	href="#"
	rel="nofollow">�ձ�</a><a
	href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">������</a><a
	href="#"
	rel="nofollow">������</a><a
	href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">�ж�����</a><a
	href="#"
	rel="nofollow">ŷ��</a></p>
<p><span>��ɫ��</span><a href="#"
	rel="nofollow">ǩ֤</a><a
	href="#"
	rel="nofollow">�⳵����</a><a href="#"
	rel="nofollow">������</a><a href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">����</a><a
	href="#">�Լ���</a><a
	href="#">�Լ��⳵</a><a
	href="#" target="_blank" rel="nofollow">�ȼٹ�Ԣ</a></p>
</div>
<div class="s_item_cont">
<div class="s_item">������<input id="txtspotlinecity" onclick="this.value='';GetCityList(this); " onkeyup="GetCityList(this); "
	type="text" value=""  class="s_vca_dest" />
	<div id="suggest" class="ac_results"></div>
    <input type="text" id="city_spotline_hide" name="CityID"   />
					
	
	</div>
<div class="s_item2">Ŀ�ĵ�<input id="txtspotlinecity2" onclick="this.value='';GetCityList2(this); " onkeyup="GetCityList2(this); "
	type="text"  class="inputSel"
	style="" />
	<div id="suggest2" class="ac_results"></div>
    <input type="text" id="city_spotline_hide2" name="EndCityID"   />
					
	
	
	</div>
</div>
<div class="s_button_area"><input id=""
	type="button" value="����" class="s_btn" title="����"  onclick="SeachSpotline()"/></div>
</form>
</div>
<!--������������--> <!--��Ʊ��ʼ -->
<div styletag="train" class="s_content" style="display: none;">
<p id="trainSubSwitch" class="s_type">�г����� <label
	class="index_label" data-index="0"><input type="radio"
	checked="checked" id="singleTrip" value="Single" name="traintype"
	onclick="SelectTrip()">����</label> <label class="index_label"
	data-index="1"><input type="radio" id="roundTrip"
	name="traintype" value="Double" onclick="SelectTrip()">����</label></p>
<div class="s_item_cont s_item_cont_ex">
<div class="s_exchange"><a href="javascript:;"
	onclick="searchReturn();">��</a></div>
<div class="s_item">��������<input type="text" autocomplete="off"
	id="notice01" tabindex="1" onfocus="changeColor('#notice01')"
	onblur="changeColorLeave('#notice01')" style="color: gray;"><input
	type="hidden" value="" id="from" name="from" /></div>
<div class="s_item2">��������<input type="text" autocomplete="off"
	tabindex="3" onfocus="changeColor('#DdateObj')"
	onblur="changeColorLeave('#DdateObj')" id="DdateObj" name="DdateObj"
	style="color: gray;" onchange="ChangeDate(1)"></div>
</div>
<div class="s_item_cont">
<div class="s_item">�������<input type="text" autocomplete="off"
	id="notice02" tabindex="2" onfocus="changeColor('#notice02')"
	onblur="changeColorLeave('#notice02')" style="color: gray;"> <input
	type="hidden" value="" id="to" name="to" /></div>
<div id="ArraveDate" class="s_item2 s_disable">��������<input
	type="text" autocomplete="off" tabindex="3"
	onfocus="changeColor('#AdateObj')"
	onblur="changeColorLeave('#AdateObj')" id="AdateObj" name="AdateObj"
	style="color: gray;" onchange="ChangeDate(2)"></div>
</div>
<div class="s_button_area"><input type="button" id=""
	name="" title="����" class="s_btn" value="����" onclick="alert('��Ʊģ����������ά����');" /></div>
</div>
<!--��Ʊ���� --> <!--��Ʊ������ʼ-->
<div styletag="ticket" class="s_content" style="display: none;">
<form id="ticketTab" name="ticketTab" action="spotticket!SeachSpot.jspx" method="post">
<div class="s_links">
<p><span>ʱ�����⣺</span><a
	href="#">��ˮƯ��</a><a
	href="#">�ͻ�</a><a
	href="#">��԰</a><a
	href="#">����</a></p>
<p><span>��ѡ���У�</span><a
	href="#"
	rel="nofollow">�Ϻ�</a><a
	href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">�ɶ�</a><a
	href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">�ൺ</a><a
	href="#"
	rel="nofollow">����</a><a
	href="#"
	rel="nofollow">����</a></p>
<p><span>�����Ƽ���</span><a
	href="#">��Ȩ��</a><a
	href="#">��������</a><a
	href="#">���ݿ���԰</a><a
	href="#">���ݳ�¡</a><a
	href="#">ǧ����</a><a
	href="#">�������ȳ�</a></p>
</div>
<div class="s_item_cont">
<div class="s_item w100">Ŀ�ĵ�<input type="text" value="������" onclick="this.value='';GetCityList_spot(this); " onkeyup="GetCityList_spot(this); "
	id="txthotelcity" data-default="������" class="w03 inputSel"  />
	
	 <div id="suggest" class="ac_results"></div>
     <input type="hidden" id="city_hotel_hide" name="CityID" value=""  />
     
	</div>
<div class="s_item w100">�ؼ���
<input type="text" value=""  id="SeachName" name="SeachName"  class="w03"  />
</div>
</div>
<div class="s_button_area"><input type="button" value="����" onclick="SeachSpotticket()"
	class="s_btn" title="����" id="" /></div>
</form>
</div>
<!--��Ʊ��������--> <!--�ֻ��濪ʼ -->
<div styletag="mobilePhone" class="s_content" style="display: none;">
<form action="" id="wirelessForm">
<div class="s_wireless_l">
<div class="s_wireless"></div>
<a href="#" target="_blank" class="s_wireless_link"
	rel="nofollow">��������</a></div>
<div class="s_wireless_r">
<p class="s_wireless_title">ֱ������</p>
<div class="s_wireless_download"><a
	href="#" target="_blank" class="iphone"
	title="iPhone" rel="nofollow"><span></span>iPhone</a> <a
	href="#" target="_blank" class="ipad"
	title="iPad" rel="nofollow"><span></span>iPad</a> <a
	href="#" target="_blank"
	class="android" title="Android" rel="nofollow"><span></span>Android</a>
</div>
<div class="s_item_cont">
<div class="s_item w100">�ֻ�����<input id="mobilePhoneId" class="w04"
	type="text" value="" autocomplete="off" /></div>
</div>
<a id="mobileSmt" href="javascript:;" class="s_wireless_send"
	rel="nofollow">�������ص�ַ���ֻ�</a>
<div id="wirelessTip" class="s_wireless_suc" style="visibility: hidden;">
<b></b> ���ŷ��ͳɹ������Ժ�鿴��</div>
</div>
</form>
</div>
<!--�ֻ������ --> <!--env:4,update:2013-9-3 14:05:28--> <!-- �������Ʒ���ݽ��� --></div>
<!-- tab���� end -->
<div class="pic_banner"><!-- �����濪ʼ -->
<div class="pic_banner_t pic_ad" id="allyesId"></div>
<!-- ��������� -->
<div class="pic_banner_b pic_ad" id="allyesId2"></div>
</div>
</div>
<!--left start-->
<div class="bd_left"><!--����ϲ��start-->
<div id="customerGuess" class="c_customer" style="display: none;">
<dl class="c_history" id="guessLeft">
</dl>
<div class="c_likes">
<h2>����ϲ��</h2>
<div class="c_likes_in">
<div class="c_likes_list" id="guessItems"></div>
</div>
<a title="�رղ���������ʷ" href="javascript:;" class="c_customer_close"
	id="guessClose"
	onclick="this.parentNode.parentNode.style.display='none';"></a> <a
	href="javascript:;" class="c_customer_next" id="guessNext"></a> <a
	href="javascript:;" class="c_customer_prev_un" id="guessPrev"></a></div>
</div>
<!--����ϲ��end--> <!--�ȼ� start -->
<h2 id="vacation_tab" class="h2_tabtitle">
<span id="tab_1" onclick="ChangType(1);" class="current">��Ʊ</span>
<span id="tab_2" onclick="ChangType(2);" >�ܱ�����</span>
<span id="tab_3" onclick="ChangType(3);">��������</span>
<span id="tab_4" onclick="ChangType(4);">��������</span>
<span id="tab_5" onclick="ChangType(5);">����</span>
</h2>

<div class="citys" style="display: none">
<a class="startcity" href="javascript:void(0);"
	id="v_departure"><span cityId=2>�Ϻ�</span>����</a>
<div class="departures" id="v_departure_city" style="display: none;">
<h5>���ų�������</h5>
<a title="BeiJing" data-id="1" href="javascript:void(0);">����</a><a
	title="ShangHai" data-id="2" href="javascript:void(0);">�Ϻ�</a><a
	title="TianJin" data-id="3" href="javascript:void(0);">���</a><a
	title="QingDao" data-id="7" href="javascript:void(0);">�ൺ</a><a
	title="NanJing" data-id="12" href="javascript:void(0);">�Ͼ�</a><a
	title="HangZhou" data-id="17" href="javascript:void(0);">����</a><a
	title="XiaMen" data-id="25" href="javascript:void(0);">����</a><a
	title="ChengDu" data-id="28" href="javascript:void(0);">�ɶ�</a><a
	title="ShenZhen" data-id="30" href="javascript:void(0);">����</a><a
	title="GuangZhou" data-id="32" href="javascript:void(0);">����</a><a
	title="ShenYang" data-id="451" href="javascript:void(0);">����</a><a
	title="WuHan" data-id="477" href="javascript:void(0);">�人</a>
<ul class="departures_sequence">
	<li><span>B</span><a title="BeiJing" href="javascript:void(0);"
		data-id="1">����</a><a title="BaoTou" href="javascript:void(0);"
		data-id="141">��ͷ</a></li>
	<li><span>M</span><a title="MianYang" href="javascript:void(0);"
		data-id="370">����</a></li>
	<li><span>C</span><a title="ZhongQing" href="javascript:void(0);"
		data-id="4">����</a><a title="ChengDu" href="javascript:void(0);"
		data-id="28">�ɶ�</a><a title="ChangChun" href="javascript:void(0);"
		data-id="158">����</a><a title="ChangSha" href="javascript:void(0);"
		data-id="206">��ɳ</a><a title="ChangZhou" href="javascript:void(0);"
		data-id="213">����</a></li>
	<li><span>N</span><a title="NanJing" href="javascript:void(0);"
		data-id="12">�Ͼ�</a><a title="NingBo" href="javascript:void(0);"
		data-id="375">����</a><a title="NanChang" href="javascript:void(0);"
		data-id="376">�ϲ�</a><a title="NanNing" href="javascript:void(0);"
		data-id="380">����</a></li>
	<li><span>D</span><a title="DaLian" href="javascript:void(0);"
		data-id="6">����</a><a title="DongZuo" href="javascript:void(0);"
		data-id="223">��ݸ</a></li>
	<li><span>Q</span><a title="QingDao" href="javascript:void(0);"
		data-id="7">�ൺ</a><a title="QuanZhou" href="javascript:void(0);"
		data-id="406">Ȫ��</a></li>
	<li><span>F</span><a title="FoShan" href="javascript:void(0);"
		data-id="251">��ɽ</a><a title="FuZhou" href="javascript:void(0);"
		data-id="258">����</a></li>
	<li><span>S</span><a title="ShangHai" href="javascript:void(0);"
		data-id="2">�Ϻ�</a><a title="SuZhou" href="javascript:void(0);"
		data-id="14">����</a><a title="ShenZhen" href="javascript:void(0);"
		data-id="30">����</a><a title="SanYa" href="javascript:void(0);"
		data-id="43">����</a><a title="ShiJiaZhuang" href="javascript:void(0);"
		data-id="428">ʯ��ׯ</a><a title="ShanTou" href="javascript:void(0);"
		data-id="447">��ͷ</a><a title="ShenYang" href="javascript:void(0);"
		data-id="451">����</a></li>
	<li><span>G</span><a title="GuangZhou" href="javascript:void(0);"
		data-id="32">����</a><a title="GuiYang" href="javascript:void(0);"
		data-id="38">����</a></li>
	<li><span>T</span><a title="TianJin" href="javascript:void(0);"
		data-id="3">���</a><a title="TaiYuan" href="javascript:void(0);"
		data-id="105">̫ԭ</a><a title="TaiZhou" href="javascript:void(0);"
		data-id="578">̨��</a></li>
	<li><span>H</span><a title="HaErBin" href="javascript:void(0);"
		data-id="5">������</a><a title="HangZhou" href="javascript:void(0);"
		data-id="17">����</a><a title="HaiKou" href="javascript:void(0);"
		data-id="42">����</a><a title="HuHeHaoTe" href="javascript:void(0);"
		data-id="103">���ͺ���</a><a title="HaiLaEr" href="javascript:void(0);"
		data-id="142">������</a><a title="HeFei" href="javascript:void(0);"
		data-id="278">�Ϸ�</a></li>
	<li><span>W</span><a title="WuXi" href="javascript:void(0);"
		data-id="13">����</a><a title="WuLuMuQi" href="javascript:void(0);"
		data-id="39">��³ľ��</a><a title="WuHan" href="javascript:void(0);"
		data-id="477">�人</a><a title="WeiHai" href="javascript:void(0);"
		data-id="479">����</a><a title="WenZhou" href="javascript:void(0);"
		data-id="491">����</a></li>
	<li><span>J</span><a title="JiNan" href="javascript:void(0);"
		data-id="144">����</a><a title="JiangMen" href="javascript:void(0);"
		data-id="316">����</a></li>
	<li><span>X</span><a title="XiAn" href="javascript:void(0);"
		data-id="10">����</a><a title="XiaMen" href="javascript:void(0);"
		data-id="25">����</a><a title="XiNing" href="javascript:void(0);"
		data-id="124">����</a><a title="XiChang" href="javascript:void(0);"
		data-id="494">����</a><a title="XuZhou" href="javascript:void(0);"
		data-id="512">����</a></li>
	<li><span>K</span><a title="KunMing" href="javascript:void(0);"
		data-id="34">����</a><a title="KaShiShi" href="javascript:void(0);"
		data-id="109">��ʲ��</a></li>
	<li><span>Y</span><a title="YinChuan" href="javascript:void(0);"
		data-id="99">����</a><a title="YunCheng" href="javascript:void(0);"
		data-id="140">�˳�</a><a title="YanJi" href="javascript:void(0);"
		data-id="523">�Ӽ�</a><a title="YuLin" href="javascript:void(0);"
		data-id="527">����</a><a title="YanTai" href="javascript:void(0);"
		data-id="533">��̨</a><a title="YiWu" href="javascript:void(0);"
		data-id="536">����</a></li>
	<li><span>L</span><a title="LaSa" href="javascript:void(0);"
		data-id="41">����</a><a title="LanZhou" href="javascript:void(0);"
		data-id="100">����</a></li>
	<li><span>Z</span><a title="ZhuHai" href="javascript:void(0);"
		data-id="31">�麣</a><a title="ZhongShan" href="javascript:void(0);"
		data-id="553">��ɽ</a><a title="ZhengZhou" href="javascript:void(0);"
		data-id="559">֣��</a></li>
</ul>
</div>
</div>
<div id="vacation_tab_1" class="citytabs">
<a class="current"
	pinyin="JingXuan" id="spot_a_1" title="��ѡ" href="javascript:void(0);" onclick="selectspotticket(1,321)">��ѡ</a><a
	pinyin="ShangHai" id="spot_a_2" title="�Ϻ�" href="javascript:void(0);" onclick="selectspotticket(2,321)">�Ϻ�</a><a
	pinyin="JiangSu"  id="spot_a_3" title="����" href="javascript:void(0);" onclick="selectspotticket(3,321)">����</a><a
	pinyin="ZheJiang" id="spot_a_4" title="�㽭" href="javascript:void(0);" onclick="selectspotticket(4,321)">�㽭</a><a
	pinyin="AnHui"    id="spot_a_5" title="����" href="javascript:void(0);" onclick="selectspotticket(5,321)">����</a><a
	pinyin="BeiJing"  id="spot_a_6" title="����" href="javascript:void(0);" onclick="selectspotticket(6,607)">����</a><a
	pinyin="ShanDong" id="spot_a_7" title="ɽ��" href="javascript:void(0);" onclick="selectspotticket(7,321)">ɽ��</a>
<div id="vacationsCityPop_1" class="city_pop" style="display: none"><a class="more"
	href="javascript:void(0);">����</a>
<div id="vacationsMoreCity_1" class="morecity"
	style="display: none; width: 82px;"><a pinyin="GuangDong"
	title="�㶫" href="javascript:void(0);">�㶫</a><a pinyin="GangAoTai"
	title="�۰�̨" href="javascript:void(0);">�۰�̨</a><a pinyin="RiHan"
	title="�պ�" href="javascript:void(0);">�պ�</a><a pinyin="DongNanYa"
	title="������" href="javascript:void(0);">������</a></div>
</div>
</div>
<div id="vacation_tab_2" class="citytabs" style="display: none;">
<a class="current"
	pinyin="JingXuan" title="��ѡ" href="javascript:void(0);">��ѡ</a><a
	pinyin="ShangHai" title="�Ϻ�" href="javascript:void(0);">�Ϻ�</a><a
	pinyin="JiangSu" title="����" href="javascript:void(0);">����</a><a
	pinyin="ZheJiang" title="�㽭" href="javascript:void(0);">�㽭</a><a
	pinyin="AnHui" title="����" href="javascript:void(0);">����</a><a
	pinyin="BeiJing" title="����" href="javascript:void(0);">����</a><a
	pinyin="ShanDong" title="ɽ��" href="javascript:void(0);">ɽ��</a>


</div>
<div id="vacation_tab_3" class="citytabs" style="display: none;">
<a class="current"
	pinyin="JingXuan" title="��ѡ" href="javascript:void(0);">��ѡ</a><a
	pinyin="ShangHai" title="�Ϻ�" href="javascript:void(0);">�Ϻ�</a><a
	pinyin="JiangSu" title="����" href="javascript:void(0);">����</a><a
	pinyin="ZheJiang" title="����" href="javascript:void(0);">����</a><a
	pinyin="AnHui" title="��ɽ" href="javascript:void(0);">��ɽ</a><a
	pinyin="BeiJing" title="����" href="javascript:void(0);">����</a><a
	pinyin="ShanDong" title="�ൺ" href="javascript:void(0);">�ൺ</a>

</div>
<div id="vacation_tab_4" class="citytabs" style="display: none;">
<a class="current"
	pinyin="JingXuan" title="��ѡ" href="javascript:void(0);">��ѡ</a><a
	pinyin="ShangHai" title="�Ϻ�" href="javascript:void(0);">�Ϻ�</a><a
	pinyin="JiangSu" title="����" href="javascript:void(0);">����</a><a
	pinyin="ZheJiang" title="�㽭" href="javascript:void(0);">�㽭</a><a
	pinyin="AnHui" title="����" href="javascript:void(0);">����</a><a
	pinyin="BeiJing" title="����" href="javascript:void(0);">����</a><a
	pinyin="ShanDong" title="ɽ��" href="javascript:void(0);">ɽ��</a>

</div>
<div id="vacation_tab_5" class="citytabs" style="display: none;">
<a class="current"
	pinyin="JingXuan" title="��ѡ" href="javascript:void(0);">��ѡ</a><a
	pinyin="ShangHai" title="�Ϻ�" href="javascript:void(0);">�Ϻ�</a><a
	pinyin="JiangSu" title="����" href="javascript:void(0);">����</a><a
	pinyin="ZheJiang" title="�㽭" href="javascript:void(0);">�㽭</a><a
	pinyin="AnHui" title="����" href="javascript:void(0);">����</a><a
	pinyin="BeiJing" title="����" href="javascript:void(0);">����</a><a
	pinyin="ShanDong" title="ɽ��" href="javascript:void(0);">ɽ��</a>

</div>
<div id="divSpotticketHtml" class="vac_list">

<div class="vac_item vac_item_main"><a
	href="http://vacations.ctrip.com/tickets/p85207.html" class="vac_thumb"><img
	src="http://pic.c-ctrip.com/common/pic_alpha.gif"
	_src="http://pkgpic.ctrip.com/images2/1/10/10_821_s28263.jpg" alt=""
	width="500" height="280" /></a>
<p><span class="c_price">230</span>��</p>
<a href="http://vacations.ctrip.com/tickets/p85207.html"
	title="������ɽ�����Ʊ�������ָ���">������ɽ�����Ʊ�������ָ���</a></div>
<div class="vac_item"><a
	href="http://vacations.ctrip.com/tickets/p54779.html" class="vac_thumb"><img
	src="http://pic.c-ctrip.com/common/pic_alpha.gif"
	_src="http://pkgpic.ctrip.com/images2/1/206/206_247_s31519-m.jpg"
	alt="" width="186" height="105" /></a>
<p><span class="c_price">100</span>��</p>
<a href="http://vacations.ctrip.com/tickets/p54779.html" title="������Ϸ����Ʊ">������Ϸ����Ʊ</a></div>
<div class="vac_item"><a
	href="http://vacations.ctrip.com/tickets/p28977.html" class="vac_thumb"><img
	src="http://pic.c-ctrip.com/common/pic_alpha.gif"
	_src="http://pkgpic.ctrip.com/images2/tour/pp/hz/0818-1b-m.jpg" alt=""
	width="186" height="105" /></a>
<p><span class="c_price">130</span>��</p>
<a href="http://vacations.ctrip.com/tickets/p28977.html"
	title="����ӡ�������ݳ�Ʊ">����ӡ�������ݳ�Ʊ</a></div>
<div class="vac_item"><a
	href="http://vacations.ctrip.com/tickets/p1620998.html"
	class="vac_thumb"><img
	src="http://pic.c-ctrip.com/common/pic_alpha.gif"
	_src="http://pkgpic.ctrip.com/images2/1/14/14_1122_s31519-m.jpg" alt=""
	width="186" height="105" /></a>
<p><span class="c_price">120</span>��</p>
<a href="http://vacations.ctrip.com/tickets/p1620998.html"
	title="ǧ����ˮ֮���ݳ���Ʊ">ǧ����ˮ֮���ݳ���Ʊ</a></div>
<div class="vac_item"><a
	href="http://vacations.ctrip.com/tickets/p66256.html" class="vac_thumb"><img
	src="http://pic.c-ctrip.com/common/pic_alpha.gif"
	_src="http://pkgpic.ctrip.com/images2/1/2/2_1749_s31517-m.jpg" alt=""
	width="186" height="105" /></a>
<p><span class="c_price">130</span>��</p>
<a href="http://vacations.ctrip.com/tickets/p66256.html"
	title="�Ϻ���ɯ�����������Ʊ">�Ϻ���ɯ�����������Ʊ</a></div>
<div class="vac_item"><a
	href="http://vacations.ctrip.com/tickets/p76951.html" class="vac_thumb"><img
	src="http://pic.c-ctrip.com/common/pic_alpha.gif"
	_src="http://pkgpic.ctrip.com/images2/1/14/14_649_s31519-m.jpg" alt=""
	width="186" height="105" /></a>
<p><span class="c_price">55</span>��</p>
<a href="http://vacations.ctrip.com/tickets/p76951.html"
	title="��Ϫʪ�أ�������������Ʊ���ǳ���������أ�">��Ϫʪ�أ�������������Ʊ���ǳ���������أ�</a></div>
<div class="vac_item vac_item_last"><a
	href="http://vacations.ctrip.com/tickets/p1601149.html"
	class="vac_thumb"><img
	src="http://pic.c-ctrip.com/common/pic_alpha.gif"
	_src="http://pkgpic.ctrip.com/images2/1/2/2_1419_s31519-m.jpg" alt=""
	width="186" height="105" /></a>
<p><span class="c_price">145</span>��</p>
<a href="http://vacations.ctrip.com/tickets/p1601149.html"
	title="�Ϻ���������㲥��������Ʊ">�Ϻ���������㲥��������Ʊ</a></div>
<!--update:2013-9-24 13:51:27-->
</div>
<!--�ȼ� end --> 


<!--�Ƶ� start -->

<h2 class="h2_tabtitle"><span class="current">��ѡ�Ƶ�</span></h2>
<div class="citytabs" id="hotelCityTab">
	<a class="current" title="�����Ƶ�" id="hotel_a_1" href="#" onclick="selecthotel(1,607);return false;">����</a>
	<a  title="�Ϻ��Ƶ�" id="hotel_a_2" href="#" onclick="selecthotel(2,607);return false;">�Ϻ�</a>
	<a  title="���ݾƵ�" id="hotel_a_3" href="#" onclick="selecthotel(3,607);return false;">����</a>
	<a  title="�ɶ��Ƶ�" id="hotel_a_4" href="#" onclick="selecthotel(4,607);return false;">�ɶ�</a>
	<a  title="���ھƵ�" id="hotel_a_5" href="#" onclick="selecthotel(5,607);return false;">����</a>
	<a  title="���ݾƵ�" id="hotel_a_6" href="#" onclick="selecthotel(6,607);return false;">����</a>
	<a  title="�Ͼ��Ƶ�" id="hotel_a_7" href="#" onclick="selecthotel(7,607);return false;">�Ͼ�</a>
	<a  title="�¼��¾Ƶ�" id="hotel_a_8" href="#" onclick="selecthotel(8,607);return false;">�¼���</a>
	<a  title="���ȾƵ�" id="hotel_a_9" href="#" onclick="selecthotel(9,607);return false;">����</a>
	<a  title="�׶��Ƶ�" id="hotel_a_10" href="#" onclick="selecthotel(10,607);return false;">�׶�</a>
	<a  title="̨���Ƶ�" id="hotel_a_11" href="#" onclick="selecthotel(11,607);return false;">̨��</a>
	<a  title="�����Ƶ�" id="hotel_a_12" href="#" onclick="selecthotel(12,607);return false;">����</a>
<div id="hotelCityPop" class="city_pop" style="display: none"><a class="more"
	href="javascript:void(0);">����</a>
<div id="hotelMoreCity" class="morecity morecity_limit"><a
	data-id="7" data-type="1" href="javascript:void(0);">�ൺ</a><a
	data-id="25" data-type="1" href="javascript:void(0);">����</a><a
	data-id="10" data-type="1" href="javascript:void(0);">����</a><a
	data-id="477" data-type="1" href="javascript:void(0);">�人</a><a
	data-id="43" data-type="1" href="javascript:void(0);">����</a><a
	data-id="4" data-type="1" href="javascript:void(0);">����</a><a
	data-id="6" data-type="1" href="javascript:void(0);">����</a><a
	data-id="451" data-type="1" href="javascript:void(0);">����</a><a
	data-id="58" data-type="1" href="javascript:void(0);">���</a><a
	data-id="144" data-type="1" href="javascript:void(0);">����</a><a
	data-id="34" data-type="1" href="javascript:void(0);">����</a><a
	data-id="206" data-type="1" href="javascript:void(0);">��ɳ</a><a
	data-id="559" data-type="1" href="javascript:void(0);">֣��</a><a
	data-id="38" data-type="1" href="javascript:void(0);">����</a><a
	data-id="14" data-type="1" href="javascript:void(0);">����</a><a
	data-id="13" data-type="1" href="javascript:void(0);">����</a><a
	data-id="278" data-type="1" href="javascript:void(0);">�Ϸ�</a><a
	data-id="39" data-type="1" href="javascript:void(0);">��³ľ��</a><a
	data-id="23" data-type="1" href="javascript:void(0);">��ɽ</a><a
	data-id="37" data-type="1" href="javascript:void(0);">����</a><a
	data-id="33" data-type="1" href="javascript:void(0);">����</a><a
	data-id="871" data-type="1" href="javascript:void(0);">��˷</a>
<div id="hotelMoreLine"></div>
<a data-id="725" data-type="2" href="javascript:void(0);">�ռ���</a><a
	data-id="315" data-type="2" href="javascript:void(0);">��¡��</a><a
	data-id="723" data-type="2" href="javascript:void(0);">���嵺</a><a
	data-id="501" data-type="2" href="javascript:void(0);">Ϥ��</a><a
	data-id="219" data-type="2" href="javascript:void(0);">����</a><a
	data-id="1225" data-type="2" href="javascript:void(0);">������</a><a
	data-id="1369" data-type="2" href="javascript:void(0);">����</a><a
	data-id="737" data-type="2" href="javascript:void(0);">���ݵ�</a><a
	data-id="1229" data-type="2" href="javascript:void(0);">��÷��</a><a
	data-id="623" data-type="2" href="javascript:void(0);">����</a><a
	data-id="192" data-type="2" href="javascript:void(0);">����</a><a
	data-id="220" data-type="2" href="javascript:void(0);">�ϰ�</a><a
	data-id="301" data-type="2" href="javascript:void(0);">��־����</a><a
	data-id="633" data-type="2" href="javascript:void(0);">ŦԼ</a><a
	data-id="338" data-type="2" href="javascript:void(0);">�׶�</a></div>
</div>
</div>
<div class="hotel_list" id="divHotelHtml">
<dl class="hotel_item">
	<dt><span class="" title=""></span><a
		href="http://hotels.ctrip.com/hotel/61999.html" title="�Ϻ������˱�˼�Ƶ�">�Ϻ������˱�˼�Ƶ�</a></dt>
	<dd class="hotel_thumb"><a
		href="http://hotels.ctrip.com/pic/61999.html"><img
		src="http://pic.c-ctrip.com/common/pic_alpha.gif"
		_src="http://images4.c-ctrip.com/target/hotel/62000/61999/4D771712-961B-4403-876D-FF5168505C81_130_130.jpg"
		width="130" height="130" alt="�Ϻ������˱�˼�Ƶ�" /></a></dd>
	<dd><span class="diamond03_half"></span></dd>
	<dd class="hotel_item_area"><a target="_blank"
		href="http://hotels.ctrip.com/hotel/shanghai2/zone379"
		title="�ֶ��¹��ʲ�������">�ֶ��¹��ʲ�������</a>&nbsp;</dd>
	<dd class="hotel_info"><span class="c_price">349</span>��<br />
	</dd>
	<dd class="hotel_comment"><a
		href="http://hotels.ctrip.com/hotel/dianping/61999.html"><b>4</b>��&nbsp;|&nbsp;1821�˵���</a></dd>
</dl>
<dl class="hotel_item">
	<dt><span class="hotel_strategymedal" title="�ؼ��ƺ���"></span><a
		href="http://hotels.ctrip.com/hotel/370211.html"
		title="���ӾƵ꾫ѡ���Ϻ���ƽ·����̲�꣩">���ӾƵ꾫ѡ���Ϻ���ƽ·����̲�꣩</a></dt>
	<dd class="hotel_thumb"><a
		href="http://hotels.ctrip.com/pic/370211.html"><img
		src="http://pic.c-ctrip.com/common/pic_alpha.gif"
		_src="http://images4.c-ctrip.com/target/hotel/371000/370211/e58730059b1c4863bdd016cf36f0ac6c_130_130.jpg"
		width="130" height="130" alt="���ӾƵ꾫ѡ���Ϻ���ƽ·����̲�꣩" /></a></dd>
	<dd><span class="diamond04_half"></span></dd>
	<dd class="hotel_item_area"><a target="_blank"
		href="http://hotels.ctrip.com/hotel/shanghai2/zone369" title="����̲����">����̲����</a>&nbsp;<a
		target="_blank"
		href="http://hotels.ctrip.com/hotel/shanghai2/location116" title="�����">�����</a></dd>
	<dd class="hotel_info"><span class="c_price">288</span>��<br />
	</dd>
	<dd class="hotel_comment"><a
		href="http://hotels.ctrip.com/hotel/dianping/370211.html"><b>4.5</b>��&nbsp;|&nbsp;1478�˵���</a></dd>
</dl>
<dl class="hotel_item">
	<dt><span class="hotel_strategymedal" title="�ؼ��ƺ���"></span><a
		href="http://hotels.ctrip.com/hotel/438527.html"
		title="���ӾƵ꾫ѡ���Ϻ����ر�·�꣩">���ӾƵ꾫ѡ���Ϻ����ر�·�꣩</a></dt>
	<dd class="hotel_thumb"><a
		href="http://hotels.ctrip.com/pic/438527.html"><img
		src="http://pic.c-ctrip.com/common/pic_alpha.gif"
		_src="http://images4.c-ctrip.com/target/hotel/439000/438527/df6db358e3794a3d82fbac78334a24e3_130_130.jpg"
		width="130" height="130" alt="���ӾƵ꾫ѡ���Ϻ����ر�·�꣩" /></a></dd>
	<dd><span class="diamond04_half"></span></dd>
	<dd class="hotel_item_area"><a target="_blank"
		href="http://hotels.ctrip.com/hotel/shanghai2/zone19" title="�Ϻ���վ����">�Ϻ���վ����</a>&nbsp;<a
		target="_blank"
		href="http://hotels.ctrip.com/hotel/shanghai2/location118" title="բ����">բ����</a></dd>
	<dd class="hotel_info"><span class="c_price">358</span>��<br />
	</dd>
	<dd class="hotel_comment"><a
		href="http://hotels.ctrip.com/hotel/dianping/438527.html"><b>4.7</b>��&nbsp;|&nbsp;772�˵���</a></dd>
</dl>
<dl class="hotel_item">
	<dt><span class="" title=""></span><a
		href="http://hotels.ctrip.com/hotel/21601.html"
		title="Ī̩168���Ϻ�½�����̳�·�꣩">Ī̩168���Ϻ�½�����̳�·�꣩</a></dt>
	<dd class="hotel_thumb"><a
		href="http://hotels.ctrip.com/pic/21601.html"><img
		src="http://pic.c-ctrip.com/common/pic_alpha.gif"
		_src="http://images4.c-ctrip.com/target/hotel/22000/21601/a002153a90a346b98ce479c2723d6291_130_130.jpg"
		width="130" height="130" alt="Ī̩168���Ϻ�½�����̳�·�꣩" /></a></dd>
	<dd><span class="diamond02_half"></span></dd>
	<dd class="hotel_item_area"><a target="_blank"
		href="http://hotels.ctrip.com/hotel/shanghai2/zone22"
		title="�ֶ�½�������ó����">�ֶ�½�������ó����</a>&nbsp;<a target="_blank"
		href="http://hotels.ctrip.com/hotel/shanghai2/location119"
		title="�ֶ�����">�ֶ�����</a></dd>
	<dd class="hotel_info"><span class="c_price">259</span>��<br />
	</dd>
	<dd class="hotel_comment"><a
		href="http://hotels.ctrip.com/hotel/dianping/21601.html"><b>3.9</b>��&nbsp;|&nbsp;1052�˵���</a></dd>
</dl>
<dl class="hotel_item">
	<dt><span class="hotel_strategymedal" title="�ؼ��ƺ���"></span><a
		href="http://hotels.ctrip.com/hotel/441507.html" title="���ӾƵ꾫ѡ���Ϻ������꣩">���ӾƵ꾫ѡ���Ϻ������꣩</a></dt>
	<dd class="hotel_thumb"><a
		href="http://hotels.ctrip.com/pic/441507.html"><img
		src="http://pic.c-ctrip.com/common/pic_alpha.gif"
		_src="http://images4.c-ctrip.com/target/hotel/442000/441507/89aff3a784ff4beaa56a5fa039f5bb34_130_130.jpg"
		width="130" height="130" alt="���ӾƵ꾫ѡ���Ϻ������꣩" /></a></dd>
	<dd><span class="diamond04_half"></span></dd>
	<dd class="hotel_item_area"><a target="_blank"
		href="http://hotels.ctrip.com/hotel/shanghai2/zone981" title="����·��ҵ��">����·��ҵ��</a>&nbsp;<a
		target="_blank"
		href="http://hotels.ctrip.com/hotel/shanghai2/location112" title="������">������</a></dd>
	<dd class="hotel_info"><span class="c_price">338</span>��<br />
	</dd>
	<dd class="hotel_comment"><a
		href="http://hotels.ctrip.com/hotel/dianping/441507.html"><b>4.6</b>��&nbsp;|&nbsp;750�˵���</a></dd>
</dl>
<dl class="hotel_item">
	<dt><span class="" title=""></span><a
		href="http://hotels.ctrip.com/hotel/385148.html" title="�Ϻ������Ƶ�">�Ϻ������Ƶ�</a></dt>
	<dd class="hotel_thumb"><a
		href="http://hotels.ctrip.com/pic/385148.html"><img
		src="http://pic.c-ctrip.com/common/pic_alpha.gif"
		_src="http://images4.c-ctrip.com/target/hotel/386000/385148/9a17e6d65dc34a16a6151abb86184c5a_130_130.jpg"
		width="130" height="130" alt="�Ϻ������Ƶ�" /></a></dd>
	<dd><span class="diamond02_half"></span></dd>
	<dd class="hotel_item_area"><a target="_blank"
		href="http://hotels.ctrip.com/hotel/shanghai2/zone361" title="�ֶ�����԰��">�ֶ�����԰��</a>&nbsp;</dd>
	<dd class="hotel_info"><span class="c_price">258</span>��<br />
	</dd>
	<dd class="hotel_comment"><a
		href="http://hotels.ctrip.com/hotel/dianping/385148.html"><b>3.7</b>��&nbsp;|&nbsp;73�˵���</a></dd>
</dl>
</div>
<!--�Ƶ� end --> <!--��Ʊ start -->
<h2 class="h2_tabtitle"><span class="current">�����ؼۻ�Ʊ</span></h2>
<div class="citys" id="flightCityPop"><a id="packageRecommend"
	href="javascript:void(0);" class="startcity"><span
	id="flightPopSpan">�Ϻ�</span>����</a>
<div id="flightMoreCityDiv" class="departures_list"
	style="display: none;"><a href="javascript:;" data-szm="BJS">����</a>
<a href="javascript:;" data-szm="SHA">�Ϻ�</a> <a href="javascript:;"
	data-szm="CAN">����</a> <a href="javascript:;" data-szm="SZX">����</a> <a
	href="javascript:;" data-szm="HGH">����</a> <a href="javascript:;"
	data-szm="CTU">�ɶ�</a> <a href="javascript:;" data-szm="NKG">�Ͼ�</a> <a
	href="javascript:;" data-szm="TAO">�ൺ</a> <a href="javascript:;"
	data-szm="CSX">��ɳ</a> <a href="javascript:;" data-szm="CGO">֣��</a></div>
</div>
<p class="h2_title">�����ؼۻ�Ʊ</p>
<div class="flight_list" id="flightList">
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-JIU-day-1.html?DDate1=2013-10-06';"
	href="http://flights.ctrip.com/booking/SHA-JIU-day-1.html">
	<dt><a title="�Ϻ����Ž��Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-JIU-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-JIU-day-1.html?DDate1=2013-10-06';">�Ϻ�-�Ž�</a></dt>
	<dd><span class="c_price">150</span>10-06</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-LYA-day-1.html?DDate1=2013-10-12';"
	href="http://flights.ctrip.com/booking/SHA-LYA-day-1.html">
	<dt><a title="�Ϻ��������Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-LYA-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-LYA-day-1.html?DDate1=2013-10-12';">�Ϻ�-����</a></dt>
	<dd><span class="c_price">230</span>10-12</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-WEH-day-1.html?DDate1=2013-10-12';"
	href="http://flights.ctrip.com/booking/SHA-WEH-day-1.html">
	<dt><a title="�Ϻ��������Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-WEH-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-WEH-day-1.html?DDate1=2013-10-12';">�Ϻ�-����</a></dt>
	<dd><span class="c_price">240</span>10-12</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-LCX-day-1.html?DDate1=2013-10-16';"
	href="http://flights.ctrip.com/booking/SHA-LCX-day-1.html">
	<dt><a title="�Ϻ������ҵĻ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-LCX-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-LCX-day-1.html?DDate1=2013-10-16';">�Ϻ�-����</a></dt>
	<dd><span class="c_price">250</span>10-16</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-TYN-day-1.html?DDate1=2013-10-10';"
	href="http://flights.ctrip.com/booking/SHA-TYN-day-1.html">
	<dt><a title="�Ϻ���̫ԭ�Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-TYN-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-TYN-day-1.html?DDate1=2013-10-10';">�Ϻ�-̫ԭ</a></dt>
	<dd><span class="c_price">300</span>10-10</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-BJS-day-1.html?DDate1=2013-10-02';"
	href="http://flights.ctrip.com/booking/SHA-BJS-day-1.html">
	<dt><a title="�Ϻ��������Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-BJS-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-BJS-day-1.html?DDate1=2013-10-02';">�Ϻ�-����</a></dt>
	<dd><span class="c_price">320</span>10-02</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-HRB-day-1.html?DDate1=2013-10-20';"
	href="http://flights.ctrip.com/booking/SHA-HRB-day-1.html">
	<dt><a title="�Ϻ����������Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-HRB-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-HRB-day-1.html?DDate1=2013-10-20';">�Ϻ�-������</a></dt>
	<dd><span class="c_price">340</span>10-20</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-KMG-day-1.html?DDate1=2013-10-15';"
	href="http://flights.ctrip.com/booking/SHA-KMG-day-1.html">
	<dt><a title="�Ϻ��������Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-KMG-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-KMG-day-1.html?DDate1=2013-10-15';">�Ϻ�-����</a></dt>
	<dd><span class="c_price">340</span>10-15</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-WUS-day-1.html?DDate1=2013-10-08';"
	href="http://flights.ctrip.com/booking/SHA-WUS-day-1.html">
	<dt><a title="�Ϻ�������ɽ�Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-WUS-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-WUS-day-1.html?DDate1=2013-10-08';">�Ϻ�-����ɽ</a></dt>
	<dd><span class="c_price">340</span>10-08</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-LZO-day-1.html?DDate1=2013-10-09';"
	href="http://flights.ctrip.com/booking/SHA-LZO-day-1.html">
	<dt><a title="�Ϻ������ݵĻ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-LZO-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-LZO-day-1.html?DDate1=2013-10-09';">�Ϻ�-����</a></dt>
	<dd><span class="c_price">380</span>10-09</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-HET-day-1.html?DDate1=2013-10-11';"
	href="http://flights.ctrip.com/booking/SHA-HET-day-1.html">
	<dt><a title="�Ϻ������ͺ��صĻ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-HET-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-HET-day-1.html?DDate1=2013-10-11';">�Ϻ�-���ͺ���</a></dt>
	<dd><span class="c_price">410</span>10-11</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-HAK-day-1.html?DDate1=2013-10-09';"
	href="http://flights.ctrip.com/booking/SHA-HAK-day-1.html">
	<dt><a title="�Ϻ������ڵĻ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-HAK-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-HAK-day-1.html?DDate1=2013-10-09';">�Ϻ�-����</a></dt>
	<dd><span class="c_price">430</span>10-09</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-LYG-day-1.html?DDate1=2013-10-05';"
	href="http://flights.ctrip.com/booking/SHA-LYG-day-1.html">
	<dt><a title="�Ϻ������Ƹ۵Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-LYG-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-LYG-day-1.html?DDate1=2013-10-05';">�Ϻ�-���Ƹ�</a></dt>
	<dd><span class="c_price">435</span>10-05</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-SYX-day-1.html?DDate1=2013-10-09';"
	href="http://flights.ctrip.com/booking/SHA-SYX-day-1.html">
	<dt><a title="�Ϻ������ǵĻ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-SYX-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-SYX-day-1.html?DDate1=2013-10-09';">�Ϻ�-����</a></dt>
	<dd><span class="c_price">450</span>10-09</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-HIA-day-1.html?DDate1=2013-09-26';"
	href="http://flights.ctrip.com/booking/SHA-HIA-day-1.html">
	<dt><a title="�Ϻ��������Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-HIA-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-HIA-day-1.html?DDate1=2013-09-26';">�Ϻ�-����</a></dt>
	<dd><span class="c_price">530</span>09-26</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-YIH-day-1.html?DDate1=2013-10-04';"
	href="http://flights.ctrip.com/booking/SHA-YIH-day-1.html">
	<dt><a title="�Ϻ����˲��Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-YIH-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-YIH-day-1.html?DDate1=2013-10-04';">�Ϻ�-�˲�</a></dt>
	<dd><span class="c_price">540</span>10-04</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-NNY-day-1.html?DDate1=2013-10-04';"
	href="http://flights.ctrip.com/booking/SHA-NNY-day-1.html">
	<dt><a title="�Ϻ��������Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-NNY-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-NNY-day-1.html?DDate1=2013-10-04';">�Ϻ�-����</a></dt>
	<dd><span class="c_price">620</span>10-04</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-UYN-day-1.html?DDate1=2013-10-14';"
	href="http://flights.ctrip.com/booking/SHA-UYN-day-1.html">
	<dt><a title="�Ϻ������ֵĻ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-UYN-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-UYN-day-1.html?DDate1=2013-10-14';">�Ϻ�-����</a></dt>
	<dd><span class="c_price">630</span>10-14</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-TGO-day-1.html?DDate1=2013-10-13';"
	href="http://flights.ctrip.com/booking/SHA-TGO-day-1.html">
	<dt><a title="�Ϻ���ͨ�ɵĻ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-TGO-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-TGO-day-1.html?DDate1=2013-10-13';">�Ϻ�-ͨ��</a></dt>
	<dd><span class="c_price">720</span>10-13</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-DDG-day-1.html?DDate1=2013-10-10';"
	href="http://flights.ctrip.com/booking/SHA-DDG-day-1.html">
	<dt><a title="�Ϻ��������Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-DDG-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-DDG-day-1.html?DDate1=2013-10-10';">�Ϻ�-����</a></dt>
	<dd><span class="c_price">722</span>10-10</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-URC-day-1.html?DDate1=2013-10-19';"
	href="http://flights.ctrip.com/booking/SHA-URC-day-1.html">
	<dt><a title="�Ϻ�����³ľ��Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-URC-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-URC-day-1.html?DDate1=2013-10-19';">�Ϻ�-��³ľ��</a></dt>
	<dd><span class="c_price">830</span>10-19</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-JHG-day-1.html?DDate1=2013-10-05';"
	href="http://flights.ctrip.com/booking/SHA-JHG-day-1.html">
	<dt><a title="�Ϻ�����˫���ɵĻ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-JHG-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-JHG-day-1.html?DDate1=2013-10-05';">�Ϻ�-��˫����</a></dt>
	<dd><span class="c_price">900</span>10-05</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-ENY-day-1.html?DDate1=2013-10-03';"
	href="http://flights.ctrip.com/booking/SHA-ENY-day-1.html">
	<dt><a title="�Ϻ����Ӱ��Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-ENY-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-ENY-day-1.html?DDate1=2013-10-03';">�Ϻ�-�Ӱ�</a></dt>
	<dd><span class="c_price">1020</span>10-03</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-LJG-day-1.html?DDate1=2013-10-04';"
	href="http://flights.ctrip.com/booking/SHA-LJG-day-1.html">
	<dt><a title="�Ϻ��������Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-LJG-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-LJG-day-1.html?DDate1=2013-10-04';">�Ϻ�-����</a></dt>
	<dd><span class="c_price">1070</span>10-04</dd>
</dl>
<dl
	onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-JZH-day-1.html?DDate1=2013-10-05';"
	href="http://flights.ctrip.com/booking/SHA-JZH-day-1.html">
	<dt><a title="�Ϻ�����կ���Ļ�Ʊ"
		href="http://flights.ctrip.com/booking/SHA-JZH-day-1.html"
		onclick="javascript:window.location='http://flights.ctrip.com/booking/SHA-JZH-day-1.html?DDate1=2013-10-05';">�Ϻ�-��կ��</a></dt>
	<dd><span class="c_price">1300</span>10-05</dd>
</dl>
</div>
<!--��Ʊ end --></div>
<!--left end--> <!--right start-->
<div class="bd_right"><!-- �����ػ� start -->
<h2 class="h2_title">�����ػ�</h2>

<div class="ad_onsale" id="ad_onsaleId"><a rel="nofollow"
	href="#"
	title="���Ƶ� ���ֽ���ߴ�201Ԫ/��ҹ" target="_blank"><img
	src="http://pic.c-ctrip.com/index/pic_onsale07_s.png?20130427.png"
	alt="���Ƶ� ���ֽ���ߴ�201Ԫ/��ҹ" /></a> <a rel="nofollow"
	href="#"
	title="����Ʊ ���ֽ���ߴ�715Ԫ/Ʊ" target="_blank"><img
	src="http://pic.c-ctrip.com/index/pic_onsale08_s.png?20130624.png"
	alt="����Ʊ ���ֽ���ߴ�715Ԫ/Ʊ" /></a> <a rel="nofollow"
	href="#"
	title="��Ʊǧ����?��������������Ʒֱ��90% ÿ����1Ԫ��ɱ" target="_blank"><img
	src="http://pic.c-ctrip.com/index/pic_onsale12_s.png"
	alt="��Ʊǧ����?��������������Ʒֱ��90% ÿ����1Ԫ��ɱ" /></a> <a rel="nofollow"
	href="#"
	title="Я����Ʒ�������������񡢽�Ʒ���ѡ��" target="_blank"><img
	src="http://pic.c-ctrip.com/index/pic_onsale05_s.png?20130427.png"
	alt="Я����Ʒ�������������񡢽�Ʒ���ѡ��" /></a> <a rel="nofollow"
	href="#" target="_blank"
	title="HHtravel ��������, ʵ��13�����룡�ļ�������"><img
	src="http://pic.c-ctrip.com/index/pic_onsale13.png"
	alt="HHtravel ��������, ʵ��13�����룡�ļ�������" /></a> <a rel="nofollow"
	href="#"
	target="_blank" title=";���� ��Ʒ�ʷ���Ԣ,������ �����٣�0Ԫ��ס"><img
	src="http://pic.c-ctrip.com/index/pic_onsale14.png"
	alt=";���� ��Ʒ�ʷ���Ԣ,������ �����٣�0Ԫ��ס" /></a></div>

<!-- �����ػ� end --> 
<!-- ������Ϣ start -->

<div class="mail_book"><span class="bold">&nbsp;</span></div>
<div id="mail_state_sucess" class="mail_book_success"
	style="display: none;"><i></i>���ĳɹ�&nbsp;&nbsp;&nbsp;&nbsp;<a
	href="javascript:void(0);">����</a></div>
<!-- ������Ϣ end--> 

<!-- ��ɫ����&�����俪ʼ -->
<div class="toolbox"><a
	href="#" target="_blank"
	class="tool_4">����Ԥ��</a> <a
	href="#" target="_blank"
	class="tool_2">�𳵲�ѯ</a> <a href="#" rel="nofollow"
	target="_blank" class="tool_6">�ó�����</a> <a
	href="#" rel="nofollow"
	target="_blank" class="tool_1">���ӵ�ͼ</a> <a
	href="#" target="_blank"
	class="tool_3">����ʱ��</a> <a
	href="#"
	rel="nofollow" target="_blank" class="tool_8">�ͼۻ�Ʊ<span>��֪��</span></a>
<a href="#" rel="nofollow" target="_blank"
	class="tool_5">��չ��Ϣ</a> <a
	href="#"
	rel="nofollow" target="_blank" class="tool_7">�������<span>���ÿ�</span></a>
</div>
<!-- ��ɫ����&��������� --> <!-- ����������ʼ -->
<h2 class="h2_title"><a class="more" href="#"
	target="_blank">����&gt;&gt;</a>��������</h2>
<div class="raiders_wrap">
<ul class="raiders_in" id="communityPics">
	<li class="raiders_li_current" id="gongyue1"><a
		href="http://you.ctrip.com/travels/beijing1/1495977.html"
		class="raiders_thumb">
	<div class="raiders_mask"></div>
	<img
		src="http://images4.c-ctrip.com/target/tg/042/219/117/5b44856511b445fa8ab79a8eebd9575a.jpg"
		width="150" height="114" alt="" /></a>
	<dl class="raiders_info">
		<dt><a href="http://you.ctrip.com/travels/beijing1/1495977.html"
			title="���䱱����Ӻ�͹������������䱦��һ������˹�����¼">���䱱����Ӻ�͹������������䱦��һ������˹�����¼</a></dt>
		<dd class="raiders_intro">Ӻ�͹��Ǳ��������ִ��ģ���Ĳش���Ժ</dd>
		<dd class="raiders_author">--the_air</dd>
	</dl>
	</li>
	<li id="gongyue2"><a
		href="http://you.ctrip.com/travels/budapest1109/1495999.html"
		class="raiders_thumb">
	<div class="raiders_mask"></div>
	<img
		src="http://images4.c-ctrip.com/target/tg/704/880/126/bdbeb1e0dfc5414a92208594e47cc2cd.jpg"
		width="150" height="114" alt="" /></a>
	<dl class="raiders_info">
		<dt><a
			href="http://you.ctrip.com/travels/budapest1109/1495999.html"
			title="Զ���Ĺ���֮ʮ----������˹֮��">Զ���Ĺ���֮ʮ----������˹֮��</a></dt>
		<dd class="raiders_intro">�����й���Ը��̤�㶫ŷ��Ƭ���أ���ȥŷ��ǰ�������������������������һ�ȷ���</dd>
		<dd class="raiders_author">--��Ҳ��֪��</dd>
	</dl>
	</li>
	<li id="gongyue3"><a
		href="http://you.ctrip.com/travels/ceskykrumlov8532/1495449.html"
		class="raiders_thumb">
	<div class="raiders_mask"></div>
	<img
		src="http://images4.c-ctrip.com/target/tg/791/680/005/164eb5a6109f427fae99b34992bee8de.jpg"
		width="150" height="114" alt="" /></a>
	<dl class="raiders_info">
		<dt><a
			href="http://you.ctrip.com/travels/ceskykrumlov8532/1495449.html"
			title="�ݿ��μǣ��߽�����������С�򣭣���³ķ���">�ݿ��μǣ��߽�����������С�򣭣���³ķ���</a></dt>
		<dd class="raiders_intro">��³ķ���С�������˵ģ��ݿ˵�ĸ�׺ӷ������ߺӴ�С������ʱ</dd>
		<dd class="raiders_author">--B��Ѫ������</dd>
	</dl>
	</li>
</ul>
</div>
<div class="raiders_num" id="communityBtns">
<a href="#" onclick="ChangGongYue(1);return false;"
	class="raiders_current">1</a><a href="#" onclick="ChangGongYue(2);return false;">2</a><a
	href="#" onclick="ChangGongYue(3);return false;">3</a></div>
	
<!-- ������������ --> 
<a class="mobile"
	href="#"
	target="_blank"><img alt="" title="��������V5.0,������,NO.1�ⵥ"
	src="http://pic.c-ctrip.com/index/pic_phone20130911.png" /></a>
	
	</div>
<!--right end--></div>
<!--body end-->
<!-- footer partner -->
<div class="etcinfo">

<dl class="partner">
	<dt class="h2_title">�������</dt>
	<dd><a rel="nofollow" title="��������" target="_blank"
		href="http://www.hhtravel.com/" class="partner_hh">��������</a> <a
		rel="nofollow" title="������" target="_blank"
		href="http://www.tieyou.com/" class="partner_lp">¿����</a> <a
		rel="nofollow" title="�ɹ���" target="_blank"
		href="http://www.songguo.com/" class="partner_sg">�ɹ���</a> <a
		rel="nofollow" title=";����" target="_blank"
		href="http://www.tujia.com/" class="partner_tj">;����</a> <a
		rel="nofollow" title="��������" target="_blank"
		href="http://www.wingontravel.com/" class="partner_ya">��������</a> <a
		rel="nofollow" title="������" target="_blank"
		href="http://www.eztravel.com.tw/" class="partner_yy">������</a></dd>
</dl>

<dl class="info">
	<dt class="h2_title"><a
		href="http://pages.ctrip.com/marketing/newsindex.htm" class="more"
		target="_blank">����&gt;&gt;</a>Я���ȵ�</dt>
	<dd><a rel="nofollow" title="Я��Ԯ���Ű�ϣ��Сѧ " target="_blank"
		href="http://pages.ctrip.com/marketing/news.htm?file=2013091602">Я��Ԯ���Ű�ϣ��Сѧ</a></dd>
	<dd><a rel="nofollow" title="Я�������������ѡƻ����Ʒ�Ƽ��� " target="_blank"
		href="http://pages.ctrip.com/marketing/news.htm?file=2013091601">Я�������������ѡƻ����Ʒ�Ƽ���</a></dd>
	<dd><a rel="nofollow" title="Я�������ͻ��������������ײ�" target="_blank"
		href="http://pages.ctrip.com/marketing/news.htm?file=2013091603">Я�������ͻ��������������ײ�</a></dd>
	<dd><a rel="nofollow" title="�Ƶ����߶����ȴ�40%����վ" target="_blank"
		href="http://pages.ctrip.com/marketing/news.htm?file=2013090901">�Ƶ����߶����ȴ�40%����վ</a></dd>
</dl>
<dl class="info">
	<dt class="h2_title"><a href="http://cards.ctrip.com/"
		class="more" target="_blank">����&gt;&gt;</a>������Ϣ</dt>
	<dd><a rel="nofollow"
		href="http://cards.ctrip.com/AllianceCardNew/lianmingcard32_2.htm"
		target="_blank" title="���֪�����Ƶ� ��ǧԪ���Ϳ�">���֪�����Ƶ� ��ǧԪ���Ϳ�</a></dd>
	<dd><a rel="nofollow"
		href="http://cards.ctrip.com/AllianceCardNew/lianmingcard113_2.htm"
		target="_blank" title="����ר�߷��� Ӯ��ֵ�����">����ר�߷��� Ӯ��ֵ�����</a></dd>
	<dd><a rel="nofollow"
		href="http://pages.ctrip.com/commerce/promote/201307/vacation/zh/page.html"
		target="_blank" title="�й����о�������ŷˢ����3000">�й����о�������ŷˢ����3000</a></dd>
	<dd><a rel="nofollow"
		href="http://pages.ctrip.com/commerce/promote/201304/vacation/xy/index.html"
		target="_blank" title="��ҵ���о�����������2000">��ҵ���о�����������2000</a></dd>
</dl>
</div>
<!-- ҳ�Ź�濪ʼ -->
<div id="gg_bottom" class="col1 ads_bottom">
<div id="gg_pic1"></div>
<div id="gg_pic2"></div>
<div id="gg_pic3"></div>
<div id="gg_pic4"></div>
<div id="gg_pic5"></div>
<div id="gg_pic6"></div>
</div>
<!-- ҳ�Ź����� -->
<!-- UMA ad start
         <div class="col1 ads_bottom" style="height:90px;">
			<div class="ads_uma" id="googlead">
			</div>
		</div>
		 -->
<!-- UMA ad end -->

<!--seo start-->
<div class="cityname">

<p><a title="ȫ���Ƶ��ȫ" target="_blank"
	href="http://hotels.ctrip.com/domestic-city-hotel.html">�Ƶ��ȫ</a> <a
	title="��۾Ƶ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/hong-kong58">��۾Ƶ�</a> <a
	title="���ݾƵ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/hangzhou17">���ݾƵ�</a> <a
	title="���ǾƵ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/sanya43">���ǾƵ�</a> <a title="�Ϻ��Ƶ�Ԥ��"
	target="_blank" href="http://hotels.ctrip.com/hotel/shanghai2">�Ϻ��Ƶ�</a>
<a title="�����Ƶ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/beijing1">�����Ƶ�</a> <a
	title="���žƵ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/xiamen25">���žƵ�</a> <a
	title="���ݾƵ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/guangzhou32">���ݾƵ�</a> <a
	title="�ɶ��Ƶ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/chengdu28">�ɶ��Ƶ�</a> <a
	title="���ھƵ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/shenzhen30">���ھƵ�</a> <a
	title="���žƵ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/macau59">���žƵ�</a> <a title="���ݾƵ�Ԥ��"
	target="_blank" href="http://hotels.ctrip.com/hotel/suzhou14">���ݾƵ�</a>
<a title="�����Ƶ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/xian10">�����Ƶ�</a> <a title="���ϾƵ�Ԥ��"
	target="_blank" href="http://hotels.ctrip.com/hotel/jinan144">���ϾƵ�</a>
<a title="��ɳ�Ƶ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/changsha206">��ɳ�Ƶ�</a> <a
	title="�Ͼ��Ƶ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/nanjing12">�Ͼ��Ƶ�</a> <a
	title="�人�Ƶ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/wuhan477">�人�Ƶ�</a> <a
	title="���Ƶ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/hotel/tianjin3">���Ƶ�</a> <a
	title="Ʒ�ƾƵ��ȫ" target="_blank" href="http://hotels.ctrip.com/brand/">�Ƶ�Ʒ��</a>
<a title="��ҿ�ݾƵ�" target="_blank"
	href="http://hotels.ctrip.com/brand/h110/">��ҿ��</a> <a title="���������Ƶ�"
	target="_blank" href="http://hotels.ctrip.com/brand/h132/">7������</a> <a
	title="����֮�ǾƵ�" target="_blank"
	href="http://hotels.ctrip.com/brand/h50/">����֮��</a> <a title="Ī̩168�Ƶ�"
	target="_blank" href="http://hotels.ctrip.com/brand/h44/">Ī̩168</a> <a
	title="���ֺ�̩�Ƶ�" target="_blank"
	href="http://hotels.ctrip.com/brand/h168/">���ֺ�̩</a> <a title="��ͥ��ݾƵ�"
	target="_blank" href="http://hotels.ctrip.com/brand/h48/">��ͥ�Ƶ�</a> <a
	title="��8�����Ƶ�" target="_blank"
	href="http://hotels.ctrip.com/brand/h39/">��8�Ƶ�</a> <a title="��������Ƶ�"
	target="_blank" href="http://hotels.ctrip.com/brand/h35/">��������Ƶ�</a> <a
	title="ϣ���پƵ�" target="_blank" href="http://hotels.ctrip.com/brand/h10/">ϣ���پƵ�</a>
<a title="ϲ���ǾƵ�" target="_blank"
	href="http://hotels.ctrip.com/brand/h12/">ϲ���ǾƵ�</a> <a title="����Ƶ�Ԥ��"
	target="_blank" href="http://hotels.ctrip.com/brand/h18/">����Ƶ�</a> <a
	title="���þƵ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/brand/h26/">���þƵ�</a> <a title="̩���Ƶ�Ԥ��"
	target="_blank" href="http://hotels.ctrip.com/international/country4/">̩���Ƶ�</a>
<a title="�¹��Ƶ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/international/country28/">�¹��Ƶ�</a> <a
	title="�����Ƶ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/international/country31/">�����Ƶ�</a> <a
	title="�ϰݾƵ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/international/dubai220">�ϰݾƵ�</a> <a
	title="�¼��¾Ƶ�Ԥ��" target="_blank"
	href="http://hotels.ctrip.com/international/singapore73">�¼��¾Ƶ�</a> <a
	title="�ر��ҾƵ�" target="_blank"
	href="http://hotels.ctrip.com/domestic-city-land.html">�Ƶ�ر�</a></p>
<p><a title="�Ϻ���Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/sha-Shanghai-flights.html">�Ϻ���Ʊ</a>
<a title="������Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/bjs-Beijing-flights.html">������Ʊ</a>
<a title="���ݻ�Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/can-Guangzhou-flights.html">���ݻ�Ʊ</a>
<a title="���ݻ�Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/szx-Shenzhen-flights.html">���ڻ�Ʊ</a>
<a title="�����Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/ckg-Chongqing-flights.html">�����Ʊ</a>
<a title="�ɶ���Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/ctu-Chengdu-flights.html">�ɶ���Ʊ</a>
<a title="������Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/kmg-Kunming-flights.html">������Ʊ</a>
<a title="���Ż�Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/xmn-Xiamen-flights.html">���Ż�Ʊ</a>
<a title="���ǻ�Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/syx-Sanya-flights.html">���ǻ�Ʊ</a>
<a title="���ݻ�Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/hgh-Hangzhou-flights.html">���ݻ�Ʊ</a>
<a title="�人��Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/wuh-Wuhan-flights.html">�人��Ʊ</a>
<a title="������Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/sia-Xian-flights.html">������Ʊ</a>
<a title="���ϻ�Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/tna-Jinan-flights.html">���ϻ�Ʊ</a>
<a title="������Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/dlc-Dalian-flights.html">������Ʊ</a>
<a title="���ﺽ�չ�����Ʊ��ѯ" target="_blank"
	href="http://flights.ctrip.com/booking/SHA-BJS-day-1.html">���ﺽ��</a> <a
	title="�������չ�����Ʊ��ѯ" target="_blank"
	href="http://muair.flights.ctrip.com">��������</a> <a title="�Ϸ����չ�����Ʊ��ѯ"
	target="_blank" href="http://czair.flights.ctrip.com">�Ϸ�����</a> <a
	title="�й�����������Ʊ��ѯ" target="_blank"
	href="http://caair.flights.ctrip.com">�й�����</a> <a title="���Ϻ��չ�����Ʊ��ѯ"
	target="_blank" href="http://huair.flights.ctrip.com">���Ϻ���</a> <a
	title="���ź��չ�����Ʊ��ѯ" target="_blank"
	href="http://mfair.flights.ctrip.com">���ź���</a> <a title="ɽ�����չ�����Ʊ��ѯ"
	target="_blank" href="http://scair.flights.ctrip.com">ɽ������</a> <a
	title="���麽�չ�����Ʊ��ѯ" target="_blank"
	href="http://hoair.flights.ctrip.com">���麽��</a> <a title="�׶����չ�����Ʊ��ѯ"
	target="_blank" href="http://jdair.flights.ctrip.com">�׶�����</a> <a
	title="�Ϻ�������" target="_blank"
	href="http://flights.ctrip.com/booking/SHA-BJS-day-1.html">�Ϻ�������</a> <a
	title="�Ϻ�������" target="_blank"
	href="http://flights.ctrip.com/booking/SHA-CKG-day-1.html">�Ϻ�������</a> <a
	title="�Ϻ�������" target="_blank"
	href="http://flights.ctrip.com/booking/SHA-CAN-day-1.html">�Ϻ�������</a> <a
	title="�Ϻ�������" target="_blank"
	href="http://flights.ctrip.com/booking/SHA-SZX-day-1.html">�Ϻ�������</a> <a
	title="�Ϻ����ɶ�" target="_blank"
	href="http://flights.ctrip.com/booking/SHA-CTU-day-1.html">�Ϻ����ɶ�</a> <a
	title="���ݵ�����" target="_blank"
	href="http://flights.ctrip.com/booking/CAN-BJS-day-1.html">���ݵ�����</a> <a
	title="���ݵ��Ϻ�" target="_blank"
	href="http://flights.ctrip.com/booking/CAN-SHA-day-1.html">���ݵ��Ϻ�</a> <a
	title="���쵽�Ϻ�" target="_blank"
	href="http://flights.ctrip.com/booking/CKG-SHA-day-1.html">���쵽�Ϻ�</a> <a
	title="���ڵ��Ϻ�" target="_blank"
	href="http://flights.ctrip.com/booking/SZX-SHA-day-1.html">���ڵ��Ϻ�</a> <a
	title="�������Ϻ�" target="_blank"
	href="http://flights.ctrip.com/booking/DLC-SHA-day-1.html">�������Ϻ�</a> <a
	title="���ද̬" target="_blank"
	href="http://flights.ctrip.com/actualtime/">���ද̬</a> <a title="����"
	target="_blank" href="http://flights.ctrip.com/hot-airport.html">����</a>
<a title="�ؼۻ�Ʊ" target="_blank"
	href="http://flights.ctrip.com/booking/china-city-flights-sitemap.html">�ؼۻ�Ʊ</a>
</p>

<p class="cityname_vca"><a
	href="http://vacations.ctrip.com/dest/p-Hubei-20" target="_blank">��������</a>
<a href="http://vacations.ctrip.com/dest/d-Hawaii-251" target="_blank">����������</a>
<a href="http://vacations.ctrip.com/dest/p-Hainan-31" target="_blank">��������</a>
<a href="http://vacations.ctrip.com/dest/d-Sanya-61" target="_blank">��������</a>
<a href="http://vacations.ctrip.com/dest/d-Yichang-313" target="_blank">�˲�����</a>
<a href="http://vacations.ctrip.com/dest/d-Wuxi-10" target="_blank">��������</a>
<a href="http://vacations.ctrip.com/dest/d-Chongqing-158"
	target="_blank">��������</a> <a
	href="http://vacations.ctrip.com/dest/d-Suzhou-11" target="_blank">��������</a>
<a href="http://vacations.ctrip.com/dest/d-yangshuo-702" target="_blank">��˷����</a>
<a href="http://vacations.ctrip.com/dest/d-Dunhuang-8" target="_blank">�ػ�����</a>
<a href="http://vacations.ctrip.com/dest/p-Guangxi-24" target="_blank">��������</a>
<a href="http://vacations.ctrip.com/dest/d-Qingdao-5" target="_blank">�ൺ����</a>
<a href="http://vacations.ctrip.com/dest/d-Shanghai-2" target="_blank">�Ϻ�����</a>
<a href="http://vacations.ctrip.com/dest/d-Seoul-234" target="_blank">�׶�����</a>
<a href="http://vacations.ctrip.com/dest/d-Wulumuqi-117" target="_blank">��³ľ������</a>
<a href="http://vacations.ctrip.com/dest/d-Beijing-1" target="_blank">��������</a>
<a href="http://vacations.ctrip.com/dest/p-Gansu-13" target="_blank">��������</a>
<a href="http://vacations.ctrip.com/dest/p-Qinghai-27" target="_blank">�ຣ����</a>
<a href="http://vacations.ctrip.com/dest/d-Lanzhou-231" target="_blank">��������</a>
<a href="http://vacations.ctrip.com/dest/d-Guilin-28" target="_blank">��������</a>
<a href="http://vacations.ctrip.com/dest/c-Maldives-146" target="_blank">������������</a>
</p>
</div>
<!--seo end-->
<!-- InstanceEnd name="position" -->
<!--ҳ�� start-->
<div id="footer" class="footer">
<p><a rel="nofollow" title="���ע��"
	href="https://accounts.ctrip.com/member/emailregist.aspx">���ע��</a> | <a
	title="��վ����" href="http://pages.ctrip.com/public/sitemap/sitemap.htm">��վ����</a>
| <a title="��������"
	href="http://pages.ctrip.com/public/sitemap/cityHotel.htm">��������</a> | <a
	title="��Ʊ����"
	href="http://flights.ctrip.com/booking/hot-city-flights-sitemap.html">��Ʊ����</a>
| <a rel="nofollow" title="����˵��"
	href="http://pages.ctrip.com/public/serve%20guideline.htm">����˵��</a> | <a
	rel="nofollow" title="����Я��"
	href="http://pages.ctrip.com/public/ctripab/abctrip.htm">����Я��</a> | <a
	rel="nofollow"
	href="http://pages.ctrip.com/commerce/promote/201201/other/qygm/index.html"
	title="��ҵ����">��ҵ����</a> | <a rel="nofollow"
	href="http://pages.ctrip.com/tour/ingroupline_pages.asp?folder=ingroup0904&amp;file=0177"
	title="���ζȼ�����">���ζȼ�����</a> | <a rel="nofollow" title="��ƸӢ��"
	href="http://job.ctrip.com">��ƸӢ��</a> | <a rel="nofollow" title="��������"
	href="http://u.ctrip.com">��������</a> | <a rel="nofollow" title="��ҵ��Ʒ���ɹ�"
	href="http://pages.ctrip.com/commerce/promote/201305/other/qylpk/index.html">��ҵ��Ʒ���ɹ�</a>
| <a rel="nofollow" title="��������"
	href="http://pages.ctrip.com/public/dlhz.htm">��������</a> | <a
	rel="nofollow" title="���ҵ��"
	href="http://pages.ctrip.com/public/ctripad/adyw.htm">���ҵ��</a> | <a
	rel="nofollow" title="��ϵ����"
	href="http://pages.ctrip.com/public/contact.htm">��ϵ����</a> | <a
	class="suggestions" rel="nofollow" target="_blank" title="��Ҫ�Ὠ��"
	href="http://accounts.ctrip.com/MyCtrip/Community/CommunityAdvice.aspx">��Ҫ�Ὠ��</a></p>
<p><a rel="nofollow" target="_blank"
	href="http://pages.ctrip.com/public/diploma/company.htm">Ӫҵִ��</a> | <a
	rel="nofollow" target="_blank"
	href="http://pages.ctrip.com/public/Insurance/index.htm">���մ���</a> | <a
	target="_blank"
	href="http://pages.ctrip.com/public/link/ctrip_link.html">��������</a> | <a
	rel="nofollow" href="http://pages.ctrip.com/public/copyright.htm">Copyright&copy;</a>
1999-2013, <a href="http://www.ctrip.com/"> ctrip.com</a>. All rights
reserved. | <a rel="nofollow" target="_blank"
	href="http://www.miibeian.gov.cn/">ICP֤����B2-20050130</a></p>
<p>��վ��ͼ�ɱ���ͼΪ�ȿƼ����޹�˾�����������������֤��ţ��ײ���11002015����ͼ��ͼ�ţ�GS��2010��1049��</p>
<p id="cui_lang_bottom"><a href="http://big5.ctrip.com/" title="�����"
	class="cui_lang_big5" rel="nofollow">�����</a> <a rel="nofollow"
	title="China Travel" class="cui_lang_en"
	href="http://english.ctrip.com/">English</a> <a rel="nofollow"
	title="�й�����" href="http://jp.ctrip.com/" class="cui_lang_jap">�����</a> <a
	rel="nofollow" title="�й�����" href="http://kr.ctrip.com/"
	class="cui_lang_korea">�����</a> <a rel="nofollow" title="Chine Voyage"
	href="http://fr.ctrip.com/" class="cui_lang_fr">Fran&#231;ais</a> <a
	rel="nofollow" title="China Reisen" href="http://de.ctrip.com/"
	class="cui_lang_de">Deutsch</a> <a rel="nofollow"
	title="Viajar a China" href="http://es.ctrip.com/" class="cui_lang_es">Espa&#241;ol</a>
<a rel="nofollow" title="���٧էڧ�� �� ���ڧ�ѧ�" href="http://ru.ctrip.com/"
	class="cui_lang_ru">������ܧڧ�</a></p>
<div class="policewrap layoutfix"><a class="police_z"
	title="���ű��룺163178864X" target="blank" rel="nofollow"
	href="http://www.itrust.org.cn/yz/pjwx.asp?wm=163178864X"></a> <a
	class="police_g" title="�������ձ�ʶ" target="blank" rel="nofollow"
	href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20110428175405415"></a>
<a class="police_c"
	href="http://search.cxwz.org/cert/l/CX20111018000615000623"
	target="_blank" rel="nofollow" title="������֤ʾ����ҵ"></a> <a
	class="police_x" href="http://www.zx110.org/" rel="nofollow"
	target="_blank" title="������"></a> <a class="police_j" href="javascript:"
	rel="nofollow" title="�Ϻ��л�����Υ����Υ����Ϣ�ٱ�����"></a> <a title="������վ"
	target="_blank"
	href="https://ss.cnnic.cn/verifyseal.dll?sn=e12061531010025926306977"
	rel="nofollow" class="police_k"></a></div>
</div>
<!--ҳ�� end-->
<input type="hidden" id="page_id" value="100101991" />
<input type="hidden" id="_releaseNo_" value="201300816.js" />
<input type="hidden" id="uid" value="" />
<input type="hidden" id="hongkongMask" value="" />
<input type="hidden" id="solution" value="PRO|GB" />
<div class="departures" id="pkgStartCityDiv" style="display: none;">
<h5>���ų�������</h5>
<a title="BeiJing" data-id="1" href="javascript:void(0);">����</a><a
	title="ShangHai" data-id="2" href="javascript:void(0);">�Ϻ�</a><a
	title="TianJin" data-id="3" href="javascript:void(0);">���</a><a
	title="QingDao" data-id="7" href="javascript:void(0);">�ൺ</a><a
	title="NanJing" data-id="12" href="javascript:void(0);">�Ͼ�</a><a
	title="HangZhou" data-id="17" href="javascript:void(0);">����</a><a
	title="XiaMen" data-id="25" href="javascript:void(0);">����</a><a
	title="ChengDu" data-id="28" href="javascript:void(0);">�ɶ�</a><a
	title="ShenZhen" data-id="30" href="javascript:void(0);">����</a><a
	title="GuangZhou" data-id="32" href="javascript:void(0);">����</a><a
	title="ShenYang" data-id="451" href="javascript:void(0);">����</a><a
	title="WuHan" data-id="477" href="javascript:void(0);">�人</a>
<ul class="departures_sequence">
	<li><span>B</span><a title="BeiJing" href="javascript:void(0);"
		data-id="1">����</a><a title="BaoTou" href="javascript:void(0);"
		data-id="141">��ͷ</a></li>
	<li><span>M</span><a title="MianYang" href="javascript:void(0);"
		data-id="370">����</a></li>
	<li><span>C</span><a title="ZhongQing" href="javascript:void(0);"
		data-id="4">����</a><a title="ChengDu" href="javascript:void(0);"
		data-id="28">�ɶ�</a><a title="ChangChun" href="javascript:void(0);"
		data-id="158">����</a><a title="ChangSha" href="javascript:void(0);"
		data-id="206">��ɳ</a><a title="ChangZhou" href="javascript:void(0);"
		data-id="213">����</a></li>
	<li><span>N</span><a title="NanJing" href="javascript:void(0);"
		data-id="12">�Ͼ�</a><a title="NingBo" href="javascript:void(0);"
		data-id="375">����</a><a title="NanChang" href="javascript:void(0);"
		data-id="376">�ϲ�</a><a title="NanNing" href="javascript:void(0);"
		data-id="380">����</a></li>
	<li><span>D</span><a title="DaLian" href="javascript:void(0);"
		data-id="6">����</a><a title="DongZuo" href="javascript:void(0);"
		data-id="223">��ݸ</a></li>
	<li><span>Q</span><a title="QingDao" href="javascript:void(0);"
		data-id="7">�ൺ</a><a title="QuanZhou" href="javascript:void(0);"
		data-id="406">Ȫ��</a></li>
	<li><span>F</span><a title="FoShan" href="javascript:void(0);"
		data-id="251">��ɽ</a><a title="FuZhou" href="javascript:void(0);"
		data-id="258">����</a></li>
	<li><span>S</span><a title="ShangHai" href="javascript:void(0);"
		data-id="2">�Ϻ�</a><a title="SuZhou" href="javascript:void(0);"
		data-id="14">����</a><a title="ShenZhen" href="javascript:void(0);"
		data-id="30">����</a><a title="SanYa" href="javascript:void(0);"
		data-id="43">����</a><a title="ShiJiaZhuang" href="javascript:void(0);"
		data-id="428">ʯ��ׯ</a><a title="ShanTou" href="javascript:void(0);"
		data-id="447">��ͷ</a><a title="ShenYang" href="javascript:void(0);"
		data-id="451">����</a></li>
	<li><span>G</span><a title="GuangZhou" href="javascript:void(0);"
		data-id="32">����</a><a title="GuiYang" href="javascript:void(0);"
		data-id="38">����</a></li>
	<li><span>T</span><a title="TianJin" href="javascript:void(0);"
		data-id="3">���</a><a title="TaiYuan" href="javascript:void(0);"
		data-id="105">̫ԭ</a><a title="TaiZhou" href="javascript:void(0);"
		data-id="578">̨��</a></li>
	<li><span>H</span><a title="HaErBin" href="javascript:void(0);"
		data-id="5">������</a><a title="HangZhou" href="javascript:void(0);"
		data-id="17">����</a><a title="HaiKou" href="javascript:void(0);"
		data-id="42">����</a><a title="HuHeHaoTe" href="javascript:void(0);"
		data-id="103">���ͺ���</a><a title="HaiLaEr" href="javascript:void(0);"
		data-id="142">������</a><a title="HeFei" href="javascript:void(0);"
		data-id="278">�Ϸ�</a></li>
	<li><span>W</span><a title="WuXi" href="javascript:void(0);"
		data-id="13">����</a><a title="WuLuMuQi" href="javascript:void(0);"
		data-id="39">��³ľ��</a><a title="WuHan" href="javascript:void(0);"
		data-id="477">�人</a><a title="WeiHai" href="javascript:void(0);"
		data-id="479">����</a><a title="WenZhou" href="javascript:void(0);"
		data-id="491">����</a></li>
	<li><span>J</span><a title="JiNan" href="javascript:void(0);"
		data-id="144">����</a><a title="JiangMen" href="javascript:void(0);"
		data-id="316">����</a></li>
	<li><span>X</span><a title="XiAn" href="javascript:void(0);"
		data-id="10">����</a><a title="XiaMen" href="javascript:void(0);"
		data-id="25">����</a><a title="XiNing" href="javascript:void(0);"
		data-id="124">����</a><a title="XiChang" href="javascript:void(0);"
		data-id="494">����</a><a title="XuZhou" href="javascript:void(0);"
		data-id="512">����</a></li>
	<li><span>K</span><a title="KunMing" href="javascript:void(0);"
		data-id="34">����</a><a title="KaShiShi" href="javascript:void(0);"
		data-id="109">��ʲ��</a></li>
	<li><span>Y</span><a title="YinChuan" href="javascript:void(0);"
		data-id="99">����</a><a title="YunCheng" href="javascript:void(0);"
		data-id="140">�˳�</a><a title="YanJi" href="javascript:void(0);"
		data-id="523">�Ӽ�</a><a title="YuLin" href="javascript:void(0);"
		data-id="527">����</a><a title="YanTai" href="javascript:void(0);"
		data-id="533">��̨</a><a title="YiWu" href="javascript:void(0);"
		data-id="536">����</a></li>
	<li><span>L</span><a title="LaSa" href="javascript:void(0);"
		data-id="41">����</a><a title="LanZhou" href="javascript:void(0);"
		data-id="100">����</a></li>
	<li><span>Z</span><a title="ZhuHai" href="javascript:void(0);"
		data-id="31">�麣</a><a title="ZhongShan" href="javascript:void(0);"
		data-id="553">��ɽ</a><a title="ZhengZhou" href="javascript:void(0);"
		data-id="559">֣��</a></li>
</ul>
</div>


<div class="departures" id="divVacationStartCity"
	style="position: absolute; display: none;">
<h5>���ų�������</h5>
<a title="Beijing" href="javascript:void(0);" data-id="1">����</a><a
	title="Shanghai" href="javascript:void(0);" data-id="2">�Ϻ�</a><a
	title="Tianjin" href="javascript:void(0);" data-id="3">���</a><a
	title="Chongqing" href="javascript:void(0);" data-id="4">����</a><a
	title="Haerbin" href="javascript:void(0);" data-id="5">������</a><a
	title="Dalian" href="javascript:void(0);" data-id="6">����</a><a
	title="Qingdao" href="javascript:void(0);" data-id="7">�ൺ</a><a
	title="Xi'an" href="javascript:void(0);" data-id="10">����</a><a
	title="Dunhuang" href="javascript:void(0);" data-id="11">�ػ�</a><a
	title="Nanjing" href="javascript:void(0);" data-id="12">�Ͼ�</a>
<ul class="departures_sequence">
	<li><span>B</span><a title="Beijing" href="javascript:void(0);"
		data-id="1">����</a><a title="Baotou" href="javascript:void(0);"
		data-id="141">��ͷ</a></li>
	<li><span>M</span><a title="Mianyang" href="javascript:void(0);"
		data-id="370">����</a></li>
	<li><span>C</span><a title="Chongqing" href="javascript:void(0);"
		data-id="4">����</a><a title="Chengdu" href="javascript:void(0);"
		data-id="28">�ɶ�</a><a title="Changchun" href="javascript:void(0);"
		data-id="158">����</a><a title="Changsha" href="javascript:void(0);"
		data-id="206">��ɳ</a><a title="Changzhou" href="javascript:void(0);"
		data-id="213">����</a></li>
	<li><span>N</span><a title="Nanjing" href="javascript:void(0);"
		data-id="12">�Ͼ�</a><a title="Nantong" href="javascript:void(0);"
		data-id="82">��ͨ</a><a title="Ningbo" href="javascript:void(0);"
		data-id="375">����</a><a title="Nanchang" href="javascript:void(0);"
		data-id="376">�ϲ�</a><a title="Nanning" href="javascript:void(0);"
		data-id="380">����</a></li>
	<li><span>D</span><a title="Dalian" href="javascript:void(0);"
		data-id="6">����</a><a title="Dongguan" href="javascript:void(0);"
		data-id="223">��ݸ</a></li>
	<li><span>Q</span><a title="Qingdao" href="javascript:void(0);"
		data-id="7">�ൺ</a><a title="Quanzhou" href="javascript:void(0);"
		data-id="406">Ȫ��</a></li>
	<li><span>F</span><a title="Foshan" href="javascript:void(0);"
		data-id="251">��ɽ</a><a title="Fuzhou" href="javascript:void(0);"
		data-id="258">����</a></li>
	<li><span>S</span><a title="Shanghai" href="javascript:void(0);"
		data-id="2">�Ϻ�</a><a title="Suzhou" href="javascript:void(0);"
		data-id="14">����</a><a title="Shenzhen" href="javascript:void(0);"
		data-id="30">����</a><a title="Sanya" href="javascript:void(0);"
		data-id="43">����</a><a title="Shijiazhuang" href="javascript:void(0);"
		data-id="428">ʯ��ׯ</a><a title="Shantou" href="javascript:void(0);"
		data-id="447">��ͷ</a><a title="Shenyang" href="javascript:void(0);"
		data-id="451">����</a></li>
	<li><span>G</span><a title="Guangzhou" href="javascript:void(0);"
		data-id="32">����</a><a title="Guiyang" href="javascript:void(0);"
		data-id="38">����</a></li>
	<li><span>T</span><a title="Tianjin" href="javascript:void(0);"
		data-id="3">���</a><a title="Taiyuan" href="javascript:void(0);"
		data-id="105">̫ԭ</a><a title="Taizhou" href="javascript:void(0);"
		data-id="578">̨��</a></li>
	<li><span>H</span><a title="Haerbin" href="javascript:void(0);"
		data-id="5">������</a><a title="Hangzhou" href="javascript:void(0);"
		data-id="17">����</a><a title="Haikou" href="javascript:void(0);"
		data-id="42">����</a><a title="Huhehaote" href="javascript:void(0);"
		data-id="103">���ͺ���</a><a title="Hailaer" href="javascript:void(0);"
		data-id="142">������</a><a title="Hefei" href="javascript:void(0);"
		data-id="278">�Ϸ�</a></li>
	<li><span>W</span><a title="Wuxi" href="javascript:void(0);"
		data-id="13">����</a><a title="Wulumuqi" href="javascript:void(0);"
		data-id="39">��³ľ��</a><a title="Wuhan" href="javascript:void(0);"
		data-id="477">�人</a><a title="Weihai" href="javascript:void(0);"
		data-id="479">����</a><a title="Wenzhou" href="javascript:void(0);"
		data-id="491">����</a></li>
	<li><span>J</span><a title="Jinan" href="javascript:void(0);"
		data-id="144">����</a><a title="Jiangmen" href="javascript:void(0);"
		data-id="316">����</a></li>
	<li><span>X</span><a title="Xi'an" href="javascript:void(0);"
		data-id="10">����</a><a title="Xiamen" href="javascript:void(0);"
		data-id="25">����</a><a title="Xining" href="javascript:void(0);"
		data-id="124">����</a><a title="Xichang" href="javascript:void(0);"
		data-id="494">����</a><a title="Xuzhou" href="javascript:void(0);"
		data-id="512">����</a></li>
	<li><span>K</span><a title="Kunming" href="javascript:void(0);"
		data-id="34">����</a><a title="Kashi" href="javascript:void(0);"
		data-id="109">��ʲ��</a></li>
	<li><span>Y</span><a title="Yinchuan" href="javascript:void(0);"
		data-id="99">����</a><a title="Yuncheng" href="javascript:void(0);"
		data-id="140">�˳�</a><a title="Yanji" href="javascript:void(0);"
		data-id="523">�Ӽ�</a><a title="Yulin" href="javascript:void(0);"
		data-id="527">����</a><a title="Yantai" href="javascript:void(0);"
		data-id="533">��̨</a><a title="Yiwu" href="javascript:void(0);"
		data-id="536">����</a></li>
	<li><span>L</span><a title="Lijiang" href="javascript:void(0);"
		data-id="37">����</a><a title="Lasa" href="javascript:void(0);"
		data-id="41">����</a><a title="Lanzhou" href="javascript:void(0);"
		data-id="100">����</a></li>
	<li><span>Z</span><a title="Zhuhai" href="javascript:void(0);"
		data-id="31">�麣</a><a title="Zhongshan" href="javascript:void(0);"
		data-id="553">��ɽ</a><a title="Zhengzhou" href="javascript:void(0);"
		data-id="559">֣��</a></li>
</ul>
</div>
<div id="hotelNameChoice" class="choice" style="display: none;"></div>
<script src="js/LAB.js?20130116.js" charset="utf-8"
	type="text/javascript"></script>
<script type="text/javascript">
    //����AddCookie����
    var adCookieDomain = 'localhost';
</script>

<script type="text/javascript">
    var pkgStartCityHash = { "�麣": 31, "����": 41, "����": 42, "����": 99, "��ʲ": 109, "����": 124, "�˳�": 140, "��ͷ": 141, "������": 142, "����": 213, "����": 370, "Ȫ��": 406, "����": 43, "ʯ��ׯ": 428, "��ͷ": 447, "����": 479, "����": 494, "����": 512, "�Ӽ�": 523, "����": 527, "��̨": 533, "����": 536, "̨��": 578, "����": 1, "�Ϻ�": 2, "����": 32, "����": 30, "����": 17, "�ɶ�": 28, "�Ͼ�": 12, "�ൺ": 7, "����": 25, "�人": 477, "����": 451, "����": 144, "����": 375, "����": 13, "����": 491, "���": 3, "����": 4, "����": 10, "֣��": 559, "����": 258, "����": 34, "��ɳ": 206, "����": 6, "����": 38, "��³ľ��": 39, "����": 100, "���ͺ���": 103, "̫ԭ": 105, "����": 158, "�Ϸ�": 278, "�ϲ�": 376, "����": 380, "������": 5, 1: "����", 2: "�Ϻ�", 32: "����", 30: "����", 17: "����", 28: "�ɶ�", 12: "�Ͼ�", 7: "�ൺ", 25: "����", 477: "�人", 451: "����", 144: "����", 375: "����", 13: "����", 491: "����", 3: "���", 4: "����", 10: "����", 559: "֣��", 258: "����", 34: "����", 206: "��ɳ", 6: "����", 38: "����", 39: "��³ľ��", 100: "����", 103: "���ͺ���", 105: "̫ԭ", 158: "����", 278: "�Ϸ�", 376: "�ϲ�", 380: "����", 5: "������", 31: "�麣", 41: "����", 42: "����", 99: "����", 109: "��ʲ", 124: "����", 140: "�˳�", 141: "��ͷ", 142: "������", 213: "����", 370: "����", 406: "Ȫ��", 43: "����", 428: "ʯ��ׯ", 447: "��ͷ", 479: "����", 494: "����", 512: "����", 523: "�Ӽ�", 527: "����", 533: "��̨", 536: "����", 578: "̨��" };

    var g_adsconfig = "http://webresource.c-ctrip.com/ResCRMOnline/ahomepage/ahomectrip.js";

    var config = {
        today: '2013-09-24',
        tomorrow: '2013-09-25',
        oneyear_today: '2014-09-24',
        url: {
            hotelFlightAction: 'http://package.ctrip.com/',
            loginAjax: 'js/AjaxGetLoginCookie.ashx',
            vacationAjax: 'js/AjaxGetVacationsTabJSON.ashx',
            hotelAjax: 'js/AjaxGetHotelTabJSON.ashx',
            flightAjax: '/Tool/AjaxGetFlightTabJSON.ashx',
            popAjax: '/Tool/AjaxQuery.ashx',
            hotelAddressJsonp: '/Tool/AjaxSearchLandMark.ashx',
            hotelAddresSmt: 'http://hotels.ctrip.com',
            hotelNameJsonp: '/Tool/AjaxSearchHotelName.ashx?cityId={cityId}&keyword=${key}',
            citynameInterJsonp: '/Tool/HotelAjaxIndexCity.ashx?keyword=${key}',
            trainURL: 'vacations.ctrip.com',
            SMSUrl: '/Tool/AjaxSendSMS.ashx',
            ticketAction: 'http://vacations.ctrip.com/',
            inteHotelAction: 'http://hotels.ctrip.com',
            guessAjaxGet: 'js/AjaxGetUlike.ashx',
            guessAjaxDel: 'js/AjaxDelUlike.ashx'
        },
        tip: {
            chinaHotel: [
				'��ѡ��Ƶ����ڳ���',
				'��������סʱ��',
				'�˷�������Ҫ������ס����',
				'��סʱ�䲻������{$today}',
				'���������ʱ��',
				'��ס���ڸ�ʽ����ȷ',
				'�˷����ڸ�ʽ����ȷ',
				'����ס�Ƶ�ʱ�䳬��28�죬��ֶ����ύԤ��'
			],
            inteHotel: [
				'��ס���ڸ�ʽ����ȷ',
				'�˷����ڸ�ʽ����ȷ',
				'��ѡ��Ƶ����ڳ���',
				'��������סʱ��',
				'��סʱ�䲻������{$today}',
				'���������ʱ��',
				'�˷�������Ҫ������ס����',
				'����ס�Ƶ�ʱ�䳬��28�죬��ֶ����ύԤ��'
			],
            chinaFlight: [
				'�������ڸ�ʽ����ȷ',
				'�������ڸ�ʽ����ȷ',
				'��ѡ���������',
				'��ѡ�񵽴����',
				'�������в��ܺ͵��������ͬ',
				'��ѡ�����ĳ�������',
				'��ѡ�����ķ�������',
				'�������ڲ�������{$today}',
				'�������ڲ������ڳ�������{$startDate}',
				'ֻ�ܲ�ѯһ���ں���'
			],
            inteFlight: [
				'�������ڸ�ʽ����ȷ',
				'�������ڸ�ʽ����ȷ',
				'��ѡ���������',
				'��ѡ��Ŀ�ĳ���',
				'��ѡ��ĳ�������û��ǰ��$1�ĺ��࣬������ѡ��',
				'��ѡ��ĳ�������û��ǰ����Ŀ�ĳ��еĺ��࣬������ѡ��',
				'��ѡ��ĳ����ص���Ŀ�ĵ���ͬ,������ѡ��',
				'��ѡ�����ĳ�������',
				'��ѡ�����ķ�������',
				'�������ڲ�������{$today}',
				'�������ڲ������ڳ�������{$startDate}',
				'ֻ�ܲ�ѯһ���ں���'
			],
            vacation: [
				'��ѡ�����ĳ�����',
				'��ѡ������Ŀ�ĵ�'
			],
            flightHotel: [
				'�������ڸ�ʽ����ȷ',
				'�������ڸ�ʽ����ȷ',
				'ֻ��Ԥ��һ���Ժ�ľƵ�ͻ�Ʊ',
				'����д��������',
				'����д�������',
				'�������ڲ�������{$today}',
				'ֻ������һ���ڻ�Ʊ�;Ƶ�',
				'�������к�Ŀ�ĳ��в�����ͬ',
				'��ѡ���������',
				'��ѡ�񷵻�����',
				'�������ڱ������ڳ�������',
				'ÿ�䷿����Ԥ��28��������д1-28������',
				'һλ��������Я��������ͯ�˻������޸ĳ�������'
			],
            telphone: [
                 '�ֻ����벻��Ϊ��',
                    '�ֻ������ʽ����ȷ'
            ],
            email: [
				'������Email��ַ',
				'��������ȷ��Email��ַ',
				'�����ظ�����',
				'����Email(�磺a@b.c)'
			]
        },
        notice: [
			'����/ƴ��',
			'����/ƴ��',
			'����/Ӣ��',
			'��������/ƴ��',
			'ѡ�λ�ùؼ��֣�',
            '����/Ӣ��/ƴ��',
            'ѡ�����/ƴ����'
		],
        msg: {
            "hotelStartCity": "<strong>���ų���</strong>����ֱ��ѡ����л��������ȫƴ/��ƴ��",
            "addressTab": "ʡ��",
            "hotelAddress": "��ֱ��ѡ�����λ�û�����λ�ùؼ���",
            "aMapTitle": "�鿴��ҵ����ͼ",
            "subCity": "��Ͻ��/�أ�",
            "all": "ȫ��",
            "suggestion": "�����ų��У���ֱ��������л�ƴ��",
            "pkgDestCity": "��������/ƴ���������йؼ�����ѡ��"
        },
        data: [
			["�Ϻ�(����)", "�Ϻ�(�ֶ�)", "����(�׶�)", "����(��Է)"]
		],
        posTitle: {
            "zone": "��ҵ��",
            "location": "������",
            "metro": "������"
        },
        TW: ["̨��", "����", "�Ѷ�", "̨����", "��԰��"]
    };


    $globalPad = true;
    $LAB
    /*
    .script({ src: "js/cQuery_110421.js", charset: "utf-8" }).wait(function () {
        //cQuery.config("modPath", "http://webresource.c-ctrip.com/ResCRMOnline/r3/js/index/");
        $.mod.load('sideBar', '2.0', function () {
            var sidebar = $(document).regMod('sideBar', '2.0', {
                url: {
                 //   feedBackURL: 'http://www.ctrip.com/QSYS/Online/OnlineQsysQurveyLogin.asp?SurveyID=519bcdac-927a-44d9-a7b8-7b1097ca5e00&Review=',
                   // liveChatURL: 'http://livechat.ctrip.com/livechat/Login3.aspx?GroupCode=CustomerService&AsFrom=1|CustomerService'
                },
                title: {
                    backTop: '�ص�����',
                    feedBack: '�ʾ�����',
                    liveChat: '���߿ͷ�'
                }
            });
        });
    })
    */
    .padScript({ src: "js/pad.js", charset: "utf-8" }).wait()
    .script({ src: "js/index.min.js?ws_www20130805.js", charset: "utf-8" }).wait(logTimer)
    .script({ src: "js/adCookie.min.js?ws_www20130805.js", charset: "utf-8" }); 
	
</script>



<script type="text/javascript">
    var HD_HOTEL_CONFIG = {
        addressMessageConfig: {
            cityname: {
                suggestionB: '֧������/ƴ��/��ƴ����',
                suggestion: "<strong>���ų���</strong>����ֱ��ѡ����л��������ȫƴ/��ƴ��"
            },
            searchHistory: '������ʷ',
            addressTab: "ʡ��",
            hotelPos: {
                suggestion: "��ֱ��ѡ�����λ�û�����λ�ùؼ���",
                titles: {
                    "zone": "��ҵ��",
                    "location": "������",
                    "metro": "������"
                },
                showAMap: false,
                AMapTitle: '�鿴��ҵ����ͼ',
                all: 'ȫ��',
                subCity: '��Ͻ��/�أ�'
            },
            suggestTitle: ["����", "������վ", "λ��"],
            defaultValue: ['�Ϻ�', '2', 'shanghai']
        },
        validateMessageConfig: {
            hotel: {
                city: '��ѡ��Ƶ����ڳ���',
                checkIn: '��ѡ����ס����',
                checkOut: '��ѡ���������',
                dateErr: '���ڸ�ʽΪyyyy-mm-dd',
                too_early_in: '��ס���ڲ������ڽ���',
                too_early_out: '��ѡ��������������/������ס���ڣ�������ѡ��',
                too_long: '����ס�Ƶ�ʱ�䳬��28�죬��ֶ����ύԤ��',
                no_room: '��ѡ�������û�з���ɹ�Ԥ��!',
                room_num: '��ѡ��Ԥ��������'
            }
        },
        noticeMessageConfig: ['����/ƴ��']
    };



</script>
 
<script type="text/javascript">
    //������
    (function () {
        var ads = document.createElement('script'); ads.type = 'text/javascript'; ads.async = true;
        ads.src = "js/AdCallProxy.aspx?re=ads&adlist=[{\"adIDs\":\"27-28-29-30-31-32\",\"domID\":\"allyesId\"},{\"adIDs\":\"33\",\"domID\":\"allyesId2\"},{\"adIDs\":\"34\",\"domID\":\"gg_pic1\"},{\"adIDs\":\"40\",\"domID\":\"gg_pic2\"},{\"adIDs\":\"41\",\"domID\":\"gg_pic3\"},{\"adIDs\":\"42\",\"domID\":\"gg_pic4\"},{\"adIDs\":\"43\",\"domID\":\"gg_pic5\"},{\"adIDs\":\"44\",\"domID\":\"gg_pic6\"}]&r=ws_www";
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ads, s);
    })();

    

    (function () {
      
        var nts = document.createElement('script'); nts.type = 'text/javascript'; nts.async = true;
        nts.src = "js/__nts.js?ws_www_20130808";
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(nts, s);
    })();

    (function (d) {
        window.bd_cpro_rtid = "PWTzPjD";
        var s = d.createElement("script"); s.type = "text/javascript"; s.async = true; s.src =  "js/rt.js";
        var s0 = d.getElementsByTagName("script")[0]; s0.parentNode.insertBefore(s, s0);
    })(document);
    
    

    
</script>
<script>
   function SeachTicket(){
  
   if(document.getElementById("FD_DCity1").value==""){//��������
     alert("�������в���Ϊ��");
    //$("#FD_StartCity").focus();
     document.getElementById("FD_StartCity").focus();
    return;
   }
   if(document.getElementById("FD_ACity1").value==""){//�������
   alert("������в���Ϊ��");
    //$("#FD_DestCity").focus();
     document.getElementById("FD_DestCity").focus();
     return;
   }
   if(document.getElementById("FD_DCity1").value==document.getElementById("FD_ACity1").value){
   alert("�������в��ܺ͵������һ��");
     //$("#FD_DestCity").focus();
     document.getElementById("FD_DestCity").focus();
     return;
   }
   //alert(document.getElementById("FD_StartDate").value);
   if(document.getElementById("FD_StartDate").value==""||document.getElementById("FD_StartDate").value=="yyyy-mm-dd"){//��������
    //$("#FD_StartDate").focus();
    alert("�������ڲ���Ϊ��");
     document.getElementById("FD_StartDate").focus();
     return;
   }
   document.FD_ChinaFlightForm.action="ticticket!toTicketList.jspx";
   document.FD_ChinaFlightForm.method="POST";
   document.FD_ChinaFlightForm.submit();
   
   }
   
   function SeachInterTicket(){
  
   if(document.getElementById("FD_DCity1").value==""){//��������
     alert("�������в���Ϊ��");
    //$("#FD_StartCity").focus();
     document.getElementById("FD_StartCity").focus();
    return;
   }
   if(document.getElementById("FD_ACity1").value==""){//�������
   alert("������в���Ϊ��");
    //$("#FD_DestCity").focus();
     document.getElementById("FD_DestCity").focus();
     return;
   }
   if(document.getElementById("FD_DCity1").value==document.getElementById("FD_ACity1").value){
   alert("�������в��ܺ͵������һ��");
     //$("#FD_DestCity").focus();
     document.getElementById("FD_DestCity").focus();
     return;
   }
   //alert(document.getElementById("FD_StartDate").value);
   if(document.getElementById("FD_StartDate").value==""||document.getElementById("FD_StartDate").value=="yyyy-mm-dd"){//��������
    //$("#FD_StartDate").focus();
    alert("�������ڲ���Ϊ��");
     document.getElementById("FD_StartDate").focus();
     return;
   }
   document.FD_ChinaFlightForm.action="international!toInterNationalList.jspx";
   document.FD_ChinaFlightForm.method="POST";
   document.FD_ChinaFlightForm.submit();
   
   }
   
  function SeachSpotticket(){
  if(document.getElementById("city_hotel_hide").value==""){//�������
   alert("Ŀ�ĳ��в���Ϊ��");
    //$("#FD_DestCity").focus();
     document.getElementById("txthotelcity").focus();
     return;
   }
   
   document.ticketTab.action="spotticket!SeachSpotbyIndex.jspx";
   document.ticketTab.method="POST";
   document.charset = 'UTF-8';
   document.ticketTab.submit();
  
  }
  function SeachSpotline(){
  alert("SeachSpotline");
  if(document.getElementById("city_spotline_hide").value==""){//��������
   alert("�������в���Ϊ��");
  
     document.getElementById("txtspotlinecity").focus();
     return;
   }
 //  if(document.getElementById("city_spotline_hide2").value!=""&&document.getElementById("city_spotline_hide").value==document.getElementById("city_spotline_hide2").value){
  // alert("�������к͵�����в���һ��");
  // }
   
   document.vacationTab.action="spotline!SeachSpotline.jspx";
   document.vacationTab.method="POST";
   document.charset = 'UTF-8';
   document.vacationTab.submit();
  
  }
  
   
</script>
<!-- ��Ʊ�� -->
 
<script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript" src="js/hotel/functions.js"></script>
<script language="javascript" type="text/javascript" src="js/hotel/city_date2_index.js"></script>
<!-- ������ -->
<script language="javascript" type="text/javascript" src="js/spotline/city_date2.js"></script>

<script type="text/javascript">
var varAddress="";
$(document).ready(function(){
   loadCityData();
   loadCityData2();
   selecthotel(1,607);
   selectspotticket(1,607);
});

function loadCityData()
{

 $.ajax({
       type:"POST",
       url:"spotticket!GetSpotCity.jspx",
       async:false,     
       success:function(data)
       {    
         varAddress=data;
       }            
  });
 // alert(varAddress);
}
</script>

<script type="text/javascript">
var varAddress2="";
function loadCityData2()
{

 $.ajax({
       type:"POST",
       url:"spotticket!GetSpotCity.jspx",
       async:false,     
       success:function(data)
       {    
         varAddress2=data;
       }            
  });
 // alert(varAddress);
}
//�Ƶ���
function selecthotel(index,cityid){
for(i=1;i<=12;i++){
document.getElementById("hotel_a_"+i).className=""; 
}
 document.getElementById("hotel_a_"+index).className="current"; 



  $.ajax({
      type:"POST",
      async : false,
      cache:false,
       url:"index!GetIndexHotelByIndex.jspx",
      data:{strHotelIndex:index,strCityID:cityid,parastr:Math.floor(Math.random()*100)},
      beforeSend:function(){$("#divHotelHtml").html("&nbsp;&nbsp;&nbsp;&nbsp;<img src='images/loadding.gif' border='0' />���ڼ����Ƽ��Ƶ���Ϣ...");},             
      success:function(data){
     // alert(data);
      $("#divHotelHtml").html(data);           
      }            
      }); 
}
//��Ʊ��
function  selectspotticket(index,cityid){

for(i=1;i<=7;i++){
	 document.getElementById("spot_a_"+i).className=""; 
}
  document.getElementById("spot_a_"+index).className="current"; 
  

	//alert("selectspotticket:"+index+","+cityid);
 	 $.ajax({
       type:"GET",
       cache:false,
       url:"index!GetSpotTicketByIndex.jspx",
      data:{strHotelIndex:index,strCityID:cityid,para:Math.floor(Math.random()*100)},
      beforeSend:function(){$("#divSpotticketHtml").html("&nbsp;&nbsp;&nbsp;&nbsp;<img src='images/loadding.gif' border='0' />���ڼ����Ƽ���Ʊ��Ϣ...");},             
      success:function(data){
      $("#divSpotticketHtml").html(data);           
      }            
      }); 
}

function ChangType(ind){
for(i=1;i<=5;i++){
	 document.getElementById("tab_"+i).className=""; 
}
  document.getElementById("tab_"+ind).className="current"; 
}
function ChangGongYue(ind){

for(i=1;i<=3;i++){
	  $("#gongyue"+i).hide();  
}
   $("#gongyue"+ind).show();  
}

</script>
</body>
</html>