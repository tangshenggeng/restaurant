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
                                    <li class="active">已发放优惠卷</li>
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
									<form>
										<div class="layui-form-item ">
											<div class="col-lg-6">
													<div class="input-group input-group-rounded">
														<span class="input-group-btn">
															<button class="btn btn-primary input-group-close-icon btn-group-left" type="reset">
																<i class="ti-close"></i>
															</button>
														</span> 
														<input type="text" id="kwCouponCode" class="form-control" placeholder="请输入优惠卷校验码">
														<span class="input-group-btn">
															<button class="btn btn-pink btn-group-right" id="getCouponByConditionBtn" type="button">
															 <i class="ti-search"></i>
															</button>
														</span>
													</div>
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
                                    <h4>优惠卷信息</h4>
									<div class="card-header-right-icon">
										<ul>
											<li class="card-close" id="lookTBIcon"><i class="ti-email"></i></li>
													<li class="card-option" id="reloadTBIcon"><i class="ti-loop" aria-haspopup="true" aria-expanded="true" role="link"></i>
													</li>
											
											 
										</ul>
									</div>
                                </div>
                                <div class="card-body">
                                    <table id="CouponListTb" class="table table-responsive table-hover" lay-filter="couponListTBFilter">
                                        
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
<div style="display: none;" id="feedInfoModal">
		<div class="layui-card">
			<div class="layui-card-body">
				<div id="feedText">
				</div><br>
				<div class="form-group">
                    <h4>称呼： &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="label btn-primary" id="modalFeedNameSpan">New</span></h4>
               	</div>
				<div class="form-group">
                    <h4>Email： &nbsp;&nbsp;<span class="label btn-danger" id="modalFeedEmailSpan">NEW</span></h4>
               	</div>	
				<div class="form-group">
                    <h3>反馈内容： &nbsp;&nbsp;<br><br><span class="label btn-success" id="modalFeedTextSpan">NEW</span></h3>
               	</div>	
			</div>
		</div>
</div>
<div style="display: none;" id="changeCouponModal">
		<div class="layui-card">
			<div class="layui-card-body">
			  <form>
			  	<input type="hidden" name="id" id="feedDiscountId"/>
				<div class="form-group">
                     <label>选择优惠卷</label>
                     <select class="form-control" name="discountId" id="changeCouponSel">
                         <option v-for="item in discount" :value="item.discountId">{{item.discountName}}</option>
                     </select>
                 </div>
                 <button type="button" id="changeCouponBtn" class="btn btn-pink btn-outline m-b-10 m-l-5">修改</button>
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
		renderTb();
	});
	function renderTb(){
		layui.use(['table','form','layer'], function(){
			  var kwCode = $("#kwCouponCode").val();
			  var table = layui.table;
			  var form = layui.form;
			  var layer = layui.layer;
			  //第一个实例
			  table.render({
			    elem: '#CouponListTb'
			    ,height: 600
			    ,url: '${APP_PATH}/feedDiscount/getCouponList' //数据接口
			    ,page: true //开启分页
			    ,where: {
			    	kwCouponCode : kwCode,
			    }
			    ,cols: [[ //表头
			      {field: 'id', title: '#',hide:true,align:"center"}
			      ,{field: 'discountCode', title: '校验码',align:"center"}
			      ,{field: 'isUsed', title: '使用情况',align:"center",templet: function(d){
			          return d.isUsed==true?"<span style='color:orange'>已使用</span>":"未使用"
			      }}
			      ,{field: 'giveTime', title: '发放时间',align:"center"}
			      ,{field: 'usedTime', title: '使用时间',align:"center",style:"color:red"}
			      ,{fixed: 'right', title: '操作', toolbar: '#barDemo',align:"center"}
			    ]]
			    ,text: {
			        none: '暂时没有需要处理的优惠卷条目'
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
			  table.on('tool(couponListTBFilter)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				  var data = obj.data; //获得当前行数据
				  console.log(data)
				  var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
				  var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
				  if(layEvent === 'changeCoupon'){ //解决
					  $("#feedDiscountId").val(data.id);
					  if(data.isUsed == true){
						  layer.msg("优惠卷已使用！不可查看和更改！",{icon:5})
						  return;
					  }
					  $("#changeCouponSel>option").each(function(){
						  var disId = $(this).val();
						  var discountId = data.discountId;
						  if(disId==discountId){
							  $(this).attr("selected","selected")
						  }
					  }); 
					  var index = layer.open({
							title : '修改优惠卷',
							fix : true,
							resize :false,
							move: false,
							area:["600px","300px"],
							zIndex : 500,
							shadeClose : false,
							shade : 0.4,
							type : 1,
							content : $('#changeCouponModal')
						});
				  } else if(layEvent === 'lookFeed'){ //查看
					  
				      $.ajax({
				    	  url:"${APP_PATH}/feedBack/getFeedBackById?id="+data.feedId,
				  		  method:"get",
				  		  success:function(res){
				  			  console.log(res)
				  			  if(res.code == 100){
				  				 $("#modalFeedNameSpan").text(res.extend.feedName);
				  				 $("#modalFeedEmailSpan").text(res.extend.feedEmail);
				  				 $("#modalFeedTextSpan").text(res.extend.feedText);
				  				 
				  			  }else{
				  				layer.msg("查看反馈人信息失败！",{icon:5});
				  			  }
				  		  },error:function(){
				  			  console.log("查看已解决的反馈信息时系统出错")
				  		  }
				      });
					  var index = layer.open({
							title : '反馈人信息',
							fix : true,
							resize :false,
							move: false,
							area:["600px","300px"],
							zIndex : 500,
							shadeClose : true,
							shade : 0.4,
							type : 1,
							content : $('#feedInfoModal')
						});
				  }else if(layEvent === 'LAYTABLE_TIPS'){
				  
				    layer.alert('Hi，头部工具栏扩展的右侧图标。');
				  }
				});
			});
	}
	$("#getCouponByConditionBtn").click(function(){
		renderTb();
	});
	//筛选的select
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
	
	//点击表格顶部的刷新
	$("#reloadTBIcon").click(function(){
		renderTb();
	});
	$("#lookTBIcon").click(function(){
		layui.use('layer', function(){
			var table = layui.layer;
			layer.msg("优惠卷信息");
		})
	});
	var giveCouponSel = new Vue({
		el:"#changeCouponSel",
		data:{
			discount:[]
		},
		created: function () {
			this.$http.get("${APP_PATH}/discount/getAll").then(function(response){
				//成功
				this.discount=response.body;
			},function(response) {
				//错误
				console.log("查询反馈分类时，出现系统错误！")
			});
		}
	});
	
	$("#changeCouponBtn").click(function(){
		layui.use('layer', function(){
			var layer = layui.layer;
			var discountId = $("#changeCouponSel").val();
			var id = $("#feedDiscountId").val();
			$.ajax({
				url:"${APP_PATH}/feedDiscount/changeCoupon?discountId="+discountId+"&id="+id,
				method:"get",
				success:function(res){
					if(res.code == 100){
						layer.msg(res.extend.msg,{icon:1},function(){
							renderTb();
							
						});
					}else{
						layer.msg(res.extend.msg,{icon:2},function(){
							renderTb();
						});
					}
				},error:function(){
					layer.msg("发放失败！系统出错！",{icon:5});
				}
			});
		});
	});
</script>
<script type="text/html" id="barDemo">
<button type="button" class="btn btn-warning btn-xs btn-outline" lay-event="lookFeed">所属人</button>
<button type="button" class="btn btn-danger btn-xs btn-outline" lay-event="changeCoupon">优惠卷</button>
</script>
</body>

</html>