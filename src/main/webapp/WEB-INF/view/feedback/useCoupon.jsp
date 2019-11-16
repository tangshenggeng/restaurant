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
    <title>使用优惠卷</title>
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
                                    <li class="active">使用校验码</li>
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
								<a href="index.html"><span>使用校验码</span></a>
							</div>
							<div class="login-form">
								<form>
									<div class="form-group">
										<label>请输入订单金额</label>
										<input type="number" required="required" id="numInput" class="form-control" placeholder="请输入订单金额">
									</div>
									<div class="form-group">
										<label>请输入校验码</label>
										<input type="text" required="required" id="codeInput" class="form-control" placeholder="请输入校验码">
									</div>
									<div class="sweetalert m-t-15">
                                        <button class="btn btn-warning" id="conversionBtn" type="button">提交</button>
                                        <button type="reset" hidden="hidden" id="resetBtn">重置</button>
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
<!-- 模态框 -->
<div style="display: none;" id="couponInfokModal">
		<div class="layui-card">
			<div class="layui-card-body">
				<div id="feedText">
				</div><br>
				<!-- 中间表的id -->
				<div class="form-group">
                    <h3>原价： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="label btn-primary" id="modalMoneySpan">New</span></h3>
               	</div>
				<div class="form-group">
                    <h3>优惠卷： &nbsp;&nbsp;<span class="label btn-danger" id="modalDiscountNameSpan"></span></h3>
               	</div>	
				<div class="form-group">
                    <h3>优惠价： &nbsp;&nbsp;<span class="label btn-danger" id="modalAfterMoneySpan"></span></h3>
               	</div>
               	<button class="btn btn-warning btn sweet-confirm">使用</button>
			</div>
		</div>
</div>



<script src="${APP_PATH}/static/assets/js/lib/jquery.min.js"></script>
<!-- jquery vendor -->
<script
	src="${APP_PATH}/static/assets/js/lib/jquery.nanoscroller.min.js"></script>
<!-- nano scroller -->
<script src="${APP_PATH}/static/assets/js/lib/sidebar.js"></script>
<!-- sidebar -->
<script src="${APP_PATH}/static/assets/js/lib/bootstrap.min.js"></script>

<script src="${APP_PATH}/static/assets/js/lib/sweetalert/sweetalert.min.js"></script>
<!-- bootstrap -->
<script src="${APP_PATH}/static/assets/js/lib/mmc-common.js"></script>
<script src="${APP_PATH}/static/assets/js/scripts.js"></script>
<script src="${APP_PATH}/static/layui/layui.all.js"></script>
<div class="sweet-overlay" tabindex="-1" style="opacity: -0.01; display: none;"></div>
<div class="sweet-alert hideSweetAlert" data-custom-class="" data-has-cancel-button="true" data-has-confirm-button="true" data-allow-outside-click="false" data-has-done-function="true" data-animation="pop" data-timer="null" style="display: none; margin-top: -171px; opacity: 0;"><div class="sa-icon sa-error" style="display: none;">
      <span class="sa-x-mark">
        <span class="sa-line sa-left"></span>
        <span class="sa-line sa-right"></span>
      </span>
    </div><div class="sa-icon sa-warning" style="display: block;">
      <span class="sa-body"></span>
      <span class="sa-dot"></span>
    </div><div class="sa-icon sa-info" style="display: none;"></div><div class="sa-icon sa-success" style="display: none;">
      <span class="sa-line sa-tip"></span>
      <span class="sa-line sa-long"></span>

      <div class="sa-placeholder"></div>
      <div class="sa-fix"></div>
    </div><div class="sa-icon sa-custom" style="display: none;"></div><h2>Are you sure to delete ?</h2>
    <p style="display: block;">You will not be able to recover this imaginary file !!</p>
    <fieldset>
      <input type="text" tabindex="3" placeholder="">
      <div class="sa-input-error"></div>
    </fieldset><div class="sa-error-container">
      <div class="icon">!</div>
      <p>Not valid!</p>
    </div><div class="sa-button-container">
      <button class="cancel" tabindex="2" style="display: inline-block; box-shadow: none;">取消</button>
      <div class="sa-confirm-button-container">
        <button class="confirm" tabindex="1" style="display: inline-block; background-color: rgb(221, 107, 85); box-shadow: none;">Yes, delete it !!</button><div class="la-ball-fall">
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
    </div></div>
</body>
<script type="text/javascript">
$("#conversionBtn").click(function(){
	layui.use('layer', function(){
		 var layer = layui.layer;
		 var money = $("#numInput").val();
		 var code = $("#codeInput").val();
			$.ajax({
				url:"${APP_PATH}/discount/useDiscountByCode?money="+money+"&code="+code,
				method:"get",
				success:function(res){
					console.log(res)
					if(res.code==100){
						$("#modalMoneySpan").text("￥"+money)
						$("#modalDiscountNameSpan").text(res.extend.discountName)
						$("#modalAfterMoneySpan").text("￥"+res.extend.afterMoney)
						var index = layer.open({
							title : '优惠卷明细',
							fix : true,
							resize :false,
							move: false,
							area:["600px","300px"],
							zIndex : 500,
							shadeClose : false,
							shade : 0.4,
							type : 1,
							content : $('#couponInfokModal')
						});
					}else{
						layer.msg(res.extend.msg,{icon:2})
					}
				},error:function(){
					layer.msg("系统出错！可能是没有输入校验码或订单金额",{icon:5});
				}
			});
		});	
	});
document.querySelector('.sweet-confirm').onclick = function(){
	var code = $("#codeInput").val();
	console.log(code)
    swal({
            title: "确定要使用吗？",
            text: "一旦使用便失效了！",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            closeOnConfirm: false
        },
        function(){
        	layui.use('layer', function(){
       		var layer = layui.layer;
       		 $.ajax({
       			 url:"${APP_PATH}/discount/userDiscountByCode?code="+code,
       			 method:"get",
       			 success:function(res){
       				 if(res.code=100){
       					layer.closeAll();
       		            swal({
       			           	title: "使用成功！",
       			            text: "",
       			            type: "success",
       			            confirmButtonText: "返回",
       		            });
       		            $("#resetBtn").click();
       				 }else{
       					 layer.msg(res.extend.msg,{icon:5});
       				 }
       			 },error:function(){
       				 layer.msg("系统错误！",{icon:5})
       			 }
       		 });
        	})
        });
};
</script>
</html>