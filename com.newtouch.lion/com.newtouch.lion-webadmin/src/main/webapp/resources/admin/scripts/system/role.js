$(function() {
	//加载bootstrap
	Metronic.init(); // init metronic core componets
	Layout.init(); // init layout
	Tasks.initDashboardWidget(); // init tash dashboard widget

	$("#sys_role_lists_tb").datagrid({
		onLoadSuccess : function(data) {
 
		}
	});
	
	 //重新加载DataGrid
	 function dataGridReload(dataGridId){
		$("#"+dataGridId).datagrid("reload");
	 }
	 //刷新
	 $("#btnRefresh").on("click",function(){
		 dataGridReload("sys_role_lists_tb");
	 });
	 
	 $("#btnAdd").on("click",function(){
		 return;
	 });	
});
