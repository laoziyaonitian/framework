<#assign base = request.contextPath/>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
<title>个人资料管理</title>
<link href="${base}/resources/global/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/global/plugins/bootstrap-toastr/toastr.css" rel="stylesheet" type="text/css">
<link href="${base}/resources/global/plugins/ztree/css/metro.css" rel="stylesheet" type="text/css"/>
<!--DataTable css Start-->
<link rel="stylesheet" type="text/css" href="${base}/resources/global/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="${base}/resources/global/plugins/datatables/extensions/Scroller/css/dataTables.scroller.min.css"/>
<link rel="stylesheet" type="text/css" href="${base}/resources/global/plugins/datatables/extensions/ColReorder/css/dataTables.colReorder.min.css"/>
<link rel="stylesheet" type="text/css" href="${base}/resources/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css"/>
<!--DataTable css End-->
<link href="${base}/resources/global/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/global/css/lion.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/global/css/combotree/combotree.css" rel="stylesheet" type="text/css" />
<!-- DataTables js Start -->
<script type="text/javascript" src="${base}/resources/global/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="${base}/resources/global/plugins/datatables/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="${base}/resources/global/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.js"></script>
<script type="text/javascript" src="${base}/resources/global/plugins/datatables/extensions/ColReorder/js/dataTables.colReorder.js"></script>
<script type="text/javascript" src="${base}/resources/global/plugins/datatables/extensions/Scroller/js/dataTables.scroller.js"></script>
<script type="text/javascript" src="${base}/resources/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<!-- DataTables js End -->
<script src="${base}/resources/global/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<script src="${base}/resources/global/plugins/bootstrap-toastr/toastr.min.js"></script>
<script src="${base}/resources/admin/pages/scripts/ui-toastr.js"></script>
<script src="${base}/resources/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<!--EasyUI JavaScript End-->
<!--ztree js-->
<script src="${base}/resources/global/plugins/ztree/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>
<!--lion UI JS Start-->
<script src="${base}/resources/global/js/lion.js" type="text/javascript"></script>
<script src="${base}/resources/global/js/form/form.fill.js" type="text/javascript"></script>
<script src="${base}/resources/global/js/dialog/dialog.js" type="text/javascript"></script>
<script src="${base}/resources/global/js/combo/combo.js" type="text/javascript"></script>
<script src="${base}/resources/global/js/combotree/combotree.js" type="text/javascript"></script>
<script src="${base}/resources/global/js/datagrid/datagrids.js" type="text/javascript"></script>
<!--lion UI JS End-->
<script src="${base}/resources/global/js/local/lion-lang-zh_CN.js" type="text/javascript"></script>
<script src="${base}/resources/admin/scripts/system/user.js" type="text/javascript"></script>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-sidebar-closed-hide-logo">
<!-- BEGIN PAGE CONTENT INNER -->
<!-- BEGIN PROFILE CONTENT -->
					<div class="profile-content">
						<div class="row">
							<div class="col-md-12">
								<div class="portlet light">
									<div class="portlet-title tabbable-line">
										<div class="caption caption-md">
											<i class="icon-globe theme-font hide"></i>
											<span class="caption-subject font-blue-madison bold uppercase">个人资料管理</span>
										</div>
										<ul class="nav nav-tabs">
											<li class="active">
												<a href="#tab_1_1" data-toggle="tab">基本信息</a>
											</li>
											<li>
												<a href="#tab_1_2" data-toggle="tab">修改头像</a>
											</li>
											<li>
												<a href="#tab_1_3" data-toggle="tab">修改密码</a>
											</li>
											<li>
												<a href="#tab_1_4" data-toggle="tab">设置</a>
											</li>
										</ul>
									</div>
									<div class="portlet-body">
										<div class="tab-content">
											<!-- PERSONAL INFO TAB -->
											<div class="tab-pane active" id="tab_1_1">
												<form  action="#" class="form-horizontal" id="formuser">
													<div class="form-group">
														<label class="control-label col-md-3">真实姓名(中文)</label>
														<div class="col-md-8 input-group">
															<input type="text" class="form-control input-medium"  name="realnameZh" value="${user.realnameZh!}"/>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label  col-md-3">真实姓名(英文)</label>
														<div class="col-md-8 input-group">
															<input type="text" class="form-control input-medium" name="realnameEn" value="${user.realnameEn!}"/>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">手机号</label>
														<div class="col-md-8 input-group">
															<input type="text"  class="form-control input-medium" name="mobile" value="${user.mobile!}"/>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">联系电话</label>
														<div class="col-md-8 input-group">
															<input type="text"   class="form-control input-medium" name="telephone" value="${user.telephone!}"/>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">办公室电话</label>
														<div class="col-md-8 input-group">
															<input type="text"   class="form-control input-medium" name="officePhone" value="${user.officePhone!}"/>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">传真</label>
														<div class="col-md-8 input-group">
															<input type="text" class="form-control input-medium" name="fax" value="${user.fax!}"/>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">邮编</label>
														<div class="col-md-8 input-group">
															<input type="text"  class="form-control input-medium" name="postcode" value="${user.postcode!}"/>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">办公位置</label>
														<div class="col-md-8 input-group">
															<input type="text"  class="form-control input-medium" name="location" value="${user.location!}"/>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-3">描述</label>
														<div class="col-md-8 input-group">
															<input type="text"  class="form-control input-medium" name="description"  value="${user.description!}"/>
														</div>
													</div>
													<div class=" form-group">
															<label class="col-md-3 control-label"></label>
															<div class="col-md-8 input-group">
																<button type="button" id="btnChanagePwdSave" class="btn blue">
																	<i class="fa fa-save"></i> 保存基本信息
																</button>&nbsp; &nbsp; 
																<button type="button" id="btnCancel" class="btn default">
																	<i class="fa  fa-arrow-left"></i> 取 消 
																</button>
															</div>
													</div>
												</form>
											</div>
											<!-- END PERSONAL INFO TAB -->
											<!-- CHANGE AVATAR TAB -->
											<div class="tab-pane" id="tab_1_2">
												<form action="#" role="form">
													<div class="form-group">
														<div class="fileinput fileinput-new" data-provides="fileinput">
															<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
																<img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt=""/>
															</div>
															<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;">
															</div>
															<div>
																<span class="btn default btn-file">
																<span class="fileinput-new">
																选择图片 </span>
																<span class="fileinput-exists">
																修改 </span>
																<input type="file" name="...">
																</span>
																<a href="#" class="btn default fileinput-exists" data-dismiss="fileinput">
																删除 </a>
															</div>
														</div>
														<div class="clearfix margin-top-10">
															 
														</div>
													</div>
													<div class="margin-top-10">
														<a href="#" class="btn green-haze">
														保存头像 </a>
														<a href="#" class="btn default">
														取  消 </a>
													</div>
												</form>
											</div>
											<!-- END CHANGE AVATAR TAB -->
											<!-- CHANGE PASSWORD TAB -->
											<div class="tab-pane" id="tab_1_3">											  
													<form action="#"  id="formpassword" class="form-horizontal">
														<div class="form-group">
															<label class="control-label  col-md-3">旧密码</label>
															<div class="col-md-8 input-group">
																<input type="password" class="form-control input-medium" name="oldpassword"/>
															</div>															
														</div>
														<div class="form-group">
															<label class="control-label col-md-3">新密码</label>
															<div class="col-md-8 input-group">
																<input type="password" class="form-control input-medium" name="password"/>
															</div>
														</div>
														<div class="form-group">												
															<label class="col-md-3 control-label">确认新密码</label>
															<div class="col-md-8 input-group">
																<input type="password" class="form-control input-medium" name="confirmpassword"/>
															</div>												 
														</div>
														<div class=" form-group">
															<label class="col-md-3 control-label"></label>
															<div class="col-md-8 input-group">
																<button type="button" id="btnChanagePwdSave" class="btn blue">
																	<i class="fa fa-save"></i> 修改密码 
																</button>&nbsp; &nbsp; 
																<button type="button" id="btnCancel" class="btn default">
																	<i class="fa  fa-arrow-left"></i> 取 消 
																</button>
															</div>
														</div>
													</form>
											</div>
											<!-- END CHANGE PASSWORD TAB -->
											<!-- PRIVACY SETTINGS TAB -->
											<div class="tab-pane" id="tab_1_4">												 
													<form action="#"  class="form-horizontal">
														 <div class=" form-group">
															<label class="col-md-3 control-label"></label>
															<div class="col-md-8 input-group">
																<button type="button" id="btnSaveSettings" class="btn blue">
																	<i class="fa fa-save"></i> 保存设置
																</button>&nbsp; &nbsp; 
																<button type="button" id="btnCancel" class="btn default">
																	<i class="fa  fa-arrow-left"></i> 取 消 
																</button>
															</div>
														</div>
													</form>
												 
											</div>
											<!-- END PRIVACY SETTINGS TAB -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END PROFILE CONTENT -->

<!-- END PAGE CONTENT INNER -->
</body>
</html>
