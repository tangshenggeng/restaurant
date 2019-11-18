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
										<h4>有效预约</h4>
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
										

										<button type="button" id="delOneAppoint" class="btn btn-danger">删除</button>
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
<div style="display: none;" id="changeAppointModal">
	<div class="layui-card">
		<div class="layui-card-body">
			  <form class="layui-form" id="changeAppointFormModal"> 
			  <input type="hidden" name="appointmentId" id="appointIdModal">
				<div class="row col-lg-6">
				<div class="layui-form-item">
					  <label class="layui-form-label">称呼</label>
					  <div class="layui-input-block ">
					    <input name="custName" type="text" id="appointNameModal" placeholder="请输入预约人的称呼" autocomplete="off" class="layui-input">
					  </div>
				</div>
				<div class="layui-form-item">
				    <label class="layui-form-label">日期</label>
				    <div class="layui-input-block">
				      <input type="text" name="appointmentDate" class="layui-input" placeholder="请选择日期" id="changeDate">
				    </div>
				</div>
				
				<div class="layui-form-item">
					    <label class="layui-form-label">时间</label>
					    <div class="layui-input-block">
					      <input type="text" class="layui-input" name="appointmentTime" placeholder="请选择时间" id="changeTime">
					    </div>
					</div>
				</div>
				
				<div class="row col-lg-6">
					<div class="layui-form-item" >
						  <label class="layui-form-label">人数</label>
						  <div class="layui-input-block">
						      <input type="text" id="appointNumModal" name="custNum" placeholder="请输入人数" autocomplete="off" class="layui-input">
						  </div>
					</div>
					<div class="layui-form-item">
					  <label class="layui-form-label">电话</label>
					  <div class="layui-input-block ">
					    <input type="text" id="appointphoneModal" name="custPhone" placeholder="请输入预约人的电话" autocomplete="off" class="layui-input">
					  </div>
					</div>
					
					
				</div>
				<div class="row col-lg-12">
					<div class="layui-form-item">
					  <label class="layui-form-label">备注</label>
					  <div class="layui-input-block ">
					    <textarea id="appointCustMsgModal" name="custMessage" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
					  </div>
				</div>
				</div>
				<div class="layui-form-item">
				  <div class="layui-input-block">
				    <button class="layui-btn" type="button" id="changeAppointBtnModal"> 修改</button>
				  </div>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- 结算 -->
<div style="display: none;" id="delAppointModal">
	<div class="layui-card"><br>
		<div class="layui-card-header">
			<button type="button" class="btn btn-warning m-l-10 m-b-10">预约客户默认打九八折</button>
		</div>
		<div class="layui-card-body">
			<form>
			  	<input type="hidden" id="appointDelModalId"/>
				<div class="form-group">
	                <div class="input-group input-group-rounded">
	                    <input type="text" id="consumeMoneyModalInput" placeholder="请输入消费金额" class="form-control">
	                    <span class="input-group-btn"><button class="btn btn-primary btn-group-right" id="consumeMoneyBtn" type="button"><i class="ti-reload"></i></button></span>
	                </div>
	            </div>
				<div class="form-group" id="afterMoneyInput" hidden="hidden">
					<label class="col-sm-3 control-label">结算后的金额</label>
	                <div class="input-group input-group-rounded">
	                    <input type="text" disabled="disabled" placeholder="结算后的金额" id="afterMoneyModalInput" class="form-control">
	                </div>
	                <br>
	                <button type="button" id="determineBtn"  class="btn btn-success m-b-10 m-l-5">确认结算</button>
	            	<button type="reset" id="resetModalForm" hidden="hidden">重置</button>
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
				,id: 'idValidAppoint'
				,processData : false
				,contentType : "application/json"//必须指定，否则会报415错误
			    ,where: {
			    	name : appointName,
			    	phone : appointPhone,
			    	num :appointNum,
			    	date : appointDate
			    }
			    ,cols: [[ //表头
			      {field: 'appointmentId',title: '#',type:"radio",rowspan:2,align:"center"}
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
			  table.on('tool(validAppointListTBFilter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  console.log(data)
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				  if(layEvent === 'edit'){ //修改
					  var is_arrival = data.isArrival;
				  	  if(is_arrival == "100"){
				  		  layer.msg("该顾客已经到来,不支持修改！",{icon:5})
				  		  return;
				  	  }
					  $("#appointNameModal").val(data.custName);
					  $("#appointphoneModal").val(data.custPhone);
					  $("#appointCustMsgModal").val(data.custMessage);
					  $("#changeDate").val(data.appointmentDate);
					  $("#changeTime").val(data.appointmentTime);
					  $("#appointIdModal").val(data.appointmentId);
					  if(data.custNum == 4){
						  $("#appointNumModal").val("3+人");
					  }else{
						  $("#appointNumModal").val(data.custNum+"人");
					  }
					  var index = layer.open({
							title : '修改预约信息',
							fix : true,
							resize :false,
							move: false,
							area:["630px","450px"],
							zIndex : 500,
							shadeClose : false,
							shade : 0.4,
							anim: 1,
							type : 1,
							content : $('#changeAppointModal')
						});
				  } else if(layEvent === 'del'){ //结算
					  $("#appointDelModalId").val(data.appointmentId)
					  $("#resetModalForm").click();
					  var is_arrival = data.isArrival;
				  	  if(is_arrival == "200"){
				  		  layer.msg("该顾客还未到来,不支持结算！",{icon:5})
				  		  return;
				  	  }
					  var index = layer.open({
							title : '结算',
							fix : true,
							resize :false,
							move: false,
							area:["600px","350px"],
							zIndex : 500,
							shadeClose : false,
							shade : 0.4,
							anim: 1,
							type : 1,
							content : $('#delAppointModal')
						});
				  }else if(layEvent === 'arrival'){ //到来
					  var is_arrival = data.isArrival;
				  	  if(is_arrival == "100"){
				  		  layer.msg("该顾客已经到来",{icon:5})
				  		  return;
				  	  }
					  layer.confirm('确认顾客到来了吗？', function(index){
					      //向服务端发送删除指令
					      $.ajax({
					    	  url:"${APP_PATH}/appointment/changeCustArrival?id="+data.appointmentId,
					    	  method:"get",
					    	  success:function(res){
					    		  if(res.code == 100 ){
					    			  layer.msg(res.extend.msg,{icon:6},function(){
					    				  renderValidAppointTb();
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
	//转换金额
	$("#consumeMoneyBtn").click(function(){
		
		layui.use('layer', function(){
		  var layer = layui.layer;
		  var consumeMoney =  $("#consumeMoneyModalInput").val();
		  var validNum = /^[0-9]+(.[0-9]{2})?$/;
		  if(!validNum.test(consumeMoney)){
				layer.msg("请输入正确的金额",{icon:5})
				return;
		  }
		  var realMoney = consumeMoney * 0.98;
		  $("#afterMoneyModalInput").val(realMoney)
		  $("#afterMoneyInput").removeAttr("hidden")
		})
	});
	//结算
	$("#determineBtn").click(function(){
		var id = $("#appointDelModalId").val()
		layui.use('layer', function(){
			var layer = layui.layer;
			layer.confirm('确定结算？', function(index){
			      //向服务端发送删除指令
			      $.ajax({
			    	  url:"${APP_PATH}/appointment/determinAppoint?id="+id,
			    	  method:"get",
			    	  success:function(res){
			    		  if(res.code == 100 ){
			    			  layer.msg(res.extend.msg,{icon:6},function(){
			    				  renderValidAppointTb();
			    				  layer.closeAll();
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
		})
	});
	
	//修改
	$("#changeAppointBtnModal").click(function(){
		layui.use('layer', function(){
			  var layer = layui.layer;
			  var oldNum = $("#appointNumModal").val();
			  var vali = /^[0-9]*$/;
			  if(!vali.test(oldNum)){
				  layer.msg("请正确数字，后面不要有中文和+！",{icon:5});
				  return;
			  }
			  var varreg  = /^\d{7,11}$/;
			  var phone = $("#appointphoneModal").val();
			  if(!varreg.test(phone)){
				layer.msg("请正确输入号码！",{icon:5});
				return;
			  }
			  var data = $("#changeAppointFormModal").serialize();
			  $.ajax({
				  url:"${APP_PATH}/appointment/changeAppointInfo",
				  method:"POST",
				  data:data,
				  success:function(res){
					 if(res.code == 100){
						 layer.msg(res.extend.msg,{icon:6},function(){
							 renderValidAppointTb();
							 layer.closeAll();
						 }); 
					 } else{
						layer.msg(res.extend.msg,{icon:5}); 
					 }
				  },error:function(){
					  layer.msg("系统错误！",{icon:5});  
				  }
				  
			  });
		})
	});
	//删除
	$("#delOneAppoint").click(function(){
		layui.use(['table','layer'], function(){
		  var table = layui.table;
		  var layer = layui.layer;
		  var checkStatus = table.checkStatus('idValidAppoint'); //idTest 即为基础参数 id 对应的值
		  var data = checkStatus.data[0]
		  var id = data.appointmentId;
		  if(data.isArrival == "100"){
			  layer.msg("该顾客已经到来，不能删除！",{icon:5})
	  		  return;
		  }
		  
		  layer.confirm('确认删除预约吗？', function(index){
			$.ajax({ 
				url:"${APP_PATH}/appointment/determinAppoint?id="+id,  
				method:"get",
		    	  success:function(res){
		    		  if(res.code == 100 ){
		    			  layer.msg(res.extend.msg,{icon:6},function(){
		    				  location.reload()
		    			  });
		    		  }else{
		    			  layer.msg(res.extend.msg,{icon:5});  
		    		  }
		    	  },error:function(){
		    		  console.log("系统出错！")
		    	  }  
			})				  
		  })	
		})
	});
	
	//筛选
	$("#screeAppointBtn").click(function(){
		var appointPhone = $("#kwAppointphone").val();
		var varreg  = /^\d{0,11}$/;
		if(!varreg.test(appointPhone)){
			layer.msg("请正确输入号码！",{icon:5});
			return;
		}
		renderValidAppointTb();
	});
	//日期选择
	layui.use('laydate', function(){
		  var laydate = layui.laydate;
		  //执行一个laydate实例
		  laydate.render({
		    elem: '#changeDate'
		    ,eventElem: '#changeDate'//点击事件绑定
		    ,trigger: 'click'
		    ,min: 1
		    ,max: 14
		    ,showBottom: false
		  });
		  
		  laydate.render({
			    elem: '#changeTime'
			    ,type: 'time'
			    ,min: '08:00:00'
			    ,max: '22:00:00'
			    ,trigger: 'click'
			    ,btns: ['clear', 'confirm']
			  });
		});	
	
	
</script>
<script type="text/html" id="barDemo">
<button type="button" class="btn btn-warning btn-xs btn-outline" lay-event="edit">修改</button>
<button type="button" class="btn btn-warning btn-xs btn-outline" lay-event="arrival">到来</button>
<button type="button" class="btn btn-danger btn-xs btn-outline" lay-event="del">结算</button>
</script>
</body>

</html>