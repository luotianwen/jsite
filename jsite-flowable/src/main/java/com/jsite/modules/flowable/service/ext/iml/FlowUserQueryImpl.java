package com.jsite.modules.flowable.service.ext.iml;

import com.jsite.common.utils.SpringContextHolder;
import com.jsite.modules.flowable.utils.FlowableUtils;
import com.jsite.modules.sys.service.SystemService;
import org.flowable.common.engine.impl.interceptor.CommandContext;
import org.flowable.idm.api.User;
import org.flowable.idm.engine.impl.UserQueryImpl;
import org.flowable.idm.engine.impl.persistence.entity.UserEntity;

import java.util.ArrayList;
import java.util.List;

/**
 * 扩展Flowable用户Service
 * @author liuruijun
 * @version 2018-08-02
 */
public class FlowUserQueryImpl extends UserQueryImpl {
	
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
    public List<User> executeList(CommandContext commandContext) {
        return executeQuery();
    }
    
    protected List<User> executeQuery() {
        if (getId() != null) {
            List<User> result = new ArrayList<>();
            result.add(findById(getId()));
            return result;

        } else if (getIdIgnoreCase() != null) {
            List<User> result = new ArrayList<>();
            result.add(findById(getIdIgnoreCase()));
            return result;

        } 
//        else if (getFullNameLike() != null) {
//            return executeNameQuery(getFullNameLike());
//
//        } else if (getFullNameLikeIgnoreCase() != null) {
//            return executeNameQuery(getFullNameLikeIgnoreCase());
//
//        } 
        else {
            return executeAllUserQuery();
        }
    }
    
    
    protected List<User> executeNameQuery(String name) {
        String fullName = name.replaceAll("%", "");
        return executeUsersQuery(fullName);
    }

    protected List<User> executeAllUserQuery() {
        return executeUsersQuery("");
    }
    
    protected UserEntity findById(String userId) {
    	
    	com.jsite.modules.sys.entity.User user = getSystemService().getUserByLoginName(userId);
    	return FlowableUtils.toFlowableUser(user);
    }
    
    protected List<User> executeUsersQuery(String fullName) {
    	
    	
    	return new ArrayList<>();
    }
}
