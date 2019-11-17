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
									<li class="active">有效预约</li>
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
										<h4>反馈分类</h4>
									</div>
									<div class="card-body">
									<br>
										<form class="layui-form"> 
											<div class="row col-lg-6">
											<div class="layui-form-item">
												  <label class="layui-form-label">称呼</label>
												  <div class="layui-input-block ">
												    <input type="text" id="kwAppointName" placeholder="请输入预约人的称呼" autocomplete="off" class="layui-input">
												  </div>
											</div>
											<div class="layui-form-item">
												  <label class="layui-form-label">电话</label>
												  <div class="layui-input-block ">
												    <input type="text" id="kwAppointphone" placeholder="请输入预约人的电话" autocomplete="off" class="layui-input">
												  </div>
											</div>
											</div>
											<div class="row col-lg-6">
												<div class="layui-form-item" >
													  <label class="layui-form-label">人数</label>
													  <div class="layui-input-block">
													    <select id="kwAppointNum">
													      <option value="0">---请选择---</option>
													      <option value="1">1 人</option>
													      <option value="2">2 人</option>
													      <option value="3">3 人</option>
													      <option value="4">3+ 人</option>
													    </select>
													  </div>
												</div>
												<div class="layui-form-item">
												    <label class="layui-form-label">时间</label>
												    <div class="layui-input-block">
												      <input type="radio" name="today" id="kwAppointDate"  title="今天">
												    </div>
												</div>
											</div>
											
											<div class="layui-form-item">
											  <div class="layui-input-block">
											    <button class="layui-btn" type="button" id="screeAppointBtn"> 筛选</button>
											    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
											  </div>
											</div>
										</form>
										


										<table id="validAppointListTb"
											class="table table-responsive table-hover"
											lay-filter="validAppointListTBFilter">

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
		renderValidAppointTb();
	});
	//渲染反馈分类表
	function renderValidAppointTb(){
		var appointName = $("#kwAppointName").val();
		var appointPhone = $("#kwAppointphone").val();
		
		var appointNum = $("#kwAppointNum").val();
		
		//判断今天是否被选中
		var appointDate = "";
		if($('input[type="radio"]:checked').val()== "on"){
			appointDate = "now";
		}
		layui.use(['table','form','layer'], function(){
		  var table = layui.table;
		  var form = layui.form;
		  var layer = layui.layer;
		  table.render({
			    elem: '#validAppointListTb'
			    ,height: 400
			    ,url: '${APP_PATH}/appointment/getAllValidAppoint' //数据接口
			    ,page: true //开启分页
			    ,method : "POST"
				,dataType : 'json'
				,processData : false
				,contentType : "application/json"//必须指定，否则会报415错误
			    ,where: {
			    	name : appointName,
			    	phone : appointPhone,
			    	num :appointNum,
			    	date : appointDate
			    }
			    ,cols: [[ //表头
			      {field: 'appointmentId',hide:true,title: '#',rowspan:2,align:"center"}
			      ,{field: 'custName', title: '预约人称呼',rowspan:2,align:"center"}
			      ,{field: 'custPhone', title: '电话',rowspan:2,align:"center"}
			      ,{field: 'custNum', title: '人数',rowspan:2,style:"color: orange;",align:"center",templet: function(d){
			          return d.custNum == 4 ? "3人以上":d.custNum+"人"
			      }}
			      ,{title:"安排",colspan:2,align:"center"}
			      ,{field: 'custMessage',style:"color: #23262E;",rowspan:2, title: '备注',align:"center"}
			      ,{fixed: 'right', title: '操作',rowspan:2, toolbar: '#barDemo',align:"center"}
			    ],[
			    	 {field: 'appointmentDate',style:"color: #393D49;", title: '日期',align:"center"}
				    ,{field: 'appointmentTime',style:"color: red;", title: '时间',align:"center"}
			    ]]
			    ,text: {
			        none: '暂时没有需要处理的有效预约'
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
	$("#screeAppointBtn").click(function(){
		var appointPhone = $("#kwAppointphone").val();
		var varreg  = /^\d{0,11}$/;
		if(!varreg.test(appointPhone)){
			layer.msg("请正确输入号码！",{icon:5});
			return;
		}
		renderValidAppointTb();
	});

	
	
</script>
<script type="text/html" id="barDemo">
<button type="button" class="btn btn-warning btn-xs btn-outline" lay-event="edit">修改</button>
<button type="button" class="btn btn-danger btn-xs btn-outline" lay-event="del">删除</button>
</script>
</body>

</html>