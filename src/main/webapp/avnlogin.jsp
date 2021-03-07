<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
  <meta charset="UTF-8">
  <title>AVNLogin</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>

      <link rel="stylesheet" href="css/style.css">
</head>
<style>
body {
  background: #e9e9e9;
  color: #666666;
  font-family: 'RobotoDraft', 'Roboto', sans-serif;
  font-size: 14px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
.pen-title h1 {
  margin: 0 0 20px;
  font-size: 48px;
  font-weight: 300;
  text-align: center;
}
.pen-title span {
  font-size: 12px;
}
.pen-title span .fa {
  color: #33b5e5;
}
.pen-title span a {
  color: #33b5e5;
  font-weight: 600;
  text-decoration: none;
}
/* Form Module */
.form-module {
  position: absolute;
  left: 930px;
  top: 210px;
  background: #ffffff;
  max-width: 320px;
  width: 100%;
  border-top: 5px solid #33b5e5;
  box-shadow: 0 0 3px rgba(0, 0, 0, 0.1);
  margin: 0 auto;
}
.form-module .toggle {
  cursor: pointer;
  position: absolute;
  top: -0;
  right: -0;
  background: #33b5e5;
  width: 30px;
  height: 30px;
  margin: -5px 0 0;
  color: #ffffff;
  font-size: 12px;
  line-height: 30px;
  text-align: right;
}
.form-module .toggle .tooltip {
  position: absolute;
  top: 5px;
  right: -65px;
  display: block;
  background: rgba(0, 0, 0, 0.6);
  width: auto;
  padding: 5px;
  font-size: 10px;
  line-height: 1;
  text-transform: uppercase;
}
.form-module .toggle .tooltip:before {
  content: '';
  position: absolute;
  top: 5px;
  left: -5px;
  display: block;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-right: 5px solid rgba(0, 0, 0, 0.6);
}
.form-module .form {
  display: none;
  padding: 40px;
}
.form-module .form:nth-child(2) {
  display: block;
}
.form-module h2 {
  margin: 0 0 20px;
  color: #33b5e5;
  font-size: 18px;
  font-weight: 400;
  line-height: 1;
}
.form-module input {
  outline: none;
  display: block;
  width: 100%;
  border: 1px solid #d9d9d9;
  margin: 0 0 20px;
  padding: 10px 15px;
  box-sizing: border-box;
  font-wieght: 400;
  -webkit-transition: 0.3s ease;
  transition: 0.3s ease;
}
.form-module input:focus {
  border: 1px solid #33b5e5;
  color: #333333;
}
.form-module button {
  cursor: pointer;
  background: #33b5e5;
  width: 100%;
  border: 0;
  padding: 10px 15px;
  color: #ffffff;
  -webkit-transition: 0.3s ease;
  transition: 0.3s ease;
}
.form-module .cta {
  background: #f2f2f2;
  width: 100%;
  padding: 15px 40px;
  box-sizing: border-box;
  color: #666666;
  font-size: 12px;
  text-align: center;
}
.form-module .cta a {
  color: #333333;
  text-decoration: none;
}
.wlp-login-message-content {
position: absolute;
    left: 60px;
	top: 210px;
    background: rgba(0, 0, 0, 0) linear-gradient(to bottom, #e6e6e6 0%, #ffffff 100%) repeat scroll 0 0;
    border: 1px solid #cbcbcb;
    border-radius: 5px;
    min-height: 285px;
	min-width: 800px;
    padding: 15px;
}
.text-center {
    text-align: center;
	position: absolute;
	top: 560px;
    left: 450px;
}

</style>
<body>
<div id="headlinks">
<p style="text-align:right"><a href="">Business</a>&#160;&#160;<a href="">Contact Us</a></p>
</div><br>
<img src="logopost.jpg" alt="HTML5 Icon" style="width:325px;height:185px;position:absolute;left:60px;top:10px;">
<b>
<h1 style="color:#968370;font-size: 350%;position:absolute;left:460px;top:80px;">MARSLANDER TELECOM</h1></b>
<br><br><br>
<section class="wlp-login-message-content">
<p><b>
<i>
<font color="darkorange">Help Desk</font>
</i>
</b>
<br><br>
The Telecommunications Help Desk, can assist with issues and concerns regarding:
<br><br>
<i>
<font color="orange"> Troubleshooting problems</font>
</i>
<p>
-Moves, adds and changes to telephone equipment or service.<br>
-New service, voicemail, caller menus, special calling features and plans, caller ID, music on hold, international dialing.<br>
-Fax machines and codes, headsets, conference calls, speaker phone rental.<br>
-Call accounting and billling - Telephone bill login.<br>
-We also manage plans, orders, service, billing and trouble shooting for college provided cellphones and smartphones.<br><br>
<i>
<font color="darkorange"> CONTACT US</font>
</i>
<br><br>
<ul style="margin-left:20px">
<li>Call 896-547-7182</li>
<li>
<a href="mailto:compliant@avncommu.com">Email</a>
</li><br>
 Wholesale Customer Care:
<br>
 799-475-4578 or 458-457-7412
</p>
</section>
<div class="module form-module">
  <div class="toggle">
   </div>
    <div class="form">
    <h2>Login to your account</h2>
    <form action="avnlogin" method="post">
      <input type="text" name="username" placeholder="Username"/>
      <input type="password" name="userpassword" placeholder="Password"/>
      <button>Login</button>
    </form>
  </div>
   <div class="cta"><a href="">Forgot your password?</a></div>
   </div>
   <p class="text-center">
   <span id="fullyear">2017</span>
   &#169; AVN COMMUNICATION. All Rights Reserved.<br>
   | Small Business | Medium Business | Large Business | Wholesale |
  </p>
 </body>
 </html>
