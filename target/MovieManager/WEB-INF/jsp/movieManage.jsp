<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="dream" uri="http://dream.com/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>梦的6次方</title>

<!-- Bootstrap Core CSS -->
<link href="../../assets/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="../../assets/css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="../../assets/css/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="../../assets/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="../../assets/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="../../assets/css/boot-crm.css" rel="stylesheet"
	type="text/css">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="index.jsp">电影后台管理系统</a>
		</div>
		<div class="navbar-default sidebar" role="navigation">
			<div class="sidebar-nav navbar-collapse">
				<ul class="nav" id="side-menu">
					<li><a href="list.action" class="active"><i
							class="fa fa-edit fa-fw"></i> 电影管理</a></li>
					<li><a href="userManage.action"><i
							class="fa fa-dashboard fa-fw"></i> 用户管理</a></li>
				</ul>
			</div>
			<!-- /.sidebar-collapse -->
		</div>
		<!-- /.navbar-static-side --> </nav>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">电影管理</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
			<div class="panel panel-default">
				<div class="panel-body">

					<form class="form-inline" action="${pageContext.request.contextPath }/movie/list.action" method="post">
						<!-- <div class="form-group"> -->
							<label for="moviename">电影名称</label>
							<input type="text" class="form-control" id="moviename" value="${moviename }" name="moviename">
						<div class="form-group">
							<label for="movieCategory">电影类型</label> 
							<select	class="form-control" id="movieCategory" placeholder="电影类型" name="categorylist">
								<option value="">--请选择--</option>
								<c:forEach items="${list}" var="ll">
									<option value="${ll.categoryid}"<c:if test="${ll.categoryid == category}"> selected</c:if>>${ll.category }</option>
								</c:forEach>
							</select>
						</div>
						
<!-- 						<div class="form-group">
							<label for="custLevel">客户级别</label>
							<select	class="form-control" id="custLevel" name="custLevel">
								<option value="">--请选择--</option>
								<c:forEach items="${levelType}" var="item">
									<option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
								</c:forEach>
							</select>
						</div> -->
						<button type="submit" class="btn btn-primary">查询</button>
						<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editCustomer(${row.movieid})">添加电影</a>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">电影管理信息</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>电影ID</th>
									<th>电影名称</th>
									<th>上映年份</th>
									<th>国家/地区</th>
									<th>导演</th>
									<th>主演</th>
									<th>编剧</th>
									<th>海报</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items="${page.rows}" var="row">
								<tr>
									<td>${row.movieid}</td>
									<td>${row.moviename}</td>
									<td>${row.showyear}</td>
									<td>${row.nation}</td>
									<td>${row.director}</td>
									<td>${row.leadactors}</td>
									<td>${row.screenwriter}</td>
									<td>${row.picture}</td>
									<td>
										<a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#customerEditDialog" onclick="editCustomer(${row.movieid})">修改</a>
										<a href="#" class="btn btn-danger btn-xs" onclick="deleteMovie(${row.movieid})">删除</a>
									</td>	
								</tr>
							</c:forEach>
							</tbody>
						</table>
						<div class="col-md-12 text-right">
							<dream:page url="${pageContext.request.contextPath }/movie/list.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- 客户编辑对话框 -->
	<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改电影信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						<input type="hidden" id="edit_movieid" name="movieid"/>
						<div class="form-group">
							<label for="edit_movieName" class="col-sm-2 control-label">电影名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_movieName" placeholder="${row.moviename}" name="moviename">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_showyear" class="col-sm-2 control-label">上映年份</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_showyear" placeholder="yyyy-mm-hh" name="showyear">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_nation" class="col-sm-2 control-label">国家/地区</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_nation" placeholder="国家/地区" name="nation">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_director" class="col-sm-2 control-label">导演</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_director" placeholder="导演" name="director">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_leadactors" class="col-sm-2 control-label">主演</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_leadactors" placeholder="主演" name="leadactors">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_screenwriter" class="col-sm-2 control-label">编剧</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_screenwriter" placeholder="编剧" name="screenwriter">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_picture" class="col-sm-2 control-label">海报</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_picture" placeholder="http://xxx" name="picture">
							</div>
						</div>
						<input type="hidden" id="edit_start" name="start"/>
						<input type="hidden" id="edit_rows" name="rows"/>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateMovie()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	
	<script type="text/javascript">
		function editCustomer(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>movie/edit.action",
				data:{"id":id},
				success:function(data) {   // Customer的JSON字符串传过来就行
					$("#edit_movieid").val(data.movieid);
					$("#edit_movieName").val(data.moviename);
					$("#edit_showyear").val(data.showyear)
					$("#edit_nation").val(data.nation)
					$("#edit_director").val(data.director)
					$("#edit_leadactors").val(data.leadactors);
					$("#edit_screenwriter").val(data.screenwriter);
					$("#edit_picture").val(data.picture);
					
				}
			});
		}
		function updateMovie() {
			$.post("<%=basePath%>movie/update.action",$("#edit_customer_form").serialize(),function(data){
				alert("客户信息更新成功！");
				window.location.reload();
			});
		}
		
		function deleteMovie(id) {
			if(confirm('确实要删除该客户吗?')) {
				$.post("<%=basePath%>movie/delete.action",{"id":id},function(data){
					alert("客户删除更新成功！");
					window.location.reload();
				});
			}
		}
	</script>

</body>

</html>
