package com.jsite.modules.file.service;

import com.jsite.common.persistence.Page;
import com.jsite.common.service.CrudService;
import com.jsite.modules.file.dao.SysFileTreeDao;
import com.jsite.modules.file.entity.SysFileTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 文件分类Service
 * @author liulin
 * @version 2018-03-28
 */
@Service
@Transactional(readOnly = true)
public class SysFileTreeService extends CrudService<SysFileTreeDao, SysFileTree> {
	
	@Autowired
	private SysFileTreeDao itamcsFileTreeDao;
	
	public SysFileTree get(String id) {
		return super.get(id);
	}
	
	public List<SysFileTree> findList(SysFileTree itamcsFileTree) {
		return super.findList(itamcsFileTree);
	}
	
	public Page<SysFileTree> findPage(Page<SysFileTree> page, SysFileTree itamcsFileTree) {
		return super.findPage(page, itamcsFileTree);
	}
	
	@Transactional(readOnly = false)
	public void save(SysFileTree itamcsFileTree) {
		super.save(itamcsFileTree);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysFileTree itamcsFileTree) {
		super.delete(itamcsFileTree);
	}
	// true:存在子节点,false:不存在子节点
	public List<SysFileTree> selectChildrenByParentId(String parentId) {
		return itamcsFileTreeDao.selectChildrenByParentId(parentId);
	}
	
}