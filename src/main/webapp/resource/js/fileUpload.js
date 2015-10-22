/**
 * folder：存放文件夹<br>
 * fileName：上传文件的名称，不是必填，如果有文件名称，就按照文件名称命名，如果没有文件名称（null），就系统生成文件名称<br>
 * id：控件Id
 */
function initFileUpload(folder, fileName, id) {
	// 初始化Web Uploader
	var uploader = WebUploader.create({

		// 选完文件后，是否自动上传。
		auto : true,

		// swf文件路径
		swf : '${ctxResource}/webuploader/Uploader.swf',

		// 文件接收服务端。
		server : '/blog/common/fileUpload/' + folder + '/'
				+ (fileName == null ? "noFileName" : fileName),

		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick : {
			id : '#filePicker',
			multiple : false
		},

		// 只允许选择图片文件。
		accept : {
			title : 'Images',
			extensions : 'gif,jpg,jpeg,bmp,png',
			mimeTypes : 'image/*'
		}
	});
	// 当有文件添加进来的时候
	uploader.on('fileQueued', function(file) {
		var $li = $('<div id="' + file.id + '" class="file-item thumbnail">'
				+ '<img  style="display:inline;">'
				+ '<span class="info" style="display:inline"></span>'
				+ '</div>');
		var $img = $li.find('img');

		// $list为容器jQuery实例
		$("#fileList").html("");
		$("#fileList").append($li);

		// 创建缩略图
		// 如果为非图片文件，可以不用调用此方法。
		// thumbnailWidth x thumbnailHeight 为 100 x 100
		uploader.makeThumb(file, function(error, src) {
			if (error) {
				$img.replaceWith('<span>不能预览</span>');
				return;
			}

			$img.attr('src', src);
		}, 100, 100);
	});

	// 文件上传过程中创建进度条实时显示。
	uploader.on('uploadProgress', function(file, percentage) {
		var $li = $('#' + file.id), $percent = $li.find('.progress span');

		// 避免重复创建
		if (!$percent.length) {
			$percent = $('<p class="progress"><span></span></p>').appendTo($li)
					.find('span');
		}

		$percent.css('width', percentage * 100 + '%');
	});

	// 文件上传成功，给item添加成功class, 用样式标记上传成功。
	uploader.on('uploadSuccess', function(file) {
		$('#' + file.id).addClass('upload-state-done');
		var returnJson = arguments[1];
		$("#" + id).val(returnJson.uri);
		// alert($("#" + id).val());
	});

	// 文件上传失败，显示上传出错。
	uploader.on('uploadError', function(file) {
		var $li = $('#' + file.id), $error = $li.find('div.error');

		// 避免重复创建
		if (!$error.length) {
			$error = $('<div class="error"></div>').appendTo($li);
		}

		$error.text('上传失败');
	});

	// 完成上传完了，成功或者失败，先删除进度条。
	uploader.on('uploadComplete', function(file) {
		$('#' + file.id).find('.progress').remove();
	});
}

function initResumeFileUpload(folder, fileName) {
	var uploader1 = WebUploader.create({

		// 选完文件后，是否自动上传。
		auto : true,

		// swf文件路径
		swf : '${ctxResource}/webuploader/Uploader.swf',

		// 文件接收服务端。
		server : '/blog/common/fileUpload/' + folder + '/'
				+ (fileName == null ? "noFileName" : fileName),

		// 选择文件的按钮。可选。
		// 内部根据当前运行是创建，可能是input元素，也可能是flash.
		pick : {
			id : '#picker',
			multiple : false
		}
	});

	// 当有文件被添加进队列的时候
	uploader1.on('fileQueued', function(file) {
		var $list = $("#thelist");
		$list.append('<span id="' + file.id + '" class="item">'
				+ '<span class="state">等待上传...<span>' + '</span>');
	});

	uploader1.on('uploadSuccess', function(file) {
		$('#' + file.id).find('span.state').css("font-size","15pt").text('简历已上传(resume.'+file.ext+")");
		$("#picker").css("display","none");
	});

	uploader1.on('uploadError', function(file) {
		$('#' + file.id).find('span.state').css("font-size","15pt").css("color","red").text('上传出错');
	});

	uploader1.on('uploadComplete', function(file) {
		$('#' + file.id).find('.progress').fadeOut();
	});

}