package com.jsite.modules.file.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.web.BaseController;
import com.jsite.modules.file.entity.SysFileTree;
import com.jsite.modules.file.service.SysFileTreeService;
import com.jsite.modules.sys.utils.UserUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

/**
 * 文件夹树管理Controller
 * 
 * @author liulin
 * @version 2018-03-28
 */
@Controller
@RequestMapping(value = "${adminPath}/filetree/sysFileTree")
public class SysFileTreeController extends BaseController {

	@Autowired
	private SysFileTreeService sysFileTreeService;

	@ModelAttribute
	public SysFileTree get(@RequestParam(required = false) String id) {
		SysFileTree entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = sysFileTreeService.get(id);
		}
		if (entity == null) {
			entity = new SysFileTree();
		}
		return entity;
	}
	@RequiresPermissions("filetree:sysFileTree:view")
	@RequestMapping(value = {"index"})
	public String index(SysFileTree sysFileTree, Model model) {
		/*sysFileTree.setCreateBy(UserUtils.getUser());
		List<sysFileTree> list=sysFileTreeService.findList(sysFileTree);
		//初始化一个根节点
		if (list == null || list.size() == 0) {
			SysFileTree pf = new SysFileTree();
			pf.setId("0");
			SysFileTree f = new SysFileTree();
			f.setParentIds("0");
			f.setName("默认");
			f.setParent(pf);
			f.setSort(0);
			sysFileTreeService.save(f);
		}*/
		return "modules/file/sysFileTreeIndex";
	}
	
	@RequiresPermissions("filetree:sysFileTree:view")
	@RequestMapping(value = "listData")
	@ResponseBody
	public List<SysFileTree> listData(SysFileTree sysFileTree, HttpServletRequest request, HttpServletResponse response,
                                      Model model) {
		if (StringUtils.isBlank(sysFileTree.getParentId())) {
			sysFileTree.setParentId("0");
	    }
	    if ((StringUtils.isNotBlank(sysFileTree.getName()))) {
	    	sysFileTree.setParentId(null);
	    }
		List<SysFileTree> list=sysFileTreeService.findList(sysFileTree);
		return list;
	}

	@RequiresPermissions("filetree:sysFileTree:view")
	@RequestMapping(value = "form")
	public String form(SysFileTree sysFileTree, Model model) {
		model.addAttribute("sysFileTree", sysFileTree);
		return "modules/file/sysFileTreeForm";
	}
	
	@RequiresPermissions("filetree:sysFileTree:view")
	@RequestMapping(value = "move")
	public String move(SysFileTree sysFileTree, Model model) {
		model.addAttribute("sysFileTree", sysFileTree);
		return "modules/file/sysFileTreeMove";
	}
	
	@RequiresPermissions("filetree:sysFileTree:view")
	@RequestMapping(value = "add")
	public String add(SysFileTree sysFileTree, Model model) {
		model.addAttribute("sysFileTree", sysFileTree);
		return "modules/file/sysFileTreeAdd";
	}

	@RequiresPermissions("filetree:sysFileTree:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public String save(SysFileTree sysFileTree, Model model, RedirectAttributes redirectAttributes) {
		if(Global.isDemoMode()){
			return renderResult(Global.FALSE, "演示模式，不允许操作！");
		}

		if(sysFileTree.getIsNewRecord()) {
			if(StringUtils.isEmpty(sysFileTree.getParentId())) {
				sysFileTree.setTreeLeaf("0");
				sysFileTree.setTreeLevel(0);
				sysFileTree.setParentIds("0");
				sysFileTree.setParentId("0");
			}else {
				SysFileTree f=sysFileTreeService.get(sysFileTree.getParentId());
				sysFileTree.setParentIds(f.getParentIds()+","+f.getId());
				sysFileTree.setTreeLeaf("1");
				sysFileTree.setTreeLevel(f.getTreeLevel()+1);
				if(f.getIsTreeLeaf()) {
					f.setTreeLeaf("0");
					sysFileTreeService.save(f);
				}
			}
		}
		sysFileTreeService.save(sysFileTree);
		return renderResult(Global.TRUE, "保存文件夹成功");
	}
	
	
	@RequiresPermissions("filetree:sysFileTree:edit")
	@RequestMapping(value = "saveMove")
	@ResponseBody
	public String saveMove(SysFileTree sysFileTree, Model model, RedirectAttributes redirectAttributes) {
        if(Global.isDemoMode()){
            return renderResult(Global.FALSE, "演示模式，不允许操作！");
        }

		SysFileTree sourceFile = sysFileTreeService.get(sysFileTree.getId());
		List<SysFileTree> resultList = Lists.newArrayList();

		if(sourceFile.getParentId().equals(sysFileTree.getParentId())) {
			return renderResult(Global.FALSE, "文件夹目录未发生改变");
		}else {
			SysFileTree destFile = sysFileTreeService.get(sysFileTree.getParentId());
			destFile.setTreeLeaf("0");
			
			sourceFile.setParentId(destFile.getId());
			sourceFile.setParentIds(destFile.getParentIds()+','+destFile.getId());
			sourceFile.setTreeLevel(destFile.getTreeLevel()+1);
			
			List<SysFileTree> list = sysFileTreeService.findList(new SysFileTree());
			
			for (int i = 0; i < list.size(); i++) {
				if(list.get(i).getId().equals(sourceFile.getId())) {
					list.get(i).setParentId(destFile.getId());
					list.get(i).setParentIds(destFile.getParentIds()+','+destFile.getId());
					list.get(i).setTreeLevel(destFile.getTreeLevel()+1);
				}
			}
			
			if (ifChilds(list, sourceFile.getId())) {//存在子集  
				List<SysFileTree> childs = Lists.newArrayList();
                childs = getChildList(list,sourceFile,childs); 
                resultList.addAll(childs);  
            }  
			sysFileTreeService.save(destFile);
			sysFileTreeService.save(sourceFile);
			for (SysFileTree sysFileTree2 : resultList) {
				sysFileTreeService.save(sysFileTree2);
			}
			
		}
		return renderResult(Global.TRUE, "移动文件夹成功");
	}
	
	
	 //获取父id下的子集合  
    private static List<SysFileTree> getChildList(List<SysFileTree> list ,SysFileTree p,List<SysFileTree> reList) {  
        for (int i = 0; i < list.size(); i++) {
        	if (list.get(i).getParentId().equals(p.getId())) {//查询下级菜单  
        		list.get(i).setParentIds(p.getParentIds()+","+p.getId());
        		list.get(i).setTreeLevel(p.getTreeLevel()+1);
            	reList.add(list.get(i)); 
                if (ifChilds(list, list.get(i).getId())) {  
                    getChildList(list, list.get(i), reList);  
                }  
            }  
		}
        return reList;  
    }  
      
    //判断是否存在子集  
    private static boolean ifChilds(List<SysFileTree> list,String pId) {  
        boolean flag = false;  
        for (SysFileTree testEntity : list) {  
            if (testEntity.getParentId().equals(pId)) {  
                flag=true;  
                break;  
            }  
        }  
        return flag;  
    }  
	
	
	@RequiresPermissions("filetree:sysFileTree:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(SysFileTree sysFileTree, RedirectAttributes redirectAttributes) {
        if(Global.isDemoMode()){
            return renderResult(Global.FALSE, "演示模式，不允许操作！");
        }

		sysFileTree = sysFileTreeService.get(sysFileTree.getId());
		if("0".equals(sysFileTree.getParentId())) {
			return renderResult(Global.FALSE, "默认根文件夹不能删除");
		}
		sysFileTreeService.delete(sysFileTree);
		boolean flag = sysFileTreeService.selectChildrenByParentId(sysFileTree.getParentId()).size()>0?true:false;
		if(!flag) {
			SysFileTree ift = sysFileTreeService.get(sysFileTree.getParentId());
			ift.setTreeLeaf("1");
			sysFileTreeService.save(ift);
		}
		return renderResult(Global.TRUE, "文件夹删除成功");
	}

	/**
	 * 获取机构JSON数据。
	 * 
	 * @param extId
	 *            排除的ID
	 * @param type
	 *            类型（1：公司；2：部门/小组/其它：3：用户）
	 * @param grade
	 *            显示级别
	 * @param response
	 * @return
	 */
	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(SysFileTree sysFileTree, @RequestParam(required = false) String extId,
                                              @RequestParam(required = false) Boolean isAll, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		sysFileTree.setCreateBy(UserUtils.getUser());
		List<SysFileTree> list = sysFileTreeService.findList(sysFileTree);
		for (int i = 0; i < list.size(); i++) {
			SysFileTree e = list.get(i);
			if ((StringUtils.isBlank(extId) || (extId != null && !extId.equals(e.getId())
					&& !e.getParentIds().contains(extId)))) {
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("pIds", e.getParentIds());
				map.put("name", e.getName());
				map.put("parentName", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}
}