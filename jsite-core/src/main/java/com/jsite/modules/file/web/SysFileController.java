package com.jsite.modules.file.web;

import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.persistence.Page;
import com.jsite.common.utils.UploadUtils4;
import com.jsite.common.utils.UploadUtils4.UploadResult;
import com.jsite.common.web.BaseController;
import com.jsite.modules.file.entity.SysFile;
import com.jsite.modules.file.service.SysFileService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 文件管理Controller
 * @author liulin
 * @version 2018-03-28
 */
@Controller
@RequestMapping(value = "${adminPath}/file/sysFile")
public class SysFileController extends BaseController {

	@Autowired
	private SysFileService sysFileService;
	
	@ModelAttribute
	public SysFile get(@RequestParam(required=false) String id) {
		SysFile entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysFileService.get(id);
		}
		if (entity == null){
			entity = new SysFile();
		}
		return entity;
	}
	@RequiresPermissions("file:sysFile:view")
	@RequestMapping(value = {"index"})
	public String index() {
		return "modules/file/sysFileIndex";
	}
	
	@RequiresPermissions("file:sysFile:view")
	@RequestMapping(value = {"list", ""})
	public String list(SysFile sysFile, HttpServletRequest request, HttpServletResponse response, Model model) {
		/*sysFile.setCreateBy(UserUtils.getUser());*/
		Page<SysFile> page = sysFileService.findPage(new Page<SysFile>(request, response), sysFile); 
		model.addAttribute("page", page);
		return "modules/file/sysFileList";
	}
	
	@RequiresPermissions("file:sysFile:view")
	@RequestMapping(value = "listData")
	@ResponseBody
	public Page<SysFile> listData(SysFile sysFile, HttpServletRequest request, HttpServletResponse response, Model model){
		return sysFileService.findPage(new Page<>(request, response), sysFile);
	}
	
	@RequiresPermissions("file:sysFile:view")
	@RequestMapping(value = "fileTreeSelect")
	public String fileTreeSelect() {
		return "modules/file/sysFileFolderSelect";
	}
	
	
	@RequiresPermissions("file:sysFile:view")
	@RequestMapping(value = "uploadFile")
	public String uploadFile(@RequestParam(value = "fileTreeId", required = true) String fileTreeId, HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("fileTreeId", fileTreeId);
		return "modules/file/sysFileUpload";
	}
	
	
	@RequiresPermissions("file:sysFile:view")
	@RequestMapping(value = "up", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String up(HttpServletRequest request) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}

		List<UploadResult> result = UploadUtils4.getInstance().uploadFile(request);

		for (UploadResult uploadResult : result) {
			logger.info("上传结果----uploadResult----" + uploadResult.toString());

			if (!uploadResult.err) {
				SysFile entity = new SysFile();
				if (StringUtils.isBlank(uploadResult.chunk) || uploadResult.merged) {// 写入数据库
					
					entity.setFileTreeId(uploadResult.fields.get("param1"));
					entity.setName(uploadResult.fileName);
					entity.setFileSize(uploadResult.fields.get("size"));
					entity.setPath(uploadResult.fileRltvPath);
					sysFileService.save(entity);

					return renderResult(Global.TRUE, "上传成功");
				}

			}
		}

		return renderResult(Global.FALSE, "上传失败");
	}
	
	
	@RequiresPermissions("file:sysFile:edit")
	@RequestMapping(value = "download")
	public void download(SysFile sysFile, HttpServletRequest request, HttpServletResponse response) {
		
		UploadUtils4.getInstance().downloadFile(sysFile.getPath(), request, response);
	}
	
	
	@RequiresPermissions("file:sysFile:view")
	@RequestMapping(value = "move")
	public String move(SysFile sysFile, Model model) {
		model.addAttribute("sysFile", sysFile);
		return "modules/file/sysFileMove";
	}
	
	@RequiresPermissions("file:sysFile:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public String save(SysFile sysFile, Model model, RedirectAttributes redirectAttributes) {
        if(Global.isDemoMode()){
            return renderResult(Global.FALSE, "演示模式，不允许操作！");
        }
		sysFileService.save(sysFile);
		return renderResult(Global.TRUE, "移动文件成功");
	}
	
	@RequiresPermissions("file:sysFile:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(SysFile sysFile, RedirectAttributes redirectAttributes) {
        if(Global.isDemoMode()){
            return renderResult(Global.FALSE, "演示模式，不允许操作！");
        }
		sysFileService.delete(sysFile);
		return renderResult(Global.TRUE, "删除文件管理成功");
	}

}