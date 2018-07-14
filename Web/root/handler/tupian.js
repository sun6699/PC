/*
fileinputid:上传控件id
flashid:flash进度id
tupiancid:图片容器id
*/
function init_up_tupian(fileinputid, flashid, tupiancid, fid, loadbtnid, tabname) {
    $("#" + fileinputid).uploadify({
        swf: '/root/js/uploadfy/uploadify.swf',
        uploader: '/root/handler/tupianmd.aspx?id=' + fid + "&tabname=" + tabname,
        queueID: flashid,
        auto: true,
        multi: true,
        buttonText: '上传',
        removeTimeout: 1,
        fileTypeExts: "*.jpg;*.gif;*.png;*.jpeg",
        onUploadSuccess: function (file, data, response) {
            var rs = eval("(" + data + ")");
            if (rs.res == "1") {
            }
            else {
                alert("上传失败");
            }
        },
        'onQueueComplete': function (queueData) {
            //alert(11);
            //alert(queueData.uploadsSuccessful + ' files were successfully uploaded.');
            $("#" + loadbtnid).click();
        }
    });
}