<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Amazonregister.jsp</title>
    <style>
      #outer {
        width: 600px;
        margin: auto;
      }
      #header {
        margin: auto;
      }
      img {
        margin: auto;
        position: relative;
        left: 220px;
      }
      #inner {
        width: 500px;
        height: 670px;
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
      input[type="submit"] {
        border-style: none;
        background-color: #ffd814;
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
    </style>
  </head>
  <body>
    <div id="outer">
      <div id="header">
        <img src="../img/amazon.png" alt="" />
      </div>
      <div id="inner">
        <h1>Create account</h1>
        <form action="AmazonregisterOk.jsp" method = "post">
        <p>
          <label for="name">Your name</label><br />
          <input
            type="text"
            name="name"
            id="name"
            placeholder="   First and last name"
          />
        </p>

        <p>
          <label for="email">Mobile number or email</label><br />
          <input type="text" name="email" id="email" />
        </p>

        <p>
          <label for="pw">Password</label><br />
          <input
            type="password"
            name="pw"
            id="pw"
            placeholder="   At least 6 character"
          />
        </p>

        <p>
          <label for="re-enter_password">Re-enter password</label><br />
          <input type="password" name="" id="re-enter_password" />
        </p>
        
        <p>
          <input type="submit" value="Continue" />
        </p>
        </form>
        <div id="legalTextRow">
          By creating an account, you agree to Amazon's<br />
          <a
            href="https://www.amazon.com/gp/help/customer/display.html/ref=ap_register_notification_condition_of_use?ie=UTF8&nodeId=508088"
            >Conditions of Use</a
          >
          and
          <a
            href="https://www.amazon.com/gp/help/customer/display.html/ref=ap_register_notification_privacy_notice?ie=UTF8&nodeId=468496"
            >Privacy Notice</a
          >
        </div>
        <div id="text-row">
          <span
            >Buying for work?<br />
            Create a free business account</span
          >
        </div>
        <div id="row">
          <span>Already have an account? </span
          ><a
            href="Amazonlogin.jsp"
          >
            Sign in</a
          >
        </div>
      </div>
    </div>
  </body>
</html>

sdfsdfsdfs
