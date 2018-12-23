package com.jsite.modules.sys.utils;

import com.jsite.common.service.BaseService;
import com.jsite.common.utils.SpringContextHolder;
import com.jsite.modules.sys.dao.AreaDao;
import com.jsite.modules.sys.dao.OfficeDao;
import com.jsite.modules.sys.entity.Area;
import com.jsite.modules.sys.entity.Office;
import com.jsite.modules.sys.entity.User;

import java.util.List;

/**
 * 用户工具类 架构重构升级，拆分自jeesite1.x UserUtils
 ** @author liuruijun
 * @version 2018-12-05
 */
public class AreaOfficeUtils {

	private static AreaDao areaDao = SpringContextHolder.getBean(AreaDao.class);
	private static OfficeDao officeDao = SpringContextHolder.getBean(OfficeDao.class);

	public static final String CACHE_AREA_LIST = "areaList";
	public static final String CACHE_OFFICE_LIST = "officeList";
	public static final String CACHE_OFFICE_ALL_LIST = "officeAllList";
	

	public static Area getAreaById(String id) {
		return areaDao.get(id);
	}

	/**
	 * 获取当前用户授权的区域
	 * @return
	 */
	public static List<Area> getAreaList(){
		@SuppressWarnings("unchecked")
		List<Area> areaList = (List<Area>)UserUtils.getCache(CACHE_AREA_LIST);
		if (areaList == null){
			areaList = areaDao.findAllList(new Area());
			UserUtils.putCache(CACHE_AREA_LIST, areaList);
		}
		return areaList;
	}

    public static Office getOfficeById(String id) {
        return officeDao.get(id);
    }


    /**
	 * 获取当前用户有权限访问的部门
	 * @return
	 */
	public static List<Office> getOfficeList(){
		@SuppressWarnings("unchecked")
		List<Office> officeList = (List<Office>)UserUtils.getCache(CACHE_OFFICE_LIST);
		if (officeList == null){
			User user = UserUtils.getUser();
			if (user.isAdmin()){
				officeList = officeDao.findAllList(new Office());
			}else{
				Office office = new Office();
				office.getSqlMap().put("dsf", BaseService.dataScopeFilter(user, "a", ""));
				officeList = officeDao.findList(office);
			}
			UserUtils.putCache(CACHE_OFFICE_LIST, officeList);
		}
		return officeList;
	}

	/**
	 * 获取当前用户有权限访问的部门
	 * @return
	 */
	public static List<Office> getOfficeAllList(){
		@SuppressWarnings("unchecked")
		List<Office> officeList = (List<Office>)UserUtils.getCache(CACHE_OFFICE_ALL_LIST);
		if (officeList == null){
			officeList = officeDao.findAllList(new Office());
		}
		return officeList;
	}

}
