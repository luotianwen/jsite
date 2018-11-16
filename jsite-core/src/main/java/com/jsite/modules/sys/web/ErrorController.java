package com.jsite.modules.sys.web;

import com.jsite.common.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Error Controller
 * @author liuruijun
 * @version 2018-10-15
 */
@Controller
@RequestMapping(value = "${adminPath}/error")
public class ErrorController extends BaseController {

    @RequestMapping(value = "500")
    public String error500() {
        return "error/500";
    }

    @RequestMapping(value = "404")
    public String error404() {
        return "error/404";
    }

    @RequestMapping(value = "400")
    public String error400() {
        return "error/400";
    }

    @RequestMapping(value = "403")
    public String error403() {
        return "error/403";
    }
}
