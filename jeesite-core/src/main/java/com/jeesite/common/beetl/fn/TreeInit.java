package com.jeesite.common.beetl.fn;

import com.jeesite.common.lang.StringUtils;
import com.jeesite.modules.sys.entity.Menu;
import com.jeesite.modules.sys.utils.UserUtils;
import org.beetl.core.Context;
import org.beetl.core.Function;

import java.util.List;

public class TreeInit implements Function {

	@Override
	public Object call(Object[] paras, Context ctx) {
		List<Menu> menuList = UserUtils.getMenuList();
		
		return initMenuTree(menuList);
	}
	
	
	private String initMenuTree(List<Menu> menuList) {
		StringBuilder htmlStr = new StringBuilder();
		String rightContainer = "<span class='pull-right-container'><i class='fa fa-angle-left pull-right'></i></span>\n";
		String href = "";
		for (Menu menu : menuList) {
			
			if(menu.getParentId().equals("0") && menu.getIsShow().equals("1")) {// 一级菜单isEmpty(menu.parentId)
				href = StringUtils.isBlank(menu.getHref())?"blank":menu.getHref();
				htmlStr.append("<li class='treeview'>\n");
				htmlStr.append("<a title='" + menu.getName() + "' href='javascript:' data-href='" + href + "' class='addTabPage'>\n");
				htmlStr.append("<i class='" + menu.getIcon() + "'></i> <span>&nbsp;" + menu.getName() + "</span> \n");
				htmlStr.append(rightContainer);
				htmlStr.append("</a>\n");
				
				if(href.equals("blank")) {
					htmlStr.append("<ul class='treeview-menu'>");
					
					for(Menu menu1 : menuList) {
						if(menu1.getParentId().equals(menu.getId()) && menu1.getIsShow().equals("1")) {// 二级菜单
							href = StringUtils.isBlank(menu1.getHref())?"blank":menu1.getHref();
							
							htmlStr.append(href.equals("blank")?"<li class='treeview'>\n":"");
							htmlStr.append(href.equals("blank")?"<a title='" + menu1.getName() + "' href='javascript:' data-href='" + href + "' class='addTabPage'>\n":"");
							htmlStr.append(href.equals("blank")?"<i class='" + menu1.getIcon() + "'></i> &nbsp;" + menu1.getName() + " \n":"");
							htmlStr.append(href.equals("blank")?rightContainer:"");
							htmlStr.append(href.equals("blank")?"</a>\n":"");
							
							htmlStr.append(href.equals("blank")?"":"<li class='treeview'><a title='" + menu1.getName() + "' href='javascript:' data-href='" + href + "' class='addTabPage'><i class='" + menu1.getIcon() + "'></i> " + menu1.getName() + "</a></li>\n");
							
							if(href.equals("blank")) {
								htmlStr.append("<ul class='treeview-menu'>");
								
								for(Menu menu2 : menuList) {
									if(menu2.getParentId().equals(menu1.getId()) && menu2.getIsShow().equals("1")) {// 三级菜单
										href = StringUtils.isBlank(menu2.getHref())?"blank":menu2.getHref();
										
										htmlStr.append(href.equals("blank")?"<li class='treeview'>\n":"");
										htmlStr.append(href.equals("blank")?"<a title='" + menu2.getName() + "' href='javascript:' data-href='" + href + "' class='addTabPage'>\n":"");
										htmlStr.append(href.equals("blank")?"<i class='" + menu2.getIcon() + "'></i> &nbsp;" + menu2.getName() + " \n":"");
										htmlStr.append(href.equals("blank")?rightContainer:"");
										htmlStr.append(href.equals("blank")?"</a>\n":"");
										
										htmlStr.append(href.equals("blank")?"":"<li class='treeview'><a title='" + menu2.getName() + "' href='javascript:' data-href='" + href + "' class='addTabPage'><i class='" + menu2.getIcon() + "'></i> " + menu2.getName() + "</a></li>\n");
										
										if(href.equals("blank")) {
											htmlStr.append("<ul class='treeview-menu'>");
											
											for(Menu menu3 : menuList) {
												if(menu3.getParentId().equals(menu2.getId()) && menu3.getIsShow().equals("1")) {// 四级菜单
													// TODO  
													
													
												}
											}
										}
										
									}
								}
								
								htmlStr.append("</ul>\n");
							}
						}
					}
					
					htmlStr.append("</ul>\n");
				}
				
				htmlStr.append("</li>\n");
			}
			
		}
		
		return htmlStr.toString();
	}

}
