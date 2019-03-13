/**
 * iCheck、select2组件组件，如果所在页面是动态生成的，iCheck、select2将会丢失样式
 * 此时必须在页面加载完成之后遍历checkbox、select标签，重新绑定事件，才会正常显示
 */
$(function() {
    if ($.fn.iCheck !== undefined) {
        $("input[type=checkbox],input[type=radio]").each(function() {
            $(this).iCheck({
                checkboxClass: "icheckbox_" + ($(this).data("style") || "minimal-grey"),
                radioClass: "iradio_" + ($(this).data("style") || "minimal-grey")
            }).on("ifChanged", function() {
                try {
                    $(this).valid();
                } catch(e) {}
            });
        });
    }

    if ($.fn.select2 !== undefined) {
        //$.fn.select2.defaults.set('width', '200px');
        $.fn.select2.defaults.set('placeholder', '请选择');
        $.fn.select2.defaults.set('placeholderOption', 'first');
        $.fn.select2.defaults.set('allowClear', 'true');
        $("select").each(function() {
            $(this).select2().on("change", function() {
                try {
                    $(this).valid();
                } catch(e) {}
            });
        });
    }
});