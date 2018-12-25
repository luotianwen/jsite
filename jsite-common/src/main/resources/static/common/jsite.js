

(function($, window, undefined) {
    var js = {
        log: function(msg) {
            if (typeof (console) !== "undefined") {
                console.log(msg)
            }
        },
        error: function(msg) {
            if (typeof (console) !== "undefined") {
                console.error(msg)
            }
        },
        encodeUrl: function(url) {
            return encodeURIComponent(url)
        },
        decodeUrl: function(url) {
            return decodeURIComponent(url)
        },
        addParam: function(url, params) {
            if (params != "") {
                url += (url.indexOf("?") == -1 ? "?" : "&");
                url += params
            }
            return url
        },
        getParam: function(paramName, url) {
            var reg = new RegExp("(^|&)" + paramName + "=([^&]*)(&|$)","i");
            if (!url || url == "") {
                url = window.location.search
            } else {
                url = url.substring(url.indexOf("?"))
            }
            r = url.substr(1).match(reg);
            if (r != null) {
                return unescape(r[2])
            }
            return null
        },
        getDictLabel: function(dictListJson, value, defaultValue, inCss) {
            var result = [];
            for (var i = 0; i < dictListJson.length; i++) {
                var row = dictListJson[i];
                if (("," + value + ",").indexOf("," + row.value + ",") != -1) {
                    var str = "";
                    if (inCss && (row.cssClass || row.cssStyle)) {
                        str += "<span";
                        if (row.cssClass) {
                            str += ' class="' + row.cssClass + '"'
                        }
                        if (row.cssStyle) {
                            str += ' style="' + row.cssStyle + '"'
                        }
                        result.push(str + ">" + row.label + "</span>")
                    } else {
                        result.push(row.label)
                    }
                }
            }
            return result.length > 0 ? result.join(",") : defaultValue
        },
        loading: function(message, ignoreMessageIfExists) {
            var topJs;
            try {
                top.loadingFlag = true;
                topJs = top.js || parent.parent.js || parent.js
            } catch (e) {}
            if (typeof loadingFlag == "undefined" && topJs) {
                if (typeof topJs.loading == "function") {
                    topJs.loading(message);
                    return
                }
            }
            if (message == undefined || message == "") {
                message = "正在提交，请稍等..."
            }
            if (message == "none") {
                return
            }
            setTimeout(function() {
                if (!js.pageLoadingNum) {
                    js.pageLoadingNum = 0
                }
                if (!js.pageLoadingStyle) {
                    if ($("body").hasClass("loading-topline")) {
                        js.pageLoadingStyle = 2
                    } else {
                        js.pageLoadingStyle = 1
                    }
                }
                if (js.pageLoadingStyle == 1) {
                    message += '<em onclick="js.closeLoading(0, true)">×</em>';
                    if ($("#page-loading").length == 0) {
                        $("body").append('<div id="page-loading" onmouseover="$(this).find(\'em\').show()" onmouseout="$(this).find(\'em\').hide()">' + message + "</div>")
                    } else {
                        if (!(ignoreMessageIfExists == true)) {
                            $("#page-loading").html(message)
                        }
                    }
                } else {
                    if (js.pageLoadingStyle == 2) {
                        if ($("#page-loading-top").length == 0) {
                            $("body").append('<div id="page-loading-top" class="page-loading-top"></div>');
                            $("#page-loading-top").animate({
                                width: "65%"
                            }, 2000, function() {
                                $(this).animate({
                                    width: "85%"
                                }, 8000)
                            })
                        }
                    }
                }
                js.pageLoadingNum++
            }, 0)
        },
        closeLoading: function(timeout, forceClose) {
            var topJs;
            try {
                top.loadingFlag = true;
                topJs = top.js || parent.parent.js || parent.js
            } catch (e) {}
            if (typeof loadingFlag == "undefined" && topJs) {
                if (typeof topJs.closeLoading == "function") {
                    topJs.closeLoading(timeout, forceClose);
                    return
                }
            }
            setTimeout(function() {
                if (!js.pageLoadingNum) {
                    js.pageLoadingNum = 0
                }
                js.pageLoadingNum--;
                if (forceClose || js.pageLoadingNum <= 0) {
                    if (js.pageLoadingStyle == 1) {
                        $("#page-loading").remove()
                    } else {
                        if (js.pageLoadingStyle == 2) {
                            $("#page-loading-top").stop().animate({
                                width: "100%"
                            }, 200, function() {
                                $(this).fadeOut(300, function() {
                                    $(this).remove()
                                })
                            })
                        }
                    }
                    js.pageLoadingNum = 0
                }
            }, timeout == undefined ? 0 : timeout)
        },
        layer: function() {
            try {
                if (top.layer) {
                    return top.layer
                }
                if (parent.parent.layer) {
                    return parent.parent.layer
                }
                if (parent.layer) {
                    return parent.layer
                }
            } catch (e) {}
            if (window.layer) {
                return layer
            }
            return null
        }(),
        showMessage: function(message, title, type, timeout) {
            var msgType, layerIcon, msg = String(message), msgTimeout = timeout == undefined ? 4000 : timeout;
            var contains = function(str, searchs) {
                if (searchs) {
                    var ss = searchs.split(",");
                    for (var i = 0; i < ss.length; i++) {
                        if (msg.indexOf(ss[i]) >= 0) {
                            return true
                        }
                    }
                }
                return false
            };
            if (type == "error" || contains(msg, "showMessage.error")) {
                msgType = "error";
                layerIcon = 2
            } else {
                if (type == "warning" || contains(msg, "showMessage.warning")) {
                    msgType = "warning";
                    layerIcon = 5
                } else {
                    if (type == "success" || contains(msg, "showMessage.success")) {
                        msgType = "success";
                        layerIcon = 1
                    } else {
                        msgType = "info";
                        layerIcon = 6
                    }
                }
            }
            try {
                if (top.toastr) {
                    var positionClass = "toast-bottom-right";
                    if (msg && msg.length >= 8 && msg.indexOf("posfull:") >= 0) {
                        if (timeout == undefined) {
                            msgTimeout = 0
                        }
                        positionClass = "toast-top-full-width";
                        msg = msg.substring(8);
                        js.log(msg)
                    }
                    top.toastr.options = {
                        closeButton: true,
                        positionClass: positionClass,
                        timeOut: msgTimeout
                    };
                    top.toastr[msgType](msg, title);
                    return
                }
            } catch (e) {}
            if (!js.layer) {
                alert(msg);
                return
            }
            if (layerIcon) {
                js.layer.msg(msg, {
                    icon: layerIcon,
                    time: msgTimeout
                })
            } else {
                js.layer.msg(msg, {
                    time: msgTimeout
                })
            }
        },
        showErrorMessage: function(responseText) {
            if (responseText && responseText != "") {
                js.error(js.abbr(responseText, 500));
                if (responseText.indexOf("<html ") != -1 || responseText.indexOf("<head ") != -1 || responseText.indexOf("<body ") != -1) {
                    js.showMessage("未知错误，F12查看异常信息！", null, "error")
                } else {
                    js.showMessage(responseText, null, "warning")
                }
            }
        },
        showWarningMessage: function(responseText) {
            if (responseText && responseText != "") {
                js.error(js.abbr(responseText, 500));
                if (responseText.indexOf("<html ") != -1 || responseText.indexOf("<head ") != -1 || responseText.indexOf("<body ") != -1) {
                    js.showMessage("未知错误，F12查看异常信息！", null, "error")
                } else {
                    js.showMessage(responseText, null, "error")
                }
            }
        },
        confirm: function(message, urlOrFun, data, callback, dataType, async, loadingMessage) {
            if (typeof data == "function") {
                loadingMessage = async;
                async = dataType;
                dataType = callback;
                callback = data;
                data = undefined
            }
            var sendAjax = function() {
                js.loading(loadingMessage == undefined ? "正在处理..." : loadingMessage);
                $.ajax({
                    type: "POST",
                    url: urlOrFun,
                    data: data,
                    dataType: dataType == undefined ? "json" : dataType,
                    async: async == undefined ? true : async,
                    error: function(data) {
                        js.showErrorMessage(data.responseText);
                        js.closeLoading(0, true)
                    },
                    success: function(data) {
                        if (typeof callback == "function") {
                            callback(data)
                        }
                        js.closeLoading()
                    }
                })
            };
            if (!js.layer) {
                if (confirm(message)) {
                    if (typeof urlOrFun == "function") {
                        urlOrFun()
                    } else {
                        sendAjax()
                    }
                }
                return
            }
            var options = {
                icon: 3
            };
            if (options.shadeClose == undefined) {
                options.shadeClose = true
            }
            js.layer.confirm(message, options, function(index) {
                if (typeof urlOrFun == "function") {
                    urlOrFun();
                } else {
                    sendAjax();
                }
                js.layer.close(index);
            });
            return false
        },
        prompt : function(message, url, callback, dataType) {
            var sendAjax = function(text) {
                js.loading("正在处理...");
                $.ajax({
                    type: "POST",
                    url: (url+text),
                    dataType: dataType == undefined ? "json" : dataType,
                    async: true,
                    error: function(data) {
                        js.showErrorMessage(data.responseText);
                        js.closeLoading(0, true)
                    },
                    success: function(data) {
                        if (typeof callback == "function") {
                            callback(data)
                        }
                        js.closeLoading()
                    }
                })
            };

            js.layer.prompt({title: message, formType: 2}, function(text, index){
                sendAjax(text);

                js.layer.close(index);
            });
        },

        form : function(message, url, formUrl, callback, dataType) {
            var sendAjax = function(category) {
                js.loading("正在处理...");
                $.ajax({
                    type: "POST",
                    url: url+"&category="+category,
                    dataType: dataType == undefined ? "json" : dataType,
                    async: true,
                    error: function(data) {
                        js.showErrorMessage(data.responseText);
                        js.closeLoading(0, true)
                    },
                    success: function(data) {
                        if (typeof callback == "function") {
                            callback(data)
                        }
                        js.closeLoading()
                    }
                })
            };

            js.layer.open({
                type: 2,
                title: message,
                shade: 0.3,
                shadeClose: true,
                //maxmin: true, //开启最大化最小化按钮
                area: ['400px', '300px'],
                content: formUrl,
                btn: ['<i class="fa fa-plus"></i> 确定部署', '<i class="fa fa-times"></i> 取消'],
                btn1: function(index, layero){
                    var win = js.layer.iframeWindow(index);
                    var category = win.$("#category").val();
                    if($.isEmptyObject(category)) {
                        js.showErrorMessage("请先选择流程分类");
                        return;
                    }

                    sendAjax(category);

                    js.layer.close(index);
                },
                btn2: function(index, layero){

                }
            });
        },

        template: function(id, data, callback) {
            var tpl = String($("#" + id).html()).replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g, "")
                , data = data || [];
            if (typeof callback == "function") {
                laytpl(tpl).render(data || [], function(render) {
                    callback(render)
                });
                return null
            }
            return laytpl(tpl).render(data || [])
        },
        ajaxSubmit: function(url, data, callback, dataType, async, message) {
            js.loading(message == undefined ? "正在提交，请稍后..." : message);
            $(".btn").attr("disabled", true);
            if (typeof data == "function") {
                message = async;
                async = dataType;
                dataType = callback;
                callback = data;
                data = undefined
            }
            $.ajax({
                type: "POST",
                url: url,
                data: data,
                dataType: dataType == undefined ? "json" : dataType,
                async: async == undefined ? true : async,
                error: function(data) {
                    $(".btn").attr("disabled", false);
                    js.showErrorMessage(data.responseText);
                    js.closeLoading(0, true)
                },
                success: function(data, status, xhr) {
                    $(".btn").attr("disabled", false);
                    js.closeLoading();
                    if (typeof callback == "function") {
                        callback(data, status, xhr)
                    } else {
                        js.log(data)
                    }
                }
            })
        },
        ajaxSubmitForm: function(formJqueryObj, callback, dataType, async, message) {
            js.loading(message == undefined ? "正在提交，请稍后..." : message);
            $(".btn").attr("disabled", true);
            formJqueryObj.ajaxSubmit({
                type: "POST",
                xhrFields: {
                    withCredentials: true
                },
                url: formJqueryObj.attr("action"),
                dataType: dataType == undefined ? "json" : dataType,
                async: async == undefined ? true : async,
                error: function(data) {
                    $(".btn").attr("disabled", false);
                    js.log(data.responseText);
                    js.showErrorMessage(data.responseText);
                    js.closeLoading(0, true);
                },
                success: function(data, status, xhr) {
                    $(".btn").attr("disabled", false);
                    js.closeLoading();
                    if (typeof callback == "function") {
                        callback(data, status, xhr);
                    } else {
                        js.log(data);
                    }
                }
            })
        },
        trim: function(str) {
            return jQuery.trim(str);
        },
        startWith: function(str, start) {
            var reg = new RegExp("^" + start);
            return reg.test(str);
        },
        endWith: function(str, end) {
            var reg = new RegExp(end + "$");
            return reg.test(str);
        },
        cookie: function(name, value, options) {
            if (typeof value != "undefined") {
                options = options || {};
                if (value === null) {
                    value = "";
                    options.expires = -1
                }
                var expires = "";
                if (options.expires && (typeof options.expires == "number" || options.expires.toUTCString)) {
                    var date;
                    if (typeof options.expires == "number") {
                        date = new Date();
                        date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000))
                    } else {
                        date = options.expires
                    }
                    expires = "; expires=" + date.toUTCString()
                }
                var path = options.path ? "; path=" + options.path : "";
                var domain = options.domain ? "; domain=" + options.domain : "";
                var secure = options.secure ? "; secure" : "";
                document.cookie = [name, "=", encodeURIComponent(value), expires, path, domain, secure].join("")
            } else {
                var cookieValue = null;
                if (document.cookie && document.cookie != "") {
                    var cookies = document.cookie.split(";");
                    for (var i = 0; i < cookies.length; i++) {
                        var cookie = jQuery.trim(cookies[i]);
                        if (cookie.substring(0, name.length + 1) == (name + "=")) {
                            cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                            break
                        }
                    }
                }
                return cookieValue
            }
        }
    };

    window.js = js;
    window.log = js.log;
    window.error = js.error;
    window.text = js.text
})(window.jQuery, window);