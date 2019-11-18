<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
  %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>项遇您</title>
    <meta name="description" content="Free Bootstrap Theme ">
    <meta name="keywords" content="free website templates, free bootstrap themes, free template, free bootstrap, free website template">
    
<!--     <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Pinyon+Script" rel="stylesheet">
 -->    <link rel="stylesheet" href="${APP_PATH}/restaurant_page/css/styles-merged.css">
    <link rel="stylesheet" href="${APP_PATH}/restaurant_page/css/style.min.css">
    <link rel="stylesheet" href="${APP_PATH}/static/layui/css/layui.css">

    <!--[if lt IE 9]>
      <script src="js/vendor/html5shiv.min.js"></script>
      <script src="js/vendor/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    
    <!-- Fixed navbar -->
    
    <nav class="navbar navbar-default navbar-fixed-top probootstrap-navbar">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${APP_PATH}/restaurant_page/index.jsp" title="ProBootstrap:FineOak">LOGO</a>
        </div>

        <div id="navbar-collapse" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active"><a href="#" data-nav-section="welcome">欢迎</a></li>
            <li><a href="#" data-nav-section="specialties">新品</a></li>
            <li><a href="#" data-nav-section="menu">菜单</a></li>
            <li><a href="#" data-nav-section="reservation">预定</a></li>
            <li><a href="#" data-nav-section="events">即将推新</a></li>
            <li><a href="#" data-nav-section="contact">联系我们</a></li>
          </ul>
        </div>
      </div>
    </nav>

    <section class="flexslider" data-section="welcome">
      <ul class="slides">
        <li style="background-image: url(${APP_PATH}/restaurant_page/img/hero_bg_1.jpg)" class="overlay" data-stellar-background-ratio="0.5">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
                <div class="probootstrap-slider-text text-center probootstrap-animate probootstrap-heading">
                  <h1 class="primary-heading">欢迎您</h1>
                  <h3 class="secondary-heading">项遇您</h3>
                  <p class="sub-heading">感受味蕾的极致体验</p>
                </div>
              </div>
            </div>
          </div>
        </li>
        <li style="background-image: url(${APP_PATH}/restaurant_page/img/hero_bg_2.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
                <div class="probootstrap-slider-text text-center probootstrap-animate probootstrap-heading">
                  <h1 class="primary-heading">健康</h1>
                  <h3 class="secondary-heading">所以美味</h3>
                  <p class="sub-heading">我们就是您的御用厨师</p>
                </div>
              </div>
            </div>
          </div>
          
        </li>
        <li style="background-image: url(${APP_PATH}/restaurant_page/img/hero_bg_3.jpg)" class="overlay">
          <div class="container">
            <div class="row">
              <div class="col-md-8 col-md-offset-2">
                <div class="probootstrap-slider-text text-center probootstrap-animate probootstrap-heading">
                  <h1 class="primary-heading">服务</h1>
                  <h3 class="secondary-heading">让您宾至如归</h3>
                  <p class="sub-heading">顾客于我们始终如一</p>
                </div>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </section>

    <section class="probootstrap-section probootstrap-bg-white">
      <div class="container">
        <div class="row">
          <div class="col-md-5 text-center probootstrap-animate">
            <div class="probootstrap-heading dark">
              <h1 class="primary-heading">探索</h1>
              <h3 class="secondary-heading">我们的门店</h3>
              <span class="seperator">* * *</span>
            </div>
            <p></p>
            <p><a href="#" class="probootstrap-custom-link">关于我们</a></p>
          </div>
          <div class="col-md-6 col-md-push-1 probootstrap-animate">
            <p><img src="${APP_PATH}/restaurant_page/img/img_1.jpg" alt="Free Bootstrap Template " class="img-responsive"></p>
          </div>
        </div>
        <!-- END row -->
      </div>
    </section>

    <section class="probootstrap-section-bg overlay" style="background-image: url(${APP_PATH}/restaurant_page/img/hero_bg_2.jpg);" data-stellar-background-ratio="0.5" data-section="specialties">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center probootstrap-animate">
            <div class="probootstrap-heading">
              <h2 class="primary-heading">探索</h2>
              <h3 class="secondary-heading">我们的新品</h3>
            </div>
          </div>
        </div>
      </div>
    </section>
     <!-- probootstrap-bg-white -->
    <section class="probootstrap-section">
      <div class="container">
        <div class="row">
          <div class="probootstrap-cell-retro">

              <div class="probootstrap-cell probootstrap-animate" data-animate-effect="fadeIn">
                <div class="image" style="background-image: url(${APP_PATH}/restaurant_page/img/img_square_1.jpg);"></div>
                <div class="text text-center">
                  <h3>Baked Potato Pizza</h3>
                  <p>Laboriosam pariatur modi praesentium deleniti molestiae officiis atque numquam.</p>
                  <p class="price">$20.99</p>
                </div>
              </div>
              <div class="probootstrap-cell reverse probootstrap-animate" data-animate-effect="fadeIn">
                <div class="image" style="background-image: url(${APP_PATH}/restaurant_page/img/img_square_2.jpg);"></div>
                <div class="text text-center">
                  <h3>Salted Fried Chicken</h3>
                  <p>Laboriosam pariatur modi praesentium deleniti molestiae officiis atque numquam.</p>
                  <p class="price">$19.99</p>
                </div>
              </div>
              <div class="probootstrap-cell probootstrap-animate" data-animate-effect="fadeIn">
                <div class="image" style="background-image: url(${APP_PATH}/restaurant_page/img/img_square_3.jpg);"></div>
                <div class="text text-center">
                  <h3>Imported Salmon Steak</h3>
                  <p>Laboriosam pariatur modi praesentium deleniti molestiae officiis atque numquam.</p>
                  <p class="price">$20.99</p>
                </div>
              </div>
              <div class="probootstrap-cell probootstrap-animate" data-animate-effect="fadeIn">
                <div class="image" style="background-image: url(${APP_PATH}/restaurant_page/img/img_square_1.jpg);"></div>
                <div class="text text-center">
                  <h3>Baked Potato Pizza</h3>
                  <p>Laboriosam pariatur modi praesentium deleniti molestiae officiis atque numquam.</p>
                  <p class="price">$20.99</p>
                </div>
              </div>
              <div class="probootstrap-cell reverse probootstrap-animate" data-animate-effect="fadeIn">
                <div class="image" style="background-image: url(${APP_PATH}/restaurant_page/img/img_square_2.jpg);"></div>
                <div class="text text-center">
                  <h3>Salted Fried Chicken</h3>
                  <p>Laboriosam pariatur modi praesentium deleniti molestiae officiis atque numquam.</p>
                  <p class="price">$19.99</p>
                </div>
              </div>
              <div class="probootstrap-cell probootstrap-animate" data-animate-effect="fadeIn">
                <div class="image" style="background-image: url(${APP_PATH}/restaurant_page/img/img_square_3.jpg);"></div>
                <div class="text text-center">
                  <h3>Imported Salmon Steak</h3>
                  <p>Laboriosam pariatur modi praesentium deleniti molestiae officiis atque numquam.</p>
                  <p class="price">$20.99</p>
                </div>
              </div>

            <%-- <div class="half">

              <div class="probootstrap-cell probootstrap-animate" data-animate-effect="fadeIn">
                <div class="image" style="background-image: url(${APP_PATH}/restaurant_page/img/img_square_4.jpg);"></div>
                <div class="text text-center">
                  <h3>Roast Beef (4 sticks)</h3>
                  <p>Laboriosam pariatur modi praesentium deleniti molestiae officiis atque numquam.</p>
                  <p class="price">$32.99</p>
                </div>
              </div>
              <div class="probootstrap-cell reverse probootstrap-animate" data-animate-effect="fadeIn">
                <div class="image" style="background-image: url(${APP_PATH}/restaurant_page/img/img_square_5.jpg);"></div>
                <div class="text text-center">
                  <h3>Tuna Roast Source</h3>
                  <p>Laboriosam pariatur modi praesentium deleniti molestiae officiis atque numquam.</p>
                  <p class="price">$25.99</p>
                </div>
              </div>
              <div class="probootstrap-cell probootstrap-animate" data-animate-effect="fadeIn">
                <div class="image" style="background-image: url(${APP_PATH}/restaurant_page/img/img_square_1.jpg);"></div>
                <div class="text text-center">
                  <h3>Fried Potatoes with Garlic</h3>
                  <p>Laboriosam pariatur modi praesentium deleniti molestiae officiis atque numquam.</p>
                  <p class="price">$32.99</p>
                </div>
              </div>
              
            </div> --%>
          </div>
        </div>
      </div>
    </section>

    <section class="probootstrap-section-bg overlay" style="background-image: url(${APP_PATH}/restaurant_page/img/hero_bg_4.jpg);"  data-stellar-background-ratio="0.5"  data-section="menu">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center probootstrap-animate">
            <div class="probootstrap-heading">
              <h2 class="primary-heading">发现</h2>
              <h3 class="secondary-heading">菜单</h3>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="probootstrap-section probootstrap-bg-white">
      <div class="container">
        <div class="row">
        
            <ul class="menus">
              <li  class="col-md-5" style="margin: 5px 45px">
                <figure class="image"><img src="${APP_PATH}/restaurant_page/img/img_square_1.jpg" alt="Free Bootstrap Template "></figure>
                <div class="text">
                  <span class="price">$22.99</span>
                  <h3>Fried Potatoes with Garlic</h3>
                  <p>Crab / Potatoes / Rice</p>
                </div>
              </li>
              <li  class="col-md-5" style="margin: 5px 45px">
                <figure class="image"><img src="${APP_PATH}/restaurant_page/img/img_square_2.jpg" alt="Free Bootstrap Template "></figure>
                <div class="text">
                  <span class="price">$22.99</span>
                  <h3>Tuna Roast Source</h3>
                  <p>Crab / Potatoes / Rice</p>
                </div>
              </li>
              <li  class="col-md-5" style="margin: 5px 45px">
                <figure class="image"><img src="${APP_PATH}/restaurant_page/img/img_square_3.jpg" alt="Free Bootstrap Template "></figure>
                <div class="text">
                  <span class="price">$22.99</span>
                  <h3>Roast Beef (4 sticks)</h3>
                  <p>Crab / Potatoes / Rice</p>
                </div>
              </li>
              <li  class="col-md-5" style="margin: 5px 45px">
                <figure class="image"><img src="${APP_PATH}/restaurant_page/img/img_square_4.jpg" alt="Free Bootstrap Template "></figure>
                <div class="text">
                  <span class="price">$22.99</span>
                  <h3>Salted Fried Chicken</h3>
                  <p>Crab / Potatoes / Rice</p>
                </div>
              </li>
              <li  class="col-md-5" style="margin: 5px 45px">
                <figure class="image"><img src="${APP_PATH}/restaurant_page/img/img_square_1.jpg" alt="Free Bootstrap Template "></figure>
                <div class="text">
                  <span class="price">$22.99</span>
                  <h3>Fried Potatoes with Garlic</h3>
                  <p>Crab / Potatoes / Rice</p>
                </div>
              </li>
              <li  class="col-md-5" style="margin: 5px 45px">
                <figure class="image"><img src="${APP_PATH}/restaurant_page/img/img_square_2.jpg" alt="Free Bootstrap Template "></figure>
                <div class="text">
                  <span class="price">$22.99</span>
                  <h3>Tuna Roast Source</h3>
                  <p>Crab / Potatoes / Rice</p>
                </div>
              </li>
              <li  class="col-md-5" style="margin: 5px 45px">
                <figure class="image"><img src="${APP_PATH}/restaurant_page/img/img_square_3.jpg" alt="Free Bootstrap Template "></figure>
                <div class="text">
                  <span class="price">$22.99</span>
                  <h3>Roast Beef (4 sticks)</h3>
                  <p>Crab / Potatoes / Rice</p>
                </div>
              </li>
              <li  class="col-md-5" style="margin: 5px 45px">
                <figure class="image"><img src="${APP_PATH}/restaurant_page/img/img_square_4.jpg" alt="Free Bootstrap Template "></figure>
                <div class="text">
                  <span class="price">$22.99</span>
                  <h3>Salted Fried Chicken</h3>
                  <p>Crab / Potatoes / Rice</p>
                </div>
              </li>
            </ul>
          
          <%-- <div class="col-md-6">
            <ul class="menus">
              <li>
                <figure class="image"><img src="${APP_PATH}/restaurant_page/img/img_square_5.jpg" alt="Free Bootstrap Template "></figure>
                <div class="text">
                  <span class="price">$22.99</span>
                  <h3>Baked Potato Pizza</h3>
                  <p>Crab / Potatoes / Rice</p>
                </div>
              </li>
              <li>
                <figure class="image"><img src="${APP_PATH}/restaurant_page/img/img_square_1.jpg" alt="Free Bootstrap Template "></figure>
                <div class="text">
                  <span class="price">$22.99</span>
                  <h3>Fried Potatoes with Garlic</h3>
                  <p>Crab / Potatoes / Rice</p>
                </div>
              </li>
              <li>
                <figure class="image"><img src="${APP_PATH}/restaurant_page/img/img_square_2.jpg" alt="Free Bootstrap Template "></figure>
                <div class="text">
                  <span class="price">$22.99</span>
                  <h3>Salted Fried Chicken</h3>
                  <p>Crab / Potatoes / Rice</p>
                </div>
              </li>
              <li>
                <figure class="image"><img src="${APP_PATH}/restaurant_page/img/img_square_3.jpg" alt="Free Bootstrap Template "></figure>
                <div class="text">
                  <span class="price">$22.99</span>
                  <h3>Tuna Roast Source</h3>
                  <p>Crab / Potatoes / Rice</p>
                </div>
              </li>
            </ul>
          </div> --%>
          
        </div>
      </div>
    </section>

    <section class="probootstrap-section-bg overlay" style="background-image: url(${APP_PATH}/restaurant_page/img/hero_bg_5.jpg);"  data-stellar-background-ratio="0.5" data-section="reservation">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center probootstrap-animate">
            <div class="probootstrap-heading">
              <h2 class="primary-heading">预定</h2>
              <h3 class="secondary-heading">您的专属餐桌</h3>
            </div>
          </div>
        </div>
      </div>
    </section>
		<div class="tlinks">Collect from <a href="http://www.cssmoban.com/"  title="网站模板">网站模板</a></div>
    <section class="probootstrap-section probootstrap-bg-white">
      <div class="container">
        <div class="row">
          <div class="col-md-12 probootstrap-animate">
            <form class="probootstrap-form" id="appointment_form">
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="people">人数</label>
                    <div class="form-field">
                      <i class="icon icon-chevron-down"></i>
                      <select name="custNum" class="form-control">
                        <option value="1">1 人</option>
                        <option value="2">2 人</option>
                        <option value="3">3 人</option>
                        <option value="4">3+ 人</option>
                      </select>
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="test1">日期</label>
                    <div class="form-field">
                      <i class="icon icon-calendar"></i>
                      <input type="text" name="appointmentDate" class="layui-input form-control" id="test1" placeholder="请选择日期">
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="time">时间</label>
                    <div class="form-field">
                      <i class="icon icon-clock"></i>
                      <!-- <input type="text" id="time" class="form-control"> -->
                      <input type="text" name="appointmentTime" class="layui-input form-control" id="test-limit3" placeholder="请选择时区">
                    </div>
                  </div>
                </div>
              </div>
              <!-- END row -->
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="name">称呼</label>
                    <div class="form-field">
                      <i class="icon icon-user2"></i>
                      <input type="text" id="name" name="custName" class="form-control" placeholder="请输入您的称呼">
                    </div>
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label for="phone">电话</label>
                    <div class="form-field">
                      <i class="icon icon-phone"></i>
                      <input type="text" id="phone" name="custPhone" class="form-control" placeholder="请输入您的电话">
                    </div>
                  </div>
                </div>
                 <div class="col-md-4">
                  <div class="form-group">
	                <label for="c_message">备注</label>
	                <div class="form-field">
	                  <textarea name="custMessage" cols="" rows="2" class="form-control" placeholder="请备注您的口味"></textarea>
	                </div>
	              </div>
                </div>
                
              </div>
              <div class="row">
                <div class="col-md-4 col-md-offset-4">
                  <input type="button" id="appointment_btn" value="预定" class="btn btn-lg btn-primary btn-block">
                  <input type="reset" id="appointment_reset" value="重置" class="btn btn-lg btn-info btn-block">
                </div>
              </div>
              
            </form>
          </div>
        </div>
      </div>
    </section>

    <section class="probootstrap-section-bg overlay" style="background-image: url(${APP_PATH}/restaurant_page/img/hero_bg_4.jpg);"  data-stellar-background-ratio="0.5" data-section="events">
      <div class="container">
        <div class="row">
          <div class="col-md-12 text-center probootstrap-animate">
            <div class="probootstrap-heading">
              <h2 class="primary-heading">尽请期待</h2>
              <h3 class="secondary-heading">我们的新品</h3>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="probootstrap-section">
      <div class="container">
        <div class="row">
          <div class="col-md-4 col-sm-4 probootstrap-animate">
            <div class="probootstrap-block-image">
              <figure><img src="${APP_PATH}/restaurant_page/img/img_square_2.jpg" alt="Free Bootstrap Template "></figure>
              <div class="text">
                <span class="date">June 29, 2017</span>
                <h3><a href="#">Laboriosam Quod Dignissimos</a></h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto provident qui tempore natus quos quibusdam soluta at.</p>
                <p class=""><a href="#" class="probootstrap-custom-link link-sm">Read More</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-4 probootstrap-animate">
            <div class="probootstrap-block-image">
              <figure><img src="${APP_PATH}/restaurant_page/img/img_square_3.jpg" alt="Free Bootstrap Template "></figure>
              <div class="text">
                <span class="date">June 29, 2017</span>
                <h3><a href="#">Laboriosam Quod Dignissimos</a></h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto provident qui tempore natus quos quibusdam soluta at.</p>
                <p class=""><a href="#" class="probootstrap-custom-link link-sm">Read More</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-4 probootstrap-animate">
            <div class="probootstrap-block-image">
              <figure><img src="${APP_PATH}/restaurant_page/img/img_square_4.jpg" alt="Free Bootstrap Template "></figure>
              <div class="text">
                <span class="date">June 29, 2017</span>
                <h3><a href="#">Laboriosam Quod Dignissimos</a></h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto provident qui tempore natus quos quibusdam soluta at.</p>
                <p class=""><a href="#" class="probootstrap-custom-link link-sm">Read More</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-4 probootstrap-animate">
            <div class="probootstrap-block-image">
              <figure><img src="${APP_PATH}/restaurant_page/img/img_square_2.jpg" alt="Free Bootstrap Template "></figure>
              <div class="text">
                <span class="date">June 29, 2017</span>
                <h3><a href="#">Laboriosam Quod Dignissimos</a></h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto provident qui tempore natus quos quibusdam soluta at.</p>
                <p class=""><a href="#" class="probootstrap-custom-link link-sm">Read More</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-4 probootstrap-animate">
            <div class="probootstrap-block-image">
              <figure><img src="${APP_PATH}/restaurant_page/img/img_square_3.jpg" alt="Free Bootstrap Template "></figure>
              <div class="text">
                <span class="date">June 29, 2017</span>
                <h3><a href="#">Laboriosam Quod Dignissimos</a></h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto provident qui tempore natus quos quibusdam soluta at.</p>
                <p class=""><a href="#" class="probootstrap-custom-link link-sm">Read More</a></p>
              </div>
            </div>
          </div>
          <div class="col-md-4 col-sm-4 probootstrap-animate">
            <div class="probootstrap-block-image">
              <figure><img src="${APP_PATH}/restaurant_page/img/img_square_4.jpg" alt="Free Bootstrap Template "></figure>
              <div class="text">
                <span class="date">June 29, 2017</span>
                <h3><a href="#">Laboriosam Quod Dignissimos</a></h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Iusto provident qui tempore natus quos quibusdam soluta at.</p>
                <p class=""><a href="#" class="probootstrap-custom-link link-sm">Read More</a></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="probootstrap-section probootstrap-bg-white" data-section="contact">
      <div class="container">
        <div class="row">
          <div class="col-md-5 text-center probootstrap-animate">
            <div class="probootstrap-heading dark">
              <h1 class="primary-heading">您的心声</h1>
              <h3 class="secondary-heading">让我们进步</h3>
            </div>
            <p>即使没有反馈也可以来撩哟~</p>
          </div>
          <div class="col-md-6 col-md-push-1 probootstrap-animate">
            <form  class="probootstrap-form" id="feedBackForm">
              <div class="form-group">
                <label for="c_name">称呼：</label>
                <div class="form-field">
                  <input type="text" name="feedbackCustName" class="form-control" placeholder="请输入您的称呼">
                </div>
              </div>
              <div class="form-group">
                <label for="c_email">联系Email：</label>
                <div class="form-field">
                  <input type="email" name="feedbackCustEmail" class="form-control" placeholder="请输入您的Email">
                </div>
              </div>
              <div class="form-group">
                <label for="c_message">内容：</label>
                <div class="form-field">
                  <textarea name="feedbackText" cols="30" rows="10" class="form-control" placeholder="请输入您要反馈的内容"></textarea>
                </div>
              </div>
              <div class="form-group">
                <input type="button" id="c_submit" value="留言" class="btn btn-primary btn-lg">
                <input type="reset" id="c_reset" value="重置" class="btn btn-primary btn-lg">
              </div>
            </form>
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
   <%--  <script src="${APP_PATH}/static/layer/layer.js"></script> --%>
    <script src="${APP_PATH}/static/layui/layui.all.js"></script>
	<script type="text/javascript">
		//预约
		$("#appointment_btn").click(function(){
			var varreg  = /^\d{7,11}$/;
			var phone = $("#phone").val();
			if(!varreg.test(phone)){
				layer.msg("请正确输入号码！",{icon:5});
				return;
			}
			var data = $("#appointment_form").serialize();
			$.ajax({
				url:"${APP_PATH}/appointment/addAppointment",
				method:"POST",
				data:data,
				success:function(res){
					if(res.code==100){
						layer.msg(res.extend.msg,{icon:6},function(){
							$("#appointment_reset").click();
						})
					}else{
						layer.msg(res.extend.msg,{icon:5})
					}
				},error:function(){
					layer.msg("系统出错！请您电话预约，同时希望您能反馈给我们~",{icon:5})
					console.log("系统出错！")
				}
			});
		});
	
	
	
		layui.use('laydate', function(){
			  var laydate = layui.laydate;
			  //执行一个laydate实例
			  laydate.render({
			    elem: '#test1'
			    ,eventElem: '#test1'
			    ,trigger: 'click'
			    ,min: 1
			    ,max: 14
			    ,showBottom: false
			  });
			  
			  laydate.render({
				    elem: '#test-limit3'
				    ,type: 'time'
				    ,min: '08:00:00'
				    ,max: '22:00:00'
				    ,trigger: 'click'
				    ,btns: ['clear', 'confirm']
				  });
			});	
		//留言
		$("#c_submit").click(function(){
			$.ajax({
				url:"${APP_PATH}/feedBack/addFeedBack",
				method:"post",
				data:$("#feedBackForm").serialize(),
				success:function(res){
					if(res.code == 100){
						layer.msg(res.extend.msg, {icon: 6}, function(){
							$("#c_reset").click();
						}); 
					}else{
						layer.msg(res.extend.msg, {icon: 5});
					}
				},error:function(){
					layer.msg(res.extend.msg, {icon: 5});
				}
			});
		});
	
	</script>
  </body>
</html>