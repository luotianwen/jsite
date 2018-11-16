package com.jsite.modules.flowable.service;

import com.jsite.common.lang.StringUtils;
import com.jsite.common.persistence.Page;
import com.jsite.common.service.CrudService;
import com.jsite.modules.flowable.core.ModelCoreServiceImpl;
import com.jsite.modules.flowable.dao.DeModelDao;
import com.jsite.modules.flowable.entity.DeModel;
import org.flowable.engine.RepositoryService;
import org.flowable.engine.repository.Deployment;
import org.flowable.engine.repository.ProcessDefinition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 流出模型Service
 * @author liuruijun
 * @version 2018-08-02
 */
@Service
@Transactional(readOnly = true)
public class DeModelService extends CrudService<DeModelDao, DeModel> {

    @Autowired
	private RepositoryService repositoryService;
	@Autowired
	private ModelCoreServiceImpl modelCoreServiceImpl;

	public Page<DeModel> findPage(Page<DeModel> page, DeModel model) {
		
		return super.findPage(page, model);
	}
	
	public DeModel get(String id) {
		return super.get(new DeModel(id));
	}
	
	@Transactional(readOnly = false)
	public void delete(DeModel model) {
		super.delete(model);
	}

    @Transactional(readOnly = false)
	public String doDeploy(String modelId, String category) {

        String message = "";

        org.flowable.ui.modeler.domain.Model model = modelCoreServiceImpl.getModel(modelId);
        byte[] bpmnBytes = modelCoreServiceImpl.getBpmnXML(model);

        String processName = model.getName();
        if (!StringUtils.endsWith(processName, ".bpmn20.xml")){
            processName += ".bpmn20.xml";
        }

        Deployment deployment = repositoryService.createDeployment()
                .addBytes(processName, bpmnBytes)
                .name(model.getName())
                .key(model.getKey())
                .deploy();

        logger.debug("流程部署--------deploy：" + deployment + "  分类---------->" + category);

        List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery()
                .deploymentId(deployment.getId()).list();

        // 设置流程分类
        for (ProcessDefinition processDefinition : list) {
            if(StringUtils.isNotBlank(category)) {
                repositoryService.setProcessDefinitionCategory(processDefinition.getId(), category);
            }
            message += "部署成功，流程ID=" + processDefinition.getId() + "<br/>";
        }

        if (list.size() == 0){
            message = "部署失败，没有流程。";
        }

        return message;
	}
}
