package com.jeesite.modules.file.service;

import com.jeesite.common.persistence.Page;
import com.jeesite.common.service.CrudService;
import com.jeesite.modules.file.dao.SysFileDao;
import com.jeesite.modules.file.entity.SysFile;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 文件管理Service
 * @author liulin
 * @version 2018-03-28
 */
@Service
@Transactional(readOnly = true)
public class SysFileService extends CrudService<SysFileDao, SysFile> {

	public SysFile get(String id) {
		return super.get(id);
	}
	
	public List<SysFile> findList(SysFile itamcsFile) {
		return super.findList(itamcsFile);
	}
	
	public Page<SysFile> findPage(Page<SysFile> page, SysFile itamcsFile) {
		return super.findPage(page, itamcsFile);
	}
	
	@Transactional(readOnly = false)
	public void save(SysFile itamcsFile) {
		super.save(itamcsFile);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysFile itamcsFile) {
		super.delete(itamcsFile);
	}
	
}