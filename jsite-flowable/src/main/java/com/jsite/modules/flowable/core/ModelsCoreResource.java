/* Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.jsite.modules.flowable.core;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.jsite.common.utils.UploadUtils4;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.lang3.StringUtils;
import org.flowable.bpmn.BpmnAutoLayout;
import org.flowable.bpmn.converter.BpmnXMLConverter;
import org.flowable.bpmn.model.BpmnModel;
import org.flowable.cmmn.converter.CmmnXmlConverter;
import org.flowable.cmmn.editor.json.converter.CmmnJsonConverter;
import org.flowable.cmmn.model.Case;
import org.flowable.cmmn.model.CmmnModel;
import org.flowable.editor.language.json.converter.BpmnJsonConverter;
import org.flowable.editor.language.json.converter.util.CollectionUtils;
import org.flowable.ui.common.security.SecurityUtils;
import org.flowable.ui.common.service.exception.BadRequestException;
import org.flowable.ui.common.service.exception.InternalServerErrorException;
import org.flowable.ui.common.util.XmlUtil;
import org.flowable.ui.modeler.domain.AbstractModel;
import org.flowable.ui.modeler.domain.Model;
import org.flowable.ui.modeler.model.ModelRepresentation;
import org.flowable.ui.modeler.serviceapi.ModelService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.List;


/**
 * @author liuruijun
 * @version 2018-08-21
 * 说明：
 * 1.由于文件上传采用 org.apache.commons.fileupload 组件，
 * 所以注释掉spring-mvc.xml文件中CommonsMultipartResolver（MultipartFile） 相关配置
 * ( CommonsMultipartResolver先解析了request，导致Servletfileupload获取不到上传参数..
	 详细原理见:https://blog.csdn.net/cctt_1/article/details/8962322 )；
 * 2.流程文件导入功能使用的也是 MultipartFile，因此导入出错；
 * 3.本类是把流程文件导入相关REST抽离出来，修改MultipartFile获取方式，重新实现导入功能；
 * 4.源码路径 org.flowable.ui.modeler.rest.app.ModelsResource；
 * 5.Bean注入冲突，重命名成ModelsCoreResource
 */
@RestController
@RequestMapping("/base/app")
public class ModelsCoreResource {

    private static final Logger LOGGER = LoggerFactory.getLogger(ModelsCoreResource.class);

    @Autowired
    protected ModelService modelService;
    
    @Autowired
    protected ObjectMapper objectMapper;

    protected BpmnXMLConverter bpmnXmlConverter = new BpmnXMLConverter();
    protected BpmnJsonConverter bpmnJsonConverter = new BpmnJsonConverter();
    
    protected CmmnXmlConverter cmmnXmlConverter = new CmmnXmlConverter();
    protected CmmnJsonConverter cmmnJsonConverter = new CmmnJsonConverter();

    @SuppressWarnings("unchecked")
	@RequestMapping(value = "/rest/import-process-model", method = RequestMethod.POST, produces = "application/json")
    public ModelRepresentation importProcessModel(HttpServletRequest request) {
    	
    	FileItem fileItem = null;
		try {
			fileItem = ((List<FileItem>) UploadUtils4.getInstance().initFields(request).get(UploadUtils4.FILE_FIELDS)).get(0);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	
        return importProcessModel(request, fileItem);
    }

    /*
     * specific endpoint for IE9 flash upload component
     */
    @SuppressWarnings("unchecked")
	@RequestMapping(value = "/rest/import-process-model/text", method = RequestMethod.POST)
    public String importProcessModelText(HttpServletRequest request) {
    	
    	FileItem fileItem = null;
		try {
			fileItem = ((List<FileItem>) UploadUtils4.getInstance().initFields(request).get(UploadUtils4.FILE_FIELDS)).get(0);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

        ModelRepresentation modelRepresentation = importProcessModel(request, fileItem);
        String modelRepresentationJson = null;
        try {
            modelRepresentationJson = objectMapper.writeValueAsString(modelRepresentation);
        } catch (Exception e) {
            LOGGER.error("Error while processing Model representation json", e);
            throw new InternalServerErrorException("Model Representation could not be saved");
        }

        return modelRepresentationJson;
    }
    
    @SuppressWarnings("unchecked")
	@RequestMapping(value = "/rest/import-case-model", method = RequestMethod.POST, produces = "application/json")
    public ModelRepresentation importCaseModel(HttpServletRequest request) {
    	
    	FileItem fileItem = null;
		try {
			fileItem = ((List<FileItem>) UploadUtils4.getInstance().initFields(request).get(UploadUtils4.FILE_FIELDS)).get(0);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
    	
        return importCaseModel(request, fileItem);
    }

    /*
     * specific endpoint for IE9 flash upload component
     */
    @SuppressWarnings("unchecked")
	@RequestMapping(value = "/rest/import-case-model/text", method = RequestMethod.POST)
    public String importCaseModelText(HttpServletRequest request) {
    	
    	FileItem fileItem = null;
		try {
			fileItem = ((List<FileItem>) UploadUtils4.getInstance().initFields(request).get(UploadUtils4.FILE_FIELDS)).get(0);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

        ModelRepresentation modelRepresentation = importCaseModel(request, fileItem);
        String modelRepresentationJson = null;
        try {
            modelRepresentationJson = objectMapper.writeValueAsString(modelRepresentation);
        } catch (Exception e) {
            LOGGER.error("Error while processing Model representation json", e);
            throw new InternalServerErrorException("Model Representation could not be saved");
        }

        return modelRepresentationJson;
    }

    
    
    public ModelRepresentation importProcessModel(HttpServletRequest request, FileItem file) {

        String fileName = file.getName();
        if (fileName != null && (fileName.endsWith(".bpmn") || fileName.endsWith(".bpmn20.xml"))) {
            try {
                XMLInputFactory xif = XmlUtil.createSafeXmlInputFactory();
                InputStreamReader xmlIn = new InputStreamReader(file.getInputStream(), "UTF-8");
                XMLStreamReader xtr = xif.createXMLStreamReader(xmlIn);
                BpmnModel bpmnModel = bpmnXmlConverter.convertToBpmnModel(xtr);
                if (CollectionUtils.isEmpty(bpmnModel.getProcesses())) {
                    throw new BadRequestException("No process found in definition " + fileName);
                }

                if (bpmnModel.getLocationMap().size() == 0) {
                    BpmnAutoLayout bpmnLayout = new BpmnAutoLayout(bpmnModel);
                    bpmnLayout.execute();
                }

                ObjectNode modelNode = bpmnJsonConverter.convertToJson(bpmnModel);

                org.flowable.bpmn.model.Process process = bpmnModel.getMainProcess();
                String name = process.getId();
                if (StringUtils.isNotEmpty(process.getName())) {
                    name = process.getName();
                }
                String description = process.getDocumentation();

                ModelRepresentation model = new ModelRepresentation();
                model.setKey(process.getId());
                model.setName(name);
                model.setDescription(description);
                model.setModelType(AbstractModel.MODEL_TYPE_BPMN);
                Model newModel = modelService.createModel(model, modelNode.toString(), SecurityUtils.getCurrentUserObject());
                return new ModelRepresentation(newModel);

            } catch (BadRequestException e) {
                throw e;

            } catch (Exception e) {
                LOGGER.error("Import failed for {}", fileName, e);
                throw new BadRequestException("Import failed for " + fileName + ", error message " + e.getMessage());
            }
        } else {
            throw new BadRequestException("Invalid file name, only .bpmn and .bpmn20.xml files are supported not " + fileName);
        }
    }
    
    public ModelRepresentation importCaseModel(HttpServletRequest request, FileItem file) {

        String fileName = file.getName();
        if (fileName != null && (fileName.endsWith(".cmmn") || fileName.endsWith(".cmmn.xml"))) {
            try {
                XMLInputFactory xif = XmlUtil.createSafeXmlInputFactory();
                InputStreamReader xmlIn = new InputStreamReader(file.getInputStream(), "UTF-8");
                XMLStreamReader xtr = xif.createXMLStreamReader(xmlIn);
                CmmnModel cmmnModel = cmmnXmlConverter.convertToCmmnModel(xtr);
                if (CollectionUtils.isEmpty(cmmnModel.getCases())) {
                    throw new BadRequestException("No cases found in definition " + fileName);
                }

                if (cmmnModel.getLocationMap().size() == 0) {
                    throw new BadRequestException("No CMMN DI found in definition " + fileName);
                }

                ObjectNode modelNode = cmmnJsonConverter.convertToJson(cmmnModel);

                Case caseModel = cmmnModel.getPrimaryCase();
                String name = caseModel.getId();
                if (StringUtils.isNotEmpty(caseModel.getName())) {
                    name = caseModel.getName();
                }
                String description = caseModel.getDocumentation();

                ModelRepresentation model = new ModelRepresentation();
                model.setKey(caseModel.getId());
                model.setName(name);
                model.setDescription(description);
                model.setModelType(AbstractModel.MODEL_TYPE_CMMN);
                Model newModel = modelService.createModel(model, modelNode.toString(), SecurityUtils.getCurrentUserObject());
                return new ModelRepresentation(newModel);

            } catch (BadRequestException e) {
                throw e;

            } catch (Exception e) {
                LOGGER.error("Import failed for {}", fileName, e);
                throw new BadRequestException("Import failed for " + fileName + ", error message " + e.getMessage());
            }
        } else {
            throw new BadRequestException("Invalid file name, only .cmmn and .cmmn.xml files are supported not " + fileName);
        }
    }
}
