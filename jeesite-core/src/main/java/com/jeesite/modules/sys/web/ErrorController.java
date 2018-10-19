package com.jeesite.modules.sys.web;

import com.jeesite.common.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 区域Controller
 * @author liuruijun
 * @version 2018-10-15
 */
@Controller
@RequestMapping(value = "${adminPath}/error")
public class ErrorController extends BaseController {

    @RequestMapping(value = "500")
    public String Error500() {
        return "error/500";
    }
}
