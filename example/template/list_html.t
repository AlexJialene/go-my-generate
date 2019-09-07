<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <!-- Basic -->
    <meta charset="UTF-8"/>
    <title></title>
    <%@ include file="/public/admin-front-css.jsp" %>
    <link rel="stylesheet" href="/admin-front/js/jconfirm/jquery-confirm.min.css">
</head>

<body>
<div class="container-fluid p-t-15">

    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-toolbar clearfix">
                    <div class="toolbar-btn-action col-sm-4">
                        <a class="btn btn-primary" href="/pv/user/addUser"><i class="mdi mdi-plus"></i> 新增</a>
                        <a class="btn btn-success" href="javascript:handle('/pv/user/disable/0')">
                            <i class="mdi mdi-check"></i>激活</a>
                        <a class="btn btn-warning" href="javascript:handle('/pv/user/disable/1')">
                            <i class="mdi mdi-block-helper"></i> 禁用</a>
                    </div>
                    <div class="toolbar-btn-action col-sm-8 form-inline">
                        <form method="get" action="/pv/user/list" role="form" id="sForm">
                            <input type="hidden" name="pageSize" value="${pageInfo.pageSize}">
                            <div class="form-group">
                                <input class="form-control" type="text" name="name" value="${user.name}"
                                       placeholder="名称">
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="phone" value="${user.phone}"
                                       placeholder="电话">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary">搜索</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card-body">

                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th width="30">
                                    <label class="lyear-checkbox checkbox-primary">
                                        <input type="checkbox" id="check-all"><span></span>
                                    </label>
                                </th>
                                <th>名称</th>
                                <th>电话</th>
                                <th>会员</th>
                                <th>有效期</th>
                                <th>状态</th>
                                <th class="col-sm-2">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pageInfo.list}" var="user">
                                <tr>
                                    <td width="30">
                                        <label class="lyear-checkbox checkbox-primary">
                                            <input type="checkbox" name="ids" value="${user.id}"><span></span>
                                        </label>
                                    </td>
                                    <td>${user.name }</td>
                                    <td>${user.phone }</td>
                                    <td>${user.vipRoleName }</td>
                                    <td>
                                        <fmt:formatDate value="${user.validityPeriod}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate>
                                    </td>
                                    <td>
                                        <c:if test="${user.status == 0}">
                                            <span class="label label-pink">激活</span>
                                        </c:if>
                                        <c:if test="${user.status == 1}">
                                            <span class="label label-dark">禁用</span>
                                        </c:if>
                                    </td>

                                    <td>
                                        <div class="btn-group">
                                            <a class="btn btn-xs btn-default" href="/pv/user/view/${user.id}"
                                               title="编辑" data-toggle="tooltip"><i class="mdi mdi-pencil"></i></a>
                                            <a class="btn btn-xs btn-default" href="javascript:handle('/pv/user/disable/0' , '${user.id}')"
                                               title="激活" data-toggle="tooltip"><i class="mdi mdi-emoticon-happy"></i></a>
                                            <a class="btn btn-xs btn-default" href="javascript:handle('/pv/user/disable/1' , '${user.id}')"
                                               title="禁用" data-toggle="tooltip"><i class="mdi mdi-window-close"></i></a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <jsp:include page="/public/admin-front-page.jsp">
                        <jsp:param value="${pageContext.request.contextPath }/pv/user/list?name=${user.name}&phone=${user.phone}"
                                   name="pageUrl"/>
                        <jsp:param value="${pageInfo.pageSize}" name="pageSize"/>
                    </jsp:include>
                </div>
            </div>
        </div>

    </div>

</div>


<!-- start: JavaScript-->
<script type="text/javascript" src="/admin-front/js/jquery.min.js"></script>
<script type="text/javascript" src="/admin-front/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/admin-front/js/main.min.js"></script>
<!--消息提示-->
<script type="text/javascript" src="/admin-front/js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="/admin-front/js/lightyear.js"></script>
<script type="text/javascript" src="/admin-front/js/bootstrap-multitabs/multitabs.js"></script>
<script src="/admin-front/js/jconfirm/jquery-confirm.min.js"></script>
</body>
</html>