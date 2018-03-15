<%--
  Created by IntelliJ IDEA.
  User: lu
  Date: 18-3-9
  Time: 上午10:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            
            <a class="navbar-brand" href="list.action">电影后台管理系统</a>
        </div>

            <ul class="nav navbar-top-links navbar-right">



                <li class="dropdown"><a class="dropdown-toggle"
                                        data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i>
                    <i class="fa fa-caret-down"></i>
                </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> 用户设置</a></li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> 系统设置</a></li>
                        <li class="divider"></li>
                        <li><a href="/logout"><i class="fa fa-sign-out fa-fw"></i>
                            退出登录</a></li>
                    </ul> <!-- /.dropdown-user --></li>
                <!-- /.dropdown -->
            </ul>

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li><a href="/movie" class="active"><i
                            class="fa fa-edit fa-fw"></i> 电影管理</a></li>
                    <li><a href="list.action"><i
                            class="fa fa-dashboard fa-fw"></i> 用户管理</a></li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side --> </nav>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">用户管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="panel panel-default">
                <div class="panel-body">

                    <form class="form-inline" action="${pageContext.request.contextPath }/user/list.action" method="post">
                        <div class="form-group">
                            <label for="userName">用户名</label>
                            <input type="text" class="form-control" id="username" value="${ username }" name="username">
                        </div>
                        <%--<div class="form-group">--%>
                            <%--<label for="catagoryId">电影类型</label>--%>
                            <%--<select class="form-control" id="categoryId" placeholder="电影类型" name="categoryId">--%>
                                <%--<option value=0>--请选择--</option>--%>
                                <%--<c:forEach items="${categoryList}" var="ca">--%>
                                    <%--<option value="${ca.categoryid}"<c:if test="${ca.categoryid == categoryId }"> selected</c:if>>${ca.category }</option>--%>
                                <%--</c:forEach>--%>
                            <%--</select>--%>
                        <%--</div>--%>
                        <%----%>

                        <button type="submit" class="btn btn-primary">查询</button>
                        <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#movieAddDialog" >添加电影</a>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">用户管理信息</div>
                        <!-- /.panel-heading -->
                        <table class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>用户Id</th>
                                    <th>用户名</th>
                                    <th>用户密码</th>
                                    <th>注册时间</th>
                                    <th>上次登录时间</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${page.rows}" var="row">
                                <tr>
                                    <td>${row.userid}</td>
                                    <td>${row.username}</td>
                                    <td>${row.password}</td>
                                    <td><fmt:formatDate type="date" value="${row.registertime}" dateStyle="default"/></td>
                                    <td><fmt:formatDate type="date" value="${row.lastlogintime}" dateStyle="default"/></td>
                                    <td>
                                        <a href="#" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#movieEditDialog" onclick="editMovie(${row.userid})">修改</a>
                                        <a href="#" class="btn btn-danger btn-xs" onclick="deleteMovie(${row.userid})">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="col-md-12 text-right">
                            <dream:page url="${pageContext.request.contextPath }/user/list.action" />
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
        </div>
    </div>
            

    <!-- 客户编辑对话框 -->
    <div class="modal fade" id="movieEditDialog" tabindex="-1" role="dialog"
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
                    <form class="form-horizontal" id="edit_movie_form">
                        <input type="hidden" id="edit_movieid" name="movieid"/>
                        <div class="form-group">
                            <label for="edit_movieName" class="col-sm-2 control-label">电影名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_movieName" placeholder="ccc" name="moviename">
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

                        <div class="form-group">
                            <label for="catagoryId" class="col-sm-2 control-label">电影类型</label>
                            <div class="col-sm-10">
                                <select multiple class="form-control" id="catagoryId" placeholder="电影类型" name="categoryId">
                                    <c:forEach items="${categoryList}" var="ca">
                                        <option value="${ca.categoryid}"<c:if test="${ca.categoryid == categoryId }"> selected</c:if>>${ca.category }</option>
                                    </c:forEach>
                                </select>
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

    <!-- 电影添加对话框 -->
    <div class="modal fade" id="movieAddDialog" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="add_myModalLabel">添加电影</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="add_movie_form">
                        <input type="hidden" id="add_movieid" name="movieid"/>
                        <div class="form-group">
                            <label for="add_movieName" class="col-sm-2 control-label">电影名称</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_movieName" placeholder="ccc" name="moviename">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add_showyear" class="col-sm-2 control-label">上映年份</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_showyear" placeholder="yyyy-mm-hh" name="showyear">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add_nation" class="col-sm-2 control-label">国家/地区</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_nation" placeholder="国家/地区" name="nation">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add_director" class="col-sm-2 control-label">导演</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_director" placeholder="导演" name="director">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add_leadactors" class="col-sm-2 control-label">主演</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_leadactors" placeholder="主演" name="leadactors">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add_screenwriter" class="col-sm-2 control-label">编剧</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_screenwriter" placeholder="编剧" name="screenwriter">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="add_picture" class="col-sm-2 control-label">海报</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="add_picture" placeholder="http://xxx" name="picture" value="">
                            </div>
                        </div>

                        <!-- <div class="form-group">
                            <label for="add_picture" class="col-sm-2 control-label">海报</label>
                            <input type="file" name="file" id="image">
                            <a href="javascript:uploadImg()" class="btn btn-blue">上传配图</a>
                            <%--<input type="submit" value="提交">--%>
                        </div> -->

                        <div class="form-group">
                            <label for="add_catagoryId" class="col-sm-2 control-label">电影类型</label>
                            <div class="col-sm-10">
                                <select multiple class="form-control" id="add_catagoryId" placeholder="电影类型" name="categoryId">
                                    <c:forEach items="${categoryList}" var="ca">
                                        <option value="${ca.categoryid}"<c:if test="${ca.categoryid == categoryId }"> selected</c:if>>${ca.category }</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <input type="hidden" id="add_start" name="start"/>
                        <input type="hidden" id="add_rows" name="rows"/>

                    </form>
                    <%--<form id="add_picture_form" method="post" enctype="multipart/form-data">--%>
                        <%--<label>文件上传</label>--%>
                        <%--<input type="file" name="file">--%>
                        <%--<input type="submit" value="提交">--%>
                        <%--&lt;%&ndash;<button type="button" class="btn btn-primary" onclick="addPicture()">上传图片</button>&ndash;%&gt;--%>
                    <%--</form>--%>
                    <form class="form-horizontal" id="add_picture_form" enctype="multipart/form-data">
                        <div class="form-group">
                                <label for="add_picture" class="col-sm-2 control-label">海报</label>
                                <input type="file" name="file" id="image">
                                <a href="javascript:uploadImg()" class="btn btn-blue">上传配图</a>
                            <%--<input type="submit" value="提交">--%>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="addMovie()">确认添加</button>
                </div>
            </div>
        </div>
    </div>

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
    <script type="text/javascript" src="<%=basePath%>js/common.js"></script>
    
    <script type="text/javascript">

        
        function editMovie(id) {
            $.ajax({
                type:"get",
                url:"<%=basePath%>movie/edit.action",
                data:{"id":id},
                success:function(data) {   // Movie的JSON字符串传过来就行
                    $("#edit_movieid").val(data.movieid);
                    $("#edit_movieName").val(data.moviename);
                    $("#edit_showyear").val(data.showyear)
                    $("#edit_nation").val(data.nation)
                    $("#edit_director").val(data.director)
                    $("#edit_leadactors").val(data.leadactors);
                    $("#edit_screenwriter").val(data.screenwriter);
                    $("#edit_picture").val(data.picture);
                    $("#catagoryId").val(data.categoryid);
                }
            });
        }

        //上传新闻配图
        function uploadImg(){
            var formData = new FormData($( "#add_picture_form" )[0]);
            formData.append("file",$("#image")[0]);
            formData.append("name",name);
            $.ajax({
                url:"<%=basePath%>movie/file/upload.action",
                type:"POST",
                dataType:"json",
                data:formData,
                contentType: false,
                processData: false,
                success:function(data) {
                        alert("上传成功!");
                         // $("#picture").attr("disabled","disabled");
                        $("#add_picture").val(data.url);
                }
            });

        }


        function addMovie() {
            $.post("<%=basePath%>movie/add.action",$("#add_movie_form").serialize(),function(data){
                alert("客户信息更新成功！");
                window.location.reload();
            });
        }

        function updateMovie() {

            $.post("<%=basePath%>movie/update.action",$("#edit_movie_form").serialize(),function(data){
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
