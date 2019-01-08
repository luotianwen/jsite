package com.jsite.modules.test.web;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jsite.common.config.Global;
import com.jsite.common.lang.StringUtils;
import com.jsite.common.web.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;
import com.jsite.modules.test.entity.TestTree;
import com.jsite.modules.test.service.TestTreeService;

/**
 * 树结构表生成Controller
 * @author liuruijun
 * @version 2019-01-08
 */
@Controller
@RequestMapping(value = "${adminPath}/test/testTree")
public class TestTreeController extends BaseController {

	@Autowired
	private TestTreeService testTreeService;
	
	@ModelAttribute
	public TestTree get(@RequestParam(required=false) String id, @RequestParam(required=false) String parentId) {
		TestTree entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = testTreeService.get(id);
		}
		if (entity == null){
			entity = new TestTree();
		}

		if(StringUtils.isNotBlank(parentId)) {
			entity.setParent(testTreeService.get(parentId));
		}
		return entity;
	}
	
	@RequiresPermissions("test:testTree:view")
	@RequestMapping(value = {"list", ""})
	public String list() {
		return "modules/test/testTreeList";
	}

    @RequiresPermissions("test:testTree:view")
	@RequestMapping(value = "listData")
	@ResponseBody
	public List<TestTree> listData(TestTree testTree) {

        if (testTree.getParent() == null || StringUtils.isBlank(testTree.getParent().getId())) {
            testTree.setParent(new TestTree("0"));
        }
	    return testTreeService.findList(testTree);
	}

	@RequiresPermissions("test:testTree:view")
	@RequestMapping(value = "form")
	public String form(TestTree testTree, Model model) {
		if (testTree.getParent() == null) {
            testTree.setParent(new TestTree(TestTree.getRootId()));
        }
		model.addAttribute("testTree", testTree);
		return "modules/test/testTreeForm";
	}

	@RequiresPermissions("test:testTree:edit")
	@RequestMapping(value = "save")
	@ResponseBody
	public String save(TestTree testTree) {
		testTreeService.save(testTree);
		return renderResult(Global.TRUE, "保存树结构表生成成功");
	}
	
	@RequiresPermissions("test:testTree:edit")
	@RequestMapping(value = "delete")
	@ResponseBody
	public String delete(TestTree testTree) {
		if (testTree.getIsRoot()){
            return renderResult(Global.FALSE, "删除树结构表生成失败, 不允许删除顶级树结构表生成或编号为空");
		}

		testTreeService.delete(testTree);
		return  renderResult(Global.TRUE, "删除树结构表生成成功");
	}

	@RequiresPermissions("user")
	@RequestMapping(value = "treeData")
	@ResponseBody
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<TestTree> list = testTreeService.findList(new TestTree());
		for (int i=0; i<list.size(); i++){
			TestTree e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParent().getId());
				map.put("pIds", e.getParentIds());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}
	
}