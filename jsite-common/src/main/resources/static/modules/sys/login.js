/*
 * @author liuruijun
 * @version 2017-4-18
 */
	$(function() {
		$('input').iCheck({
			checkboxClass : 'icheckbox_square-blue',
			radioClass : 'iradio_square-blue',
			increaseArea : '20%' /* optional */
		});
	});
	
	

	$(document).ready(function() {

		$("#loginForm").validate({
			submitHandler : function(form) {
				ajaxSubmitForm($(form), function(data) {
					if (data.isValidateCodeLogin) {
						$("#isValidCodeLogin").show();
						$("#validCodeImg").click();
					}
					if (data.result == "false") {
						js.showErrorMessage(data.message);
					} else {
						js.loading($("#btnSubmit").data("loading"));
						location = ctx;
					}
				}, "json", true, $("#btnSubmit").data("loginValid"));
				return false; // 阻止表单自动提交事件
			}
		});

		function ajaxSubmitForm(form, callback, dataType, async, message) {
			js.loading(message);
			$("#btnSubmit").attr("disabled", true);

			form.ajaxSubmit({
				type : "POST",
				url : form.attr("action"),
				dataType : dataType,
				async : async,
				error : function(data) {
					$("#btnSubmit").attr("disabled", false);
					js.showErrorMessage(data.responseText);
					js.closeLoading();
				},
				success : function(data) {
					$("#btnSubmit").attr("disabled", false);
					js.closeLoading();
					if (typeof callback == "function") {
						callback(data);
					} else {
						js.print(data);
					}
				}
			});
		};
	});