package com.jsite.modules.flowable.service.ext.iml;

import com.google.common.collect.Lists;
import com.jsite.common.utils.SpringContextHolder;
import com.jsite.modules.flowable.utils.FlowableUtils;
import com.jsite.modules.sys.entity.Role;
import com.jsite.modules.sys.entity.User;
import com.jsite.modules.sys.service.SystemService;
import org.flowable.common.engine.impl.interceptor.CommandContext;
import org.flowable.idm.api.Group;
import org.flowable.idm.engine.impl.GroupQueryImpl;

import java.util.ArrayList;
import java.util.List;

/**
 * 扩展Flowable组Service
 * @author liuruijun
 * @version 2018-08-02
 */
public class FlowGroupQueryImpl extends GroupQueryImpl {

	private static final long serialVersionUID = 1L;
	
	private SystemService systemService;

	public SystemService getSystemService() {
		if (systemService == null){
			systemService = SpringContextHolder.getBean(SystemService.class);
		}
		return systemService;
	}

	@Override
    public long executeCount(CommandContext commandContext) {
        return executeQuery().size();
    }

    @Override
    public List<Group> executeList(CommandContext commandContext) {
        return executeQuery();
    }

    protected List<Group> executeQuery() {
        if (getUserId() != null) {
            return findGroupsByUser(getUserId());
        } else {
            return findAllGroups();
        }
    }
    
    
    protected List<Group> findGroupsByUser(String userId) {
    	List<Group> list = Lists.newArrayList();
		User user = getSystemService().getUserByLoginName(userId);
		if (user != null && user.getRoleList() != null){
			for (Role role : user.getRoleList()){
				list.add(FlowableUtils.toFlowableGroup(role));
			}
		}
    	
    	return list;
    }
    
    protected List<Group> findAllGroups() {
    	return new ArrayList<>();
    }
}
