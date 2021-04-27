<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>员工列表</title>
    <%--静态引入样式文件--%>
    <%@ include file="common/jscssjq.jsp"%>
<body>
<!-- 员工添加Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <!--填写Modal内容-->
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@atguigu.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId" id="dept_add_select">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工修改Modal -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_update_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" disabled> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F" disabled> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <!-- 部门提交部门id即可 -->
                            <select class="form-control" name="dId">
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<!--搭建显示页面-->
<div class="container">
    <%@ include file="common/head.jsp"%>
    <!--第一行：显示标题-->
    <div class="row">
        <div class="col-md-12">
            <h1>后台管理模块</h1>
        </div>
    </div>
    <!--第二行：添加/删除按钮-->
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>
    </div>
    <!--第三行：显示表格数据-->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all">
                    </th>
                    <th>No.</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <!-- //通过ajax请求之后得到result，在ajax的处理函数中添加tbody -->
                </tbody>
            </table>
        </div>
    </div>
    <!--第四行：显示分页数据-->
    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area"></div>
    </div>

    <%--静态包含页脚内容--%>
    <%@include file="/WEB-INF/views/common/foot.jsp"%>
</div>

<!--js脚本-->
<script type="text/javascript">
    var total_pages;
    var current_page;
    var current_rows = 0;
    //1,当前页面加载完成之后
    $(function(){
        //直接发送去第一页的ajax请求，要到分页数据
        to_page(1);
    });

    //将跳转页面的代码抽取出来
    function to_page(pn){
        $("#check_all").prop("checked",false);
        $.ajax({
            url:"${pro_path }/emps",
            data:"pn="+pn,
            type:"get",
            success:function(result){
                //1,解析并显示员工数据
                build_emps_table(result);
                //2，解析并显示分页信息
                build_page_mav(result);
                //3，解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    //1,解析员工数据
    function build_emps_table(result){
        /*再次调用此方法前，应该先清空当前区域内数据*/
        $("#emps_table tbody").empty();
        var emps=result.extend.pageInfo.list;
        $.each(emps,function(index,item){
            current_rows++;
            var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.dept.deptName);

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            //为了方便以后点击修改，得到对应的员工id，我们为editBtn加上一个自定义属性edit-id,来表示当前对应的员工信息
            editBtn.attr("edit-id",item.empId);
            var delBtn  = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("删除");
            delBtn.attr("del-id",item.empId);
            /*将两个按钮放到同一个单元格中*/
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }

    //2，解析分页信息
    function build_page_mav(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页,"
            +"总"+result.extend.pageInfo.pages+"页"
            +"总 "+result.extend.pageInfo.total+"条记录");

        total_pages = result.extend.pageInfo.pages;
        current_page = result.extend.pageInfo.pageNum;
    }

    //3，解析显示分页条数据
    function build_page_nav(result){
        $("#page_nav_area").empty();
        //构建分页条ul
        var ul=$("<ul></ul>").addClass("pagination");
        //构建ul中的元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        //添加首页和前一页按钮
        ul.append(firstPageLi).append(prePageLi);
        //遍历给ul中添加页码按钮
        $.each(result.extend.pageInfo.navigatepageNums,function(index,item){
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum == item){
                numLi.addClass("active");
            }
            numLi.click(function(){
                to_page(item);
            });
            ul.append(numLi);
        });
        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        //添加下一页和末页按钮
        ul.append(nextPageLi).append(lastPageLi);


        /*如果当前页是首页，则设置上一页和首页按钮不可点击*/
        if(!result.extend.pageInfo.hasPreviousPage){
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            firstPageLi.click(function(){
                to_page(1);
            });
            prePageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum-1);
            });
        }


        /*如果当前页是末页，则设置下一页和末页按钮不可点击*/
        if(!result.extend.pageInfo.hasNextPage){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            nextPageLi.click(function(){
                to_page(result.extend.pageInfo.pageNum+1);
            });
            lastPageLi.click(function(){
                to_page(result.extend.pageInfo.pages);
            });
        }

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    //清除表单数据和样式的方法（表单完整重置）
    function reset_form(ele){
        //清空表单数据
        $(ele)[0].reset();
        //清空表单样式
        $(ele).find("").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    //点击新增按钮弹出模态框。
    $("#emp_add_modal_btn").click(function(){
        //清除表单数据和样式（表单完整重置）
        reset_form("#empAddModal form");
        //发送ajax请求，查出部门信息，显示在下拉列表中
        getDepts("#empAddModal select");
        //弹出模态框
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });
    //获取所有部门并添加到modal的form中的方法
    function getDepts(ele){
        //清空之前的列表信息
        $(ele).empty();
        $.ajax({
            url:"${pro_path}/depts",
            type:"Get",
            success:function(result){
                /*遍历部门信息*/
                $.each(result.extend.depts,function(){
                    var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    /*将其添加到模态框的下拉列表select中*/
                    optionEle.appendTo(ele);
                })
            }
        });
    }

    //校验表单数据
    function validate_add_from(){
        //1，拿到要校验的字段empName_add_input，并指定校验规则（正则表达式）
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16})|(^[\u2E80-\u9FFF]{1,10})/;
        //校验名称信息
        if(!regName.test(empName)){
            show_valiable_msg("#empName_add_input","error","view error:用户名必须是2-5位中文或者6-16位英文和数字的组合");
            return false;
        }else{
            show_valiable_msg("#empName_add_input","success","view success:用户名可用");
        }
        //校验邮箱信息
        var empEmail = $("#email_add_input").val();
        var regEmail =  /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(empEmail)){
            show_valiable_msg("#email_add_input","error","view error:请输入正确邮箱地址");
            return false;
        }else{
            if($("#emp_save_btn").attr("ajax-va")=="success")
                show_valiable_msg("#email_add_input","success","view success:邮箱地址可用");
            else
                show_valiable_msg("#email_add_input","error","view error:邮箱地址重复");
        }
        return true;
    }

    //校验后显示的信息
    function show_valiable_msg(ele,status,msg){
        //每次调用此方法前，都应该清除上一次方法产生的影响
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if("success"==status){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error"==status){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //通过检验邮箱的方法来确保员工的唯一性
    $("#email_add_input").blur(function(){
        var empEmail = this.value;
        //发送ajax请求判断邮箱是否唯一
        $.ajax({
            url:"${pro_path}/checkuser",
            data:"empEmail="+empEmail,
            type:"POST",
            success:function(result){
                if(result.code==200){
                    show_valiable_msg("#email_add_input","success",result.extend.va_msg);
                    //给保存按钮添加一个属性，来记录当前邮箱是否可用
                    $("#emp_save_btn").attr("ajax-va","success");
                }else{
                    show_valiable_msg("#email_add_input","error",result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax-va","error");
                }
            }
        });
    });
    //保存新增模态框的表单信息
    $("#emp_save_btn").click(function(){
        //模态框中填写的表单数据提交给服务器进行保存

        //0，首先要对填写的表单信息进行“前端”校验，是否符合规则((!validate_add_from()),我们现在将这个校验也交给后端，使用spring提供的校验)
        //0,包括判断当前邮箱地址的可用性(this.attr("ajax-va")=="error")
        if($(this).attr("ajax-va")=="error"){
            return false;
        }
        //1,模态框中form表单调用serialize()方法，得到字符串，供ajax请求使用
        var emp_data = $("#empAddModal form").serialize();
        //2，发送ajax请求保存员工
        $.ajax({
            url:"${pro_path}/emp",
            type:"POST",
            data:emp_data,
            success:function(result){
                if(result.code==200){
                    //保存成功之后
                    //1，关闭模态框
                    $("#empAddModal").modal('hide');
                    //2，来到最后一页查看刚保存的数据
                    to_page(total_pages+1);
                }else{
                    //有哪个字段的错误信息就显示哪个字段的；
                    if(undefined != result.extend.errorFields.email){
                        //显示邮箱错误信息
                        show_valiable_msg("#email_add_input", "error", result.extend.errorFields.email);
                    }
                    if(undefined != result.extend.errorFields.empName){
                        //显示员工名字的错误信息
                        show_valiable_msg("#empName_add_input", "error", result.extend.errorFields.empName);
                    }
                }
            }
        });
    });


    /*
    给修改按钮绑定事件
    由于修改按钮是在页面完成加载之后出现的，不能直接在其创建之前为其绑定事件
    我们采取.on()方法，可以为新生的后代元素绑定事件
    */
    $(document).on("click",".edit_btn",function(){
        //清除表单数据和样式（表单完整重置）
        reset_form("#empUpdateModal form");
        //查询该员工信息
        getEmp($(this).attr("edit-id"));
        //查询所有的部门并填在updateModal的select中
        getDepts("#empUpdateModal select");

        //为了便于更新，我们将员工id传递给modal的更新按钮
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        //弹出修改的模态框
        $("#empUpdateModal ").modal({
            backdrop:"static"
        });

    });

    //查询员工的方法
    function getEmp(id){
        $.ajax({
            url:"${pro_path}/emp/"+id,
            type:"GET",
            success:function(result){
                console.log(result);
                //开始设置回显信息
                var empData = result.extend.emp;
                $("#empName_update_input").val(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empUpdateModal input[name=gender]").val([empData.gender]);
                $("#empUpdateModal select").val([empData.dId]);
            }
        })
    }

    //点击更新，更新员工信息
    $("#emp_update_btn").click(function(){
        //验证名称是否合法
        //1，拿到要校验的字段empName_add_input，并指定校验规则（正则表达式）
        var empName = $("#empName_update_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16})|(^[\u2E80-\u9FFF]{1,10})/;
        //校验名称信息
        if(!regName.test(empName)){
            show_valiable_msg("#empName_update_input","error","view error:用户名必须是2-5位中文或者6-16位英文和数字的组合");
            return false;
        }else{
            show_valiable_msg("#empName_update_input","success","view success:用户名可用");
        }
        //发送ajax请求保存更新的员工数据
        $.ajax({
            url:"${pro_path}/emp/"+$(this).attr("edit-id"),
            type:"POST",
            data:$("#empUpdateModal form").serialize()+"&_method=PUT",
            success:function(result){
                //保存成功之后
                //1，关闭模态框
                $("#empUpdateModal").modal('hide');
                //2，查看刚保存的数据
                to_page(current_page);
            }
        });
    });

    /*给每一个员工信息后面的删除按钮绑定单个删除事件*/
    $(document).on("click",".delete_btn",function(){
        var empName_delete = $(this).parents("tr").find("td:eq(2)").text();
        var empId_delete = $(this).attr("del-id");
        if(confirm("确认删除【 "+empName_delete+" 】吗？")){
            //确认之后，发送ajax请求删除对应员工。
            $.ajax({
                url:"${pro_path}/emp/"+empId_delete,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    //回到当前页
                    to_page(current_page);
                }
            });
        }
    });

    //完成全选，全不选功能
    $("#check_all").click(function(){
        $(".check_item").prop("checked",$(this).prop("checked"));
    });
    $(document).on("click",".check_item",function(){
        /*$(".check_item").length*/
        var fullChecked = $(".check_item:checked").length==current_rows;
        $("#check_all").prop("checked",fullChecked);
    });

    //点击标题下的删除，就批量删除
    $("#emp_delete_all_btn").click(function(){
        //获取需要删除的员工的名字，用于删除前的提示信息
        var empNames = "";
        //组装id字符串
        var del_idstr = "";
        $.each($(".check_item:checked"),function(){
            empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        //去除empNames后多余的逗号。
        empNames = empNames.substring(0,empNames.length-1);
        del_idstr = del_idstr.substring(0,del_idstr.length-1);
        if(empNames==""){
            confirm("你还未选择需要删除的员工信息，请先选择。")
        }else if(confirm("确定删除【 "+empNames+" 】吗？")){
            $.ajax({
                url:"${pro_path}/emp/"+del_idstr,
                type:"DELETE",
                success:function(result){
                    alert(result.msg);
                    //回到当前页面
                    to_page(current_page);
                }
            });
        }
    });

</script>
</body>
</html>