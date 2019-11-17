<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
        <div class="nano">
            <div class="nano-content">
                <ul>
                    <li class="active">
                        <a href="${APP_PATH}/admin/toIndex"><i class="ti-home"></i> 首页</a>
                    </li>
                    
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-email"></i>反馈福利<span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="${APP_PATH}/feedBack/afterSolveFB">已解决的反馈</a></li>
                            <li><a href="${APP_PATH}/discount/useCouponByCode">使用优惠卷</a></li>
                            <li><a href="${APP_PATH}/feedDiscount/getAllCoupon">所有优惠卷</a></li>
                            <li><a href="${APP_PATH}/feedDiscount/mangeSortAndDiscount">反馈分类和优惠卷</a></li><!-- 放在了中间表的控制器 -->
                             
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-time"></i> 预约管理 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="${APP_PATH}/appointment/toValidAppointPage">有效预约</a></li>
                            <li><a href="uc-calendar.html">失效预约</a></li>
                            <li><a href="uc-calendar.html">有效预约</a></li>
                            
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-bar-chart-alt"></i>  Charts  <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="chart-flot.html">Flot</a></li>
                              
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-layout-grid4-alt"></i> Table <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="table-basic.html">Basic</a></li> 
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-heart"></i> Icons <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="font-themify.html">Themify</a></li>
                        </ul>
                    </li>
                    <li> 
                    </li>
                    <li><a href="form-basic.html"><i class="ti-view-list-alt"></i> Basic Form </a></li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-files"></i> Invoice <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="invoice.html">Basic</a></li>
                            <li><a href="invoice-editable.html">Editable</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="sidebar-sub-toggle"><i class="ti-target"></i> Pages <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                        <ul>
                            <li><a href="page-login.html">Login</a></li>
                            <li><a href="page-register.html">Register</a></li>
                            <li><a href="page-reset-password.html">Forgot password</a></li>
                        </ul>
                    </li>
                    <li><a target="_blank" href="#"><i class="ti-file"></i> Documentation</a></li>
                    <li><a href="${APP_PATH}/admin/loginOut"><i class="ti-close"></i> 退出登录</a></li>
                </ul>
            </div>
        </div>
    </div>