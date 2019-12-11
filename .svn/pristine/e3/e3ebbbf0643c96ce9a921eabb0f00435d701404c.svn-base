/**
 *
 */
(function ($) {
        //上传默认参数配置
        $.fn.webuploader.defaults = {
            id: "",
            bizKey: "",
            bizType: "",
            readonly: false,
            returnPath: false,
            filePathInputId: "",
            fileNameInputId: "",
            uploadType: "",
            basePath:"",
            uploadPath:"",
            imageAllowSuffixes: ".gif,.bmp,.jpeg,.jpg,.ico,.png,.tif,.tiff,",
            mediaAllowSuffixes: ".flv,.swf,.mkv,webm,.mid,.mov,.mp3,.mp4,.m4v,.mpc,.mpeg,.mpg,.swf,.wav,.wma,.wmv,.avi,.rm,.rmi,.rmvb,.aiff,.asf,.ogg,.ogv,",
            fileAllowSuffixes: ".doc,.docx,.rtf,.xls,.xlsx,.csv,.ppt,.pptx,.pdf,.vsd,.txt,.md,.xml,.rar,.zip,7z,.tar,.tgz,.jar,.gz,.gzip,.bz2,.cab,.iso,",
            maxFileSize: 100 * 1024 * 1024,
            maxUploadNum: 300,
            imageMaxWidth: 1024,
            imageMaxHeight: 768,
            isLazy: false,
            preview: ""
        };

        /**
         * 初始化webuploader
         * @param d
         * @param f
         * @returns {*}
         */
        $.fn.webuploader = function (d, f) {
            var e;
            var c = this.each(function () {
                var i = $(this);
                var h = i.data("webuploader");
                var g = typeof d === "object" && d;
                if (!h) {
                    h = new a(g, i);
                    i.data("webuploader", h)
                }
                if (typeof d === "string" && typeof h[d] === "function") {
                    if (f instanceof Array) {
                        e = h[d].apply(h, f)
                    } else {
                        e = h[d](f)
                    }
                }
            });
            return (e === undefined) ? c : e
        };

        var a = function (config, p) {
            var option = $.extend({}, $.fn.webuploader.defaults, config),
                $id = option.id,
                l = "",
                $isImage = option.uploadType == "image",
                $wrap = $("#" + $id + "Uploader"),
                $fileLists = $wrap.find("#" + $id + "fileLists");
            if ($isImage) {
                $fileLists.appendTo($wrap.find(".queueList"));
            }
            // 状态栏，包括进度和控制按钮
            var $statusBar = $wrap.find('.statusBar'),
                // 文件总体选择信息。
                $info = $statusBar.find('.info'),
                // 上传按钮
                $upload = $wrap.find('.uploadBtn'),
                // 没选择文件之前的内容。
                $placeHolder = $wrap.find('.placeholder'),
                $progress = $statusBar.find('.progress').hide(),
                // 添加的文件数量
                fileCount = 0,
                // 添加的文件总大小
                fileSize = 0,
                // 优化retina, 在retina下这个值是2
                ratio = window.devicePixelRatio || 1,
                // 缩略图大小
                thumbnailWidth = 110 * ratio,
                thumbnailHeight = 110 * ratio,
                // 可能有pedding, ready, uploading, confirm, done.
                state = 'pedding',
                // 所有文件的进度信息，key为file id
                percentages = {},
                // 检测是否已经安装flash，检测flash的版本
                flashVersion = (function () {
                    var version;

                    try {
                        version = navigator.plugins['Shockwave Flash'];
                        version = version.description;
                    } catch (ex) {
                        try {
                            version = new ActiveXObject('ShockwaveFlash.ShockwaveFlash')
                                .GetVariable('$version');
                        } catch (ex2) {
                            version = '0.0';
                        }
                    }
                    version = version.match(/\d+/g);
                    return parseFloat(version[0] + '.' + version[1], 10);
                })(),
                supportTransition = (function () {
                    var s = document.createElement('p').style,
                        r = 'transition' in s ||
                            'WebkitTransition' in s ||
                            'MozTransition' in s ||
                            'msTransition' in s ||
                            'OTransition' in s;
                    s = null;
                    return r;
                })()
                /**====================================================**/
                , F = []
                , j = []
                , C = []
                , i = [],
                formData = {
                    bizType: option.bizType,
                    bizKey: option.bizKey,
                    uploadType: option.uploadType,
                    imageMaxWidth: option.imageMaxWidth,
                    imageMaxHeight: option.imageMaxHeight,
                };

            if (!WebUploader.Uploader.support('flash') && WebUploader.browser.ie) {
                // flash 安装了但是版本过低。
                if (flashVersion) {
                    (function (container) {
                        window['expressinstallcallback'] = function (state) {
                            switch (state) {
                                case 'Download.Cancelled':
                                    alert('您取消了更新！')
                                    break;

                                case 'Download.Failed':
                                    alert('安装失败')
                                    break;

                                default:
                                    alert('安装已成功，请刷新！');
                                    break;
                            }
                            delete window['expressinstallcallback'];
                        };

                        var swf = './expressInstall.swf';
                        // insert flash object
                        var html = '<object type="application/' +
                            'x-shockwave-flash" data="' + swf + '" ';

                        if (WebUploader.browser.ie) {
                            html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
                        }

                        html += 'width="100%" height="100%" style="outline:0">' +
                            '<param name="movie" value="' + swf + '" />' +
                            '<param name="wmode" value="transparent" />' +
                            '<param name="allowscriptaccess" value="always" />' +
                            '</object>';

                        container.html(html);

                    })($wrap);

                    // 压根就没有安转。
                } else {
                    $wrap.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
                }
                return;
            } else if (!WebUploader.Uploader.support()) {
                alert('Web Uploader 不支持您的浏览器！');
                return;
            }
            ;
            var uploaderPara = {};
            if (!option.readonly) {
                uploaderPara = $.extend({}, {
                    pick: {
                        id: "#" + $id + "filePicker",
                        label: "点击选择文件",
                    },
                    dnd: "#" + $id + "Uploader .queueList",
                    paste: "#" + $id + "Uploader .queueList"
                });
                if (option.uploadType == "image") {
                    uploaderPara.pick.label = "点击选择图片";
                    uploaderPara.accept = {
                        title: "Images",
                        extensions: option.imageAllowSuffixes.replace(/\./g, ""),
                        mimeTypes: "image/*"
                    }
                } else {
                    if (option.uploadType == "media") {
                        uploaderPara.pick.label = "点击选择视频";
                        uploaderPara.accept = {
                            title: "Medias",
                            extensions: option.mediaAllowSuffixes.replace(/\./g, ""),
                            mimeTypes: "*/*"
                        }
                    } else {
                        if (option.uploadType == "file") {
                            uploaderPara.accept = {
                                title: "Files",
                                extensions: option.fileAllowSuffixes.replace(/\./g, ""),
                                mimeTypes: "*/*"
                            }
                        } else {
                            uploaderPara.accept = {
                                title: "All",
                                extensions: (option.imageAllowSuffixes + option.mediaAllowSuffixes + option.fileAllowSuffixes).replace(/\./g, ""),
                                mimeTypes: "*/*"
                            }
                        }
                    }
                }
            }
            uploaderPara = $.extend({}, {
                disableGlobalDnd: true,
                swf: option.basePath+"/webuploader/0.1/Uploader.swf",
                server: option.uploadPath,
                formData: formData,
                threads: 1,
                fileNumLimit: option.maxUploadNum,
                fileSingleSizeLimit: option.maxFileSize,
                compress: false
            }, uploaderPara);
            var uploader = WebUploader.create(uploaderPara);
            if (!window.webuploader) {
                window.webuploader = []
            }
            window.webuploader.push(uploader);

            if (!window.webuploaderRefresh) {
                window.webuploaderRefresh = function () {
                    setTimeout(function () {
                        for (var index in window.webuploader) {
                            window.webuploader[index].refresh()
                        }
                    }, 200)
                }
            }

            // 拖拽时不接受 js, txt 文件。
            uploader.on("dndAccept", function (items) {
                var denied = false,
                    len = items.length,
                    i = 0,
                    // 修改js类型
                    unAllowed = 'text/plain;application/javascript ';

                for (; i < len; i++) {
                    // 如果在列表里面
                    if (~unAllowed.indexOf(items[i].type)) {
                        denied = true;
                        break;
                    }
                }
                return !denied;
            });

            // 添加“添加文件”的按钮，
            uploader.addButton({
                id: "#" + x + "filePicker2",
                label: s("继续添加")
            });

            /*=========================================================*/
            if (!option.isLazy) {
                $upload.hide()
            }
            function D(M, K, N) {
                if (option.bizType != "") {
                    F.push(M);
                    $("#" + $id).val(F.join(",")).change();
                    try {
                        $("#" + $id).valid()
                    } catch (e) {
                    }
                }
                if (option.returnPath) {
                    C.push(K);
                    i.push(N);
                    $("#" + option.filePathInputId).val(C.join("|")).change();
                    $("#" + option.fileNameInputId).val(i.join("|")).change();
                    try {
                        $("#" + option.filePathInputId).valid()
                    } catch (e) {
                    }
                    try {
                        $("#" + option.fileNameInputId).valid()
                    } catch (e) {
                    }
                }
            }

            function h(M) {
                var N = M.attr("fileUploadId");
                if (N && N != null) {
                    if (option.bizType != "") {
                        F.splice($.inArray(N, F), 1);
                        j.push(N);
                        $("#" + $id).val(F.join(","));
                        $("#" + $id + "__del").val(j.join(","));
                        try {
                            $("#" + $id).valid()
                        } catch (L) {
                        }
                        try {
                            $("#" + $id + "__del").valid()
                        } catch (L) {
                        }
                    }
                    if (option.returnPath) {
                        var K = M.attr("fileUrl");
                        var O = M.attr("fileName");
                        C.splice($.inArray(K, C), 1);
                        i.splice($.inArray(O, i), 1);
                        $("#" + option.filePathInputId).val(C.join("|"));
                        $("#" + option.fileNameInputId).val(i.join("|"));
                        try {
                            $("#" + option.filePathInputId).valid()
                        } catch (e) {
                        }
                        try {
                            $("#" + option.fileNameInputId).valid()
                        } catch (e) {
                        }
                    }
                }
            }

            function setState(val) {
                var file, stats;

                if (val === state) {
                    return;
                }
                d.removeClass("state-" + state);
                d.addClass("state-" + val);
                state = val;
                switch (state) {
                    case "pedding":
                        $placeHolder.removeClass('element-invisible');
                        $queue.hide();
                        $statusBar.addClass('element-invisible');
                        break;
                    case "ready":
                        $placeHolder.addClass('element-invisible');
                        $("#" + $id + "filePicker2").removeClass("element-invisible");
                        $queue.show();
                        $statusBar.removeClass('element-invisible');
                        break;
                    case "uploading":
                        $("#" + $id + "filePicker2").addClass("element-invisible");
                        $progress.show();
                        $upload.text('暂停上传');
                        break;
                    case "paused":
                        $progress.show();
                        $upload.text('继续上传');
                        break;
                    case "confirm":
                        $progress.hide();
                        $("#" + $id + "filePicker2").removeClass("element-invisible");
                        $upload.text('开始上传');
                        stats = A.getStats();
                        if (stats.successNum && !stats.uploadFailNum) {
                            setState('finish');
                            return;
                        }
                        break;
                    case "finish":
                        stats = uploader.getStats();
                        if (stats.successNum) {
                            alert('上传成功');
                        } else {
                            // 没有成功的图片，重设
                            state = 'done';
                        }
                        break;
                }
                updateStatus();
            }

            function updateTotalProgress() {
                var loaded = 0,
                    total = 0,
                    spans = $progress.children(),
                    percent;

                $.each(percentages, function (k, v) {
                    total += v[0];
                    loaded += v[0] * v[1];
                });
                percent = total ? loaded / total : 0;
                spans.eq(0).text(Math.round(percent * 100) + '%');
                spans.eq(1).css('width', Math.round(percent * 100) + '%');
                updateStatus();
            }

            function updateStatus() {
                var text = '',
                    stats = uploader.getS;
                if (state === 'ready') {
                    text = '选中' + fileCount + '张图片，共' +
                        WebUploader.formatSize(fileSize) + '。';
                } else if (state === 'confirm') {
                    stats = uploader.getStats();
                    if (stats.uploadFailNum) {
                        text = '已成功上传' + stats.successNum + '张照片至XX相册，' +
                            stats.uploadFailNum + '张照片上传失败，<a class="retry" href="#">重新上传</a>失败图片或<a class="ignore" href="#">忽略</a>'
                    }
                } else {
                    stats = uploader.getStats();
                    text = '共' + fileCount + '张（' +
                        WebUploader.formatSize(fileSize) +
                        '），已上传' + stats.successNum + '张';
                    if (stats.uploadFailNum) {
                        text += '，失败' + stats.uploadFailNum + '张';
                    }
                }
                $info.html(text);
                var text = '', stats = uploader.getStats();
                if (state === "confirm" && stats.uploadFailNum) {
                    text = stats.uploadFailNum + $isImage ? "张图片" : "个文件" + "上传失败" + ', <a class="retry" href="#">' + "重新上传" + "</a>" + "或" + '<a class="ignore" href="#">' + "忽略" + "</a>"
                } else {
                    if (state === "confirm" || state === "ready") {
                        text = s("总共") + fileCount + $isImage ? "张图片" : "个文件" + (fileSize <= 0 ? "" : "（" + WebUploader.formatSize(fileSize) + "）");
                    } else {
                        text = s("已上传") + fileCount + $isImage ? "张图片" : "个文件" + (fileSize <= 0 ? "" : "（" + WebUploader.formatSize(fileSize) + "）");
                        if (stats.uploadFailNum) {
                            text += ", " + "失败" + stats.uploadFailNum + "个";
                        }
                    }
                }
                $info.html(text);
                if (fileCount < option.maxUploadNum) {
                    b("#" + $id + "filePicker2").show()
                } else {
                    b("#" + $id + "filePicker2").hide()
                }
                window.webuploaderRefresh();
            }


            uploader.onUploadProgress = function (file, percentage) {
                var $li;
                if ($isImage) {
                    $li = $("#" + $id + file.id),
                        $percent = $li.find(".progress span");
                    $percent.css("width", percentage * 100 + "%")
                } else {
                    $li = b("#" + $id + file.id).find(".prog_bar"),
                        $percent = $li.find(".progress-bar");
                    $percent.css("width", Math.round(K * 100) + "%");
                    $percent.text(Math.round(percentage * 100) + "%");
                }
                percentages[file.id][1] = percentage;
                updateTotalProgress();
            }

            uploader.onFileQueued = function (file) {
                if (fileCount > option.maxUploadNum) {
                    alert("您只能上传" + option.maxUploadNum + "个文件");
                }
                $upload.addChild("disabled");
                uploader.md5File(file, 0, 10 * 1024 * 1024).then(function (md5) {
                    fileCount++;
                    fileSize += file.size;
                    if (fileCount === 1 && !option.readonly) {
                        $statusBar.show();
                    }
                    if ($isImage) {
                        var $li = $('<li id="' + $id + file.id + '"><input id="' + $id + K.id + '_md5" type="hidden" value="' + md5 + '"/><p id="' + $id + file.id + '_name" class="title">' + file.name + '</p><p class="imgWrap"></p><p class="progress"><span></span></p></li>')
                            , $btns = $('<div class="file-panel"><span class="cancel">' + s("删除") + "</span></div>").appendTo($li)
                            , $prgress = $li.find("p.progress-bar")
                            , M = $li.find("p.imgWrap")
                            , $wrap = b('<p class="error"></p>')
                            , showError = function (code) {
                            switch (code) {
                                case "exceed_size":
                                    text = "文件大小超出";
                                    break;
                                case "interrupt":
                                    text = "文件传输中断";
                                    break;
                                case "http":
                                    text = "HTTP请求错误";
                                    break;
                                case "not_allow_type":
                                    text = "文件格式不允许";
                                    break;
                                default:
                                    text = "上传失败，请重试";
                                    break
                            }
                            if (text != null) {
                                $info.text(text).appendTo($li);
                            }
                        };
                        if (file.getStatus() === 'invalid') {
                            showError(file.statusText);
                        } else {
                            $wrap.text('预览中');
                            uploader.makeThumb(file, function (error, src) {
                                if (error) {
                                    $wrap.text('不能预览');
                                    return
                                }
                                var img = $('<img src="' + src + '">');
                                $wrap.empty().append(img);
                            }, thumbnailWidth, thumbnailHeight);
                            percentages[file.id] = [file.size, 0];
                            file.rotation = 0;
                        }
                        file.on('statuschange', function (cur, prev) {
                            if (prev === 'progress') {
                                $prgress.hide().width(0);
                            }
                            // 成功
                            if (cur === 'error' || cur === 'invalid') {
                                console.log(file.statusText);
                                showError(file.statusText);
                                percentages[file.id][1] = 1;
                            } else if (cur === 'interrupt') {
                                showError('interrupt');
                            } else if (cur === 'queued') {
                                $info.remove();
                                $prgress.css('display', 'block');
                                percentages[file.id][1] = 0;
                            } else if (cur === 'progress') {
                                $info.remove();
                                $prgress.css('display', 'block');
                            } else if (cur === 'complete') {
                                $prgress.hide().width(0);
                                $li.append('<span class="success"></span>');
                            }
                            $li.removeClass('state-' + prev).addClass('state-' + cur);
                        });
                        $li.on('mouseenter', function () {
                            $btns.stop().animate({height: 30});
                        });

                        $li.on('mouseleave', function () {
                            $btns.stop().animate({height: 0});
                        });
                        $btns.on('click', 'span', function () {
                            var obj = $(this);
                            switch (obj.index()) {
                                case 0:
                                    var r = confirm("确定删除该图片吗？");
                                    if (r == true) {
                                        h(obj);
                                        uploader.removeFile(file);
                                    }
                                    return;
                                case 1:
                                    file.rotation += 90;
                                    break;

                                case 2:
                                    file.rotation -= 90;
                                    break;
                            }
                            if (supportTransition) {
                                var deg = 'rotate(' + file.rotation + 'deg)';
                                $wrap.css({
                                    '-webkit-transform': deg,
                                    '-mos-transform': deg,
                                    '-o-transform': deg,
                                    'transform': deg
                                });
                            } else {
                                $wrap.css('filter', 'progid:DXImageTransform.Microsoft.BasicImage(rotation=' + (~~((file.rotation / 90) % 4 + 4) % 4) + ')');
                            }
                        })

                    } else {
                        //文件上传
                    }

                    $li.appendTo( $queue );
                    setState( 'ready' );
                    updateTotalProgress();
                    var P = null;
                    $.ajax({
                        type: "POST",
                        url: option.uploadPath,
                        data: {
                            fileMd5: md5,
                            fileName: file.name
                        },
                        cache: false,
                        async: false,
                        timeout: 10000,
                        dataType: "json",
                        success: function(rb) {
                            if (rb.msg == 0) {
                                alert("ssssssss");
                                 P = rb.data;
                                // if ($isImage) {
                                //     P.message = '<p class="error" title="' + rb.msg + '">' + rb.msg + "</p>"
                                // } else {
                                //     P.progress = '<p class="progress"><span class="progress-bar" style="display:block;width:100%;">100%</span></p>';
                                //     P.message = '<span class="label label-sm label-success" title="' + T.message + '">' + T.message + "</span>"
                                // }
                            }
                        }
                    });
                    if (P) {
                        uploader.removeFile(file);
                        p.refreshFileList([P], false)
                    }
                    d.removeClass("disabled");
                    if (!t.isLazy) {
                        $upload.click()
                    }
                })

            }

        }
    })(jQuery);
