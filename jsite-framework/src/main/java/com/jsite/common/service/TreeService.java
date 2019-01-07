/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.jsite.common.service;

import com.jsite.common.persistence.TreeDao;
import com.jsite.common.persistence.TreeEntity;
import com.jsite.common.utils.Reflections;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Service基类
 * @author ThinkGem
 * @version 2014-05-16
 */
@Transactional(readOnly = true)
public abstract class TreeService<D extends TreeDao<T>, T extends TreeEntity<T>> extends CrudService<D, T> {
	
	@Transactional(readOnly = false)
	public void save(T entity) {
		
		@SuppressWarnings("unchecked")
		Class<T> entityClass = Reflections.getClassGenricType(getClass(), 1);

        // 获取修改前的parentIds，用于更新子节点的parentIds
        String oldParentIds = entity.getParentIds();

        if (entity.getIsNewRecord()){
			if(entity.getIsRoot()) {
				entity.setTreeLeaf("1");
				entity.setTreeLevel(0);
				entity.setParentIds("0,");
			}else {
				T f = get(entity.getParent().getId());
				entity.setParentIds(f.getParentIds()+f.getId()+",");
				entity.setTreeLeaf("1");
				entity.setTreeLevel(f.getTreeLevel()+1);
				if(f.getIsTreeLeaf()) {
					f.setTreeLeaf("0");
                    super.save(f);
				}
			}
		}
		// 保存或更新实体
		super.save(entity);
		
		// 更新子节点 parentIds
		T o;
		try {
			o = entityClass.newInstance();
		} catch (Exception e) {
			throw new ServiceException(e);
		}
		o.setParentIds("%,"+entity.getId()+",%");
		List<T> list = dao.findByParentIdsLike(o);
		for (T e : list){
			if (e.getParentIds() != null && oldParentIds != null){
				e.setParentIds(e.getParentIds().replace(oldParentIds, entity.getParentIds()));
				preUpdateChild(entity, e);
				dao.updateParentIds(e);
			}
		}
		
	}
	
	/**
	 * 预留接口，用户更新子节前调用
	 * @param childEntity
	 */
	protected void preUpdateChild(T entity, T childEntity) {
		
	}

}
