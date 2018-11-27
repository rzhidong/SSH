<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--输出,条件,迭代标签库-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<!--数据格式化标签库-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="sql"%>
<!--数据库相关标签库-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>
<!--常用函数标签库-->
<%@ page isELIgnored="false"%>
<!--支持EL表达式，不设的话，EL表达式不会解析-->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="col-lg-offset-1 col-lg-10">

		<div class="navbar navbar-default">
			<div class="navbar-header">
				<a href="<%=request.getContextPath()%>" class="navbar-brand"> <span
					class="glyphicon glyphicon-user">SSHDemo</span>
				</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<button class="btn btn-primary btn-lg" data-toggle="modal"
					data-target="#personModal" onclick="showBeforeAdd()">
					<span class="glyphicon glyphicon-plus">添加人员</span>
				</button>
			</ul>
		</div>

		<c:if test="${not empty list }">
			<table class="table table-bordered table-striped table-hover">
				<thead>
					<tr class="success">
						<th><center>ID</center></th>
						<th><center>姓名</center></th>
						<th><center>住址</center></th>
						<th><center>电话</center></th>
						<th><center>备注</center></th>
						<th><center>创建时间</center></th>
						<th><center>操作</center></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list }" varStatus="status">
						<tr>
							<td><center>${ item.id}</center></td>
							<td><center>${ item.username}</center></td>
							<td><center>${ item.address}</center></td>
							<td><center>${ item.phone}</center></td>
							<td><center>${ item.remark}</center></td>
							<td><center>${ item.created}</center></td>
							<td><a class="btn btn-success"
								onclick="queryData(${item.id},'query')" data-toggle="modal"
								data-target="#personModal"> <span
									class="glyphicon glyphicon-zoom-in ">查看</span>
							</a> <a class="btn btn-info" onclick="queryData(${item.id},'update')"
								data-toggle="modal" data-target="#personModal"> <span
									class="glyphicon glyphicon-edit">修改</span>
							</a> <%-- 					<a	href="<%=request.getContextPath()%>/deletePerson?id=${item.id}" --%>
								<!-- 						class="btn btn-danger" onclick="return confirm('您确定要删除吗？');"> -->
								<!-- 							<span class="glyphicon glyphicon-trash">删除</span> -->
								<!-- 					</a> --> <a onclick="deletePerson(${item.id},)"
								data-toggle="modal" data-target="#deleteModal"
								class="btn btn-danger"> <span
									class="glyphicon glyphicon-trash">删除</span>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7" align="center" class="info">共${page.totalRecords}条记录
							共${page.totalPages}页 当前第${page.pageNo}页<br> <a
							href="<%=request.getContextPath()%>/findAll?pageNo=${page.topPageNo }"><input
								type="button" class="btn btn-primary" name="fristPage"
								value="首页" /></a> <c:choose>
								<c:when test="${page.pageNo!=1}">

									<a
										href="<%=request.getContextPath()%>/findAll?pageNo=${page.previousPageNo }"><input
										type="button" class="btn btn-info" name="previousPage"
										value="上一页" /></a>

								</c:when>
								<c:otherwise>

									<input type="button" disabled="disabled" class="btn btn-info"
										name="previousPage" value="上一页" />

								</c:otherwise>
							</c:choose> <c:choose>
								<c:when test="${page.pageNo != page.totalPages}">
									<a
										href="<%=request.getContextPath()%>/findAll?pageNo=${page.nextPageNo }"><input
										type="button" class="btn btn-info" name="nextPage" value="下一页" /></a>
								</c:when>
								<c:otherwise>

									<input type="button" class="btn btn-info" disabled="disabled"
										name="nextPage" value="下一页" />

								</c:otherwise>
							</c:choose> <a
							href="<%=request.getContextPath()%>/findAll?pageNo=${page.bottomPageNo }"><input
								type="button" class="btn btn-primary" name="lastPage" value="尾页" /></a>
						</td>
					</tr>
				</tfoot>
			</table>
		</c:if>
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="personModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">X</button>
						<h4 class="modal-title" id="myModalLabel"></h4>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" id="personForm" method="post"
							role="form">
							<div class="form-group">
								<label class="control-label col-lg-2"><span
									style="color: red;">*</span>帐号</label>
								<div class="col-lg-9">
									<input type="text" name="username" id="username"
										class="form-control" placeholder="请输入用户名" required="required"
										maxlength="20" />
								</div>
								<div class="col-lg-1"></div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-2">地址</label>
								<div class="col-lg-9">
									<input type="text" name="address" id="address"
										class="form-control" placeholder="请输入地址" maxlength="20" />
								</div>
								<div class="col-lg-1"></div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-2">手机</label>
								<div class="col-lg-9">
									<input type="text" name="phone" id="phone" class="form-control"
										placeholder="请输入手机号" />
								</div>
								<div class="col-lg-1"></div>
							</div>
							<div class="form-group">
								<label class="control-label col-lg-2">备注</label>
								<div class="col-lg-9">
									<input type="text" name="remark" id="remark"
										class="form-control" placeholder="请输入备注" />
								</div>
								<div class="col-lg-1"></div>
							</div>
							<div id="other" style="display: none;">
								<input id="id" name="id">
							</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button class="btn btn-primary" type="submit" id="optionBtn"></button>
					</div>
				</div>
				</form>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
		<script type="text/javascript">
		//add之前设置属性
		function showBeforeAdd(){
			$("#myModalLabel").text("添加Person");
			$("#optionBtn").text("添加").show();
			$("#username").val("").removeAttr("disabled");
		   	$("#phone").val("").removeAttr("disabled");
		   	$("#address").val("").removeAttr("disabled");
		   	$("#remark").val("").removeAttr("disabled");
		   	$("#personForm").attr("action","<%=request.getContextPath()%>/savePerson?pageNo=1");
		}
		
		function deletePerson(id){
			$("#myModalLabel1").text("删除Person["+id+"]").attr("class","alert alert-danger");
			$("#delBtn").attr("onclick","deleteP("+id+")")
		}
		
		function deleteP(id){
			$.ajax({
				url:"<%=request.getContextPath()%>/deletePerson",
					async : true,
			        type : "POST",
			        cache:false,
			        data : {
			            "id" : id,
			            "pageNo":${page.pageNo}
			        },
			        success : function(){
			        	window. location.replace("<%=request.getContextPath()%>/findAll?pageNo=1");
			        },
			        error : function() {
			            alert("删除失败");
			        },
			});
			$('#deleteModal').modal('hide');
		}
		
		//查询对应person
		function queryData(id,obj) {
		    $.ajax({
		        url : "<%=request.getContextPath()%>/getPerson",
		        async : true,
		        type : "POST",
		        cache:false,
		        data : {
		            "uid" : id
		        },
		        // 成功后开启模态框
		        success : function(data){
		        	if($.trim(obj) == $.trim("query")){
		        		showQuery(data);
		        	}else if($.trim(obj) == $.trim("update")){
		        		updateData(data);
		        	}
		        },
		        error : function() {
		            alert("请求失败");
		        },
		        dataType : "json"
		    });
		}
		function showQuery(data) {
			$("#myModalLabel").text('查看Person[ID:'+data.id+']');
			$("#optionBtn").hide();
		   	$("#username").val(data.username).attr("disabled","disabled");
		   	$("#phone").val(data.phone).attr("disabled","disabled");
		   	$("#address").val(data.address).attr("disabled","disabled");
		   	$("#remark").val(data.remark).attr("disabled","disabled");
		    $('#personModal').modal('show');
		}
		function updateData(data){
			$("#myModalLabel").text('修改Person[ID:'+data.id+']');
			$("#optionBtn").text("修改").show();
			$("#id").val(data.id);
			$("#username").val(data.username).removeAttr("disabled");
		   	$("#phone").val(data.phone).removeAttr("disabled");
		   	$("#address").val(data.address).removeAttr("disabled");
		   	$("#remark").val(data.remark).removeAttr("disabled");
		   	$("#personForm").attr("action","<%=request.getContextPath()%>/updatePerson?pageNo=${page.pageNo}");
		   	//$('#personModal').modal('show');
		}
		</script>

		<!-- 模态框（Modal） -->
		<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel1"></h4>
					</div>
					<div class="modal-body">
						<div class="alert alert-danger" id="tip">您确定要删除吗？</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭
						</button>
						<button type="submit" id="delBtn" class="btn btn-primary">
							删除</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>
	</div>
	<div class="col-lg-1"></div>
</body>
</html>