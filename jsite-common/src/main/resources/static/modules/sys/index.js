/**
 * auth liuruijun 2018.05.08
 * @returns
 */
var tabpanel;
$(document).ready(function(){
	
	tabpanel = initTabPage('tabpanel');
	$(window).resize();
	var homePage = $("#desktopTabPage");
	if(homePage.size()>0){
		addTabPage(null, "<i class='fa fa-home'></i> " + homePage.data("title"), homePage.data("url"), false, false)
	}
	
	
	$(document).on('click', '.addTabPage', function(e){
		var target = $(this), href = target.data("href"), title = target.data("title") || target.attr("title") || target.text();
		
		if(href && href != "" && href != "blank") {
			if(target.parent().hasClass("treeview")) {
				window.location.hash = href.replace("#","");
			}
			
			addTabPage(target, $.trim(title || "tabpanel.newTabPage"), href, true, false);
			
			return false
		}
		return true
	});
});

	function initTabPage(renderId) {
		
		var height = getGeight();
		
		return new TabPanel({
	        renderTo:renderId,  //把tabpanel放在一个div中，div的id为tab
	        //width:600,  //tabpanel宽度
	        height:height,  //tabpanel高度
	        border:'none',  //tabpanel的边框，不为'none'即可，若为'none'则没有边框
	        //active : 0,//默认激活的tab索引数，此处为第二个，索引从0开始
	        //tabWidth:114,//顶上tab标签页的宽度
	        //maxLength:10,//可添加的tab元素的最大个数
	        autoResizable:true,
	        items : []
	    });
	}
	
	function getGeight() {
		var wHeight = $(window).height();
		var hHeight = $(".main-header:visible").outerHeight();
		var fHeight = $(".main-footer:visible").outerHeight();
		var cHeight = wHeight-hHeight-fHeight;
		
		return cHeight < 300 ? 300:cHeight;
	}
	
	function addTabPage(tab, title, url, closable, isChild, parentId) {
		var tabId = isNull(tab) ? null:tab.data("tabId");
		
		if(isUndefined(tabId)){
			tabId = "tabpanel-"+Math.uuid();
			tab.attr("data-tab-id", tabId);
		}
		
		var pid;
		if(isChild) {
			pid = parentId?parentId:tabpanel.getActiveTab().id;
		}
		
		var item = {
			parentid:pid,
	        id:tabId,//标签的id，此id必须在该html中唯一
	        title:title,//顶上标签的标题
	        closable:closable,
	        html:'<script>js.loading("正在加载，请稍后...");<\/script><iframe id="' + tabId + 'Frame" src="' + ctx+url + '" width="100%" height="100%" frameborder="0" onload="js.closeLoading();"></iframe>'//标签的内容
	    };
		
		tabpanel.addTab(item);
	}
	
	
	
	function isUndefined(tmp) {
		if (typeof(tmp) == "undefined"){ 
			return true;
		}
		
		return false;
	}
	
	function isNull(tmp) {
		if (!tmp && typeof(tmp)!="undefined" && tmp!=0){ 
			return true;
		}
		
		return false;
	}
	
	
	function closeCurrentTabPage(preTabCallback, title, url) {
		var tabItem = tabpanel.getActiveTab();
		console.log(tabItem.parentid);
		
		var position = tabpanel.getTabPosision(tabItem.id);
		tabpanel.kill(position);
		
//		console.log(tabItem.parentid);
		var parentid = tabItem.parentid;
		if(typeof preTabCallback=="function"){
			try{
				preTabCallback(parentid, title, url);
				
			}catch(e){
				js.error(e)
			}
		}
	}
	
	function refreshTab(parentid, title, url) {
	    if (title && url) {
            addTabPage(null, title, url, true, true, parentid);
        } else {
            tabpanel.refresh(parentid);
        }
	}

$("#fullScreen").click(function() {
	if ($(this).data("isOpen") == "true") {
		$(this).data("isOpen", "false");
		if (document.exitFullscreen) {
			document.exitFullscreen();
		} else {
			if (document.msExitFullscreen) {
				document.msExitFullscreen();
			} else {
				if (document.mozCancelFullScreen) {
					document.mozCancelFullScreen();
				} else {
					if (document.webkitCancelFullScreen) {
						document.webkitCancelFullScreen();
					}
				}
			}
		}
	} else {
		$(this).data("isOpen", "true");
		var c = document.documentElement;
		if (c.requestFullscreen) {
			c.requestFullscreen();
		} else {
			if (c.msRequestFullscreen) {
				c.msRequestFullscreen();
			} else {
				if (c.mozRequestFullScreen) {
					c.mozRequestFullScreen();
				} else {
					if (c.webkitRequestFullScreen) {
						c.webkitRequestFullScreen();
					}
				}
			}
		}
	}
	return false;
});

$("#switchSkin").click(
		function() {
			layer.open({
				type : 2,
				shadeClose : true,
				title : $(this).attr("title"),
				area : [ "500px", "390px" ],
				content : ctx + "/switchSkin/select",
				success : function(c, d) {
					if ($(layer.window).width() < 500 || $(layer.window).height() < 390) {
						layer.full(d);
					}
				},
		});
});

