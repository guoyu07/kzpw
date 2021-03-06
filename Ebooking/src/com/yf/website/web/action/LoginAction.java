package com.yf.website.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import sun.net.www.http.Hurryable;

import com.yf.system.base.aircompany.Aircompany;
import com.yf.system.base.buying.Buying;
import com.yf.system.base.charterorder.Charterorder;
import com.yf.system.base.cityairport.Cityairport;
import com.yf.system.base.customercredit.Customercredit;
import com.yf.system.base.customerpassenger.Customerpassenger;
import com.yf.system.base.customeruser.Customeruser;
import com.yf.system.base.fairport.Fairport;
import com.yf.system.base.fairway.Fairway;
import com.yf.system.base.fcity.Fcity;
import com.yf.system.base.fflight.Fflight;
import com.yf.system.base.guest.Guest;
import com.yf.system.base.hotelorder.Hotelorder;
import com.yf.system.base.huodonguser.Huodonguser;
import com.yf.system.base.orderinfo.Orderinfo;
import com.yf.system.base.passenger.Passenger;
import com.yf.system.base.segmentinfo.Segmentinfo;
import com.yf.system.base.spotcity.Spotcity;
import com.yf.system.base.spotlineorder.Spotlineorder;
import com.yf.system.base.spotlineuser.Spotlineuser;
import com.yf.system.base.spotmes.Spotmes;
import com.yf.system.base.spotorder.Spotorder;
import com.yf.system.base.spotticket.Spotticket;
import com.yf.system.base.train.Train;
import com.yf.system.base.trainpassenger.Trainpassenger;
import com.yf.system.base.useraddress.Useraddress;
import com.yf.system.base.util.PageInfo;
import com.yf.system.base.util.Util;
import com.yf.system.base.ymsend.Ymsend;
import com.yf.website.web.server.Server;
import com.opensymphony.webwork.ServletActionContext;
import com.opensymphony.xwork.ActionContext;

public class LoginAction extends B2b2cbackAction {
	private Customeruser customeruser = new Customeruser();
	private Huodonguser huodonguser = new Huodonguser();
	private Customerpassenger customerpassenger = new Customerpassenger();// 机票常用旅客
	private List<Customercredit> ListCustomercredit;// 机票证件list
	private List<Customerpassenger> ListCustomerpassenger;// 常用旅客LIST
	//酒店订单list
	private List<Hotelorder>ListHotelOrder;
	//酒店订单对象
	private Hotelorder hotelorder = new Hotelorder();
	
	//酒店订单 入住人List
	
	private  List<Guest>ListGuest; 
	//酒店订单ID
	private Long HotelOrderID;
	//航空公司
	
	private List<Aircompany> listAircompany;
	
    //包机订单list
	private List<Charterorder>ListCharterorder;
	//   常用配送地址
	private Useraddress useraddress = new Useraddress();
	private long AddressID;
	
	//门票订单list
	private List<Spotorder>ListSpotTicketOrder;
	private Spotorder spotorder;//门票订单对象
	private Spotmes spotmes;//景点对象
	private Spotticket spotticket;//门票对象
	
	
	//线路订单list
	private List<Spotlineorder>ListSpotLineOrder;
	private Spotlineorder spotlineorder;//线路订单对象
	private List<Spotlineuser>ListSpotLineUser;//线路订单游客
	
	//包机订单
	
	private Charterorder charterorder = new Charterorder();
	
	// 机票订单列表
	private List<Orderinfo> ListOrderinfo;
	private List<Segmentinfo> ListSegmentinfo;
	private List<Passenger> ListPassenger;
	// 机票订单ID
	private long OrderinfoId;
	private Orderinfo orderinfo = new Orderinfo();
	private Segmentinfo segmentinfo = new Segmentinfo();
	private Passenger passenger = new Passenger();

	// 判断是否是国内机票还是国际机票
	private int istype;// 0=国内 1=国际

	// 批量操作ID数组
	private int[] selectid;
	// 批量操作选项
	private int opt;
//常用配送地址list
	private List<Useraddress> listUseraddress;
	// 验证码
	private String validateImg;
	// 跳转用
	private String forword;
	// 修改密码用
	private String oldpassword;// 旧密码
	private String newpassword;// 新密码
	private String Vnewpassword;// 再次输入的
	// 完善信息用字段
	private String sheng;// 省
	private String shi;// 市
	private String address;// 具体地址
	private String areacode;// 区号
	private String telephone;// 座机号
	private String c_birthday;// 生日
	private String c_postalcode;// 邮政编码
	private String c_membername;// 姓名
	private String c_membersex;// 性别
	
	private String c_memberemail;//电子邮件
	// 机票常用旅客用字段
	private String c_passname;// 姓名
	private String c_passtype;// 乘机人类型
	private String c_mobile;// 乘机人电话
	private String c_staus;// 乘机人状态
	private String s_idtype;// 乘机人证件类型
	private String s_idnumber;// 乘机人证件号码
	private String s_staus;// 证件状态
	// 机票常用旅客检索字段
	private String c_name;// 姓名
	private String c_number;// 证件号码
	private String c_idtype;// 证件类型
	private String s_passtype;// 证件类型
	private String s_mobile;// 手机号码
	private String c_stste="-1";// 状态
	// 机票订单状态字段
	private int complete;// 已经完成的
	private int Cancel;// 已经取消的
	private int ToBePaid;// 待支付
	// 机票订单检索用字段
	private String ordercode;// 订单编号
	private String aircode="-1";// 航空公司
	private String c_scityname;// 出发城市
	private String c_endcityname;// 到达城市
	private String c_endtime;// 到达时间
	private String c_stime;// 起飞时间 和 证件有效期
	private long passengerid;
	
	
	//线路订单ID
	private long SoptLineOrderID;
	//门票订单ID
	private long SoptOrderID;
	
	//包机订单检索用字段
	private String s_fnumber;//航班号
	//
	private long CharterOrderID;//包机订单ID
	//包机订单状态字段
	private long Unaudited;//待审核
	private long WaitPrice;//等待报价
	private long AlreadyPrice;//已报价
	private long notpassed;//审核不通过
	
	//添加常用乘机人
	
	private String s_sex;//性别
	
	private Customercredit sfz= new Customercredit();//身份证
	private Customercredit hz= new Customercredit();//护照
	private Customercredit gatxz= new Customercredit();//港澳通行证
	private Customercredit twtxz= new Customercredit();//台湾通行证
	private Customercredit tbz= new Customercredit();//台胞证
	private Customercredit hxz= new Customercredit();//回乡证
	private Customercredit qt= new Customercredit();//其他
	
	//找回密码用字段
	private String ajax_username;//用户名
	private String ajax_img;//验证码
	
	//手机号快速登录
	private String login_mobile;//手机号
	
	//酒店订单检索用字段
	//城市ID
	private int CityID;
	//酒店名称
	private String HotelName; 
	//预订时间
	private String startDate;
	
	//入住人
	private String GuestName;
	//联系人电话
	private String LinkMobeil;
	//订单号
	private String OrderNO;
	
	//以下为活动注册用
	
	private String loginname_hd;
	private String loginpwd_hd;
	private String mobile_hd;
	private String mail_hd;
	private String name_hd;
	private String idtype_hd;
	private String idnumber_hd;
	
	
	public String DeletePassenger() throws Exception {

		Server.getInstance().getMemberService().deleteCustomerpassenger(
				passengerid);
		String sql = " delete FROM " + Customercredit.TABLE + " where "
				+ Customercredit.COL_refid + " =" + passengerid;
		int si = Server.getInstance().getMemberService()
				.excuteCustomercreditBySql(sql);
		System.out.println("delete了" + si + "行");
		return "DeletePassenger";
	}
	
	public String AddPassenger() throws Exception {
System.out.println("s_idtype=="+s_idtype);
System.out.println("c_stime=="+c_stime);		
System.out.println("s_idnumber=="+s_idnumber);		
		
		customeruser = (Customeruser) ActionContext.getContext().getSession()
				.get("loginuser");
		if (customeruser == null) {
			return this.toLogin();
		}
		Customerpassenger customerpassenger = new Customerpassenger();
		if (passengerid > 0) {
			System.out.println("editpass");

			customerpassenger = Server.getInstance().getMemberService()
					.findCustomerpassenger(passengerid);

		} else {

			System.out.println("addpass");
		}

		customerpassenger.setMobile(c_mobile);
		customerpassenger.setCustomeruserid(getLoginUser().getId());
		customerpassenger.setUsername(c_passname);
		customerpassenger.setType(Integer.parseInt(c_passtype));
		customerpassenger.setSex(s_sex);
		customerpassenger.setCreatetime(new Timestamp(System
				.currentTimeMillis()));
	//	customerpassenger.setState(Integer.parseInt(c_staus));
		if (passengerid > 0) {
			Server.getInstance().getMemberService()
					.updateCustomerpassengerIgnoreNull(customerpassenger);
		} else {

			customerpassenger = Server.getInstance().getMemberService()
					.createCustomerpassenger(customerpassenger);
		}

		String[] intypes = s_idtype.trim().split(",");
		String[] innumbers = s_idnumber.trim().split(",");
		//String[] innstaus = s_staus.split(",");
		String[] intimes = c_stime.trim().split(",");
		String sql = "  delete from " + Customercredit.TABLE + " where "
				+ Customercredit.COL_refid + " =" + customerpassenger.getId();
		Server.getInstance().getMemberService().excuteCustomercreditBySql(sql);

		for (int i = 0; i < intypes.length; i++) {

			if (intypes[i] != null && !intypes[i].toString().equals(" ")&&!intypes[i].equals("")&&intypes[i].length()>0
				&& innumbers[i] != null&& !innumbers[i].toString().equals(" ")&&!innumbers[i].equals("")&&innumbers[i].length()>0
				&& intimes[i] != null&& !intimes[i].toString().equals(" ")&&!intimes[i].equals("")&&intimes[i].length()>0
			) {
				Customercredit customercredit = new Customercredit();
				customercredit.setCreatetime(new Timestamp(System
						.currentTimeMillis()));
				customercredit.setCreateuser(getLoginUser().getLoginname());
				customercredit.setRefid(customerpassenger.getId());
				customercredit.setType(0);
				//customercredit.setStaus(Integer.parseInt(innstaus[i]));
				customercredit.setPassportvalidity(intimes[i].trim());
				customercredit.setCredittypeid(Integer.parseInt(intypes[i].trim()));
				customercredit.setCreditnumber(innumbers[i].trim());
				Server.getInstance().getMemberService().createCustomercredit(
						customercredit);
				
				System.out.println("customercredit=="+customercredit);
			}
			
		/*	String stime="2011-11-29 10:38:46";
			stime=stime.trim();
			stime=stime.replace("-", "");
			stime=stime.replace(":", "");*/
		}

		this.addActionMessage("操作成功!!");
		this.addFieldError("validate", "成功完善常用乘机人信息!");
		
		return "toOk";

		//return "AddPassenger";
	}

	public String EditUser() throws Exception {
		customeruser = (Customeruser) ActionContext.getContext().getSession()
				.get("loginuser");
		if (customeruser == null) {
			return this.toLogin();
		}
		customeruser = getLoginUser();
		System.out.println("完善会员信息!!!");
		/*if(sheng!=null&&sheng.length()>0&&shi!=null&&shi.length()>0&&address!=null&&address.length()>0){
		
		String chinaaddress = sheng + "@" + shi + "@" + address;
		
		
		customeruser.setChinaaddress(chinaaddress);// 地址
		}*/
		if(areacode!=null&&areacode.length()>0&&telephone!=null&&telephone.length()>0){
			String linkother = areacode + "@" + telephone;
			customeruser.setWorkphone(linkother);
			
		}
	
		
		customeruser.setBirthday(dateToTimestamp(c_birthday));
		customeruser.setPostalcode(c_postalcode);
		customeruser.setMembersex(c_membersex);
		customeruser.setMembername(c_membername);
		if(c_memberemail!=null&&c_memberemail.length()>0){
		customeruser.setMemberemail(c_memberemail);
		}
		Server.getInstance().getMemberService().updateCustomeruserIgnoreNull(
				customeruser);
		this.addActionMessage("操作成功!!");
		this.addFieldError("validate", "成功完善个人信息!");
		//return "EditUser";
		return "toOk";
	}

	public String toRegsit() throws Exception {

		System.out.println("来到了注册页面!!!");

		return "toRegsit";

	}
	public String toRegsit_HD() throws Exception {

		System.out.println("来到了活动注册页面!!!");

		return "toRegsit_HD";

	}

	public String Regsit() throws Exception {
		
		String vali = (String) ServletActionContext.getContext().getSession()
		.get("validate");
System.out.println(vali);
System.out.println(validateImg);


if (!validateImg.toLowerCase().equals(vali)) {
	// 验证否
	this.addActionMessage("验证码错误,请重新登录!");
	this.addFieldError("validate", "验证码错误!");
	return this.toRegsit();
}


		System.out.println("注册!!!");
		ActionContext.getContext().getSession().remove("loginuser");
		customeruser.setLoginname(customeruser.getLoginname());
		customeruser.setLogpassword(Util.MD5(customeruser.getLogpassword()));
		if (customeruser.getMemberemail() != null
				&& customeruser.getMemberemail().length() > 0) {
			customeruser.setMemberemail(customeruser.getMemberemail());
		}
		customeruser.setMembername(customeruser.getMembername());
		customeruser.setMembersex(customeruser.getMembersex());
		customeruser.setMobile(customeruser.getMobile());
		customeruser.setMembertype(1);
		customeruser.setState(1);

		customeruser.setIsweb(1);
		customeruser.setAgentid(getagentId());
		customeruser.setCreatetime(new Timestamp(System.currentTimeMillis()));
		customeruser = Server.getInstance().getMemberService()
				.createCustomeruser(customeruser);
		String cNO = customeruser.getId() + "";
	
	//	customeruser.setCardnumber(cNOid);
		Server.getInstance().getMemberService().updateCustomeruserIgnoreNull(
				customeruser);
		ActionContext.getContext().getSession().put("loginuser", customeruser);

		return "Regsit";

		
	}
public String Regsit_hd() throws Exception {
		
		/*String vali = (String) ServletActionContext.getContext().getSession()
		.get("validate");



if (!validateImg.toLowerCase().equals(vali)) {
	// 验证否
	this.addActionMessage("验证码错误,请重新登录!");
	this.addFieldError("validate", "验证码错误!");
	return this.toRegsit();
}


		System.out.println("活动注册!!!");
		
		huodonguser.setLoginname(loginname_hd);
		huodonguser.setLoginpwd(Util.MD5(loginpwd_hd));
		huodonguser.setMail(mail_hd);
		huodonguser.setName(name_hd);
		huodonguser.setCreatetime(new Timestamp(System.currentTimeMillis()));
		huodonguser.setState(1l);
		huodonguser.setMobile(mobile_hd);
		huodonguser.setIdtype(Long.parseLong(idtype_hd));
		huodonguser.setIdnumber(idnumber_hd);
		Server.getInstance().getMemberService().createHuodonguser(huodonguser);*/
	
	String vali = (String) ServletActionContext.getContext().getSession()
	.get("validate");
		System.out.println(vali);
		System.out.println(validateImg);
		
		
		if (!validateImg.toLowerCase().equals(vali)) {
		// 验证否
		this.addActionMessage("验证码错误,请重新登录!");
		this.addFieldError("validate", "验证码错误!");
		return this.toRegsit_HD();
		}


	System.out.println("注册!!!");
	ActionContext.getContext().getSession().remove("loginuser");
	customeruser.setLoginname(customeruser.getLoginname());
	customeruser.setLogpassword(Util.MD5(customeruser.getLogpassword()));
	if (customeruser.getMemberemail() != null
			&& customeruser.getMemberemail().length() > 0) {
		customeruser.setMemberemail(customeruser.getMemberemail());
	}
	customeruser.setMembername(customeruser.getMembername());
	customeruser.setMembersex(customeruser.getMembersex());
	customeruser.setMobile(customeruser.getMobile());
	customeruser.setMembertype(1);
	customeruser.setState(1);

	customeruser.setIsweb(1);
	customeruser.setAgentid(getagentId());
	customeruser.setCreatetime(new Timestamp(System.currentTimeMillis()));
	customeruser = Server.getInstance().getMemberService()
			.createCustomeruser(customeruser);
	String cNO = customeruser.getId() + "";

//	customeruser.setCardnumber(cNOid);
	Server.getInstance().getMemberService().updateCustomeruserIgnoreNull(
			customeruser);
	ActionContext.getContext().getSession().put("loginuser", customeruser);
		
		forword="login!ToRegsitOK.jspx";
		
		
		return "forward";

	}

public String ToRegsitOK() throws Exception {

	

	return "ToRegsitOK";

}

	public String toLogin() throws Exception {

		System.out.println("来到了登陆页面!!!");

		return "toLogin";

	}

	public String loginout() throws Exception {

		System.out.println("来到了注销方法");
		//ActionContext.getContext().getSession().remove("loginuser");
		//ActionContext.getContext().getSession().remove("orderUrl");
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.invalidate();
		return "loginout";

	}
	//根据包机订单ID查询航空公司二字码
	public String GetCharterOderAirCompanyCodeByid(long id) throws Exception{
		String where=" where 1=1 and "+Segmentinfo.COL_orderid+" ="+id+" and "+Segmentinfo.COL_language+" =5";
		List<Segmentinfo> list=Server.getInstance().getAirService().findAllSegmentinfo(where, " ORDER BY ID DESC ", -1, 0);
		if(list.size()>0){
			return 	list.get(0).getAircomapnycode();
			
			
		}
		return "";
	}
	//根据航空公司code查询航空公司简称
	public String GetCharterOderAirCompanyNameByCode(String code) throws Exception{
		
		String where=" where 1=1 and "+Aircompany.COL_aircomcode+" ='"+code+"'";
		List<Aircompany>list=Server.getInstance().getAirService().findAllAircompany(where, " ORDER BY ID DESC ", -1, 0);
		if(list.size()>0){
			return list.get(0).getAircomjname();
		}
		return "";
	}
	//根据包机订单ID查询出发时间
	
	public String GetCharterOderStatTimeByid(long orderid) throws Exception{
		String where=" where 1=1 and "+Segmentinfo.COL_orderid+" ="+orderid+" and "+Segmentinfo.COL_language+" =5";
		List<Segmentinfo> list=Server.getInstance().getAirService().findAllSegmentinfo(where, " ORDER BY ID DESC ", -1, 0);
		if(list.size()>0){
			return 	list.get(0).getDeparttime().toString();
			
			
		}
		
		
		return "";
	}
//根据包机订单ID查询航班号
	public String GetCharterOrderFnumberByid(long orderid) throws Exception{
		String where=" where 1=1 and "+Segmentinfo.COL_orderid+" ="+orderid+" and "+Segmentinfo.COL_language+" =5";
		List<Segmentinfo> list=Server.getInstance().getAirService().findAllSegmentinfo(where, " ORDER BY ID DESC ", -1, 0);
		if(list.size()>0){
			return 	list.get(0).getFlightnumber();
			
			
		}
		
		
		return "";
	}
	
	
	
	public String Login() throws Exception {

		HttpServletRequest request = ServletActionContext.getRequest();
		StringBuffer ur = request.getRequestURL();
		System.out.println("URL===" + ur);
		ActionContext.getContext().getSession().remove("loginuser");

		String vali = (String) ServletActionContext.getContext().getSession()
				.get("validate");
		System.out.println(vali);
		System.out.println(validateImg);
		System.out.println(customeruser.getLoginname() + "------"
				+ customeruser.getLogpassword());

		if (!validateImg.toLowerCase().equals(vali)) {
			// 验证否
			this.addActionMessage("验证码错误,请重新登录!");
			this.addFieldError("validate", "验证码错误!");
			return "toLogin";
		}
		List<Customeruser> list = null;
		if (customeruser.getLoginname() != null
				&& ((customeruser.getLoginname().indexOf(' ') < 0) && (customeruser
						.getLoginname().indexOf('|') < 0))) {
			list = Server.getInstance().getMemberService().findAllCustomeruser(
					" where " + Customeruser.COL_membertype + " =1 and ("
							+ Customeruser.COL_loginname + " = '"
							+ customeruser.getLoginname() + "' OR "
							+ Customeruser.COL_mobile + " ='"
							+ customeruser.getLoginname() + "')", "", 1, 0);
			
			System.out.println(list);
			if (list.isEmpty()) {
				this.addActionMessage("用户名错误,请重新登录!");
				this.addFieldError("username", "用户名错误!");
				return "toLogin";
			}

		} else {
			this.addActionMessage("用户名错误,请重新登录!");
			this.addFieldError("username", "用户名错误!");
			return "toLogin";
		}

		if (customeruser.getLogpassword() != null) {
			if (!Util.MD5(customeruser.getLogpassword()).equals(
					list.get(0).getLogpassword())) {

				this.addActionMessage("密码错误,请重新登录!");
				this.addFieldError("password", "密码错误!");

				return "toLogin";

			}

		} else {
			this.addActionMessage("密码错误,请重新登录!");
			this.addFieldError("password", "密码错误!");
			return "toLogin";
		}
		ActionContext.getContext().getSession().put("loginuser", list.get(0));
		customeruser = getLogin();
		
		
		forword =(String)ActionContext.getContext().getSession().get("pageUrl");
		if (forword != null && !"".equals(forword)) {
			HttpServletResponse response = ServletActionContext.getResponse();
			ActionContext.getContext().getSession().remove("pageUrl");
			response.sendRedirect(forword);
			return "";
		}
		
		
		return "Login";
	}

	public String toMyCenter() throws Exception {
		System.out.println("来到了个人中心!!!");
		customeruser = (Customeruser) ActionContext.getContext().getSession()
				.get("loginuser");
		if (customeruser == null) {

			return "toLogin";
		}
		if (customeruser.getChinaaddress() != null
				&& customeruser.getChinaaddress().length() > 3
				&& customeruser.getChinaaddress().indexOf("@") != -1) {

			sheng = customeruser.getChinaaddress().split("@")[0];
			shi = customeruser.getChinaaddress().split("@")[1];
			if (customeruser.getChinaaddress().split("@").length > 2) {
				address = customeruser.getChinaaddress().split("@")[2];
			}
		}
		if (customeruser.getWorkphone() != null
				&& customeruser.getWorkphone().length() > 0
				&& customeruser.getWorkphone().indexOf("@") != -1) {

			areacode = customeruser.getWorkphone().split("@")[0];
			telephone = customeruser.getWorkphone().split("@")[1];
		}

		System.out.println("customeruser==" + customeruser);
		return "toMyCenter";

	}

	public String toPassenger() throws Exception {
		customeruser = (Customeruser) ActionContext.getContext().getSession()
				.get("loginuser");
		if (customeruser == null) {

			return "toLogin";
		}

		System.out.println("来到了乘机人列表!!!");
		// ListCustomerpassenger
		String where = "where 1=1 and " + Customerpassenger.COL_customeruserid
				+ " =" + getLoginUser().getId();

		if (c_name != null && c_name.trim().length() != 0) {

			where += " and ( " + Customerpassenger.COL_username + " like '%"
					+ c_name.trim() + "%' or "+Customerpassenger.COL_mobile+" like '%"+c_name.trim()+"%')";
		}
		if (s_passtype != null && s_passtype.trim().length() != 0
				&& !s_passtype.equals("0")) {

			where += " and " + Customerpassenger.COL_type + " =" + s_passtype;
		}
		if (s_mobile != null && s_mobile.trim().length() != 0) {

			where += " and " + Customerpassenger.COL_mobile + " like '%"
					+ s_mobile.trim() + "%'";
		}
		if (c_stste != null && c_stste.trim().length() != 0
				&& !c_stste.equals("-1")) {

			where += " and " + Customerpassenger.COL_state + " =" + c_stste;
		}
		if (c_number != null && c_number.trim().length() != 0) {

			where += " and " + Customerpassenger.COL_id + " in ( SELECT "
					+ Customercredit.COL_refid + " FROM "
					+ Customercredit.TABLE + " where "
					+ Customercredit.COL_creditnumber + " like '%"
					+ c_number.trim() + "%')";
		}
		if (c_idtype != null && c_idtype.trim().length() != 0) {

			where += " and " + Customerpassenger.COL_id + " in ( SELECT "
					+ Customercredit.COL_refid + " FROM "
					+ Customercredit.TABLE + " where "
					+ Customercredit.COL_credittypeid + " =" + c_idtype.trim()
					+ ")";
		}
		System.out.println("where=" + where);
		List list = Server.getInstance().getMemberService()
				.findAllCustomerpassengerForPageinfo(where,
						" ORDER BY ID DESC", pageinfo);
		pageinfo = (PageInfo) list.remove(0);
		ListCustomerpassenger = list;
		if (pageinfo.getTotalrow() > 0 && ListCustomerpassenger.size() == 0) {
			pageinfo.setPagenum(1);
			list = Server.getInstance().getMemberService()
					.findAllCustomerpassengerForPageinfo(where,
							" ORDER BY ID DESC", pageinfo);
			pageinfo = (PageInfo) list.remove(0);
			ListCustomerpassenger = list;
		}
		System.out.println("ListCustomerpassenger==" + ListCustomerpassenger);

		return "toPassenger";

	}
	public String toCharterOrderInfo() throws Exception{
		charterorder=Server.getInstance().getAirService().findCharterorder(CharterOrderID);
		if(charterorder==null || charterorder.getMemberid()!=getLoginUser().getId()){
			
			return this.tocharterlist();
			
		}
		String whereSegInfo="  where 1=1 and "+Segmentinfo.COL_orderid+" ='"+charterorder.getId()+"' and "+Segmentinfo.COL_language+" =5";
		ListSegmentinfo =Server.getInstance().getAirService().findAllSegmentinfo(whereSegInfo, " order by id ", -1, 0);
		String wherepass=" where 1=1 and "+Passenger.COL_orderid+" ='"+charterorder.getId()+"' and "+Passenger.COL_language+" =5";
		ListPassenger =Server.getInstance().getAirService().findAllPassenger(wherepass, " ORDER BY ID ", -1, 0);
		
		
		return "toCharterOrderInfo";
	}
	public String toSpotTicketOrder() throws Exception {
		customeruser = (Customeruser) ActionContext.getContext().getSession()
				.get("loginuser");
		if (customeruser == null) {

			return "toLogin";
		}
		System.out.println("来到了旅游门票订单列表!!!");
		// String where = " where 1=1 and " + Orderinfo.COL_customeruserid
		// + " =62 and " + Orderinfo.COL_internal + "=0";
		String where = " where 1=1  and " +Spotorder.COL_memberid+" ="+getLoginUser().getId();

		if (OrderNO != null && OrderNO.length() > 0) {

			where += " and " + Spotorder.COL_param1 + " like '%"
					+ OrderNO + "%'";
		}
		if (CityID  > 0) {
			where += " and " + Spotorder.COL_cityid + " ="
					+ CityID;
		}
		
		if (startDate != null && startDate.length() > 0) {
			where += " and " + Spotorder.COL_stime + " like '%"
			+ startDate + "%'";
		}
		if (GuestName != null && GuestName.length() > 0) {
			where += " and " + Spotorder.COL_param2 + " like '%"
			+ GuestName + "%'";
		}
		if (LinkMobeil != null && LinkMobeil.length() > 0) {
			where += " and " + Spotorder.COL_tel + " like '%"
			+ LinkMobeil + "%'";
		}
		if(HotelName!=null&&HotelName.length()>0){
			
			where += " and " + Spotorder.COL_name + " like '%"
			+ HotelName + "%'";
		}
		
		System.out.println("where==" + where);
		
		List list = Server.getInstance().getTripService()
				.findAllSpotorderForPageinfo(where, " ORDER BY ID DESC",
						pageinfo);
		pageinfo = (PageInfo) list.remove(0);
		ListSpotTicketOrder = list;
		if (pageinfo.getTotalrow() > 0 && ListSpotTicketOrder.size() == 0) {
			pageinfo.setPagenum(1);
			list = Server.getInstance().getTripService()
					.findAllSpotorderForPageinfo(where, " ORDER BY ID DESC",
							pageinfo);
			pageinfo = (PageInfo) list.remove(0);
			ListSpotTicketOrder = list;
		}

		System.out.println("ListSpotTicketOrder==" + ListSpotTicketOrder.size());
		
		return "toSpotTicketOrder";

	}
	
	public String toSpotLineOrder() throws Exception {
		customeruser = (Customeruser) ActionContext.getContext().getSession()
				.get("loginuser");
		if (customeruser == null) {

			return "toLogin";
		}
		System.out.println("来到了旅游线路订单列表!!!");
		// String where = " where 1=1 and " + Orderinfo.COL_customeruserid
		// + " =62 and " + Orderinfo.COL_internal + "=0";
		String where = " where 1=1  and " +Spotlineorder.COL_memberid+" ="+getLoginUser().getId()+" AND "+Spotlineorder.COL_param1+" ='spot'";

		if (OrderNO != null && OrderNO.length() > 0) {

			where += " and " + Spotlineorder.COL_orderno + " like '%"
					+ OrderNO + "%'";
		}
		if (CityID  > 0) {
			where += " and ( " + Spotlineorder.COL_cityid + " ="
					+ CityID + " OR "+Spotlineorder.COL_provineid + " ="
					+ CityID+")";
		}
		
		if (startDate != null && startDate.length() > 0) {
			where += " and " + Spotlineorder.COL_stime + " like '%"
			+ startDate + "%'";
		}
		if (GuestName != null && GuestName.length() > 0) {
			where += " and " + Spotlineorder.COL_linkname + " like '%"
			+ GuestName + "%'";
		}
		if (LinkMobeil != null && LinkMobeil.length() > 0) {
			where += " and " + Spotlineorder.COL_linktel + " like '%"
			+ LinkMobeil + "%'";
		}
		if(HotelName!=null&&HotelName.length()>0){
			
			where += " and " + Spotlineorder.COL_name + " like '%"
			+ HotelName + "%'";
		}
		
		System.out.println("where==" + where);
		
		List list = Server.getInstance().getTripService()
				.findAllSpotlineorderForPageinfo(where, " ORDER BY ID DESC",
						pageinfo);
		pageinfo = (PageInfo) list.remove(0);
		ListSpotLineOrder = list;
		if (pageinfo.getTotalrow() > 0 && ListSpotLineOrder.size() == 0) {
			pageinfo.setPagenum(1);
			list = Server.getInstance().getTripService()
					.findAllSpotlineorderForPageinfo(where, " ORDER BY ID DESC",
							pageinfo);
			pageinfo = (PageInfo) list.remove(0);
			ListSpotLineOrder = list;
		}

		System.out.println("ListSpotLineOrder==" + ListSpotLineOrder.size());
		
		return "toSpotLineOrder";

	}
	public String GetBuystimebyid(long id){
		String ret="";
		Buying buying=Server.getInstance().getTripService().findBuying(id);
		if(buying!=null&&buying.getStime()!=null&&buying.getEndtime()!=null){
			ret=buying.getStime()+"至"+buying.getEndtime();
		}
		
		return ret;
	}
	public String tobuyingOrder() throws Exception {
		customeruser = (Customeruser) ActionContext.getContext().getSession()
				.get("loginuser");
		if (customeruser == null) {

			return "toLogin";
		}
		System.out.println("来到了团购订单列表!!!");
		// String where = " where 1=1 and " + Orderinfo.COL_customeruserid
		// + " =62 and " + Orderinfo.COL_internal + "=0";
		String where = " where 1=1  and " +Spotlineorder.COL_memberid+" ="+getLoginUser().getId()+" AND "+Spotlineorder.COL_param1+" ='buying'";

		if (OrderNO != null && OrderNO.length() > 0) {

			where += " and " + Spotlineorder.COL_orderno + " like '%"
					+ OrderNO + "%'";
		}
		if (CityID  > 0) {
			where += " and ( " + Spotlineorder.COL_cityid + " ="
					+ CityID + " OR "+Spotlineorder.COL_provineid + " ="
					+ CityID+")";
		}
		
		if (startDate != null && startDate.length() > 0) {
			where += " and " + Spotlineorder.COL_createtime + " like '%"
			+ startDate + "%'";
		}
		if (GuestName != null && GuestName.length() > 0) {
			where += " and " + Spotlineorder.COL_linkname + " like '%"
			+ GuestName + "%'";
		}
		if (LinkMobeil != null && LinkMobeil.length() > 0) {
			where += " and " + Spotlineorder.COL_linktel + " like '%"
			+ LinkMobeil + "%'";
		}
		if(HotelName!=null&&HotelName.length()>0){
			
			where += " and " + Spotlineorder.COL_name + " like '%"
			+ HotelName + "%'";
		}
		
		System.out.println("where==" + where);
		
		List list = Server.getInstance().getTripService()
				.findAllSpotlineorderForPageinfo(where, " ORDER BY ID DESC",
						pageinfo);
		pageinfo = (PageInfo) list.remove(0);
		ListSpotLineOrder = list;
		if (pageinfo.getTotalrow() > 0 && ListSpotLineOrder.size() == 0) {
			pageinfo.setPagenum(1);
			list = Server.getInstance().getTripService()
					.findAllSpotlineorderForPageinfo(where, " ORDER BY ID DESC",
							pageinfo);
			pageinfo = (PageInfo) list.remove(0);
			ListSpotLineOrder = list;
		}

		System.out.println("ListSpotLineOrder==" + ListSpotLineOrder.size());
		
		return "tobuyingOrder";

	}
	//线路订单详细信息
	public String toSpotLineOrderInfo() throws Exception {
		
		spotlineorder=Server.getInstance().getTripService().findSpotlineorder(SoptLineOrderID);
		ListSpotLineUser =Server.getInstance().getTripService().findAllSpotlineuser(" WHERE 1=1 AND "+Spotlineuser.COL_orderid+" ="+SoptLineOrderID, " ORDER BY ID ", -1, 0);
		return "toSpotLineOrderInfo";
	}
	//门票订单详细信息
	public String toSpotOrderInfo() throws Exception {
		spotorder=Server.getInstance().getTripService().findSpotorder(SoptOrderID);
		spotticket=Server.getInstance().getTripService().findSpotticket(Long.parseLong(spotorder.getSpotticketid()));
		spotmes=Server.getInstance().getTripService().findSpotmes(Long.parseLong(spotticket.getSid()));
		
		
		return "toSpotOrderInfo";
	}
	
	public String toTicktOrder() throws Exception {
		customeruser = (Customeruser) ActionContext.getContext().getSession()
				.get("loginuser");
		if (customeruser == null) {

			return "toLogin";
		}
		System.out.println("来到了国内机票列表!!!");
		// String where = " where 1=1 and " + Orderinfo.COL_customeruserid
		// + " =62 and " + Orderinfo.COL_internal + "=0";
		String where = " where 1=1  and " + Orderinfo.COL_internal
				+ " is not null AND "+Orderinfo.COL_internal+" =0 and  "+Orderinfo.COL_customeruserid+" ="+getLoginUser().getId();

		if (ordercode != null && ordercode.length() > 0) {

			where += " and " + Orderinfo.COL_ordernumber + " like '%"
					+ ordercode + "%'";
		}
		if (c_scityname != null && c_scityname.length() > 0) {

			where += " and " + Orderinfo.COL_id
					+ " in ( SELECT C_ORDERID from T_SEGMENTINFO where "
					+ Segmentinfo.COL_startairport+" ='"
					+ c_scityname + "')";
		}
		if (c_endcityname != null && c_endcityname.length() > 0) {

			where += " and " + Orderinfo.COL_id
					+ " in ( SELECT C_ORDERID from T_SEGMENTINFO where "
					+ Segmentinfo.COL_endairport+" ='"
					+ c_endcityname
					+ "')";
		}
		if (c_endtime != null && c_endtime.length() > 0) {
			where += " and " + Orderinfo.COL_id
					+ " in ( SELECT C_ORDERID FROM T_SEGMENTINFO WHERE "
					+ Segmentinfo.COL_arrivaltime + " >'" + c_endtime + "')";
		}
		if (c_stime != null && c_stime.length() > 0) {
			where += " and " + Orderinfo.COL_id
					+ " in ( SELECT C_ORDERID FROM T_SEGMENTINFO WHERE "
					+ Segmentinfo.COL_departtime + " >'" + c_stime + "')";
		}
		if (aircode != null&&!aircode.equals("-1") && aircode.length() > 0) {
			where += " and " + Orderinfo.COL_id
					+ " in (SELECT C_ORDERID FROM T_SEGMENTINFO WHERE "
					
					+ Segmentinfo.COL_aircomapnycode + " like '%" + aircode + "%')";
		}
		System.out.println("where==" + where);
		// String where=" where 1=1 and "+Orderinfo.COL_customeruserid+"
		// ="+getLoginUser().getId();
		// ListOrderinfo
		// =Server.getInstance().getAirService().findAllOrderinfo(where, "ORDER
		// BY ID DESC ", -1, 0);
		List list = Server.getInstance().getAirService()
				.findAllOrderinfoForPageinfo(where, " ORDER BY ID DESC",
						pageinfo);
		pageinfo = (PageInfo) list.remove(0);
		ListOrderinfo = list;
		if (pageinfo.getTotalrow() > 0 && ListOrderinfo.size() == 0) {
			pageinfo.setPagenum(1);
			list = Server.getInstance().getAirService()
					.findAllOrderinfoForPageinfo(where, " ORDER BY ID DESC",
							pageinfo);
			pageinfo = (PageInfo) list.remove(0);
			ListOrderinfo = list;
		}

		System.out.println("ListOrderinfo==" + ListOrderinfo.size());
		int quxiao = 0;
		int wancheng = 0;
		int daizhifu = 0;

		for (int a = 0; a < ListOrderinfo.size(); a++) {

			if (ListOrderinfo.get(a).getOrderstatus() == 6) {

				quxiao++;
			}
			if (ListOrderinfo.get(a).getOrderstatus() == 10) {

				wancheng++;
			}
			if (ListOrderinfo.get(a).getPaystatus() == 0) {

				daizhifu++;
			}

		}
		Cancel = quxiao;
		ToBePaid = daizhifu;
		complete = wancheng;

		istype = 0;
		listAircompany=Server.getInstance().getTicketSearchService().getAircompanyCache();
		return "toTicktOrder";

	}
	private List<Train> trainlist = new ArrayList<Train>();
	private String startcreatetime;
	private String endcreatetime;
	private int s_orderstatus=-2;
	
	private String s_name;
	private String s_code;
	private String s_ordercode;
	private int s_qupiaotype=-1;
	public String toTrainOrder() throws Exception {
		customeruser = (Customeruser) ActionContext.getContext().getSession()
				.get("loginuser");
		if (customeruser == null) {

			return "toLogin";
		}
		System.out.println("来到了火车票订单列表!!!");
		
		StringBuilder where = new StringBuilder(" WHERE 1=1 ");
		
		
			where.append(" AND C_CREATEUID="+getLoginUser().getId());
		
		
		if (isNotNullOrEpt(s_code)) {
			where.append(" AND C_TRAINCODE LIKE '%" + s_code
					+ "%'");
		}
		if (isNotNullOrEpt(s_ordercode)) {
			where.append(" AND C_ORDERNUMBER LIKE '%" + s_ordercode
					+ "%'");
		}
		if (isNotNullOrEpt(s_name)) {
			where.append(" AND "+Train.COL_id+" IN ( SELECT "+Trainpassenger.COL_orderid+" FROM "+Trainpassenger.TABLE+" where "+Trainpassenger.COL_name+" like '%"+s_name+"%' )" );
		}
		
		if (s_orderstatus > -2) {
			where.append(" AND C_ORDERSTATUS=" + s_orderstatus);
		}
		String createtime = this.getCheckTime(this.startcreatetime,
				this.endcreatetime, "C_CREATETIME");
		if (isNotNullOrEpt(createtime)) {
			where.append(" AND  (" + createtime + ")");
		}
		
		if(s_qupiaotype>-1){
			
			where.append(" AND "+Train.COL_qptype+" =" + s_qupiaotype);
			
		}
		
		
		
		
		System.out.println("where:"+where);
		
		List list = Server.getInstance().getTrainService().findAllTrainForPageinfo(where.toString(),
				" ORDER BY ID DESC ", pageinfo);
		pageinfo = (PageInfo) list.remove(0);
		this.trainlist = list;
		
		return "toTrainOrder";

	}

	public String toTicktOrderInfo() throws Exception {
		System.out.println("来到了国内机票订单详细信息页面!!!");
		customeruser = (Customeruser) ActionContext.getContext().getSession()
				.get("loginuser");
		if (customeruser == null) {

			return "toLogin";
		}
		
		orderinfo = Server.getInstance().getAirService().findOrderinfo(
				OrderinfoId);
		// 验证当前订单是否是当前登陆者
		
		 if(orderinfo==null||orderinfo.getCustomeruserid()!=getLoginUser().getId()){
		  
		  return "ToTicktOrder"; 
		  
		 }
		 
		String wherepass = " where 1=1 and " + Passenger.COL_orderid + " ="
				+ OrderinfoId;
		ListPassenger = Server.getInstance().getAirService().findAllPassenger(
				wherepass, " ORDER BY ID DESC ", -1, 0);
		if (ListPassenger.size() > 0) {
			passenger = ListPassenger.get(0);
		}
		String whereseg = " where 1=1 and " + Segmentinfo.COL_orderid + " ="
				+ OrderinfoId;
		ListSegmentinfo = Server.getInstance().getAirService()
				.findAllSegmentinfo(whereseg, " ORDER BY ID ASC ", -1, 0);
		if (ListSegmentinfo.size() > 0) {
			segmentinfo = ListSegmentinfo.get(0);

		}
		istype = Integer.parseInt(orderinfo.getInternal() + "");

		return "toTicktOrderInfo";

	}

	public String toInterTicktOrder() throws Exception {
		customeruser = (Customeruser) ActionContext.getContext().getSession()
				.get("loginuser");
		if (customeruser == null) {

			return "toLogin";
		}
		System.out.println("来到了国际机票列表!!!");
		String where = " where 1=1 and " + Orderinfo.COL_customeruserid
				+ " ="+getLoginUser().getId()+" and " + Orderinfo.COL_internal + "=1";
		if (ordercode != null && ordercode.length() > 0) {
			where += " and " + Orderinfo.COL_ordernumber + " like '%"
					+ ordercode + "%'";
		}
		if (c_scityname != null && c_scityname.length() > 0) {

			/*where += " and " + Orderinfo.COL_id
					+ " in (SELECT C_ORDERID from T_SEGMENTINFO WHERE "
					+ Segmentinfo.COL_startairport
					+ " in (SELECT C_CITYCODE FROM T_FCITY WHERE "
					+ Fcity.COL_cityname + " like '%" + c_scityname + "%'"
					+ " or " + Fcity.COL_citynameen + " like '%" + c_scityname
					+ "%'))";*/
			where+=" and "+Orderinfo.COL_id+" in ( SELECT C_ORDERID from T_SEGMENTINFO WHERE "+Segmentinfo.COL_startairport+" ='"+c_scityname+"')";
			
			
		}
		if (c_endcityname != null && c_endcityname.length() > 0) { 
			/*where += " and " + Orderinfo.COL_id
					+ " in (select C_ORDERID FROM T_SEGMENTINFO WHERE "
					+ Segmentinfo.COL_endairport
					+ " in (select C_CITYCODE FROM T_FCITY WHERE "
					+ Fcity.COL_cityname + " like '%" + c_endcityname
					+ "%' or " + Fcity.COL_citynameen + " like '%"
					+ c_endcityname + "%'))";*/
			where+=" and "+Orderinfo.COL_id+" in ( SELECT C_ORDERID from T_SEGMENTINFO WHERE "+Segmentinfo.COL_endairport+" ='"+c_endcityname+"')";
			
		}
		if (c_stime != null && c_stime.length() > 0) {
			where += " and " + Orderinfo.COL_id
					+ " in (SELECT C_ORDERID FROM T_FFLIGHT WHERE "
					+ Fflight.COL_fromdate + " >'" + c_stime + "')";
		}
		if (c_endtime != null && c_endtime.length() > 0) {
			where += " and " + Orderinfo.COL_id
					+ " in (SELECT C_ORDERID FROM T_FFLIGHT WHERE "
					+ Fflight.COL_todate + " >'" + c_endtime + "')";
		}
		if (aircode != null &&!aircode.equals("-1") && aircode.length() > 0) {
			where += " and " + Orderinfo.COL_id
					+ " in (select C_ORDERID FROM T_SEGMENTINFO WHERE "
					+ Segmentinfo.COL_aircomapnycode
					+ " in (select C_AIRLINERCODE from T_FAIRWAY where "
					+ Fairway.COL_airlinername + " like '%" + aircode + "%'))";
		}
		System.out.println(where);
		
		List list = Server.getInstance().getAirService()
				.findAllOrderinfoForPageinfo(where, " ORDER BY ID DESC",
						pageinfo);
		pageinfo = (PageInfo) list.remove(0);
		ListOrderinfo = list;
		if (pageinfo.getTotalrow() > 0 && ListOrderinfo.size() == 0) {
			pageinfo.setPagenum(1);
			list = Server.getInstance().getAirService()
					.findAllOrderinfoForPageinfo(where, " ORDER BY ID DESC",
							pageinfo);
			pageinfo = (PageInfo) list.remove(0);
			ListOrderinfo = list;
		}

		System.out.println("ListOrderinfo==" + ListOrderinfo.size());
		int quxiao = 0;
		int wancheng = 0;
		int daizhifu = 0;

		for (int a = 0; a < ListOrderinfo.size(); a++) {

			if (ListOrderinfo.get(a).getOrderstatus() == 6) {

				quxiao++;
			}
			if (ListOrderinfo.get(a).getOrderstatus() == 10) {

				wancheng++;
			}
			if (ListOrderinfo.get(a).getPaystatus() == 0) {

				daizhifu++;
			}

		}
		Cancel = quxiao;
		ToBePaid = daizhifu;
		complete = wancheng;

		istype = 1;
		//listAircompany=Server.getInstance().getTicketSearchService().getAircompanyCache();
		//2011-12-16 高亮 修改国际航空公司 
		listAircompany=Server.getInstance().getAirService().findAllAircompany("", "ORDER BY ID", -1, 0);
		return "toTicktOrder";

	}

	public String toChangePassword() throws Exception {

		System.out.println("来到了修改密码页面!!!");

		return "toChangePassword";

	}

	public String ChangePasswoed() throws Exception {
		customeruser = getLoginUser();

		if (customeruser == null) {

			return this.toLogin();
		}

		

		if (newpassword != null && Vnewpassword != null&&oldpassword!=null&&oldpassword.length()>0
				&& newpassword.equals(Vnewpassword)) {

			if (customeruser.getLogpassword().equals(Util.MD5(oldpassword))) {

				customeruser.setLogpassword(Util.MD5(newpassword));
				customeruser.setModifytime(new Timestamp(System
						.currentTimeMillis()));
				Server.getInstance().getMemberService()
						.updateCustomeruserIgnoreNull(customeruser);
				
				System.out.println("修改密码!!!新密码是==" + newpassword);
				this.addActionMessage("操作成功!!");
				this.addFieldError("validate", "密码修改成功!请妥善保管好您的密码,以防丢失给您带来麻烦!");
				return "toOk";

			} else {

				this.addActionMessage("密码错误!请从新输入!");
				this.addFieldError("validate", "密码错误!");
				return "toChangePassword";
			}

		}

		this.addActionMessage("密码错误!请从新输入!");
		this.addFieldError("validate", "密码错误!");

		return "toChangePassword";

	}

	public String toAddPassenger() throws Exception {
		customeruser = (Customeruser) ActionContext.getContext().getSession()
				.get("loginuser");
		if (customeruser == null) {

			return "toLogin";
		}
		System.out.println("来到了添加常用登机人页面!!!");

		return "toAddPassenger";

	}

	public String toEditPassenger() throws Exception {
		customeruser = (Customeruser) ActionContext.getContext().getSession()
				.get("loginuser");
		if (customeruser == null) {

			return "toLogin";
		}
		System.out.println("来到了修改常用登机人页面!!!");

		customerpassenger = Server.getInstance().getMemberService()
				.findCustomerpassenger(passengerid);
		if (customerpassenger == null) {

			return "AddPassenger";
		}
		if (customerpassenger.getCustomeruserid() != getLoginUser().getId()) {

			return "AddPassenger";
		}
		String where = " where 1=1 and " + Customercredit.COL_refid + " ="
				+ customerpassenger.getId();
		ListCustomercredit = Server.getInstance().getMemberService()
				.findAllCustomercredit(where, " ORDER BY ID ", -1, 0);

		System.out.println("customerpassenger==" + customerpassenger);
		System.out.println("ListCustomercredit==" + ListCustomercredit);
		
		for(int a=0;a<ListCustomercredit.size();a++){
			if(ListCustomercredit.get(a).getCredittypeid()==1){
				sfz=ListCustomercredit.get(a);
			}
			if(ListCustomercredit.get(a).getCredittypeid()==3){
				hz=ListCustomercredit.get(a);
			}
			if(ListCustomercredit.get(a).getCredittypeid()==4){
				gatxz=ListCustomercredit.get(a);
			}
			if(ListCustomercredit.get(a).getCredittypeid()==5){
				twtxz=ListCustomercredit.get(a);
			}
			if(ListCustomercredit.get(a).getCredittypeid()==6){
				tbz=ListCustomercredit.get(a);
			}
			if(ListCustomercredit.get(a).getCredittypeid()==7){
				hxz=ListCustomercredit.get(a);
			}
			if(ListCustomercredit.get(a).getCredittypeid()==9){
				qt=ListCustomercredit.get(a);
			}
			
			
		}
		
		
		return "toAddPassenger";

	}

	public String GetCustomerCreditNumber(long id) {

		List<Customercredit> list = Server.getInstance().getMemberService()
				.findAllCustomercredit(
						" WHERE 1=1 AND " + Customercredit.COL_refid + " ="
								+ id, "ORDER BY ID DESC ", -1, 0);
		if (list.size() > 0) {

			return list.get(0).getCreditnumber();
		}

		return "";
	}

	public String GetCustomerCredittype(long id) {

		List<Customercredit> list = Server.getInstance().getMemberService()
				.findAllCustomercredit(
						" WHERE 1=1 AND " + Customercredit.COL_refid + " ="
								+ id, "ORDER BY ID DESC ", -1, 0);
		if (list.size() > 0) {
			int typeid = list.get(0).getCredittypeid();

			return GetTypeNameByTypeId(typeid + "");
		}

		return "";
	}
	//包机订单列表
	public String tocharterlist()throws Exception{
		
		if(getLoginUser()==null){
			
			return this.toLogin();
		}
		
		String where=" where 1=1 and "+Charterorder.COL_memberid+" ="+getLoginUser().getId();
		if (c_endtime != null && c_endtime.length() > 0) {
			where += " and " + Charterorder.COL_id
					+ " in ( SELECT C_ORDERID FROM T_SEGMENTINFO WHERE "
					+ Segmentinfo.COL_arrivaltime + " >'" + c_endtime + "' and "+Segmentinfo.COL_language+" =5)";
		}
		if (c_stime != null && c_stime.length() > 0) {
			where += " and " + Charterorder.COL_id
					+ " in ( SELECT C_ORDERID FROM T_SEGMENTINFO WHERE "
					+ Segmentinfo.COL_departtime + " >'" + c_stime + "' and "+Segmentinfo.COL_language+" =5)";
		}
		if (ordercode != null && ordercode.length() > 0) {

			where += " and " + Charterorder.COL_mobile + " like '%"
					+ ordercode + "%'";
		}
		if (c_scityname != null && c_scityname.length() > 0) {

			where += " and " + Charterorder.COL_id
					+ " in ( SELECT C_ORDERID from T_SEGMENTINFO where "
					+ Segmentinfo.COL_startairport
					+ " in ( SELECT C_AIRPORTCODE from T_CITYAIRPORT where "
					
					+ Cityairport.COL_airportcode + " ='" + c_scityname
					+ "'" +" and "+Segmentinfo.COL_language+" =5))";
		}
		if (c_endcityname != null && c_endcityname.length() > 0) {

			where += " and " + Charterorder.COL_id
					+ " in ( SELECT C_ORDERID from T_SEGMENTINFO where "
					+ Segmentinfo.COL_endairport
					+ " in ( SELECT C_AIRPORTCODE from T_CITYAIRPORT where  "
					+ Cityairport.COL_airportcode + " ='"
					+ c_endcityname + "' and "+Segmentinfo.COL_language+" =5))";
		}
		if (s_fnumber != null && s_fnumber.length() > 0) {

			where += " and " + Charterorder.COL_id
			+ " in ( SELECT C_ORDERID from T_SEGMENTINFO where "+Segmentinfo.COL_flightnumber+" like '%"+s_fnumber+"%' and "+Segmentinfo.COL_language+" =5)";
		}
		if (aircode != null && aircode.length() > 0&&!aircode.equals("-1")) {

			where += " and " + Charterorder.COL_id
			+ " in ( SELECT C_ORDERID from T_SEGMENTINFO where "+Segmentinfo.COL_aircomapnycode+" ='"+aircode+"' and "+Segmentinfo.COL_language+" =5)";
		}
		
		
		if(c_stste!=null&&c_stste.trim().length()>0&&!c_stste.equals("-1")){
			
			
			where+=" and "+Charterorder.COL_state+" ='"+c_stste+"'";
			
		}
		System.out.println("where="+where);
		
		List list = Server.getInstance().getAirService()
		.findAllCharterorderForPageinfo(where, " ORDER BY ID DESC",
				pageinfo);
		pageinfo = (PageInfo) list.remove(0);
		ListCharterorder = list;
		if (pageinfo.getTotalrow() > 0 && ListCharterorder.size() == 0) {
			pageinfo.setPagenum(1);
			list = Server.getInstance().getAirService()
					.findAllCharterorderForPageinfo(where, " ORDER BY ID DESC",
							pageinfo);
			pageinfo = (PageInfo) list.remove(0);
			ListCharterorder = list;
		}

		
		//private long Unaudited;//待审核
		//private long WaitPrice;//等待报价
		//private long AlreadyPrice;//已报价
		//private long notpassed;//审核不通过
		int Unaud=0;
		int wprice=0;
		int aprtice=0;
		int notpad=0;
		
		/*if(ListCharterorder.size()>0){
			for(int a=0;a<ListCharterorder.size();a++){
				if(ListCharterorder.get(a).getState()==1){
					Unaud++;
				}
				if(ListCharterorder.get(a).getState()==2){
					wprice++;
				}
				if(ListCharterorder.get(a).getState()==4){
					aprtice++;
				}
				if(ListCharterorder.get(a).getState()==3){
					notpad++;
				}
				
			}
		}*/
		Unaudited=Unaud;
		WaitPrice=wprice;
		AlreadyPrice=aprtice;
		notpassed=notpad;
		
		
		listAircompany=Server.getInstance().getTicketSearchService().getAircompanyCache();
		
		
		return "tocharterlist";
	}
	
	public String CancelCharterOrder() throws Exception{
		if(getLoginUser()==null){
			
			return this.toLogin();
			
		}
		Charterorder charterorder = Server.getInstance().getAirService().findCharterorder(CharterOrderID);
		if(charterorder.getMemberid()!=getLoginUser().getId()){
			
			return this.tocharterlist();
		}
		
		charterorder.setState(11l);
		Server.getInstance().getAirService().updateCharterorderIgnoreNull(charterorder);
		
		return this.tocharterlist();
	}
	
	public String checkairorder() throws Exception {// 改变国内机票的状态

		Orderinfo orderinfo2 = Server.getInstance().getAirService()
				.findOrderinfo(OrderinfoId);

		orderinfo2.setOrderstatus(orderinfo.getOrderstatus());
		Server.getInstance().getAirService().updateOrderinfoIgnoreNull(
				orderinfo2);

		return this.toTicktOrder();
	}
	public String checkcharterorder() throws Exception {// 改变团队/包机订单状态

	/*	Orderinfo orderinfo2 = Server.getInstance().getAirService()
				.findOrderinfo(OrderinfoId);*/
		Charterorder charterorder =Server.getInstance().getAirService().findCharterorder(OrderinfoId);
		charterorder.setState(Long.parseLong(c_stste));
		Server.getInstance().getAirService().updateCharterorderIgnoreNull(charterorder);

		return this.tocharterlist();
	}
	
	public void topay() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String orderid = request.getParameter("id");
		/*String url = "http://" + request.getServerName() + ":"
				+ request.getServerPort()
				+ "/cn_interface/Alipay?helpername=Airpayhelper&orderid="
				+ orderid;*/
		String url="../ticket_inter/Jinripay?orderid="+orderid;
		HttpServletResponse response=ServletActionContext.getResponse();
		try {
			response.sendRedirect(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	//跳转到常用配送地址页面
	public String toAddAddress()throws Exception{
		
		
		return "toAddAddress";
	}
	//跳转到常用配送地址页面--修改
	public String toEditAddress()throws Exception{
		
		
		return "toAddAddress";
	}
	//跳转到找回密码页面
	
	public String toForget() throws Exception{
		
		
		return "toForget";
	}
	//手机号快速登录
	public String LoginByMobile() throws Exception{
	String where=" where 1=1 and "+Customeruser.COL_membertype+" =1 and "+Customeruser.COL_mobile+" ='"+login_mobile+"'";
	List<Customeruser>list=Server.getInstance().getMemberService().findAllCustomeruser(where, "", -1, 0);
	if(list.size()>0){
		System.out.println("该手机号已经注册.请使用账号登录,如果忘记密码请使用找回密码功能!");
		this.addActionMessage("该手机号已经注册.请使用账号登录,如果忘记密码请使用找回密码功能!");
		this.addFieldError("validatemobile", "该手机号已经注册.请使用账号登录,如果忘记密码请使用找回密码功能!");
		
		return "toQuickLogin";
	}
		System.out.println("该手机号未被注册,可以注册");
		ActionContext.getContext().getSession().remove("loginuser");
		
		customeruser.setLoginname(login_mobile);
		int ran = (int) (Math.random() * 99999 + 1);
		String run = ran + "";
		customeruser.setLogpassword(Util.MD5(run));
		
		customeruser.setMobile(login_mobile);
		customeruser.setMembermobile("");
		customeruser.setMembertype(1);
		customeruser.setState(1);
		customeruser.setIsweb(1);
		customeruser.setAgentid(getagentId());
		customeruser
				.setCreatetime(new Timestamp(System.currentTimeMillis()));
		customeruser = Server.getInstance().getMemberService()
				.createCustomeruser(customeruser);
		ActionContext.getContext().getSession().put("loginuser",customeruser);
		
		String smstemple = "";
		smstemple = this.getSMSTemple("RegisterMobile");
		smstemple = smstemple.replaceAll("@CustomerName@",customeruser.getMobile());
		smstemple = smstemple.replaceAll("@Gender@", "先生/女士");
		smstemple = smstemple.replaceAll("@LoginPwd@", run);
		
		//this.smsSend(new String[] { "" + customeruser.getMobile() + "" }, smstemple, "");
		
		
		Ymsend ymsend=new Ymsend();
		ymsend.setContent(smstemple);
		ymsend.setCreatetime(new Timestamp(System.currentTimeMillis()));
		ymsend.setOrdercode("");
		ymsend.setPhone(customeruser.getMobile());
		ymsend.setType(2);
		ymsend.setState(0l);
		Server.getInstance().getMemberService().createYmsend(ymsend);
		System.out.println("smstemple=="+smstemple);
		
		
		//跳转
		forword =(String)ActionContext.getContext().getSession().get("pageUrl");
		
		System.out.println("forword:"+forword);
		if (forword != null && !"".equals(forword)) {
			HttpServletResponse response = ServletActionContext.getResponse();
			ActionContext.getContext().getSession().remove("pageUrl");
			response.sendRedirect(forword);
			return "";
		}

		return "toQuickLogin";
	}
	private String col_name;
	private String col_province;
	private String col_city;
	private String col_area;
	private String col_address;
	private String col_areacode;
	
	
	private String col_tel;
	private String col_mobile;
	private String col_mail;
	private String col_postalcode;
	public String AddAddress() throws Exception{
		
		Useraddress useraddress = new Useraddress();
		if(AddressID>0){
			useraddress=Server.getInstance().getMemberService().findUseraddress(AddressID);
			}
			useraddress.setName(col_name);
			useraddress.setProvince(col_province);
			useraddress.setCity(col_city);
			useraddress.setArea(col_area);
			useraddress.setAddress(col_address);
			useraddress.setAreacode(col_areacode);
			useraddress.setTel(col_tel);
			useraddress.setMobile(col_mobile);
			useraddress.setMail(col_mail);
			useraddress.setPostalcode(col_postalcode);
			useraddress.setMemberid(getLoginUser().getId());
			if(AddressID>0){
				Server.getInstance().getMemberService

	().updateUseraddressIgnoreNull(useraddress);
				
			}else{
				useraddress = Server.getInstance

	().getMemberService()
				.createUseraddress(useraddress);
			}
			
			
			return this.toAddress();
	}
	//修改
	public String toEdituseraddress() throws Exception{
		useraddress=Server.getInstance().getMemberService().findUseraddress(AddressID);
		if(useraddress.getMemberid()!=getLoginUser().getId()){
			return toAddress();
		}
		return "toAddAddress";
	}

	// 常用配送地址列表
		public String toAddress() throws Exception {
			String where = " where 1=1 and "+Useraddress.COL_memberid+" ="+getLoginUser().getId();
			listUseraddress=Server.getInstance().getMemberService().findAllUseraddress(where, " order by id", -1, 0);
		
			return "toAddress";
		}

		public String deleteUseraddress()throws Exception{
				int num=Server.getInstance().getMemberService

		().deleteUseraddress(AddressID);
				return this.toAddress();
			}
		
	public void AjaxValadateUsername() throws Exception{
		System.out.println("username=="+ajax_username);
		System.out.println("img=="+ajax_img);
		String sb="";
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String vali = (String) ServletActionContext.getContext().getSession().get("validate");
		System.out.println("vali="+vali);
		System.out.println("ajax_img="+ajax_img);


		if (!ajax_img.toLowerCase().equals(vali)) {
			sb="-1";
			System.out.println("验证码错误");
		}else{
			String where =" where 1=1 and "+Customeruser.COL_loginname+" ='"+ajax_username+"' and "+Customeruser.COL_membertype+" =1 AND "+Customeruser.COL_mobile+" IS NOT NULL ";
			List<Customeruser>list =Server.getInstance().getMemberService().findAllCustomeruser(where, "", -1, 0);
			
			if(list.size()>0){
				
				sb="0";
				System.out.println("验证成功.登录号="+list.get(0).getLoginname()+",手机号=="+list.get(0).getMobile());
			}else{
				
				sb="1";
				System.out.println("用户名不存在");
			}
			
		}
		out.print(sb.toString());
		out.flush();
		out.close();
	}
	public void AjaxSend() throws Exception{
		System.out.println("username=="+ajax_username);
		
		String sb="";
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/plain; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String vali = (String) ServletActionContext.getContext().getSession().get("validate");
		System.out.println("vali="+vali);
		System.out.println("ajax_img="+ajax_img);
			String where =" where 1=1 and "+Customeruser.COL_loginname+" ='"+ajax_username+"' and "+Customeruser.COL_membertype+" =1 AND "+Customeruser.COL_mobile+" IS NOT NULL ";
			List<Customeruser>list =Server.getInstance().getMemberService().findAllCustomeruser(where, "", -1, 0);
			
			if(list.size()>0){
				
				sb="0";
				System.out.println("验证成功.登录号="+list.get(0).getLoginname()+",手机号=="+list.get(0).getMobile());
			Customeruser customeruser=list.get(0);
			
			// 随机数字
			int ran = (int) (Math.random() * 9999999 + 1);
			String run = ran+"";
			customeruser.setLogpassword(Util.MD5(run));
			Server.getInstance().getMemberService()
			.updateCustomeruserIgnoreNull(customeruser);
			
			//发送短信开始
				String name="";
				if(customeruser.getMembername()!=null&&customeruser.getMembername().length()>0){
					name=customeruser.getMembername();
					
				}else{
					
					name=customeruser.getLoginname();
				}
			
				String smstemple = "";
				smstemple = this.getSMSTemple("SelectLoginName");
				smstemple = smstemple.replaceAll("@CustomerName@",name);
				smstemple = smstemple.replaceAll("@LoginPwd@", run);
				smstemple = smstemple.replaceAll("@LogUserName@", customeruser.getLoginname());
				this.smsSend(new String[] { "" + customeruser.getMobile() + "" }, smstemple, "");
				
				
				Ymsend ymsend=new Ymsend();
				ymsend.setContent(smstemple);
				ymsend.setCreatetime(new Timestamp(System.currentTimeMillis()));
				ymsend.setOrdercode("");
				ymsend.setPhone(customeruser.getMobile());
				ymsend.setType(2);
				ymsend.setState(0l);
				Server.getInstance().getMemberService().createYmsend(ymsend);
				System.out.println("smstemple=="+smstemple);
				
		   //发送短信结束
			
			}else{
				
				sb="1";
				System.out.println("用户名不存在");
			}
			
		
		out.print(sb.toString());
		out.flush();
		out.close();
	}
	//酒店订单列表
	public String toHotelOrder() throws Exception{
		if(getLoginUser()==null){
			
			return this.toLogin();
			
		}
		
		if(startDate!=null&&startDate.length()>0){
			
			
		}else{
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			startDate = sdf.format(calendar.getTime());
		}
		
		StringBuffer where = new StringBuffer();
			where.append(" where 1=1 and "+Hotelorder.COL_memberid+" ="+getLoginUser().getId()+" and "+Hotelorder.COL_state+" !=-1 and "+Hotelorder.COL_property+" =1");
			pageinfo.setPagerow(10);
			List list = Server.getInstance().getHotelService()
					.findAllHotelorderForPageinfo(where.toString(), " ORDER BY ID DESC",
							pageinfo);
			
			System.out.println(where);
			pageinfo = (PageInfo) list.remove(0);
			ListHotelOrder = list;
			if (pageinfo.getTotalrow() > 0 && ListHotelOrder.size() == 0) {
				pageinfo.setPagenum(1);
				list = Server.getInstance().getHotelService()
						.findAllHotelorderForPageinfo(where.toString(), " ORDER BY ID DESC",
								pageinfo);
				pageinfo = (PageInfo) list.remove(0);
				ListHotelOrder = list;
			}
		
		return "toHotelOrder";
	}
	//酒店订单详细信息
	
	public String toHotelOrderInfo() throws Exception{
		if(getLoginUser()==null){
			
			return this.toLogin();
			
		}
		hotelorder =Server.getInstance().getHotelService().findHotelorder(HotelOrderID);
		if(hotelorder==null||hotelorder.getMemberid()!=getLoginUser().getId()){
			
			return this.toLogin();
			
		}
		ListGuest=Server.getInstance().getHotelService().findAllGuest(" WHERE 1=1 AND "+Guest.COL_orderid+" ="+hotelorder.getId(), " ORDER BY ID DESC ", -1, 0);
		
		System.out.println("ListGuest=="+ListGuest);
		
		
		return "toHotelOrderInfo";
	}
	
	public String GetHotelAddreesByHotelID(long id) throws Exception{
		
		
		return Server.getInstance().getHotelService().findHotel(id).getAddress();
	}
	
	public  void Send()throws Exception{
	
	}
	public String DeleteAddress() throws Exception {

		Server.getInstance().getMemberService().deleteUseraddress(
				AddressID);
		
		return this.toAddress();
	}
	//包机订单状态
	public String GetCharterOrderStaus(String type) {
		
		if (type.equals("1")) {

			return "新订单待审核";
		}
		if (type.equals("2")) {

			return "已审核,待报价";
		}
		if (type.equals("3")) {

			return "审核不通过";
		}
		if (type.equals("4")) {

			return "已报价";
		}
		if (type.equals("5")) {

			return "报价不接受";
		}
		if (type.equals("6")) {

			return "报价接受,待支付";
		}
		if (type.equals("7")) {

			return "支付成功";
		}
		if (type.equals("8")) {

			return "支付不成功";
		}
		if (type.equals("9")) {

			return "支付成功,未乘机";
		}
		if (type.equals("10")) {

			return "交易结束";
		}
		if (type.equals("11")) {

			return "已取消";
		}
		return "";
	}
//证件类型
	public String GetTypeNameByTypeId(String type) {

		if (type.equals("1")) {

			return "身份证";
		}
		if (type.equals("3")) {

			return "护照";
		}
		if (type.equals("4")) {

			return "港澳通行证";
		}
		if (type.equals("5")) {

			return "台湾通行证";
		}
		if (type.equals("6")) {

			return "台胞证";
		}
		if (type.equals("7")) {

			return "回乡证";
		}

		return "";
	}

	/**
	 * 批量操作
	 * 
	 * @return
	 * @throws Exception
	 */
	public String batch() throws Exception {
		if (selectid != null && selectid.length > 0) {

			switch (opt) {
			case 1: // delete

				for (int i : selectid) {
					Server.getInstance().getMemberService()
							.deleteCustomerpassenger(i);
					String sql = " delete FROM " + Customercredit.TABLE
							+ " where " + Customercredit.COL_refid + " =" + i;
					int si = Server.getInstance().getMemberService()
							.excuteCustomercreditBySql(sql);
					System.out.println("delete了" + si + "行");

				}

				break;
			default:
				break;

			}
		}
		return "batch";
	}
	/**
	 * 批量操作--删除地址
	 * 
	 * @return
	 * @throws Exception
	 */
	public String DeleteAddressbatch() throws Exception {
		if (selectid != null && selectid.length > 0) {

			switch (opt) {
			case 1: // delete

				for (int i : selectid) {
					Server.getInstance().getMemberService()
							.deleteUseraddress(i);
				

				}

				break;
			default:
				break;

			}
		}
		return this.toAddress();
	}

	public Customeruser getCustomeruser() {
		return customeruser;
	}

	public void setCustomeruser(Customeruser customeruser) {
		this.customeruser = customeruser;
	}

	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return customeruser;
	}

	public String getValidateImg() {
		return validateImg;
	}

	public void setValidateImg(String validateImg) {
		this.validateImg = validateImg;
	}

	public String getForword() {
		return forword;
	}

	public void setForword(String forword) {
		this.forword = forword;
	}

	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public String getNewpassword() {
		return newpassword;
	}

	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}

	public String getVnewpassword() {
		return Vnewpassword;
	}

	public void setVnewpassword(String vnewpassword) {
		Vnewpassword = vnewpassword;
	}

	public String getSheng() {
		return sheng;
	}

	public void setSheng(String sheng) {
		this.sheng = sheng;
	}

	public String getShi() {
		return shi;
	}

	public void setShi(String shi) {
		this.shi = shi;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAreacode() {
		return areacode;
	}

	public void setAreacode(String areacode) {
		this.areacode = areacode;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getC_birthday() {
		return c_birthday;
	}

	public void setC_birthday(String c_birthday) {
		this.c_birthday = c_birthday;
	}

	public String getC_postalcode() {
		return c_postalcode;
	}

	public void setC_postalcode(String c_postalcode) {
		this.c_postalcode = c_postalcode;
	}

	public String getC_membername() {
		return c_membername;
	}

	public void setC_membername(String c_membername) {
		this.c_membername = c_membername;
	}

	public String getC_membersex() {
		return c_membersex;
	}

	public void setC_membersex(String c_membersex) {
		this.c_membersex = c_membersex;
	}

	public Customerpassenger getCustomerpassenger() {
		return customerpassenger;
	}

	public void setCustomerpassenger(Customerpassenger customerpassenger) {
		this.customerpassenger = customerpassenger;
	}

	public List<Customercredit> getListCustomercredit() {
		return ListCustomercredit;
	}

	public void setListCustomercredit(List<Customercredit> listCustomercredit) {
		ListCustomercredit = listCustomercredit;
	}

	public List<Customerpassenger> getListCustomerpassenger() {
		return ListCustomerpassenger;
	}

	public void setListCustomerpassenger(
			List<Customerpassenger> listCustomerpassenger) {
		ListCustomerpassenger = listCustomerpassenger;
	}

	public String getC_passname() {
		return c_passname;
	}

	public void setC_passname(String c_passname) {
		this.c_passname = c_passname;
	}

	public String getC_passtype() {
		return c_passtype;
	}

	public void setC_passtype(String c_passtype) {
		this.c_passtype = c_passtype;
	}

	public String getC_mobile() {
		return c_mobile;
	}

	public void setC_mobile(String c_mobile) {
		this.c_mobile = c_mobile;
	}

	public String getC_staus() {
		return c_staus;
	}

	public void setC_staus(String c_staus) {
		this.c_staus = c_staus;
	}

	public String getS_idtype() {
		return s_idtype;
	}

	public void setS_idtype(String s_idtype) {
		this.s_idtype = s_idtype;
	}

	public String getS_idnumber() {
		return s_idnumber;
	}

	public void setS_idnumber(String s_idnumber) {
		this.s_idnumber = s_idnumber;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_number() {
		return c_number;
	}

	public void setC_number(String c_number) {
		this.c_number = c_number;
	}

	public String getC_idtype() {
		return c_idtype;
	}

	public void setC_idtype(String c_idtype) {
		this.c_idtype = c_idtype;
	}

	public long getPassengerid() {
		return passengerid;
	}

	public void setPassengerid(long passengerid) {
		this.passengerid = passengerid;
	}

	public String getS_staus() {
		return s_staus;
	}

	public void setS_staus(String s_staus) {
		this.s_staus = s_staus;
	}

	public String getS_passtype() {
		return s_passtype;
	}

	public void setS_passtype(String s_passtype) {
		this.s_passtype = s_passtype;
	}

	public int[] getSelectid() {
		return selectid;
	}

	public void setSelectid(int[] selectid) {
		this.selectid = selectid;
	}

	public int getOpt() {
		return opt;
	}

	public void setOpt(int opt) {
		this.opt = opt;
	}

	public String getS_mobile() {
		return s_mobile;
	}

	public void setS_mobile(String s_mobile) {
		this.s_mobile = s_mobile;
	}

	public String getC_stste() {
		return c_stste;
	}

	public void setC_stste(String c_stste) {
		this.c_stste = c_stste;
	}

	public List<Orderinfo> getListOrderinfo() {
		return ListOrderinfo;
	}

	public void setListOrderinfo(List<Orderinfo> listOrderinfo) {
		ListOrderinfo = listOrderinfo;
	}

	public List<Segmentinfo> getListSegmentinfo() {
		return ListSegmentinfo;
	}

	public void setListSegmentinfo(List<Segmentinfo> listSegmentinfo) {
		ListSegmentinfo = listSegmentinfo;
	}

	public List<Passenger> getListPassenger() {
		return ListPassenger;
	}

	public void setListPassenger(List<Passenger> listPassenger) {
		ListPassenger = listPassenger;
	}

	public int getComplete() {
		return complete;
	}

	public void setComplete(int complete) {
		this.complete = complete;
	}

	public int getCancel() {
		return Cancel;
	}

	public void setCancel(int cancel) {
		Cancel = cancel;
	}

	public int getToBePaid() {
		return ToBePaid;
	}

	public void setToBePaid(int toBePaid) {
		ToBePaid = toBePaid;
	}

	public long getOrderinfoId() {
		return OrderinfoId;
	}

	public void setOrderinfoId(long orderinfoId) {
		OrderinfoId = orderinfoId;
	}

	public Orderinfo getOrderinfo() {
		return orderinfo;
	}

	public void setOrderinfo(Orderinfo orderinfo) {
		this.orderinfo = orderinfo;
	}

	public Segmentinfo getSegmentinfo() {
		return segmentinfo;
	}

	public void setSegmentinfo(Segmentinfo segmentinfo) {
		this.segmentinfo = segmentinfo;
	}

	public Passenger getPassenger() {
		return passenger;
	}

	public void setPassenger(Passenger passenger) {
		this.passenger = passenger;
	}

	public int getIstype() {
		return istype;
	}

	public void setIstype(int istype) {
		this.istype = istype;
	}

	public String getOrdercode() {
		return ordercode;
	}

	public void setOrdercode(String ordercode) {
		this.ordercode = ordercode;
	}

	public String getAircode() {
		return aircode;
	}

	public void setAircode(String aircode) {
		this.aircode = aircode;
	}

	public String getC_scityname() {
		return c_scityname;
	}

	public void setC_scityname(String c_scityname) {
		this.c_scityname = c_scityname;
	}

	public String getC_endcityname() {
		return c_endcityname;
	}

	public void setC_endcityname(String c_endcityname) {
		this.c_endcityname = c_endcityname;
	}

	public String getC_endtime() {
		return c_endtime;
	}

	public void setC_endtime(String c_endtime) {
		this.c_endtime = c_endtime;
	}

	public String getC_stime() {
		return c_stime;
	}

	public void setC_stime(String c_stime) {
		this.c_stime = c_stime;
	}

	public List<Charterorder> getListCharterorder() {
		return ListCharterorder;
	}

	public void setListCharterorder(List<Charterorder> listCharterorder) {
		ListCharterorder = listCharterorder;
	}

	public List<Aircompany> getListAircompany() {
		return listAircompany;
	}

	public void setListAircompany(List<Aircompany> listAircompany) {
		this.listAircompany = listAircompany;
	}

	public String getS_fnumber() {
		return s_fnumber;
	}

	public void setS_fnumber(String s_fnumber) {
		this.s_fnumber = s_fnumber;
	}

	public long getCharterOrderID() {
		return CharterOrderID;
	}

	public void setCharterOrderID(long charterOrderID) {
		CharterOrderID = charterOrderID;
	}

	public long getUnaudited() {
		return Unaudited;
	}

	public void setUnaudited(long unaudited) {
		Unaudited = unaudited;
	}

	public long getWaitPrice() {
		return WaitPrice;
	}

	public void setWaitPrice(long waitPrice) {
		WaitPrice = waitPrice;
	}

	public long getAlreadyPrice() {
		return AlreadyPrice;
	}

	public void setAlreadyPrice(long alreadyPrice) {
		AlreadyPrice = alreadyPrice;
	}

	public long getNotpassed() {
		return notpassed;
	}

	public void setNotpassed(long notpassed) {
		this.notpassed = notpassed;
	}

	public Charterorder getCharterorder() {
		return charterorder;
	}

	public void setCharterorder(Charterorder charterorder) {
		this.charterorder = charterorder;
	}

	public String getS_sex() {
		return s_sex;
	}

	public void setS_sex(String s_sex) {
		this.s_sex = s_sex;
	}

	public Customercredit getSfz() {
		return sfz;
	}

	public void setSfz(Customercredit sfz) {
		this.sfz = sfz;
	}

	public Customercredit getHz() {
		return hz;
	}

	public void setHz(Customercredit hz) {
		this.hz = hz;
	}

	public Customercredit getGatxz() {
		return gatxz;
	}

	public void setGatxz(Customercredit gatxz) {
		this.gatxz = gatxz;
	}

	public Customercredit getTwtxz() {
		return twtxz;
	}

	public void setTwtxz(Customercredit twtxz) {
		this.twtxz = twtxz;
	}

	public Customercredit getTbz() {
		return tbz;
	}

	public void setTbz(Customercredit tbz) {
		this.tbz = tbz;
	}

	public Customercredit getHxz() {
		return hxz;
	}

	public void setHxz(Customercredit hxz) {
		this.hxz = hxz;
	}

	public Customercredit getQt() {
		return qt;
	}

	public void setQt(Customercredit qt) {
		this.qt = qt;
	}

	public String getAjax_username() {
		return ajax_username;
	}

	public void setAjax_username(String ajax_username) {
		this.ajax_username = ajax_username;
	}

	public String getAjax_img() {
		return ajax_img;
	}

	public void setAjax_img(String ajax_img) {
		this.ajax_img = ajax_img;
	}

	public Useraddress getUseraddress() {
		return useraddress;
	}

	public void setUseraddress(Useraddress useraddress) {
		this.useraddress = useraddress;
	}

	public long getAddressID() {
		return AddressID;
	}

	public void setAddressID(long addressID) {
		AddressID = addressID;
	}

	public List<Useraddress> getListUseraddress() {
		return listUseraddress;
	}

	public void setListUseraddress(List<Useraddress> listUseraddress) {
		this.listUseraddress = listUseraddress;
	}

	public String getLogin_mobile() {
		return login_mobile;
	}

	public void setLogin_mobile(String login_mobile) {
		this.login_mobile = login_mobile;
	}

	public String getCol_name() {
		return col_name;
	}

	public void setCol_name(String col_name) {
		this.col_name = col_name;
	}

	public String getCol_province() {
		return col_province;
	}

	public void setCol_province(String col_province) {
		this.col_province = col_province;
	}

	public String getCol_city() {
		return col_city;
	}

	public void setCol_city(String col_city) {
		this.col_city = col_city;
	}

	public String getCol_area() {
		return col_area;
	}

	public void setCol_area(String col_area) {
		this.col_area = col_area;
	}

	public String getCol_address() {
		return col_address;
	}

	public void setCol_address(String col_address) {
		this.col_address = col_address;
	}

	public String getCol_areacode() {
		return col_areacode;
	}

	public void setCol_areacode(String col_areacode) {
		this.col_areacode = col_areacode;
	}

	public String getCol_tel() {
		return col_tel;
	}

	public void setCol_tel(String col_tel) {
		this.col_tel = col_tel;
	}

	public String getCol_mobile() {
		return col_mobile;
	}

	public void setCol_mobile(String col_mobile) {
		this.col_mobile = col_mobile;
	}

	public String getCol_mail() {
		return col_mail;
	}

	public void setCol_mail(String col_mail) {
		this.col_mail = col_mail;
	}

	public String getCol_postalcode() {
		return col_postalcode;
	}

	public void setCol_postalcode(String col_postalcode) {
		this.col_postalcode = col_postalcode;
	}

	public String getC_memberemail() {
		return c_memberemail;
	}

	public void setC_memberemail(String c_memberemail) {
		this.c_memberemail = c_memberemail;
	}

	public List<Hotelorder> getListHotelOrder() {
		return ListHotelOrder;
	}

	public void setListHotelOrder(List<Hotelorder> listHotelOrder) {
		ListHotelOrder = listHotelOrder;
	}

	public Hotelorder getHotelorder() {
		return hotelorder;
	}

	public void setHotelorder(Hotelorder hotelorder) {
		this.hotelorder = hotelorder;
	}

	public List<Guest> getListGuest() {
		return ListGuest;
	}

	public void setListGuest(List<Guest> listGuest) {
		ListGuest = listGuest;
	}

	public Long getHotelOrderID() {
		return HotelOrderID;
	}

	public void setHotelOrderID(Long hotelOrderID) {
		HotelOrderID = hotelOrderID;
	}

	public int getCityID() {
		return CityID;
	}

	public void setCityID(int cityID) {
		CityID = cityID;
	}

	public String getHotelName() {
		return HotelName;
	}

	public void setHotelName(String hotelName) {
		HotelName = hotelName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getGuestName() {
		return GuestName;
	}

	public void setGuestName(String guestName) {
		GuestName = guestName;
	}

	public String getLinkMobeil() {
		return LinkMobeil;
	}

	public void setLinkMobeil(String linkMobeil) {
		LinkMobeil = linkMobeil;
	}

	public String getOrderNO() {
		return OrderNO;
	}

	public void setOrderNO(String orderNO) {
		OrderNO = orderNO;
	}

	public Huodonguser getHuodonguser() {
		return huodonguser;
	}

	public void setHuodonguser(Huodonguser huodonguser) {
		this.huodonguser = huodonguser;
	}

	public String getLoginname_hd() {
		return loginname_hd;
	}

	public void setLoginname_hd(String loginname_hd) {
		this.loginname_hd = loginname_hd;
	}

	public String getLoginpwd_hd() {
		return loginpwd_hd;
	}

	public void setLoginpwd_hd(String loginpwd_hd) {
		this.loginpwd_hd = loginpwd_hd;
	}

	public String getMobile_hd() {
		return mobile_hd;
	}

	public void setMobile_hd(String mobile_hd) {
		this.mobile_hd = mobile_hd;
	}

	public String getMail_hd() {
		return mail_hd;
	}

	public void setMail_hd(String mail_hd) {
		this.mail_hd = mail_hd;
	}

	public String getName_hd() {
		return name_hd;
	}

	public void setName_hd(String name_hd) {
		this.name_hd = name_hd;
	}

	public String getIdtype_hd() {
		return idtype_hd;
	}

	public void setIdtype_hd(String idtype_hd) {
		this.idtype_hd = idtype_hd;
	}

	public String getIdnumber_hd() {
		return idnumber_hd;
	}

	public void setIdnumber_hd(String idnumber_hd) {
		this.idnumber_hd = idnumber_hd;
	}

	public List<Spotorder> getListSpotTicketOrder() {
		return ListSpotTicketOrder;
	}

	public void setListSpotTicketOrder(List<Spotorder> listSpotTicketOrder) {
		ListSpotTicketOrder = listSpotTicketOrder;
	}

	public Spotorder getSpotorder() {
		return spotorder;
	}

	public void setSpotorder(Spotorder spotorder) {
		this.spotorder = spotorder;
	}

	public Spotmes getSpotmes() {
		return spotmes;
	}

	public void setSpotmes(Spotmes spotmes) {
		this.spotmes = spotmes;
	}

	public Spotticket getSpotticket() {
		return spotticket;
	}

	public void setSpotticket(Spotticket spotticket) {
		this.spotticket = spotticket;
	}

	public List<Spotlineorder> getListSpotLineOrder() {
		return ListSpotLineOrder;
	}

	public void setListSpotLineOrder(List<Spotlineorder> listSpotLineOrder) {
		ListSpotLineOrder = listSpotLineOrder;
	}

	public Spotlineorder getSpotlineorder() {
		return spotlineorder;
	}

	public void setSpotlineorder(Spotlineorder spotlineorder) {
		this.spotlineorder = spotlineorder;
	}

	public List<Spotlineuser> getListSpotLineUser() {
		return ListSpotLineUser;
	}

	public void setListSpotLineUser(List<Spotlineuser> listSpotLineUser) {
		ListSpotLineUser = listSpotLineUser;
	}

	public long getSoptLineOrderID() {
		return SoptLineOrderID;
	}

	public void setSoptLineOrderID(long soptLineOrderID) {
		SoptLineOrderID = soptLineOrderID;
	}

	public long getSoptOrderID() {
		return SoptOrderID;
	}

	public void setSoptOrderID(long soptOrderID) {
		SoptOrderID = soptOrderID;
	}

	public List<Train> getTrainlist() {
		return trainlist;
	}

	public void setTrainlist(List<Train> trainlist) {
		this.trainlist = trainlist;
	}

	public String getStartcreatetime() {
		return startcreatetime;
	}

	public void setStartcreatetime(String startcreatetime) {
		this.startcreatetime = startcreatetime;
	}

	public String getEndcreatetime() {
		return endcreatetime;
	}

	public void setEndcreatetime(String endcreatetime) {
		this.endcreatetime = endcreatetime;
	}

	public int getS_orderstatus() {
		return s_orderstatus;
	}

	public void setS_orderstatus(int s_orderstatus) {
		this.s_orderstatus = s_orderstatus;
	}

	public String getS_name() {
		return s_name;
	}

	public void setS_name(String s_name) {
		this.s_name = s_name;
	}

	public String getS_code() {
		return s_code;
	}

	public void setS_code(String s_code) {
		this.s_code = s_code;
	}

	public String getS_ordercode() {
		return s_ordercode;
	}

	public void setS_ordercode(String s_ordercode) {
		this.s_ordercode = s_ordercode;
	}

	public int getS_qupiaotype() {
		return s_qupiaotype;
	}

	public void setS_qupiaotype(int s_qupiaotype) {
		this.s_qupiaotype = s_qupiaotype;
	}

}
