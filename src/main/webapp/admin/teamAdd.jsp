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
        <li><a href="#">Team</a></li>
        <li>add</li>
    </ul>
</div>
<div class="panle panel-info">
    <div class="panel-heading">
        <a class="panel-title">团队添加</a>
    </div>
    <div class="container">
        <form class="form-horizontal" action="${APP_PATH }/Team/add" method="post" enctype="multipart/form-data">
            <input type="hidden" value="${team.lid }" name="team.lid">
            <input type="hidden" value="${team.teamName }" name="team.teamName">
            <div class="form-group form-group-lg">
                <label for="teamName" class="col-sm-2 control-label">团队名称</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="teamName" name="team.teamName"  value="${team.teamName }" disabled>
                </div>
            </div>
            <div class="form-group form-group-lg">
                <label for="maxNum" class="col-sm-2 control-label">人数上限</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="maxNum" name="team.maxNum" placeholder="团队最多人数">
                </div>
            </div>
            <div class="form-group form-group-lg">
                <label for="type" class="col-sm-2 control-label">选择导游</label>
                <div class="col-sm-4">
                    <select class="form-control" id="type" name="team.tgid">
                        <c:forEach items="${tourGuides }" var="tg">
                            <option value="${tg.id }">${tg.realName }</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="form-group form-group-lg">
                <label for="dtp_input" class="col-md-2 control-label">出发时间</label>
                <div class="input-group date form_date col-sm-4" data-date-format="yyyy-mm-dd" data-link-field="dtp_input" data-link-format="yyyy-mm-dd">
                    <input class="form-control" id="goTime" type="text" name="team.goTime" placeholder="线路出发时间" readonly>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
                <input type="hidden" id="dtp_input"/><br/>
            </div>
            <div class="form-group form-group-lg">
                <div class="col-sm-offset-2 col-sm-4">
                    <button type="submit" class="btn btn-default">添加</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="${APP_PATH}/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/bootstrap/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="${APP_PATH}/bootstrap/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>

<script type="text/javascript">
    $.fn.datetimepicker.dates['zh-CN'] = {
     days: ["星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"],
     daysShort: ["周日", "周一", "周二", "周三", "周四", "周五", "周六", "周日"],
     daysMin:  ["日", "一", "二", "三", "四", "五", "六", "日"],
     months: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
     monthsShort: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
     today: "今天",
     suffix: [],
     meridiem: ["上午", "下午"]
     };
     $('.form_date').datetimepicker({
     language:  'zh-CN',
     weekStart: 7,
     todayBtn:  1,
     autoclose: 1,
     todayHighlight: 1,
     startView: 2,
     minView: 2,
     forceParse: 0
     });
</script>
</body>
</html>
