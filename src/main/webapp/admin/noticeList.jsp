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
    <title>旅游系统后台管理</title>
    <style type="text/css"></style>
</head>

<body>
<div class="bread-crumb">
    <ul class="breadcrumb">
        <li><span class="glyphicon glyphicon-home"></span><a href="#">Home</a></li>
        <li><a href="#">Notice</a></li>
        <li>list</li>
    </ul>
</div>
<div class="panle panel-info">
    <div class="panel-heading">
        <a class="panel-title">通知列表</a>
    </div>
    <div class="panel-body">
        <table class="table table-striped table-hover">
            <%--表头--%>
            <thead>
            <tr>
                <th>ID</th>
                <th>标题</th>
                <th>内容</th>
                <th>类型</th>
                <th>是否发送</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <%--显示数据--%>
            <tbody>
            <c:forEach items="${pageInfo.pageList }" var="notice">
                <tr>
                    <td>${notice.id }</td>
                    <td>${notice.title }</td>
                    <td>${notice.context }</td>
                    <td>
                        <c:if test="${notice.type  eq 0}">
                            一般通知
                        </c:if>
                        <c:if test="${notice.type eq 1}">
                            重要通知
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${notice.isSend  eq 0}">
                            未发送
                        </c:if>
                        <c:if test="${notice.isSend eq 1}">
                            已发送
                        </c:if>
                    </td>
                    <td>${notice.created }</td>
                    <td>
                        <a href="${APP_PATH}/Notice/updatePage?notice.id=${notice.id }"><input type="button" value="修改" class="btn btn-warning"/></a>
                        <a href="${APP_PATH}/Notice/del?notice.id=${notice.id }"><input type="button" value="删除"onclick="javascript:return del()" class="btn btn-danger"/></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            <%--分页--%>
            <tfoot>
            <tr>
                <td colspan="8">
                    <ul class="pagination">
                        <li><a href="${APP_PATH}/Notice/all">首页</a></li>
                        <c:if test="${pageInfo.pageIndex > 1 }">
                            <li><a href="${APP_PATH}/Notice/all?page=${pageInfo.pageIndex - 1 }">«</a></li>
                        </c:if>

                        <%--计算开始和结束的页码--%>
                        <c:choose>
                            <%-- 如果总页数不足5页，那么把所有的页数都显示出来！ --%>
                            <c:when test="${pageInfo.totalPage <= 5}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="${pageInfo.totalPage}"/>
                            </c:when>

                            <%-- 当总页数>5时，显示当前页前后的5页 --%>
                            <c:otherwise>
                                <%-- 当总页数>5时，通过公式计算出begin和end --%>
                                <c:set var="begin" value="${pageInfo.pageIndex - 2}"/>
                                <c:set var="end" value="${pageInfo.pageIndex + 2}"/>
                                <%-- 头溢出 --%>
                                <c:if test="${begin < 1}">
                                    <c:set var="begin" value="1"/>
                                    <c:set var="end" value="5"/>
                                </c:if>
                                <%-- 尾溢出 --%>
                                <c:if test="${end > pageInfo.totalPage}">
                                    <c:set var="begin" value="${pageInfo.totalPage - 4 }"/>
                                    <c:set var="end" value="${pageInfo.totalPage }"/>
                                </c:if>
                            </c:otherwise>
                        </c:choose>

                        <%-- 循环遍历页码列表 --%>
                        <c:forEach var="i" begin="${begin}" end="${end}">
                            <c:choose>
                                <c:when test="${i eq pageInfo.pageIndex }">
                                    <li class="active"><a href="${APP_PATH}/Notice/all?page=${i }">${i }</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="${APP_PATH}/Notice/all?page=${i }">${i }</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${pageInfo.pageIndex < pageInfo.totalPage }">
                            <li><a href="${APP_PATH}/Notice/all?page=${pageInfo.pageIndex + 1 }">»</a></li>
                        </c:if>
                        <li><a href="${APP_PATH}/Notice/all?page=${pageInfo.totalPage }">尾页</a></li>
                    </ul>
                </td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>
<script type="text/javascript" src="${APP_PATH}/bootstrap/js/jquery.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" >
    //显示大图
    function showimage(source)
    {
        $("#ShowImage_Form").find("#img_show").html("<image src='"+source+"' " +
                "class='carousel-inner img-responsive img-rounded' />");
        $("#ShowImage_Form").modal();
    }
    //删除确认框
    function del() {
        var msg = "您真的确定要删除吗？\n\n请确认！";
        if (confirm(msg)==true){
            return true;
        }else{
            return false;
        }
    }
</script>
</body>
</html>