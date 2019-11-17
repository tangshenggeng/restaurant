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
									<li class="active">反馈分类和优惠卷</li>
								</ol>
							</div>
						</div>
					</div>
					<!-- /# column -->
				</div>
				<!-- /# row -->
				<div class="main-content">
					<div class="row">
					
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<div class="card-header">
										<h4>反馈分类</h4>
									</div>
									<div class="card-body">
									<br>
										<form>
											<div class="input-group input-group-flat">
													<span class="input-group-btn">
                                                    <button class="btn btn-primary input-group-close-icon" type="reset"><i class="ti-close"></i></button>
                                                    </span>
                                                    <input type="text" class="form-control" id="sortNameInput" placeholder="输入分类名称">
                                                    <span class="input-group-btn">
                                                    <button class="btn btn-primary" id="addSortBtn" type="button"><i class="ti-plus"></i></button>
                                                    </span>
                                                </div>
										</form>
										<table id="feedSortListTb"
											class="table table-responsive table-hover"
											lay-filter="feedSortListTBFilter">

										</table>
									</div>
								</div>
							</div>
						</div>
						
						<div class="col-lg-6">
							<div class="card">
								<div class="card-body">
									<div class="card-header">
										<h4>优惠卷分类</h4>
									</div>
									<div class="card-body">
										<table id="discountSortListTb"
											class="table table-responsive table-hover"
											lay-filter="discountSortListTBFilter">

										</table>
									</div>
								</div>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 模态框 -->
<div style="display: none;" id="changeSortNameModal">
	<div class="layui-card">
		<div class="layui-card-body">
		  <form>
		  	<input type="hidden" id="changeId"/>
			<div class="form-group">
                <div class="input-group input-group-rounded">
                    <input type="text" id="sortNameModalInput" class="form-control">
                    <span class="input-group-btn"><button class="btn btn-primary btn-group-right" id="changeSortNameBtn" type="button"><i class="ti-reload"></i></button></span>
                </div>
            </div>
            
              </form>
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
		renderFeedSortTb();
		renderDiscountSortTb();
	});
	//渲染反馈分类表
	function renderFeedSortTb(){
		layui.use(['table','form','layer'], function(){
		  var table = layui.table;
		  var form = layui.form;
		  var layer = layui.layer;
		  table.render({
			    elem: '#feedSortListTb'
			    ,height: 400
			    ,url: '${APP_PATH}/feedBackSort/getFeedSortList' //数据接口
			    ,page: true //开启分页
			    ,cols: [[ //表头
			      {field: 'feedbackSortId',sort:true, title: '#',align:"center"}
			      ,{field: 'sortName', title: '分类名称',align:"center"}
			      ,{fixed: 'right', title: '操作', toolbar: '#barDemo',align:"center"}
			    ]]
			    ,text: {
			        none: '暂时没有需要处理的反馈分类'
			    }
			    ,skin: 'line' //行边框风格
			    ,size: 'lg'
			  	,parseData: function(res){ //res 即为原始返回的数据
				    return {
				      "code": res.status, //解析接口状态
				      "msg": res.message, //解析提示文本
				      "count": res.total, //解析数据长度
				      "data": res.data //解析数据列表
				    };
				  }
			  });
			  table.on('tool(feedSortListTBFilter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  console.log(data)
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				  if(layEvent === 'edit'){ //解决
					  $("#changeId").val(data.feedbackSortId);
					  $("#sortNameModalInput").val(data.sortName);
					  var index = layer.open({
							title : '修改优惠卷名称',
							fix : true,
							resize :false,
							move: false,
							area:["600px","150px"],
							zIndex : 500,
							shadeClose : false,
							shade : 0.4,
							type : 1,
							content : $('#changeSortNameModal')
						});
				  } else if(layEvent === 'del'){ //删除
					  layer.confirm('确定删除', function(index){
					      //向服务端发送删除指令
					      $.ajax({
					    	  url:"${APP_PATH}/feedBackSort/delFeedSort?id="+data.feedbackSortId,
					    	  method:"get",
					    	  success:function(res){
					    		  console.log(res)
					    		  if(res.code == 100 ){
					    			  layer.msg(res.extend.msg,{icon:6},function(){
					    				  renderFeedSortTb();
					    			  });
					    		  }else{
					    			  layer.msg(res.extend.msg,{icon:5});  
					    		  }
					    	  },error:function(){
					    		  console.log("系统出错！")
					    	  }
					    	  
					      });
					      layer.close(index);
					    });
				  }else if(layEvent === 'LAYTABLE_TIPS'){
				    layer.alert('Hi，头部工具栏扩展的右侧图标。');
				  }
				});
		});
	}
	//渲染优惠卷分类表
	function renderDiscountSortTb(){
		layui.use(['table','form','layer'], function(){
			  var table = layui.table;
			  var form = layui.form;
			  var layer = layui.layer;
			  table.render({
				    elem: '#discountSortListTb'
				    ,height: 500
				    ,url: '${APP_PATH}/discount/getDiscountList' //数据接口
				    ,page: false //开启分页
				    ,cols: [[ //表头
				      {field: 'discountId',sort:true, title: '#',align:"center"}
				      ,{field: 'discountName', title: '分类名称',align:"center"}
				      ,{field: 'discountNum', style:'color:orange',title: '折扣值',align:"center"}
				    ]]
				    ,text: {
				        none: '暂时没有需要处理的反馈分类'
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
		});
	}
	//修改反馈分类的名称
	$("#changeSortNameBtn").click(function(){
		var id= $("#changeId").val()
		var newName= $("#sortNameModalInput").val()
		$.ajax({
			url:"${APP_PATH}/feedBackSort/changeName?id="+id+"&newName="+newName,
			method:"get",
			success:function(res){
				if(res.code == 100 ){
	    			  layer.msg(res.extend.msg,{icon:6},function(){
	    				  renderFeedSortTb();
	    				  layer.closeAll();
	    			  });
	    			 
	    		  }else{
	    			  layer.msg(res.extend.msg,{icon:5});  
	    		  }
			},errror:function(){
				console.log("系统错误！")
			}
		});
	});
	//添加反馈分类
	$("#addSortBtn").click(function(){
		var sortName = $("#sortNameInput").val()
		$.ajax({
			url:"${APP_PATH}/feedBackSort/addSort?sortName="+sortName,
			method:"get",
			success:function(res){
				if(res.code == 100 ){
	    			  layer.msg(res.extend.msg,{icon:6},function(){
	    				  renderFeedSortTb();
	    			  });
	    		  }else{
	    			  layer.msg(res.extend.msg,{icon:5});  
	    		  }
			},errror:function(){
				console.log("系统错误！")
			}
		});
	});
	//添加优惠卷
	$("#addDiscountBtn").click(function(){
		var discountName = $("#addDiscountName").val()
		$.ajax({
			url:"${APP_PATH}/discount/addDiscount?discountName="+discountName,
			method:"get",
			success:function(res){
				if(res.code == 100 ){
	    			  layer.msg(res.extend.msg,{icon:6},function(){
	    				  renderFeedSortTb();
	    			  });
	    		  }else{
	    			  layer.msg(res.extend.msg,{icon:5});  
	    		  }
			},errror:function(){
				console.log("系统错误！")
			}
		});
	});
	
</script>
<script type="text/html" id="barDemo">
<button type="button" class="btn btn-warning btn-xs btn-outline" lay-event="edit">修改</button>
<button type="button" class="btn btn-danger btn-xs btn-outline" lay-event="del">删除</button>
</script>
</body>

</html>