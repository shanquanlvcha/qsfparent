<%@ page language="java" contentType="text/html; charset=utf8"
    pageEncoding="utf8"%>
<!DOCTYPE html>
<HTML>
<HEAD>
	<TITLE>菜单管理</TITLE>
	
	
	
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <title>H+ 后台主题UI框架 - 主页</title>

    <meta name="keywords" content="骑士风后台管理">
    <meta name="description" content="ztree与bootstrrap的整合">

    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico">
    <link href="../plus/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="../plus/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="../plus/css/animate.min.css" rel="stylesheet">
    <link href="../plus/css/style.min862f.css?v=4.1.0" rel="stylesheet">
	
	<script src="../plus/js/jquery.min.js?v=2.1.4"></script>
    <script src="../plus/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="../plus/js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="../plus/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="../plus/js/plugins/layer/layer.min.js"></script>
    <script src="../plus/js/hplus.min.js?v=4.1.0"></script>
    <script type="text/javascript" src="../plus/js/contabs.min.js"></script>
    <script src="../plus/js/plugins/pace/pace.min.js"></script>
	
	<!-- 上边是bootstrap的框架-->
	
	<link rel="stylesheet" href="../plus/css/demo.css" type="text/css">
	<link rel="stylesheet" href="../plus/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<!-- 
	<script type="text/javascript" src="../plus/js/ztree/jquery-1.4.4.min.js"></script>
	 -->
	<script type="text/javascript" src="../plus/js/ztree/jquery.ztree.core.js"></script>
	<script type="text/javascript" src="../plus/js/ztree/jquery.ztree.excheck.js"></script>
	<script type="text/javascript" src="../plus/js/ztree/jquery.ztree.exedit.js"></script>


    <script src="../plus/js/content.min.js?v=1.0.0"></script>
    <script src="../plus/js/jquery-ui-1.10.4.min.js"></script>
    <script src="../plus/js/plugins/beautifyhtml/beautifyhtml.js"></script>
    <script>
        $(document).ready(function(){setup_draggable();$("#n-columns").on("change",function(){var v=$(this).val();if(v==="1"){var $col=$(".form-body .col-md-12").toggle(true);$(".form-body .col-md-6 .draggable").each(function(i,el){$(this).remove().appendTo($col)});$(".form-body .col-md-6").toggle(false)}else{var $col=$(".form-body .col-md-6").toggle(true);$(".form-body .col-md-12 .draggable").each(function(i,el){$(this).remove().appendTo(i%2?$col[1]:$col[0])});$(".form-body .col-md-12").toggle(false)}});$("#copy-to-clipboard").on("click",function(){var $copy=$(".form-body").clone().appendTo(document.body);$copy.find(".tools, :hidden").remove();$.each(["draggable","droppable","sortable","dropped","ui-sortable","ui-draggable","ui-droppable","form-body"],function(i,c){$copy.find("."+c).removeClass(c).removeAttr("style")});var html=html_beautify($copy.html());$copy.remove();$modal=get_modal(html).modal("show");$modal.find(".btn").remove();$modal.find(".modal-title").html("复制HTML代码");$modal.find(":input:first").select().focus();return false})});var setup_draggable=function(){$(".draggable").draggable({appendTo:"body",helper:"clone"});$(".droppable").droppable({accept:".draggable",helper:"clone",hoverClass:"droppable-active",drop:function(event,ui){$(".empty-form").remove();var $orig=$(ui.draggable);if(!$(ui.draggable).hasClass("dropped")){var $el=$orig.clone().addClass("dropped").css({"position":"static","left":null,"right":null}).appendTo(this);var id=$orig.find(":input").attr("id");if(id){id=id.split("-").slice(0,-1).join("-")+"-"+(parseInt(id.split("-").slice(-1)[0])+1);$orig.find(":input").attr("id",id);$orig.find("label").attr("for",id)}$('<p class="tools col-sm-12 col-sm-offset-3">						<a class="edit-link">编辑HTML<a> | 						<a class="remove-link">移除</a></p>').appendTo($el)}else{if($(this)[0]!=$orig.parent()[0]){var $el=$orig.clone().css({"position":"static","left":null,"right":null}).appendTo(this);$orig.remove()}}}}).sortable()};var get_modal=function(content){var modal=$('<div class="modal" style="overflow: auto;" tabindex="-1">	<div class="modal-dialog"><div class="modal-content"><div class="modal-header"><a type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</a><h4 class="modal-title">编辑HTML</h4></div><div class="modal-body ui-front">	<textarea class="form-control" 	style="min-height: 200px; margin-bottom: 10px;font-family: Monaco, Fixed">'+content+'</textarea><button class="btn btn-success">更新HTML</button></div>				</div></div></div>').appendTo(document.body);return modal};$(document).on("click",".edit-link",function(ev){var $el=$(this).parent().parent();var $el_copy=$el.clone();var $edit_btn=$el_copy.find(".edit-link").parent().remove();var $modal=get_modal(html_beautify($el_copy.html())).modal("show");$modal.find(":input:first").focus();$modal.find(".btn-success").click(function(ev2){var html=$modal.find("textarea").val();if(!html){$el.remove()}else{$el.html(html);$edit_btn.appendTo($el)}$modal.modal("hide");return false})});$(document).on("click",".remove-link",function(ev){$(this).parent().parent().remove()});
    </script>
    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>

	
	<SCRIPT type="text/javascript">
		var setting = {
			view: {
				dblClickExpand: true
			},
			check: {
				enable: true
			},
			callback: {
				onRightClick: OnRightClick
			}
		};
		var zNodes =[
			{id:1, name:"无右键菜单 1", open:true, noR:true,
				children:[
					   {id:11, name:"节点 1-1", noR:true},
					   {id:12, name:"节点 1-2", noR:true}

				]},
			{id:2, name:"右键操作 2", open:true,
				children:[
					   {id:21, name:"节点 2-1"},
					   {id:22, name:"节点 2-2"},
					   {id:23, name:"节点 2-3"},
					   {id:24, name:"节点 2-4"}
				]},
			{id:3, name:"右键操作 3", open:true,
				children:[
					   {id:31, name:"节点 3-1"},
					   {id:32, name:"节点 3-2"},
					   {id:33, name:"节点 3-3"},
					   {id:34, name:"节点 3-4"}
				]}
  	 	];
        //右边击打
		function OnRightClick(event, treeId, treeNode) {
			if (!treeNode && event.target.tagName.toLowerCase() != "button" && $(event.target).parents("a").length == 0) 
			{
				zTree.cancelSelectedNode();
				showRMenu("root", event.clientX, event.clientY);
			} else if (treeNode && !treeNode.noR) {
				zTree.selectNode(treeNode);
				showRMenu("node", event.clientX, event.clientY);
			}
		}

		function showRMenu(type, x, y) {
			$("#rMenu ul").show();
			if (type=="root") {
				$("#m_del").hide();
				$("#m_check").hide();
				$("#m_unCheck").hide();
			} else {
				$("#m_del").show();
				$("#m_check").show();
				$("#m_unCheck").show();
			}
            y += document.body.scrollTop;
            x += document.body.scrollLeft;
            rMenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"});

			$("body").bind("mousedown", onBodyMouseDown);
		}
		function hideRMenu() {
			if (rMenu) rMenu.css({"visibility": "hidden"});
			$("body").unbind("mousedown", onBodyMouseDown);
		}
		function onBodyMouseDown(event){
			if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
				rMenu.css({"visibility" : "hidden"});
			}
		}
		var addCount = 1;
		function addTreeNode() {
			hideRMenu();
			var newNode = { name:"增加" + (addCount++)};
			if (zTree.getSelectedNodes()[0]) {
				newNode.checked = zTree.getSelectedNodes()[0].checked;
				zTree.addNodes(zTree.getSelectedNodes()[0], newNode);
			} else {
				zTree.addNodes(null, newNode);
			}
		}
		
		//修改菜单
		
		function editTreeNode(){
			
			alert(1);
			/* hideRMenu();
			var newNode = { name:"修改" + (addCount++)};
			if (zTree.getSelectedNodes()[0]) {
				newNode.checked = zTree.getSelectedNodes()[0].checked;
				zTree.addNodes(zTree.getSelectedNodes()[0], newNode);
			} else {
				zTree.addNodes(null, newNode);
			} */
			
			
		}
		
		function removeTreeNode() {
			hideRMenu();
			var nodes = zTree.getSelectedNodes();
			if (nodes && nodes.length>0) {
				if (nodes[0].children && nodes[0].children.length > 0) {
					var msg = "要删除的节点是父节点，如果删除将连同子节点一起删掉。\n\n请确认！";
					if (confirm(msg)==true){
						zTree.removeNode(nodes[0]);
					}
				} else {
					zTree.removeNode(nodes[0]);
				}
			}
		}
		function checkTreeNode(checked) {
			var nodes = zTree.getSelectedNodes();
			if (nodes && nodes.length>0) {
				zTree.checkNode(nodes[0], checked, true);
			}
			hideRMenu();
		}
		function resetTree() {
			hideRMenu();
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		}

		var zTree, rMenu;
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			zTree = $.fn.zTree.getZTreeObj("treeDemo");
			rMenu = $("#rMenu");
		});
		
	</SCRIPT>
	<style type="text/css">
div#rMenu {position:absolute; visibility:hidden; top:0; background-color: #555;text-align: left;padding: 2px;}
div#rMenu ul li{
	margin: 1px 0;
	padding: 0 5px;
	cursor: pointer;
	list-style: none outside none;
	background-color: #DFDFDF;
}
	</style>
 </HEAD>

<body class="gray-bg">
<div class="wrapper wrapper-content">

    <div class="row">
        <div class="col-sm-3">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <div class="left" style="height: 400px">
                        <ul id="treeDemo" class="ztree"></ul>
                    </div>
                </div>
             </div>
        </div>

        <div class="col-sm-9">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <form role="form" class="form-horizontal m-t">
                        <div class="form-group draggable">
                            <label class="col-sm-3 control-label">文本框：</label>
                            <div class="col-sm-9">
                                <input type="text" name="" class="form-control" placeholder="请输入文本">
                                <span class="help-block m-b-none">说明文字</span>
                            </div>
                        </div>
                        <div class="form-group draggable">
                            <label class="col-sm-3 control-label">密码框：</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" name="password" placeholder="请输入密码">
                            </div>
                        </div>
                        <div class="form-group draggable">
                            <label class="col-sm-3 control-label">下拉列表：</label>
                            <div class="col-sm-9">
                                <select class="form-control" name="">
                                    <option>选项 1</option>
                                    <option>选项 2</option>
                                    <option>选项 3</option>
                                    <option>选项 4</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group draggable">
                            <label class="col-sm-3 control-label">文件域：</label>
                            <div class="col-sm-9">
                                <input type="file" name="" class="form-control">
                            </div>
                        </div>
                        <div class="form-group draggable">
                            <label class="col-sm-3 control-label">纯文本：</label>

                            <div class="col-sm-9">
                                <p class="form-control-static">这里是纯文字信息</p>
                            </div>
                        </div>
                        <div class="form-group draggable">
                            <label class="col-sm-3 control-label">单选框：
                            </label>

                            <div class="col-sm-9">
                                <label class="radio-inline">
                                    <input type="radio" checked="" value="option1" id="optionsRadios1" name="optionsRadios">选项1</label>
                                <label class="radio-inline">
                                    <input type="radio" value="option2" id="optionsRadios2" name="optionsRadios">选项2</label>

                            </div>
                        </div>
                        <div class="form-group draggable">
                            <label class="col-sm-3 control-label">复选框：</label>

                            <div class="col-sm-9">
                                <label class="checkbox-inline">
                                    <input type="checkbox" value="option1" id="inlineCheckbox1">选项1</label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" value="option2" id="inlineCheckbox2">选项2</label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" value="option3" id="inlineCheckbox3">选项3</label>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group draggable">
                            <div class="col-sm-12 col-sm-offset-3">
                                <button class="btn btn-primary" type="submit">保存内容</button>
                                <button class="btn btn-white" type="submit">取消</button>
                            </div>
                        </div>
                    </form>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="rMenu">
    <ul>
        <li id="m_add" onclick="addTreeNode();">增加菜单</li>
        <li id="m_edt" onclick="editTreeNode();">修改菜单</li>
        <li id="m_del" onclick="removeTreeNode();">删除菜单</li>
        <!--
        <li id="m_check" onclick="checkTreeNode(true);">Check节点</li>
        <li id="m_unCheck" onclick="checkTreeNode(false);">unCheck节点</li>
        <li id="m_reset" onclick="resetTree();">恢复zTree</li>
         -->
    </ul>
</div>
</body>