package com.jsite.common.beetl.fn;

import com.jsite.common.lang.StringUtils;
import com.jsite.modules.sys.entity.Menu;
import com.jsite.modules.sys.utils.UserUtils;
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
			//子菜单缓冲值
			StringBuilder htmlStr2 = new StringBuilder();
			if(menu.getParent().getId().equals("0") && menu.getIsShow().equals("1")) {// 一级菜单isEmpty(menu.parentId)
				href = StringUtils.isBlank(menu.getHref()) ? "blank" : menu.getHref();
				htmlStr.append("<li class='treeview'>\n");
				htmlStr.append("<a title='" + menu.getName() + "' href='javascript:' data-href='" + href + "' class='addTabPage'>\n");
				htmlStr.append("<i class='" + menu.getIcon() + "'></i> <span>&nbsp;" + menu.getName() + "</span> \n");
				htmlStr.append(rightContainer);
				htmlStr.append("</a>\n");
				//递归获取二级->N级菜单
				StringBuilder subMenu = subMenu(menuList, menu, href, htmlStr2, rightContainer);
				htmlStr.append(subMenu);
			}
		}
		return htmlStr.toString();
	}

	/**
	 * 递归获取二级->N级菜单
	 * @param menuList
	 * @param menu
	 * @param href
	 * @param htmlStr2
	 * @param rightContainer
	 * @author lihy
	 * @data 2019年3月19日23:43
	 * @return
	 */
	public StringBuilder subMenu(List<Menu> menuList,Menu menu,String href,StringBuilder htmlStr2,String rightContainer){
		//获取每级菜单
		if(href.equals("blank")) {
			htmlStr2.append("<ul class='treeview-menu'>");
			for(Menu menu1 : menuList) {
				if(menu1.getParent().getId().equals(menu.getId()) && menu1.getIsShow().equals("1")) {// 四级菜单
					href = StringUtils.isBlank(menu1.getHref())?"blank":menu1.getHref();

					htmlStr2.append(href.equals("blank")?"<li class='treeview'>\n":"");
					htmlStr2.append(href.equals("blank")?"<a title='" + menu1.getName() + "' href='javascript:' data-href='" + href + "' class='addTabPage'>\n":"");
					htmlStr2.append(href.equals("blank")?"<i class='" + menu1.getIcon() + "'></i>&nbsp;" + menu1.getName() + " \n":"");
					htmlStr2.append(href.equals("blank")?rightContainer:"");
					htmlStr2.append(href.equals("blank")?"</a>\n":"");

					htmlStr2.append(href.equals("blank")?"":"<li class='treeview'><a title='" + menu1.getName() + "' href='javascript:' data-href='" + href + "' class='addTabPage'><i class='" + menu1.getIcon() + "'></i>&nbsp;" + menu1.getName() + "</a></li>\n");
					subMenu(menuList,menu1, href, htmlStr2, rightContainer);
				}
			}
			htmlStr2.append("</ul>\n");
		}

		return htmlStr2;
	}

}
