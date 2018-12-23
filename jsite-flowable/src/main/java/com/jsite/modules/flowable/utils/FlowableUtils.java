package com.jsite.modules.flowable.utils;

import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.utils.Encodes;
import com.jsite.modules.flowable.entity.Flow;
import com.jsite.modules.sys.entity.Role;
import com.jsite.modules.sys.entity.User;
import org.flowable.idm.engine.impl.persistence.entity.GroupEntity;
import org.flowable.idm.engine.impl.persistence.entity.GroupEntityImpl;
import org.flowable.idm.engine.impl.persistence.entity.UserEntity;
import org.flowable.idm.engine.impl.persistence.entity.UserEntityImpl;

import java.util.HashMap;
import java.util.Map;

/**
 * 流程工具
 * @author liuruijun
 * @version 2018-08-03
 */
public class FlowableUtils {

	/**
	 * 定义流程定义KEY，必须以“PD_”开头
	 * 组成结构：string[]{"流程标识","业务主表表名"}
	 */
	private final static Map<String, String> PRO_DEF_MAP = new HashMap<String, String>() {
		{
			put("leave", "oa_leave");
		}
	};

	public static String getBusinessTable(String key) {
        return PRO_DEF_MAP.get(key);
	}

	/**
	 * 获取流程表单URL
	 * @param formKey
	 * @param act 表单传递参数
	 * @return
	 */
	public static String getFormUrl(String formKey, Flow act){
		
		StringBuilder formUrl = new StringBuilder();
		
		String formServerUrl = Global.getProperty("activiti.form.server.url");
		if (StringUtils.isBlank(formServerUrl)){
			formUrl.append(Global.getAdminPath());
		}else{
			formUrl.append(formServerUrl);
		}
		
		formUrl.append(formKey).append(formUrl.indexOf("?") == -1 ? "?" : "&");
		formUrl.append("act.taskId=").append(act.getTaskId() != null ? act.getTaskId() : "");
		formUrl.append("&act.taskName=").append(act.getTaskName() != null ? Encodes.urlEncode(act.getTaskName()) : "");
		formUrl.append("&act.taskDefKey=").append(act.getTaskDefKey() != null ? act.getTaskDefKey() : "");
		formUrl.append("&act.procInsId=").append(act.getProcInsId() != null ? act.getProcInsId() : "");
		formUrl.append("&act.procDefId=").append(act.getProcDefId() != null ? act.getProcDefId() : "");
		formUrl.append("&act.status=").append(act.getStatus() != null ? act.getStatus() : "");
		formUrl.append("&id=").append(act.getBusinessId() != null ? act.getBusinessId() : "");
		
		return formUrl.toString();
	}
	
	public static UserEntity toFlowableUser(User user){
		if (user == null){
			return null;
		}
		UserEntity userEntity = new UserEntityImpl();
		userEntity.setId(user.getLoginName());
		userEntity.setFirstName(user.getName());
		userEntity.setLastName(StringUtils.EMPTY);
		userEntity.setPassword(user.getPassword());
		userEntity.setEmail(user.getEmail());
		userEntity.setRevision(1);
		return userEntity;
	}
	
	public static GroupEntity toFlowableGroup(Role role){
		if (role == null){
			return null;
		}
		GroupEntity groupEntity = new GroupEntityImpl();
		groupEntity.setId(role.getEnname());
		groupEntity.setName(role.getName());
		groupEntity.setType(role.getRoleType());
		groupEntity.setRevision(1);
		return groupEntity;
	}



}
