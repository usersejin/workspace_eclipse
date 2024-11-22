<%@page import="vo.AmazonVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>AmazonLogin</title>
<style>
#outer {
	width: 600px;
	margin: auto;
}

#header {
	margin: auto;
}

#footer {
	margin: auto;
	margin-left: 50px;
}

img {
	margin: auto;
	position: relative;
	left: 220px;
}

#inner {
	width: 500px;
	height: 550px;
	border: 1px solid gray;
	margin: 0 auto;
	border-radius: 10px;
}

p {
	margin-left: 30px;
}

h1 {
	margin-left: 30px;
}

label {
	font-weight: bold;
}

input {
	border: 1px solid gray;
	width: 430px;
	height: 30px;
	border-radius: 5px;
}

#btn1 {
	border-style: none;
	background-color: #ffd814;
	width: 440px;
	height: 40px;
	font-size: 20px;
	font-weight: bold;
}

#btn2 {
	border-color: gray;
	background-color: white;
	width: 440px;
	height: 40px;
	font-size: 20px;
	font-weight: bold;
}

input[type="text"]:focus {
	outline: none;
	border: 1px solid rgb(68, 89, 179);
	background-color: rgb(234, 249, 255);
}

input[type="password"]:focus {
	outline: none;
	border: 1px solid rgb(68, 89, 179);
	background-color: rgb(234, 249, 255);
}

#btn2:hover {
	background-color: lightgray;
}

#legalTextRow {
	margin-left: 30px;
}

#text-row {
	width: 430px;
	margin-left: 30px;
	margin-top: 30px;
	padding-top: 20px;
	padding-bottom: 20px;
	border-top: 1px solid gray;
	border-bottom: 1px solid gray;
}

#row {
	width: 430px;
	margin-left: 30px;
	margin-top: 30px;
}

a {
	color: #0066c0;
}

summary {
	font-weight: bold;
}

summary:focus {
	
}
</style>
</head>
<body>

	<% 
	// 
	Object obj = session.getAttribute("vo"); // session 에서 vo 속성값 가져오기 
	if (obj != null) {
		AmazonVO vo = (AmazonVO) obj;
		out.println("<h3>" + vo.getName() + "님 환영합니다");
		out.println("<a href = 'Amazonlogout.jsp'>logout</a>");
	} else {
	%>

	<div id="outer">
		<div id="header">
			<img src="../img/amazon.png" alt="" />
		</div>
		<div id="inner">

			<h1>Sign in</h1>
			<form action="AmazonloginOk.jsp" method="get">
				<p>
					<label for="email">Email or mobile phone number</label><br /> <input
						type="text" name="email" id="email" />
				</p>

				<p>
					<label for="pw">Password</label><br /> <input type="password"
						name="pw" id="pw" />
				</p>
				<p>
					<input type="submit" value="Continue" id="btn1" />
				</p>
			</form>
			<%
			}
			%>
			<div id="legalTextRow">
				By continuing, you agree to Amazon's <a
					href="https://www.amazon.com/gp/help/customer/display.html/ref=ap_register_notification_condition_of_use?ie=UTF8&nodeId=508088">Conditions
					of <br> Use
				</a> and <a
					href="https://www.amazon.com/gp/help/customer/display.html/ref=ap_register_notification_privacy_notice?ie=UTF8&nodeId=468496">Privacy
					Notice</a>
			</div>
			<div id="text-row">
				<details>
					<summary>Need help?</summary>
					&nbsp;&nbsp;&nbsp;
					<a
						href="https://www.amazon.com/ap/forgotpassword?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2Fdp%2FB0D88JBQJH%2Fref%3Dnav_custrec_signin%3Ftag%3Dmallonjustinb-20%26linkCode%3Dw00%26linkId%3D58520368afb4abe6bf65dc1f8af71f4f%26creativeASIN%3DB0D88JBQJH%26gclid%3DCjwKCAiArva5BhBiEiwA-oTnXfZNY3hTNvojvTV305NsSpBYONAAn4LWIdTKAVgkrXM0jeR1NzSENBoClm8QAvD_BwE&prevRID=MBH5YXQ4ZXY2SKZGJHJA&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=usflex&openid.mode=checkid_setup&prepopulatedLoginId=&failedSignInCount=0&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&pageId=usflex&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0">Forgot
						your password?</a>
					<br> &nbsp;&nbsp;&nbsp;
					<a
						href="https://www.amazon.com/gp/help/customer/account-issues/ref=ap_login_with_otp_claim_collection?ie=UTF8">More
						ways to get support</a>
				</details>
			</div>
			<div id="row">
				<span> Buying for work?</span><br> <a
					href="https://www.amazon.com/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com%2Fbusiness%2Fregister%2Fcheck%2Fstatus%3Fref_%3Dab_reg_signin%26ref_%3Dab_welcome_bw_ckab_dsk%26originalRef%3Dab_reg_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=amzn_ab_reg_web_us&openid.mode=checkid_setup&marketPlaceId=ATVPDKIKX0DER&language=en_US&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&pageId=ab_welcome_login_us&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&switch_account=signin&disableLoginPrepopulate=1&ref_=ab_welcome_bw_ap-sn_dsk&openid.pape.preferred_auth_policies=Singlefactor">
					Shop on Amazon Business</a>
			</div>
		</div>
		<div id="footer">
			<a href="Amazonregister.jsp">
				<p>
					<input type="button" value="Create your Amazon account" id="btn2" />
				</p>
			</a>
		</div>

	</div>
</body>
</html>
