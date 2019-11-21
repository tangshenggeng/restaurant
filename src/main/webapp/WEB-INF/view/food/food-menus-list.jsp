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
    <title>项遇您后台主页</title>
    <!-- Styles -->
    <link href="${APP_PATH}/static/assets/fontAwesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/themify-icons.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/mmc-chat.css" rel="stylesheet" />
    <link href="${APP_PATH}/static/assets/css/lib/sidebar.css" rel="stylesheet">
    <link href="${APP_PATH}/static/assets/css/lib/bootstrap.min.css" rel="stylesheet">
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
    <%@ include file="/WEB-INF/view/common/leftNav.jsp" %>
    <!-- /# sidebar -->
    <%@ include file="/WEB-INF/view/common/header.jsp" %>
    
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
                                    <li class="active">菜单管理</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <!-- /# column -->
                </div>
                <!-- /# row -->
                <div class="main-content">
                    <div class="row">
						<div class="col-lg-12">
							<div class="card">
								<div class="card-body">
									<div class="card-header">
										<h4>筛选</h4>
									</div>
									<div class="card-body">
									<br>
										<form class="layui-form"> 
											<div class="row col-lg-6">
											<div class="layui-form-item">
												  <label class="layui-form-label">菜名</label>
												  <div class="layui-input-block ">
												    <input type="text" id="kwFoodName" placeholder="请输入上新菜菜名" autocomplete="off" class="layui-input">
												  </div>
											</div>
													<div class="layui-form-item">
													  <div class="layui-inline">
													    <label class="layui-form-label" style="margin-right: 30px">现价</label>
													    <div class="layui-input-inline" style="width: 100px;">
													      <input type="text" id="price_min" placeholder="￥" autocomplete="off" class="layui-input">
													    </div>
													    <div class="layui-form-mid">-</div>
													    <div class="layui-input-inline" style="width: 100px;">
													      <input type="text" id="price_max" placeholder="￥" autocomplete="off" class="layui-input">
													    </div>
													  </div>
												</div>
												
											</div>
											<div class="row col-lg-6">
												<div class="layui-form-item" >
													  <label class="layui-form-label">原料</label>
													  <div class="layui-input-block">
													    <input type="text" id="kwMaterial" placeholder="请输入" autocomplete="off" class="layui-input">
													  </div>
												</div>
												<div class="layui-form-item">
												    <label class="layui-form-label">状态</label>
												    <div class="layui-input-block">
												    	 <select id="kwIsShowSel">
													      <option value="0" selected="selected">---请选择---</option>
													      <option value="100">展示</option>
													      <option value="200">隐藏</option>
													    </select>
												    </div>
												</div>
												
											</div>
											
											<div class="layui-form-item">
											  <div class="layui-input-block">
											    <button class="layui-btn" type="button" id="screeFoodBtn"> 筛选</button>
											    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
											  </div>
											</div>
										</form>
								</div>
							</div>
						</div>
					</div>
                    <div class="row">
                    	<div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4>菜单管理</h4>
                                </div>
                                <div class="card-body">
                                    <table id="foodMenusListTb" class="table table-responsive table-hover" lay-filter="foodMenusListTBFilter">
                                        
                                    </table>
                                </div>
							</div>
                        </div>
                    </div>
                    
                    
                    <!-- /# row -->
         <!-- /# row -->     </div>
 </div>
 <!-- /# container-fluid -->
</div>
<!-- /# main -->
</div>
<!-- /# content wrap -->
<!-- 模态框 -->
<!-- 改变展示状态 -->
<div style="display: none;" id="showFoodMenusModal">
	
	<form>
		<input type="hidden" class="foodMenusId"/>
		<div class="form-group" style="margin: 20px 100px">
		    <label>修改展示状态</label>
		    <select class="form-control" id="isShowModal">
		        <option value="100">展示</option>
		        <option value="200">隐藏</option>
		    </select>
		    <br>
		    <button type="button" id="changeIsShowBtn" class="btn btn-pink m-b-10 m-l-5">修改</button>
		</div>
	</form>
</div>
<!-- 修改信息 -->
<div style="display: none;" id="changeFoodMenusInfoModal">
		<div class="row" style="width: 700px">
			<form class="layui-form " style="margin-top: 5px" id="changeFoodMenusForm"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
			  <input type="hidden" class="foodMenusId" name="menuId"/>
			  <div class="layui-form-item">
			    <label class="layui-form-label">菜名</label>
			    <div class="layui-input-block">
			      <input type="text" name="foodName" id="oldFoodName" placeholder="请输入菜名" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item layui-form-text">
			    <label class="layui-form-label">原料</label>
			    <div class="layui-input-block">
			    	<input type="text" name="foodMaterial" id="oldMater" placeholder="请输入原料（用 - 隔开）" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">原价</label>
			    <div class="layui-input-block">
			      <input type="number" name="oldPrice" id="beforeOldPrice" placeholder="请输入价格" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <div class="layui-form-item">
			    <label class="layui-form-label">现价</label>
			    <div class="layui-input-block">
			      <input type="number" name="newPrice" id="beforeNewPrice" placeholder="请输入价格" autocomplete="off" class="layui-input">
			    </div>
			  </div>
			  <input type="hidden" id="imgNewFoodPath" name="foodImg"/>
			  <button type="reset" id="realResetBtn" hidden="hidden">重置</button>
			</form>	
			<div class="row col-lg-8">
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
			  </div>
			  <div class="row col-lg-4">
			  	<label>原图：</label>
			  	<img class="layui-upload-img"  style="width: 300px;height: 300px;" id="oldFoodImg">
			  </div>
			<div class="layui-form-item">
			    <div class="layui-input-block">
			      <button class="layui-btn" type="button" id="change_food_menus_btn">提交</button>
			      <button type="button" id="notRealReset" class="layui-btn layui-btn-primary">重置</button>
			    </div>
			  </div>
	</div>
	</div>
</div>
<script src="${APP_PATH}/static/assets/js/lib/jquery.min.js"></script>
<!-- jquery vendor -->
<script src="${APP_PATH}/static/assets/js/lib/jquery.nanoscroller.min.js"></script>
<!-- nano scroller -->
<script src="${APP_PATH}/static/assets/js/lib/sidebar.js"></script>
<!-- sidebar -->
<script src="${APP_PATH}/static/assets/js/lib/bootstrap.min.js"></script>
<!-- bootstrap -->
<script src="${APP_PATH}/static/assets/js/lib/mmc-common.js"></script>
<script src="${APP_PATH}/static/assets/js/scripts.js"></script>
<script src="${APP_PATH}/static/layui/layui.all.js"></script>

<!-- scripit init-->
<script>
	$(function(){
		renderTb();
	});
	function renderTb(){
		layui.use(['table','form','layer'], function(){
			  var table = layui.table;
			  var form = layui.form;
			  var layer = layui.layer;
			  var kwFoodName = $("#kwFoodName").val();
			  var price_min = $("#price_min").val();
			  var price_max = $("#price_max").val();
			  var kwIsShow = $("#kwIsShowSel").val();
			  var kwFoodMaterial = $("#kwMaterial").val();
			  //第一个实例
			  table.render({
			    elem: '#foodMenusListTb'
			    ,height: 600
			    ,url: '${APP_PATH}/foodMenus/getFoodMenusList' //数据接口
			    ,page: true //开启分页
			    ,method : "POST"
				,dataType : 'json'
				,processData : false
				,contentType : "application/json"//必须指定，否则会报415错误
			    ,where: {
			    	foodName : kwFoodName,
			    	priceMin : price_min,
			    	priceMax : price_max,
			    	isShow : kwIsShow,
			    	foodMaterial : kwFoodMaterial,
			    }
			    ,cols: [[ //表头
			      {field: 'newFoodId', title: '#',hide:true,align:"center"}
			      ,{field: 'foodName', title: '美食名',align:"center"}
			      ,{field: 'foodImg', title: '图片',align:"center",templet: function(d){
			          return '<img style="width: 50px;height: 50px;" alt="美食图片" src="'+d.foodImg+'">'
			      }}
			      ,{field: 'oldPrice', title: '原价（￥）',align:"center",style:"color:orange"}
			      ,{field: 'newPrice', title: '现价（￥）',align:"center",style:"color:red"}
			      ,{field: 'foodMaterial', title: '描述',align:"center"}
			      ,{field: 'isShow', title: '状态',align:"center",style:"color:#00838F",templet: function(d){
			    	  return d.isShow==100?"展示":"隐藏";
			      }}
			      ,{fixed: 'right', title: '操作', toolbar: '#barDemo',align:"center"}
			    ]]
			    ,text: {
			        none: '暂无相关数据'
			    }
			    ,skin: 'line' //行边框风格
			    ,size: 'lg'
			  	,parseData: function(res){ //res 即为原始返回的数据
			  		console.log(res.data)
				    return {
				      "code": res.status, //解析接口状态
				      "msg": res.message, //解析提示文本
				      "count": res.total, //解析数据长度
				      "data": res.data //解析数据列表
				    };
				  }
			  });
			  table.on('tool(foodMenusListTBFilter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  $("#isShowModal option").each(function(){
				  	$(this).attr("selected", false);  
				  });
				  var data = obj.data; //获得当前行数据
				  console.log(data)
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				  if(layEvent === 'show'){ //解决
				  	  $("#isShowModal option").each(function(){
				  		  var ele = $(this).val();
				  		  if(ele == data.isShow){
				  			 $(this).attr("selected", true);  
				  		  }
				  	  });
				  	$(".foodMenusId").val(data.menuId)
				  	var index = layer.open({
						title : '是否展示',
						fix : true,
						resize :false,
						move: false,
						area:["500px","250px"],
						zIndex : 500,
						shadeClose : true,
						shade : 0.4,
						type : 1,
						content : $('#showFoodMenusModal')
					});
				  } else if(layEvent === 'edit'){ //查看
					  $("#oldFoodImg").attr("src",data.foodImg);
				  	  $("#oldMater").val(data.foodMaterial)
				  	  $("#beforeOldPrice").val(data.oldPrice)
				  	  $("#beforeNewPrice").val(data.newPrice)
				  	  $("#oldFoodName").val(data.foodName)
				  	  $(".foodMenusId").val(data.menuId)
				  	  $("#imgNewFoodPath").val(data.foodImg)
					  var index = layer.open({
							title : '新品信息',
							fix : true,
							resize :false,
							move: false,
							area:["750px","650px"],
							zIndex : 500,
							shadeClose : true,
							shade : 0.4,
							type : 1,
							content : $('#changeFoodMenusInfoModal')
						});
				  }else if(layEvent === 'del'){
					  var id = data.menuId;
					  layer.confirm('真的删除行么', function(index){
					      obj.del(); 
					      layer.close(index);
					      $.ajax({
					    	 url:"${APP_PATH}/foodMenus/delFoodMenus?id="+id,
					    	 method:"get",
				    		 success:function(res){
								  if(res.code==100){
									  layer.msg(res.extend.msg,{icon:6})
								  }else{
									  layer.msg(res.extend.msg,{icon:5})
								  }
							  },error:function(){
								  layer.msg("删除失败，系统错误！",{icon:5})
							  }
					      });
					    });
				  }else if(layEvent === 'LAYTABLE_TIPS'){
				  
				    layer.alert('Hi，头部工具栏扩展的右侧图标。');
				  }
				});
			});
	}
	$("#screeFoodBtn").click(function(){
		renderTb();
	});
	layui.use(['upload','layer','form'], function(){
		 var $ = layui.jquery
		 ,upload = layui.upload
		 ,layer = layui.layer
		 ,form = layui.form;
		 var uploadInst = upload.render({
		    elem: '#uploadFoodImg'
		    ,url: '${APP_PATH}/foodMenus/uploadNewFoodImg'
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
	$("#changeIsShowBtn").click(function(){
		var id = $(".foodMenusId").val()
		var isShow = $("#isShowModal").val()
	    $.ajax({
		  url:"${APP_PATH}/foodMenus/changeFoodMenusShow?id="+id+"&isShow="+isShow,
		  method:"get",
		  success:function(res){
			  if(res.code==100){
				  layer.msg(res.extend.msg,{icon:6},function(){
					  renderTb();
					  layer.closeAll();
				  })
			  }else{
				  layer.msg(res.extend.msg,{icon:5})
			  }
		  },error:function(){
			  layer.msg("展示失败，系统错误！",{icon:5})
		  }
	   });
	});
	//修改信息
	$("#change_food_menus_btn").click(function(){
		$("#previewImg").attr("src","")
		var data = $("#changeFoodMenusForm").serialize(); 
		layui.use(['layer','form'], function(){
			 layer = layui.layer
			 ,form = layui.form;
			$.ajax({
				url:"${APP_PATH}/foodMenus/changeFoodMenusInfo",
				method:"POST",
				data:data,
				success:function(res){
					console.log(res);
					if(res.code==100){
						layer.msg(res.extend.msg,{icon:6},function(){
							renderTb();
							layer.closeAll();
						})
					}else{
						layer.msg(res.extend.msg,{icon:5});
					}
				},error:function(){
					layer.msg("系统错误！",{icon:5});
				}
			});
		});
	});

	
	
</script>
<script type="text/html" id="barDemo">
<button type="button" class="btn btn-warning btn-xs btn-outline" lay-event="edit">修改</button>
<button type="button" class="btn btn-danger btn-xs btn-outline" lay-event="show">状态</button>
<button type="button" class="btn btn-danger btn-xs btn-outline" lay-event="del">删除</button>
</script>
</body>

</html>