<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> 
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/bootstrap/css/bootstrap.min.css" />
    <title>旅游系统后台管理</title>
    <style type="text/css"></style> 
  </head> 

  <body> 
    <!-- 导航栏部分 -->
    <div class="navbar navbar-inverse"> 
     <div class="container-fluid"> 
      <div class="navbar-header"> 
       <div class="navbar-brand"> 
        <small class="glyphicon glyphicon-fire"></small>
        旅游系统后台管理
       </div> 
      </div> 
      <ul class="nav navbar-nav nav-stacked navbar-right"> 
       <li> 
        <a href="#"> 
         <span class="glyphicon glyphicon-tasks"></span> 
         <i class="badge">2</i> 
        </a> 
       </li> 
       <li> 
        <a href="#"> 
         <span class="glyphicon glyphicon-bell"></span> 
         <i class="badge">1</i> 
        </a> 
       </li> 
       <li> 
        <a href="#"> 
         <span class="glyphicon glyphicon-envelope"></span> 
         <i class="badge">1</i> 
        </a> 
       </li> 
       <li> 
        <a href="#" data-toggle="dropdown"> 
         <img class="img-circle" src="${APP_PATH}/admin/img/user.jpg" width="30" height="30"/>
         <small>Welcome</small>
         admin 
         <span class="caret"></span> 
        </a> 
        <ul class="nav nav-pills nav-stacked dropdown-menu"> 
         <li class="active"> 
          <a href="#"> 
           <span class="glyphicon glyphicon-cog"></span> Setting 
          </a> 
         </li> 
         <li class="divider"></li> 
         <li> 
          <a href="#"> 
           <span class="glyphicon glyphicon-user"></span> Profile 
          </a> 
         </li> 
         <li class="divider"></li> 
         <li> 
          <a href="#"> 
           <span class="glyphicon glyphicon-off"></span> Logout 
          </a> 
         </li> 
        </ul> 
       </li> 
      </ul> 
     </div> 
    </div> 
    

    <!-- 页面部分 -->
    <div class="row"> 
     <div class="col-sm-2 left-side"> 
      <div id="search"> 
       <div class="input-group"> 
        <input class="form-control input-sm" type="text" /> 
        <div class="input-group-btn"> 
         <a href="#" class="btn btn-info btn-sm"> 
          <span class="glyphicon glyphicon-search"></span> 
         </a> 
        </div> 
       </div>   
      </div> 
      
      <div class="panel-group" id="box"> 
       <div class="panel panel-info"> 
        <div class="panel-heading"> 
         <a href="#collapseA" data-parent="#box" data-toggle="collapse" class="panel-title">用户管理</a>
        </div> 
        <div class="panel-collapse collapse in" id="collapseA"> 
         <div class="panel-body"> 
          <ul class="nav nav-pills nav-stacked"> 
           <li><a href="${APP_PATH}/User/all" target="sonIframe">用户列表</a></li>
          </ul> 
         </div> 
        </div>  
       </div> 
       <div class="panel panel-info"> 
        <div class="panel-heading"> 
         <a href="#collapseB" data-parent="#box" data-toggle="collapse" class="panel-title">线路管理</a>
        </div> 
        <div class="panel-collapse collapse" id="collapseB"> 
         <div class="panel-body"> 
          <ul class="nav nav-pills nav-stacked"> 
           <li><a href="${APP_PATH}/Line/all" target="sonIframe">线路列表</a></li>
           <li><a href="lineAdd.jsp" target="sonIframe">线路添加</a></li>
          </ul>
         </div> 
        </div>  
       </div>
       <div class="panel panel-info">
        <div class="panel-heading">
         <a href="#collapseC" data-parent="#box" data-toggle="collapse" class="panel-title">导游管理</a>
        </div>
        <div class="panel-collapse collapse" id="collapseC">
         <div class="panel-body">
          <ul class="nav nav-pills nav-stacked">
           <li><a href="${APP_PATH}/TourGuide/all" target="sonIframe">导游列表</a></li>
          </ul>
         </div>
        </div>
       </div>
       <div class="panel panel-info">
        <div class="panel-heading">
         <a href="#collapseD" data-parent="#box" data-toggle="collapse" class="panel-title">团队管理</a>
        </div>
        <div class="panel-collapse collapse" id="collapseD">
         <div class="panel-body">
          <ul class="nav nav-pills nav-stacked">
           <li><a href="${APP_PATH}/Team/all" target="sonIframe">团队列表</a></li>
          </ul>
         </div>
        </div>
       </div>
       <div class="panel panel-info">
        <div class="panel-heading">
         <a href="#collapseE" data-parent="#box" data-toggle="collapse" class="panel-title">订单管理</a>
        </div>
        <div class="panel-collapse collapse" id="collapseE">
         <div class="panel-body">
          <ul class="nav nav-pills nav-stacked">
           <li><a href="${APP_PATH}/Order/all" target="sonIframe">订单列表</a></li>
          </ul>
         </div>
        </div>
       </div>
       <div class="panel panel-info">
        <div class="panel-heading">
         <a href="#collapseF" data-parent="#box" data-toggle="collapse" class="panel-title">通知管理</a>
        </div>
        <div class="panel-collapse collapse" id="collapseF">
         <div class="panel-body">
          <ul class="nav nav-pills nav-stacked">
           <li><a href="${APP_PATH}/Notice/all" target="sonIframe">通知列表</a></li>
           <li><a href="noticeAdd.jsp" target="sonIframe">添加通知</a></li>
          </ul>
         </div>
        </div>
       </div>
      </div> 
     </div>

     <div class="col-sm-10">
      <iframe scrolling="auto" rameborder="0"
              src="${APP_PATH}/User/all" width="100%" height="100%" name="sonIframe"></iframe>
     </div> 
    </div>


    <script type="text/javascript" src="${APP_PATH}/bootstrap/js/jquery.min.js"></script>
    <script type="text/javascript" src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript">
       var v = "${empty admin }";
       if (v == 'true') {
          alert("未登录，请前往登录！");
          window.location.href = "${APP_PATH}/admin/login.jsp";
       }
    </script>
  </body> 
</html> 