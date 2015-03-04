var icondg=$('#sys_icon_tb'); //datagrids
var addForm=$('#sysIconForm');  //编辑或添加表单
var addDialog=$('#basic'); //编辑或添加对话框
$(function () {
  //加载bootstrap
  Metronic.init(); // init metronic core componets
  Layout.init(); // init layout
  Tasks.initDashboardWidget(); // init tash dashboard widget
  lion.util.menu();//加载导航栏

  icondg=$("#sys_icon_tb");
  addForm=$('#sysIconForm');
  addDialog=$('#basic');
  var queryForm=$('#queryform');

  //验证表单
  handleVForm(addForm,submitForm);
  
  //查询
  $('#btnQuery').click(function(){
	  icondg.datagrids({querydata:queryForm.serializeObject()});
    var queryparam=icondg.datagrids('queryparams'); 
    icondg.datagrids('reload');
  });
  //刷新
  $('#btnRefresh').click(function(){     
	  icondg.datagrids('reload');
    });
  //添加
    $('#btnAdd').click(function(){
      addForm.reset();
      addDialog.find('.modal-header h4 span').text('添加图标');
      return;
    });

    //编辑
    $('#btnEdit').click(function(){
        var row=icondg.datagrids('getSelected');
        if(!row){
       lion.util.info('提示','请选择要编辑记录');
       return;
    }
    addForm.reset();
    addDialog.find('.modal-header h4 span').text('编辑图标');
    addDialog.modal('toggle');
    addForm.fill(row);
    });

     //删除
   $('#btnDelete').on('click',function(){
     var row=icondg.datagrids('getSelected');
     if(!row){
       lion.util.info('提示','请选择要删除记录');
       return;
     }
     bootbox.confirm('确认要删除此记录？', function(result) {
              if(result){              
                var param={'id':row.id};
                  lion.util.post('delete.json',param,successForDelete,errorRequest);
              }
          }); 
   });
   //导出Excel
   $('#btnExport').on('click',function(){
     var params=queryForm.serialize(),url='export.json?tableId='+icondg.attr('id');
        if(lion.util.isNotEmpty(params)){
          url+='&'+params;
        }
        window.open(url,'_blank');
   });
   
   //保存
   $('#btnSave').click(function(){
    addForm.submit();
   });

   //删除成功
  function successForDelete(data,arg){
     if(data!==null&&!(data.hasError)){
        lion.util.success('提示',data.message);
        icondg.datagrids('reload');
     }else if(data!==null&&data.hasError){
        var gmsg='';
        for(var msg in data.errorMessage){
          gmsg+=data.errorMessage[msg];
        }
        if(lion.util.isEmpty(gmsg)){
          gmsg='未删除成功';
        }
        lion.util.error('提示',gmsg);
    }
  }

});


/**新增或编辑的提交代码*/
function submitForm(frm){
  var param=frm.serialize(),id=($('#id').val());
  //ID为空时，为添加动作
  if(lion.util.isEmpty(id)){
      lion.util.post('add.json',param,successAddFrm,errorRequest);
  }else{
      lion.util.post('edit.json',param,successAddFrm,errorRequest,param.id);
  }
}

//添加后&编辑后提交
function successAddFrm(data,arg,id){
  //TODO
  if(data!==null&&!(data.hasError)){
    lion.util.success('提示',data.message);
    addDialog.modal('toggle');
    icondg.datagrids('reload');
  }else if(data!==null&&data.hasError){
    var gmsg='';
    for(var msg in data.errorMessage){
      gmsg+=data.errorMessage[msg];
    }
    if(lion.util.isEmpty(gmsg)){
      gmsg='添加图标出错';
    }
    lion.util.error('提示',gmsg);
  }else{
    lion.util.error('提示','添加图标失败');
  }
}
//请求失败后信息
function errorRequest(xhr,textStatus,error){
  lion.util.error('提示','网络连接异常');
}

//验证表单
handleVForm=function(vForm,submitCallBackfn){
  var addError = $('.alert-danger', vForm);
    var addSuccess = $('.alert-success',vForm);
  vForm.validate({
        errorElement: 'span',
        errorClass: 'help-block help-block-error', 
        focusInvalid: false, 
        onkeyup:false,
        ignore: '', 
        messages: {
        	iconType:{
        		required:'请输入图标类型',
        		rangelength:jQuery.validator.format('图标类型长度为{0}和{1}字符之间')
        	},
        	iconClass:{
	            required:'请输入图标类名',
	            rangelength:jQuery.validator.format('图标类名长度为{0}和{1}字符之间'),
	            remote:'该图标类名已存在，请输入其它名称'
        	},
        	iconImage:{
	            required:'请输入图标图片路径',
	            rangelength:jQuery.validator.format('图标图片路径长度为{0}和{1}字符之间')
        	}
        },
        rules: {
        	iconType: {
                required:true,
                rangelength:[1,128]
            },
            iconClass:{
              required: true,
                rangelength:[1,128],
                remote:{
                    url:'checkisexitnameen.htm', //后台处理程序
                    type: 'post',               //数据发送方式
                    dataType: 'json',           //接受数据格式   
                    data: {                     //要传递的数据
                       nameEn: function() {
                        return $('#nameEn').val();
                       },
                       id:function(){
                         var id=($('#id').val());
                         if(lion.util.isNotEmpty(id)){
                           return id;
                         }
                         return '';
                       }
                    }
             }
            },
            iconImage: {
                required:true,
                rangelength:[1,128]
            }
        },
        invalidHandler: function (event, validator) {             
            addSuccess.hide();
            addError.show();
            Metronic.scrollTo(addError, -200);
        },

        highlight: function (element) {
            $(element).closest('.form-group').addClass('has-error'); 
        },

        unhighlight: function (element) {
            $(element).closest('.form-group').removeClass('has-error'); 
        },
        success: function (label) {
            label.closest('.form-group').removeClass('has-error'); 
        },
        errorPlacement:function(error,element){
          //当遇到combo的对话框架的时，修改它的显示位置
          if (element.hasClass('lion-combo')){           
            error.insertAfter(element.parent().find('div.btn-group'));
          }else{
            error.insertAfter(element);
          }
        },
        submitHandler: function (form) {
            addSuccess.show();
            addError.hide();
            submitCallBackfn(vForm);
        }
    });
};

//测试选择中checkbox
function formatterCheckBox(data,type,full){
	return data;
}

//判断是否编辑
function formatterEidtable(data,type,full) {
  var name =$.lion.lang.editable.n;
  if (data) {
    name = $.lion.lang.editable.y;
  }
  return name;
}
