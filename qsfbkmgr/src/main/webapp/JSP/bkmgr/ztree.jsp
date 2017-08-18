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
			
			alert(1)
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

<BODY>
<body class="gray-bg">
    <div class="wrapper wrapper-content  animated fadeInRight article">
        <div class="row">
            <div class="col-lg-10 col-lg-offset-1">
            
            </div>
          </div>
        </div>
        

<div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
	<div class="right">
	
	
	
		<ul class="info">
			<li class="title"><h2>实现方法说明</h2>
				<ul class="list">
				<li>利用 beforeRightClick / onRightClick 事件回调函数简单实现的右键菜单</li>
				<li class="highlight_red">Demo 中的菜单比较简陋，你完全可以配合其他自定义样式的菜单图层混合使用</li>
				</ul>
			</li>
		</ul>
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
</BODY>
</HTML>