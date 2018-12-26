(function($, window, undefined) {
    var js = {
        renderSize: function(value) {
            if (null == value || value == "") {
                return "0 Bytes";
            }
            var unitArr = new Array("Bytes","KB","MB","GB","TB","PB","EB","ZB","YB");
            var index = 0
                , srcsize = parseFloat(value);
            index = Math.floor(Math.log(srcsize) / Math.log(1024));
            var size = srcsize / Math.pow(1024, index);
            //  保留的小数位数
            size = size.toFixed(2);
            return size + unitArr[index];
        },
        getQueryString: function(name, url) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)","i");
            if (!url || url == "") {
                return null;
            } else {
                url = url.substring(url.indexOf("?"));
            }
            var r = url.substr(1).match(reg)
            if (r != null)
                return unescape(r[2]);
            return null;
        },
        print: function(message) {
            if (typeof (console) !== "undefined") {
                console.log(message);
            }
        },
        encodeURI: function(url) {
            return encodeURIComponent(url)
        },
        decodeURI: function(url) {
            return decodeURIComponent(url)
        },
        transDictLabel: function(dictList, val, defVal) {
            var label = "";
            for (var dict in dictList) {
                if (val == dict.value) {
                    label = dict.value;
                    break;
                }
            }
            return label == "" ? defVal : label;
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
                return layer;
            }
            return null
        }(),
        loading: function(message) {
            if (message == undefined || message == "") {
                message = "正在提交，请稍等..."
            }

            js.layer.load(2,{shade: [0.3,'#000']});

            setTimeout(function(){
                js.layer.closeAll('loading');
            }, 8000);

        },
        closeLoading: function() {
            js.layer.closeAll('loading');
        },
        showMessage: function(title, message, type) {
            var timeout = 5000;
            if (top.toastr) {
                var positionClass = "toast-bottom-right";
                top.toastr.options = {
                    closeButton: true,
                    positionClass: positionClass,
                    timeOut: timeout
                };
                top.toastr[type](message, title);
            }
        },
        showErrorMessage: function(msg) {
            js.showMessage("错误信息", msg, "error");
        },
        showWarningMessage: function(msg) {
            js.showMessage("警告信息", msg, "warning")
        },
        prompt : function(message, url, callback, dataType) {
            var excuAjax = function(text) {
                js.loading("正在处理...");
                $.ajax({
                    type: "POST",
                    url: (url+text),
                    dataType: dataType == undefined ? "json" : dataType,
                    async: true,
                    error: function(data) {
                        js.showErrorMessage(data.responseText);
                        js.closeLoading()
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
                excuAjax(text);
                js.layer.close(index);
            });
        },

        confirm: function(message, urlOrFun, callback) {
            var excuAjax = function() {
                js.loading("正在处理...");
                $.ajax({
                    type: "POST",
                    url: urlOrFun,
                    data: {},
                    dataType: "json",
                    async: true,
                    error: function(data) {
                        js.showErrorMessage(data.responseText);
                        js.closeLoading()
                    },
                    success: function(data) {
                        if (typeof callback == "function") {
                            callback(data)
                        }
                        js.closeLoading()
                    }
                })
            };

            js.layer.confirm(message, {icon: 3, shadeClose: true}, function(index) {
                if (typeof urlOrFun == "function") {
                    urlOrFun();
                } else {
                    excuAjax();
                }
                js.layer.close(index);
            });
            return false
        },

        form : function(message, url, formUrl, callback, dataType) {
            var excuAjax = function(category) {
                js.loading("正在处理...");
                $.ajax({
                    type: "POST",
                    url: url+"&category="+category,
                    dataType: dataType == undefined ? "json" : dataType,
                    async: true,
                    error: function(data) {
                        js.showErrorMessage(data.responseText);
                        js.closeLoading()
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
                    excuAjax(category);
                    js.layer.close(index);
                },
                btn2: function(index, layero){
                }
            });
        },
        formatHtml: function(id) {
            return String($("#" + id).html()).replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g, "");
        },
        ajaxRequest: function(url, data, callback) {
            js.loading("正在加载..");
            $.ajax({
                type: "POST",
                url: url,
                data: data?data:{},
                dataType: "json",
                async: true,
                error: function(data) {
                    js.closeLoading();
                    js.showErrorMessage(data.responseText);
                },
                success: function(data, status, xhr) {
                    js.closeLoading();
                    if (typeof callback == "function") {
                        callback(data, status, xhr)
                    } else {
                        js.print(data)
                    }
                }
            })
        },
        ajaxSubmitForm: function(formObj, callback) {
            js.loading("正在提交，请稍后...");
            formObj.ajaxSubmit({
                type: "POST",
                xhrFields: {
                    withCredentials: true
                },
                url: formObj.attr("action"),
                dataType: "json",
                async: true,
                error: function(data) {
                    js.closeLoading();
                    js.print(data.responseText);
                    js.showErrorMessage(data.responseText);
                },
                success: function(data, status, xhr) {
                    js.closeLoading();
                    if (typeof callback == "function") {
                        callback(data, status, xhr);
                    } else {
                        js.print(data);
                    }
                }
            })
        }
    };
    window.js = js;
})(window.jQuery, window);





