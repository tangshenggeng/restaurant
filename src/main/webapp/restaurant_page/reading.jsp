<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
  %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>阅读</title>
    <meta name="description" content="Free Bootstrap Theme ">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
<!--     <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Pinyon+Script" rel="stylesheet">
 -->    <link rel="stylesheet" href="${APP_PATH}/restaurant_page/css/styles-merged.css">
    <link rel="stylesheet" href="${APP_PATH}/restaurant_page/css/style.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/layui/css/layui.css">
    <script src="${APP_PATH}/static/vue/vue.min.js"></script>
    <script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>
    <!--[if lt IE 9]>
      <script src="js/vendor/html5shiv.min.js"></script>
      <script src="js/vendor/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    
    


     <!-- probootstrap-bg-white -->

<nav class="navbar navbar-default navbar-fixed-top probootstrap-navbar">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/restaurant/restaurant_page/index.jsp" title="想遇您">LOGO</a>
        </div>
      </div>
    </nav>


    <section class="probootstrap-section">
      <div class="container">
      <p class=""><a href="javascript:history.go(-1)" class="probootstrap-custom-link link-sm">返回</a></p>
        
          <div class="probootstrap-animate" style="margin-top: 20px">
            <div class="probootstrap-block-image">
              <figure><img  class="col-md-offset-4" style="height: 360px;margin-top: 20px" src="${soonFoods.foodImg}" alt="Free Bootstrap Template "></figure>
              <div class="text" align="center">
                <span class="date">${soonFoods.formTime}</span>
                <h3><a href="#">${soonFoods.foodName}</a></h3>
                <p>${soonFoods.foodText}</p>
              </div>
            </div>
          </div>
      </div>
    </section>


    <section class="probootstrap-footer">
      <div class="container">
        <div class="row">
          <div class="col-md-4 probootstrap-animate">
            <div class="probootstrap-footer-widget">
              <h3>地点</h3>
              <div class="row">
                <div class="col-md-6">
                  <p> 江西省 南昌市 南昌县<br> 向塘镇</p>
                </div>
                <div class="col-md-6">
                  <p>江西服装学院<br><a href="${APP_PATH}/admin/toLogin">后台登录</a></p>
                  
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6 probootstrap-animate">
            <div class="probootstrap-footer-widget">
              <h3>营业时间</h3>
              <div class="row">
                <div class="col-md-4">
                  <p>周一 - 周五 <br> 7:30am - 10:00pm</p>
                </div>
                <div class="col-md-4">
                  <p>周六 - 周日 <br> 7:30pm - 12:00pm</p>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-2 probootstrap-animate">
            <div class="probootstrap-footer-widget">
              <h3>联系我们</h3>
              <div class="row">
                <div class="col-md-6">
                  	 电话:<br>1234567890
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    

    <script src="${APP_PATH}/restaurant_page/js/scripts.min.js"></script>
    <script src="${APP_PATH}/restaurant_page/js/custom.min.js"></script>
	
  </body>
</html>