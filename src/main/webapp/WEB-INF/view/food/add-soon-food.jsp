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
    <title>添加推新</title>
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
                                    <li class="active">添加推新</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
			<!-- /# row -->
			<div class="main-content">
				<div class="row" style="background-color: #00838F;">
					<div class="col-lg-2"></div>
					<div class="col-lg-8">
						<div class="login-content" style="margin: 20px 0;">
							<div class="login-logo">
								<a href="#"><span>即将推出</span></a>
							</div>
							<div class="login-form">
								<form class="layui-form " id="addSoonFoodForm"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
								  <div class="layui-form-item">
								    <label class="layui-form-label">菜名</label>
								    <div class="layui-input-block">
								      <input type="text" name="foodName" placeholder="请输入菜名" autocomplete="off" class="layui-input">
								    </div>
								  </div>
								  <div class="layui-form-item">
								    <label class="layui-form-label">日期</label>
								    <div class="layui-input-block">
								      <input type="text" name="formTime" class="layui-input" id="test1" placeholder="请上市日期">
								    </div>
								  </div>
								  <div class="layui-form-item layui-form-text">
								    <label class="layui-form-label">描述</label>
								    <div class="layui-input-block">
								      <textarea placeholder="请输入内容" name="foodDescribe" class="layui-textarea"></textarea>
								    </div>
								  </div>
								  <div class="layui-form-item layui-form-text">
								    <label class="layui-form-label">博文</label>
								    <div class="layui-input-block">
								      <textarea placeholder="请输入内容" name="foodText" rows="15" class="layui-textarea"></textarea>
								    </div>
								  </div>
								  
								  <input type="hidden" id="imgNewFoodPath" name="foodImg"/>
								  <button type="reset" id="realResetBtn" hidden="hidden">重置</button>
								</form>	
								
								<div class="layui-form-item">
								    <label class="layui-form-label">图片</label>
								    <div class="layui-input-block">
								       <div class="layui-upload">
										  <button type="button" class="layui-btn" id="uploadFoodImg">选择图片</button>
										  <div class="layui-upload-list">
										    <img class="layui-upload-img" style="width: 200px;height: 200px;" id="previewImg">
										    <p id="demoText"></p>
										  </div>
										</div>
								    </div>
								  </div>
								<div class="layui-form-item">
								    <div class="layui-input-block">
								      <button class="layui-btn" type="button" id="add_soon_food_btn">提交</button>
								      <button type="button" id="notRealReset" class="layui-btn layui-btn-primary">重置</button>
								    </div>
								  </div>
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

$("#add_soon_food_btn").click(function(){
	var data = $("#addSoonFoodForm").serialize(); 
	console.log(data)
	layui.use(['layer','form'], function(){
		 layer = layui.layer
		 ,form = layui.form;
		$.ajax({
			url:"${APP_PATH}/soonFood/addSoonFood",
			method:"POST",
			data:data,
			success:function(res){
				console.log(res);
				if(res.code==100){
					layer.msg(res.extend.msg,{icon:6},function(){
						location.reload();
					})
				}else{
					layer.msg(res.extend.msg,{icon:5});
				}
			},error:function(res){
				console.log(res)
				layer.msg("系统错误！",{icon:5});
			}
		});
	});
});


layui.use(['upload','layer','form'], function(){
	 var $ = layui.jquery
	 ,upload = layui.upload
	 ,layer = layui.layer
	 ,form = layui.form;
	 var uploadInst = upload.render({
	    elem: '#uploadFoodImg'
	    ,url: '${APP_PATH}/soonFood/uploadNewFoodImg'
	    ,accept:"images"	//指定允许上传时校验的文件类型
	    ,exts:'jpg|png|gif|bmp|jpeg'
	    ,acceptMime:'image/*' //规定打开文件选择框时，筛选出的文件类型
	    ,size:1024	//设置文件最大可允许上传的大小，单位 KB。
	    ,field:"file"
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	        $('#previewImg').attr('src', result); //图片链接（base64）
	      });
	    }
	    ,done: function(res){
	      //如果上传失败
	      if(res.code > 0){
	        return layer.msg(res.msg,{icon:6});
	      }
	      //上传成功
	      console.log(res.data)
	      $("#imgNewFoodPath").val(res.data);
	      return layer.msg(res.msg,{icon:6});
	      
	    }
	    ,error: function(){
	      //演示失败状态，并实现重传
	      var demoText = $('#demoText');
	      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
	      demoText.find('.demo-reload').on('click', function(){
	        uploadInst.upload();
	      });
	    }
	  });
})
//点击重置
$("#notRealReset").click(function(){
	$("#realResetBtn").click();
});
layui.use('laydate', function(){
	  var laydate = layui.laydate;
	  //执行一个laydate实例
	  laydate.render({
	    elem: '#test1'
	    ,eventElem: '#test1'
	    ,trigger: 'click'
	    ,min: 0
	    ,showBottom: false
	  });
});	


</script>
</html>