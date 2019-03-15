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
        trim: function(str) {
            return jQuery.trim(str)
        },
        startWith: function(str, start) {
            var reg = new RegExp("^" + start);
            return reg.test(str)
        },
        endWith: function(str, end) {
            var reg = new RegExp(end + "$");
            return reg.test(str)
        },
        transDictLabel: function (dictList, val, defVal) {
            var label = "";
            // for(dict in dictList) dict.value 取不到值 undefined
            for (var i = 0; i < dictList.length; i++) {
                var dict = dictList[i];
                if (val == dict.value) {
                    label = dict.label;
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
                message = "正在提交，请稍等...";
            }
            if (!js.loadingNum) {
                js.loadingNum = 0;
            }

            message += '<em onclick="js.closeLoading(0, true)">×</em>';
            if ($("#data-loading").length == 0) {
                $("body").append('<div id="data-loading" onmouseover="$(this).find(\'em\').show()" onmouseout="$(this).find(\'em\').hide()">' + message + "</div>")
            } else {
                $("#data-loading").html(message)
            }

            js.loadingNum++;
        },
        closeLoading: function(timeout, forceClose) {
            setTimeout(function() {
                js.loadingNum--;
                if (forceClose || js.loadingNum <= 0) {
                    $("#data-loading").remove();
                    js.loadingNum = 0;
                }
            }, timeout == undefined ? 0 : timeout);
        },
        showMessage: function(title, message, type) {
            if (top.toastr) {
                top.toastr.options = {
                    closeButton: true,
                    positionClass: "toast-bottom-right",
                    timeOut: 5000
                };
                top.toastr[type?type:"info"](message, title);
            }
        },
        showErrorMessage: function(msg) {
            js.showMessage("错误信息", msg, "error");
        },
        showWarningMessage: function(msg) {
            js.showMessage("警告信息", msg, "warning");
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
                        js.closeLoading();
                    },
                    success: function(data) {
                        if (typeof callback == "function") {
                            callback(data);
                        }
                        js.closeLoading();
                    }
                });
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
                        js.closeLoading();
                    },
                    success: function(data) {
                        if (typeof callback == "function") {
                            callback(data);
                        }
                        js.closeLoading();
                    }
                });
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

        form : function(formTitle, url, formUrl, callback, dataType, wh) {
            var excuAjax = function(jsonData) {
                js.loading("正在处理...");
                $.ajax({
                    type: "POST",
                    url: url,
                    dataType: dataType == undefined ? "json" : dataType,
                    data: jsonData,
                    async: true,
                    error: function(data) {
                        js.showErrorMessage(data.responseText);
                        js.closeLoading();
                    },
                    success: function(data) {
                        if (typeof callback == "function") {
                            callback(data)
                        }
                        js.closeLoading();
                    }
                });
            };

            var width = '400px';
            var height = '300px';
            if (wh != null) {
                var arr = wh.split('|');
                width = arr[0]+'px';
                height = arr[1]+'px';
            }

            js.layer.open({
                type: 2,
                title: formTitle,
                shade: 0.3,
                shadeClose: true,
                //maxmin: true, //开启最大化最小化按钮
                area: [width, height],
                content: formUrl,
                btn: ['<i class="fa fa-plus"></i> 确定', '<i class="fa fa-times"></i> 取消'],
                btn1: function(index, layero){
                    var win = js.layer.iframeWindow(index);
                    var jsonData = win.$("#formID").serializeArray();

                    var hasEmpty = false;
                    $.each(jsonData,function(i,item){
                        if(item['value'] == '') {
                            hasEmpty = true;
                            return false
                        }
                    });
                    if(hasEmpty) {
                        js.showErrorMessage("请先选择" + formTitle);
                        return;
                    }
                    excuAjax(jsonData);
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
                        callback(data, status, xhr);
                    } else {
                        js.print(data);
                    }
                }
            });
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
            });
        }
    };

    window.js = js;
})(window.jQuery, window);

// https://blog.csdn.net/qq_23944441/article/details/79753436
(function($, window, undefined) {
// outside the scope of the jQuery plugin to
// keep track of all dropdowns
var $allDropdowns = $();

// if instantlyCloseOthers is true, then it will instantly
// shut other nav items when a new one is hovered over
$.fn.dropdownHover = function(options) {

    // the element we really care about
    // is the dropdown-toggle's parent
    $allDropdowns = $allDropdowns.add(this.parent());

    return this.each(function() {
        var $this = $(this).parent(),
            defaults = {
                delay: 500,
                instantlyCloseOthers: true
            },
            data = {
                delay: $(this).data('delay'),
                instantlyCloseOthers: $(this).data('close-others')
            },
            options = $.extend(true, {}, defaults, options, data),
            timeout;

        $this.hover(function() {
            if(options.instantlyCloseOthers === true)
                $allDropdowns.removeClass('open');

            window.clearTimeout(timeout);
            $(this).addClass('open');
        }, function() {
            timeout = window.setTimeout(function() {
                $this.removeClass('open');
            }, options.delay);
        });
    });
};

$('[data-hover="dropdown"]').dropdownHover();
})(jQuery, this);
