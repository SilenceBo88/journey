<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html lang="en">
 <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/bootstrap/css/bootstrap.min.css" />
    <link href="${APP_PATH}/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
    <title>旅游系统后台管理</title>
    <style type="text/css"></style>
 </head>
 <body>
 <div class="bread-crumb">
     <ul class="breadcrumb">
         <li><span class="glyphicon glyphicon-home"></span><a href="#">Home</a></li>
         <li><a href="#">Notice</a></li>
         <li>update</li>
     </ul>
 </div>
 <div class="panle panel-info">
     <div class="panel-heading">
         <a class="panel-title">修改通知</a>
     </div>
     <div class="container">
         <form class="form-horizontal" action="${APP_PATH }/Notice/update" method="post">
             <input type="hidden" value="${notice.id }" name="notice.id">
             <div class="form-group form-group-lg">
                 <label for="title" class="col-sm-2 control-label">标题</label>
                 <div class="col-sm-4">
                     <input type="text" class="form-control" id="title" name="notice.title" placeholder="通知标题" value="${notice.title }">
                 </div>
             </div>
             <div class="form-group form-group-lg">
                 <label for="context" class="col-sm-2 control-label">内容</label>
                 <div class="col-sm-4">
                     <input type="text" class="form-control" id="context" name="notice.context" placeholder="通知内容" value="${notice.context }">
                 </div>
             </div>
             <div class="form-group form-group-lg">
                 <label for="type" class="col-sm-2 control-label">类型</label>
                 <div class="col-sm-4">
                     <select class="form-control" id="type" name="notice.type">
                         <option value="0" <c:if test="${'0' eq notice.type}">selected</c:if>>一般通知</option>
                         <option value="1" <c:if test="${'1' eq notice.type}">selected</c:if>>重要通知</option>
                     </select>
                 </div>
             </div>
             <div class="form-group form-group-lg">
                 <label for="isSend" class="col-sm-2 control-label">是否发送</label>
                 <div class="col-sm-4">
                     <select class="form-control" id="isSend" name="notice.isSend">
                         <option value="0" <c:if test="${'0' eq notice.isSend}">selected</c:if>>未发送</option>
                         <option value="1" <c:if test="${'1' eq notice.isSend}">selected</c:if>>已发送</option>
                     </select>
                 </div>
             </div>
             <div class="form-group form-group-lg">
                 <div class="col-sm-offset-2 col-sm-4">
                     <button type="submit" class="btn btn-default">修改</button>
                 </div>
             </div>
         </form>
     </div>
 </div>
 </body>
</html>
