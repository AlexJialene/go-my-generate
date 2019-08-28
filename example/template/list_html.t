<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

    <!-- Basic -->
    <meta charset="UTF-8"/>

    <title></title>

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <%@ include file="/public/bootstrap_page_css_admin.jsp" %>
</head>

<body>

<div class="main sidebar-minified">
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="panel panel-default bk-bg-white">
                <div class="panel-body">
                    <form id="sForm" role="form" class="form-inline" action="${pageContext.request.contextPath }/pv/{{.LowercaseEntityName}}/list" method="get">


                        <%-- <ul class="form-group">
                            <li>
                                <label class="left">名称:</label>
                                <input type="text" name="name" value="" placeholder="标题" class="right form-control">

                            </li>

                        </ul>
                        <button class="btn btn-white" type="submit">搜索</button> --%>

                        <a href="/pv/{{.LowercaseEntityName}}/addLabel" class="btn btn-primary ">添加行</a>
                    </form>

                    <br>
                    <table class="table table-bordered table-striped mb-none" id="datatable-editable">
                        <thead>
                        <tr>
                        {{range .Fields}}
                            <th>{{.Name}}</th>
                        {{end}}

                            <th class="col-sm-2">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pageInfo.list}" var="{{.LowercaseEntityName}}">
                            <tr class="gradeX">
                                {{range .Fields}}
                                    <td>{{.Name}}</td>
                                {{end}}
                                <td>
                                    <a class="btn btn-primary" href="/pv/{{.LowercaseEntityName}}/view/${}">编辑</a>
                                    <button class="btn btn-primary" onclick="confirmDel('{{.LowercaseEntityName}}','${}')">删除</button>
                                </td>

                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-sm-12">
                        <jsp:include page="/public/pageView.jsp">
                            <jsp:param
                                    value="${pageContext.request.contextPath }/pv/{{.LowercaseEntityName}}/list"
                                    name="pageUrl"/>
                            <jsp:param value="${pageInfo.pageSize}" name="pageSize"/>
                        </jsp:include>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<!-- End Main Page -->


</div>
</div><!--/container-->


<div class="clearfix"></div>


<!-- start: JavaScript-->
<%-- <%@ include file="/public/bootstrap_page_js_admin.jsp" %> --%>
<script src="${pageContext.request.contextPath}/hplus/js/jquery-2.1.1.min.js"></script>
<script src="${pageContext.request.contextPath}/hplus/js/bootstrap.min.js?v=3.4.0"></script>
<script src="${pageContext.request.contextPath}/hplus/js/plugins/layer/layer.min.js"></script>
<script src="${pageContext.request.contextPath}/view/js/common.js"></script>
<!-- Pages JS -->
<!-- end: JavaScript-->
<script type="text/javascript">
</script>
</body>
</html>