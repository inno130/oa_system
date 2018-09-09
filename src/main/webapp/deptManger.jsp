<%@page import="java.sql.*"%>
<%@page import="DBUtils.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
		<link rel="stylesheet" href="css/amazeui.min.css">
		<link rel="stylesheet" href="css/admin.css">
		<link rel="stylesheet" href="css/app.css">
	</head>

	<body>
	<div class="admin-content-body"style="" >
			<div class="am-cf am-padding am-padding-bottom-0" >
				<div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">部门管理</strong><small></small></div>
			</div>
			<hr>
			<div class="am-g">
				<div class="am-u-sm-12 am-u-md-6">
					<div class="am-btn-toolbar">
						<div class="am-btn-group am-btn-group-xs">
							<button type="button" class="am-btn am-btn-default btnAdd">
									<span class="am-icon-plus"></span> 新增
									</button>
						</div>
					</div>
				</div>
							<div class="am-u-sm-12 am-u-md-3">
								<div class="am-input-group am-input-group-sm">
									<input class="am-form-field" id="departName" placeholder="请输入部门名称" type="text">
									<span class="am-input-group-btn">
										<button class="am-btn am-btn-default" type="button" id="btnsearch">
											搜索
										</button> </span>
								</div>
							</div>
						</div>

						<div class="am-g" style="margin-top: -30px;">
							<div class="am-u-sm-12">
								<form class="am-form" action="">
									<table class="am-table am-table-striped am-table-hover table-main">
										<thead>
											<tr>
												<th class="table-check">
													<input id="chkAll" type="checkbox">
												</th>
												<th class="table-id">
													ID
												</th>
												<th class="table-title">
													部门名称
												</th>
												<th class="table-set">
													操作
												</th>
											</tr>
										</thead>
										<tbody id="tUser">
											<%
											Connection conn = null;
											PreparedStatement stat = null;
											ResultSet rs = null;
											try {
												conn=DBUtils.getConn();
												stat=conn.prepareStatement("select * from  emp");
												rs=stat.executeQuery();
												while(rs.next()){
												 %>
												 	<tr>
												<td><input name="chks" value="27" type="checkbox"></td>
												<td><%=rs.getInt(1) %></td>
												<td><%=rs.getString(2) %></td>
												<td><%=rs.getString(3) %></td>
												<td>
													<div class="am-btn-toolbar">
														<div class="am-btn-group am-btn-group-xs"><button type="button" id="depart_27" class="am-btn am-btn-default am-btn-xs am-text-secondary btnedit"><span class="am-icon-pencil-square-o"></span> 编辑</button><button type="button" class="am-btn am-btn-default am-btn-xs am-text-danger amt-hide-sm-only" onclick="deleteDepart(27,1)"><span class="am-icon-trash-o"></span> 删除</button></div>
													</div>
												</td> 
											</tr>
												 <% 
												}
											} catch (Exception e) {
												e.printStackTrace();
											}finally{
												DBUtils.close(conn,stat,rs);
											}
											%>
										</tbody>
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- content end -->
			</div>
		</div>

		<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->


<!--[if (gte IE 9)|!(IE)]><!-->
		<!-- <script src="js/jquery-1.11.3.min.js"></script> -->
		<!--<![endif]-->
		<!-- <script type="text/javascript" src="myplugs/js/plugs.js"></script> -->

		<!-- <script>
			$(function() {
					 $("#chkAll").chkAll({
				 });
				$(".btnedit").click(function() {
					$.jq_Panel({
						title: "修改部门",
						iframeWidth: 500,
						iframeHeight: 300,
						url: "addDepart.html"
					});
				});
				$(".btnAdd").click(function() {

					$.jq_Panel({
						title: "添加部门",
						iframeWidth: 500,
						iframeHeight: 300,
						url: "addDepart.html"
					});
				});
			});
		</script> -->
	</body>
</html>