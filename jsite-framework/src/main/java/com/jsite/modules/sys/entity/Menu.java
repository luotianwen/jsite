package com.jsite.modules.sys.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.jsite.common.persistence.TreeEntity;
import com.jsite.modules.sys.utils.UserUtils;
import org.hibernate.validator.constraints.Length;

import java.util.List;

/**
 * 菜单Entity
 ** @author liuruijun
 * @version 2018-05-15
 */
public class Menu extends TreeEntity<Menu> {

	private static final long serialVersionUID = 1L;
	private String href; 	// 链接
	private String target; 	// 目标（ mainFrame、_blank、_self、_parent、_top）
	private String icon; 	// 图标
	private String isShow; 	// 是否在菜单中显示（1：显示；0：不显示）
	private String permission; // 权限标识
	
	private String userId;
	
	public Menu(){
		super();
		this.isShow = "1";
	}
	
	public Menu(String id){
		super(id);
	}

	@Override
	public Menu getParent() {
		return parent;
	}

	@Override
	public void setParentId(String parentId) {
		parent = UserUtils.getMenuById(parentId);
	}

	@Override
	public void setParent(Menu parent) {
		this.parent = parent;
	}

	@Length(min=0, max=2000)
	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	@Length(min=0, max=20)
	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}
	
	@Length(min=0, max=100)
	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	@Length(min=1, max=1)
	public String getIsShow() {
		return isShow;
	}

	public void setIsShow(String isShow) {
		this.isShow = isShow;
	}

	@Length(min=0, max=200)
	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	@JsonIgnore
	public static void sortList(List<Menu> list, List<Menu> sourcelist, String parentId, boolean cascade){
		for (int i=0; i<sourcelist.size(); i++){
			Menu e = sourcelist.get(i);
			if (e.getParent()!=null && e.getParent().getId().equals(parentId)){
				list.add(e);
				if (cascade){
					// 判断是否还有子节点, 有则继续获取子节点
					for (int j=0; j<sourcelist.size(); j++){
						Menu child = sourcelist.get(j);
						if (child.getParent()!=null && child.getParent().getId().equals(e.getId())){
							sortList(list, sourcelist, e.getId(), true);
							break;
						}
					}
				}
			}
		}
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}