package com.jsite.modules.flowable.web;

import com.jsite.common.web.BaseController;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 流程定义相关Controller
 * @author liuruijun
 * @version 2018-08-02
 */
@Controller
@RequestMapping(value = "${adminPath}/act/form")
public class FormDesignController extends BaseController {


    @RequiresPermissions("act:process:edit")
    @RequestMapping(value = "formDesign")
    public String runningList(HttpServletRequest request, HttpServletResponse response) {
        return "modules/flow/flowFormDesign";
    }

}
