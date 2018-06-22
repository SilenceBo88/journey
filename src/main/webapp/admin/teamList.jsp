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
        <li><a href="#">Team</a></li>
        <li>list</li>
    </ul>
</div>
<div class="panle panel-info">
    <div class="panel-heading">
        <a class="panel-title">团队列表</a>
    </div>
    <div class="panel-body">
        <table class="table table-striped table-hover">
            <%--表头--%>
            <thead>
            <tr>
                <th>ID</th>
                <th>团队名</th>
                <th>出发时间</th>
                <th>导游</th>
                <th>导游电话</th>
                <th>最大人数</th>
                <th>已有人数</th>
                <th>团队状态</th>
                <th>所属线路</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <%--显示数据--%>
            <tbody>
            <c:forEach items="${pageInfo.pageList }" var="team">
                <tr>
                    <td>${team.id }</td>
                    <td>${team.teamName }</td>
                    <td>${team.goTime }</td>
                    <td>${team.tg_name }</td>
                    <td>${team.tg_phone }</td>
                    <td>${team.maxNum }</td>
                    <td>${team.hasNum }</td>
                    <td>
                        <c:if test="${team.status eq 0}">
                            未出发
                        </c:if>
                        <c:if test="${team.status eq 1}">
                            已出发
                        </c:if>
                        <c:if test="${team.status eq 2}">
                            已结束
                        </c:if>
                    </td>
                    <td>${team.lname }</td>
                    <td>${team.created }</td>
                    <td>
                        <a href="${APP_PATH}/Team/updatePage?team.id=${team.id }"><input type="button" value="修改" class="btn btn-warning"/></a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
            <%--分页--%>
            <tfoot>
            <tr>
                <td colspan="8">
                    <ul class="pagination">
                        <li><a href="${APP_PATH}/Team/all">首页</a></li>
                        <c:if test="${pageInfo.pageIndex > 1 }">
                            <li><a href="${APP_PATH}/Team/all?page=${pageInfo.pageIndex - 1 }">«</a></li>
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
                                    <li class="active"><a href="${APP_PATH}/Team/all?page=${i }">${i }</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="${APP_PATH}/Team/all?page=${i }">${i }</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <c:if test="${pageInfo.pageIndex < pageInfo.totalPage }">
                            <li><a href="${APP_PATH}/Team/all?page=${pageInfo.pageIndex + 1 }">»</a></li>
                        </c:if>
                        <li><a href="${APP_PATH}/Team/all?page=${pageInfo.totalPage }">尾页</a></li>
                    </ul>
                </td>
            </tr>
            </tfoot>
        </table>
    </div>
</div>

</body>
</html>