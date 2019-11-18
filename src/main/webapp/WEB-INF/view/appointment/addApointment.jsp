<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	pageContext.setAttribute("APP_PATH", request.getContextPath());
  %>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加预约</title>
    <!-- Styles -->
    <link href="${APP_PATH}/static/assets/fontAwesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/themify-icons.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/mmc-chat.css" rel="stylesheet" />
    <link href="${APP_PATH}/static/assets/css/lib/sidebar.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/nixon.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/lib/lobipanel/css/lobipanel.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/style.css" rel="stylesheet">
    <link href="${APP_PATH}/static/layui/css/layui.css" rel="stylesheet">
    <link href="${APP_PATH}/static/css/checkbox.min.css" rel="stylesheet">
    <script src="${APP_PATH}/static/vue/vue.min.js"></script>
    <script src="${APP_PATH}/static/vue/vue-resource.min.js"></script>
    <style >
	　　 input::-webkit-outer-spin-button,
	    input::-webkit-inner-spin-button {
	        -webkit-appearance: none;
	    }
	    input[type="number"]{
	        -moz-appearance: textfield;
	    }
	</style>
</head>

<body>
	<!-- 左侧导航 -->
	<%@ include file="/WEB-INF/view/common/leftNav.jsp"%>
	<!-- /# sidebar -->
	<%@ include file="/WEB-INF/view/common/header.jsp"%>

	<!-- END chat Sidebar-->
<div class="content-wrap">
	<div class="main">
		<div class="container-fluid">
			<div class="row">
                    <div class="col-lg-8 p-0">
                        <div class="page-header">
                            <div class="page-title">
                                <h1>导航</h1>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                    <div class="col-lg-4 p-0">
                        <div class="page-header">
                            <div class="page-title">
                                <ol class="breadcrumb text-right">
                                    <li><a href="#">导航</a></li>
                                    <li class="active">添加预约</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
			<!-- /# row -->
			<div class="main-content">
				<div class="row" style="background-color: #00838F;">
					<div class="col-lg-3"></div>
					<div class="col-lg-6">
						<div class="login-content" >
							<div class="login-logo">
								<a href="#"><span>添加预约</span></a>
							</div>
							<div class="login-form">
								<form class="layui-form " id="addApointmentForm"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
								  <div class="layui-form-item">
								    <label class="layui-form-label">称呼</label>
								    <div class="layui-input-block">
								      <input type="text" name="custName" placeholder="请输入称呼" autocomplete="off" class="layui-input">
								    </div>
								  </div>
								  <div class="layui-form-item">
								    <label class="layui-form-label">电话</label>
								    <div class="layui-input-block">
								      <input type="text" id="addApponitPhone"  name="custPhone" placeholder="请输入电话" autocomplete="off" class="layui-input">
								    </div>
								  </div>
								  <div class="layui-form-item">
								    <label class="layui-form-label">日期</label>
								    <div class="layui-input-block">
								      <input type="text" name="appointmentDate" class="layui-input" id="test1" placeholder="请选择日期">
								    </div>
								  </div>
								  <div class="layui-form-item">
								    <label class="layui-form-label">时间</label>
								    <div class="layui-input-block">
								      <input type="text" name="appointmentTime" class="layui-input" id="test-limit3" placeholder="请选择时区">
								    </div>
								  </div>
								  <div class="layui-form-item">
								    <label class="layui-form-label">人数</label>
								    <div class="layui-input-block">
								      <select name="custNum">
								        <option value="1">1 人</option>
				                        <option value="2">2 人</option>
				                        <option value="3">3 人</option>
				                        <option value="4">3+ 人</option>
								      </select>
								    </div>
								  </div>
								  
								  <div class="layui-form-item layui-form-text">
								    <label class="layui-form-label">备注</label>
								    <div class="layui-input-block">
								      <textarea placeholder="请输入内容" name="custMessage" class="layui-textarea"></textarea>
								    </div>
								  </div>
								  <div class="layui-form-item">
								    <div class="layui-input-block">
								      <button class="layui-btn" type="button" id="add_appointment_btn">预约</button>
								      <button type="reset" id="addAppointReset" class="layui-btn layui-btn-primary">重置</button>
								    </div>
								  </div>
								</form>	


							</div>
					    </div>
					</div>
				</div>
			</div>
			<!-- /# container-fluid -->
		</div>
		<!-- /# main -->
	</div>
</div>
<!-- /# content wrap -->
<script src="${APP_PATH}/static/assets/js/lib/jquery.min.js"></script>
<!-- jquery vendor -->
<script
	src="${APP_PATH}/static/assets/js/lib/jquery.nanoscroller.min.js"></script>
<!-- nano scroller -->
<script src="${APP_PATH}/static/assets/js/lib/sidebar.js"></script>
<!-- sidebar -->
<script src="${APP_PATH}/static/assets/js/lib/bootstrap.min.js"></script>

<!-- bootstrap -->
<script src="${APP_PATH}/static/assets/js/lib/mmc-common.js"></script>
<script src="${APP_PATH}/static/assets/js/scripts.js"></script>
<script src="${APP_PATH}/static/layui/layui.all.js"></script>
</body>
<script type="text/javascript">
	$("#add_appointment_btn").click(function(){
		var varreg  = /^\d{7,11}$/;
		var phone = $("#addApponitPhone").val();
		if(!varreg.test(phone)){
			layer.msg("请正确输入号码！",{icon:5});
			return;
		}
		var data = $("#addApointmentForm").serialize();
		$.ajax({
			url:"${APP_PATH}/appointment/addAppointment",
			method:"POST",
			data:data,
			success:function(res){
				if(res.code==100){
					layer.msg(res.extend.msg,{icon:6},function(){
						$("#addAppointReset").click();
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
	    ,min: 0
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
</script>
</html>