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
                                    <li class="active">主页</li>
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
									<form id="getFeedByConditionForm">
										<div class="layui-form-item ">
											<div class="col-lg-3">
												<div class="form-group">
													<label>反馈分类：</label> 
													<select class="form-control" name="feedbackSortId" id="sortAfterSel">
														<option value="0">---请选择---</option>
														<option v-for="item in sort" :value="item.feedbackSortId">{{item.sortName}}</option>
													</select>
												</div>
											</div>
											<div class="col-lg-3">
												<div class="form-group">
													<label>紧急性：</label><br>
													<div class="el-radio">
														<span class="margin-r">普通</span> <input
															type="radio" name="feedbackSerious" class="feedbackSeriousInput" id="1_5"  value="0">
														<label class="el-radio-style" for="1_5"></label>&nbsp;&nbsp;&nbsp;&nbsp;
														<span class="margin-r">紧急</span> <input
															type="radio" name="feedbackSerious" class="feedbackSeriousInput" id="1_4" value="1">
														<label class="el-radio-style" for="1_4"></label>
													</div>
												</div>
												
											</div>
										</div>
										<div class="layui-form-item">
											<div class="layui-input-inline">
											<button type="button" id="getFeedByConditionBtn" class="btn btn-success btn-outline btn-rounded m-b-10 m-l-5">筛选</button>
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
                                    <h4>反馈信息</h4>
									<div class="card-header-right-icon">
										<ul>
											<li class="card-close" data-dismiss="alert"><i class="ti-email"></i></li>
											<li class="card-option drop-menu"><i class="ti-settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="link"></i>
												<ul class="card-option-dropdown dropdown-menu">
													<li><a href="#"><i class="ti-loop"></i> Update data</a></li>
													<li><a href="#"><i class="ti-menu-alt"></i> Detail log</a></li>
													<li><a href="#"><i class="ti-pulse"></i> Statistics</a></li>
													<li><a href="#"><i class="ti-power-off"></i> Clear ist</a></li>
												</ul>
											</li>
											 
										</ul>
									</div>
                                </div>
                                <div class="card-body">
                                    <table id="feedBackTbAfterSolve" class="table table-responsive table-hover" lay-filter="feedBackTBFilter">
                                        
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
		layui.use(['table','form'], function(){
			  var sortId = $("#sortAfterSel").val();
			  var serious = $(".feedbackSeriousInput:checked").val();
			  var table = layui.table;
			  var form = layui.form;
			  //第一个实例
			  table.render({
			    elem: '#feedBackTbAfterSolve'
			    ,height: 312
			    ,url: '${APP_PATH}/feedBack/getAlreadySolvedFeedList' //数据接口
			    ,page: true //开启分页
			    ,method : "POST"
				,dataType : 'json'
				,processData : false
				,contentType : "application/json"//必须指定，否则会报415错误
			    ,where: {
			    	solved:1,
			    	sortId : sortId,
			    	serious:serious
			    }
			    ,cols: [[ //表头
			      {field: 'feedbackId', title: '#',hide:true,rowspan:2,align:"center"}
			      ,{field: 'feedbackCustName', title: '反馈人称呼',rowspan:2,align:"center"}
			      ,{field: 'feedbackCustEmail', title: 'Email',rowspan:2,align:"center"}
			      ,{title: '反馈状态',colspan:2,align:"center"}
			      ,{field: 'createTime', title: '反馈时间',rowspan:2,align:"center"}
			      ,{fixed: 'right', title: '操作',width:150,width:200, align:'center', toolbar: '#barDemo',rowspan:2,align:"center"}
			    ],
			    [
		    	   {field: 'feedbackSerious',align:"center", style:"color: orange;", title: '紧急性',templet: function(d){
			    	  return d.feedbackSerious == false?"普通":"紧急"
			      	}}
			      ,{field: 'feedIsDel',align:"center", style:"color: red;",title: '是否解决',templet: function(d){
			    	  return d.feedIsDel == true?"待解决":"已解决"
			      	}}
			    ]
			    ]
			    ,text: {
			        none: '暂时没有需要处理的留言'
			    }
			    ,skin: 'line' //行边框风格
			    ,size: 'lg'
			  	,parseData: function(res){ //res 即为原始返回的数据
			  		console.log(res)
				    return {
				      "code": res.status, //解析接口状态
				      "msg": res.message, //解析提示文本
				      "count": res.total, //解析数据长度
				      "data": res.data //解析数据列表
				    };
				  }
			  });
			  table.on('tool(feedBackTBFilter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				 
				  if(layEvent === 'detail'){ //查看
					  $("#feedText").html(data.feedbackText);
					  var index = layer.open({
							title : '反馈内容',
							fix : true,
							resize :false,
							move: false,
							zIndex : 500,
							shadeClose : true,
							shade : 0.4,
							type : 1,
							content : $('#detailFeedBlackModal')
						});
				  } else if(layEvent === 'solveFeedBack'){ //解决
					  
					  if(data.feedbackSortId==0){
						  layer.msg("请先在“修改”里面选择反馈分类！",{icon: 2});
						  return;
					  }
					var id=data.feedbackId;
				    layer.confirm('确认已经解决了吗？', function(index){
				      $.ajax({
				    	  url:"${APP_PATH}/feedBack/solveFeedBack?id="+id,
				    	  method:"GET",
				    	  success:function(res){
				    		  if(res.code==100){
				    			  layer.msg(res.extend.msg,{icon: 1},function(){
				    				  reloadTable();
				    			  }); 
				    		  }
				    	  },error:function(){
				    		  layer.msg("确认解决失败！系统出错！",{icon: 2});
				    	  }
				      });
				      layer.close(index);
				    });
				  } else if(layEvent === 'edit'){ //编辑
					  $("#feedBackIdModal").val(data.feedbackId);
				  	  var sortId = data.feedbackSortId
				  	  $("#sortModalSel > option").each(function(){
				  		 var va = $(this).val()
				  		  if(va == sortId){
				  			$(this).attr("selected","selected") 
				  		  }
				  	  });	
					  var index = layer.open({
							title : '反馈内容',
							fix : true,
							resize :false,
							move: false,
							area:["600px","300px"],
							zIndex : 500,
							shadeClose : true,
							shade : 0.4,
							type : 1,
							content : $('#editFeedBlackModal')
						});
					  
				  } else if(layEvent === 'LAYTABLE_TIPS'){
				    layer.alert('Hi，头部工具栏扩展的右侧图标。');
				  }
				});
			});
	}
	$("#getFeedByConditionBtn").click(function(){
		renderTb();
	});
	
	var sortAfterSel = new Vue({
		el:"#sortAfterSel",
		data:{
			sort:[]
		},
		created: function () {
			this.$http.get("${APP_PATH}/feedBackSort/getAll").then(function(response){
				//成功
				this.sort=response.body;
			},function(response) {
				//错误
				console.log("查询反馈分类时，出现系统错误！")
			});
		}
	});
	
	//重新渲染表格
	function reloadTable(){
		layui.use('layer', function(){
			 var table = layui.table;
			 table.reload('feedBackTb', {
				   url: '${APP_PATH}/feedBack/getNoSolvedFeedList' //数据接口
				  ,where: {solved:-1} //设定异步数据接口的额外参数
			});
		})
	}
</script>
<script type="text/html" id="barDemo">
<button type="button" class="btn btn-info btn-xs btn-outline" lay-event="detail">查看</button>
<button type="button" class="btn btn-warning btn-xs btn-outline" lay-event="edit">修改</button>
<button type="button" class="btn btn-danger btn-xs btn-outline" lay-event="solveFeedBack">解决</button>
</script>
</body>

</html>