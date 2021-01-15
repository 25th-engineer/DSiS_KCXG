<#include "../shared/layout.ftl">

<@layout>
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <#if username??>
            <div class="msg-panel">
                <div id="submitMsg" class="alert" style="display: none">

                </div>
                <div class="p-3">
                    <div class="form-group">
                        <label for="exampleFormControlInput1">昵称</label>
                        <input type="txt" class="form-control form-txt" id="txtUserName" placeholder="请输入你的昵称"
                               value="${username!}" disabled="disabled">
                    </div>
                    <div class="form-group" style="display: none">
                        <label for="exampleFormControlInput1">邮箱</label>
                        <input type="txt" class="form-control form-txt" id="exampleFormControlInput1"
                               placeholder="请输入你的邮箱">
                    </div>


                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">我想说：</label>
                        <textarea class="form-control" id="txtBody" rows="3" required></textarea>
                    </div>

                    <div class="form-group">
                        <button class="btn btn-primary" id="btnMessageSubmit">留言</button>
                    </div>
                </div>
            </div>
        <#else>
            <div class="alert alert-warning" role="alert">
                <a href="/user/login">登录</a>后，即可留言交流。
            </div>
        </#if>
    </div>
    <div class="my-3 p-3 bg-white rounded shadow-sm">
        <h3 class="border-bottom border-gray pb-2 mb-0">留言信息</h3>
        <div id="messageList">
            <#list messageList as message>
                <div class="message-info text-muted pt-3">
                    <div class="message-body">
                        <div class="clearfix">
                            <img class="float-left" src="http://cdn.ken.io/logo/ken/gold1-s.png" width="30" height="30">
                            <strong class="text-gray-dark ml-2 float-left">${message.userName}</strong>
                            <a class="reply-show float-right" message-id="${message.id?c}" href="#">回复</a>
                        </div>
                        <div class="message-content pt-3">${message.body}</div>
                        <hr/>
                    </div>
                    <div class="reply-list pl-5" message-id="${message.id?c}">
                        <#if message.replyList??>
                            <#list message.replyList as reply>
                                <p>
                                    <strong>${reply.userName}</strong>：<span>${reply.body}</span>
                                </p>
                            </#list>
                        </#if>
                    </div>
                    <div class="reply-form pl-5" message-id="${message.id?c}" style="display: none">
                        <textarea class="txtReply" message-id="${message.id?c}" rows="2" required></textarea>
                        <button class="btnReply" message-id="${message.id?c}">回复</button>
                    </div>
                </div>
            </#list>
        </div>

    </div>
    <small class="d-block text-center mt-3">
        ${pagination!}
    </small>
    </div>

</@layout>

<#macro bottom>
    <script type="text/javascript">
        $("#btnMessageSubmit").click(function () {
            var userName = $("#txtUserName").val();
            var body = $("#txtBody").val();
            $.post("/message/submit", {body: body, parentId: 0}, function (data) {
                var messageId = "";
                var dataJson = JSON.parse(data);
                if (dataJson.code == 0) {
                    messageId = dataJson.content;
                    var messageHtml = ' <div class="message-info text-muted pt-3">\n' +
                        '            <div class="message-body">\n' +
                        '                    <div class="clearfix">\n' +
                        '                        <img class="float-left" src="http://cdn.ken.io/logo/ken/gold1-s.png" width="30" height="30">\n' +
                        '                        <strong class="text-gray-dark ml-2 float-left">' + userName + '</strong>\n' +
                        '                        <a class="reply-show float-right" message-id="' + messageId + '" href="#">回复</a>\n' +
                        '                    </div>\n' +
                        '                    <div class="message-content pt-3">' + body + '</div>\n' +
                        '                    <hr>\n' +
                        '            </div>\n' +
                        '            <div class="reply-list pl-5" message-id="' + messageId + '"></div>\n' +
                        '            <div class="reply-form pl-5" message-id="' + messageId + '" style="display:none">\n' +
                        '                <textarea class="txtReply" message-id="' + messageId + '" rows="2" required=""></textarea>\n' +
                        '                <button class="btnReply" message-id="' + messageId + '">回复</button>\n' +
                        '            </div>\n' +
                        '        </div>';

                    $(messageHtml).insertBefore($("#messageList .message-info:first"));
                    $("#messageList .message-info:last").remove();
                    $("#submitMsg").text("留言成功");
                    $("#submitMsg").addClass("alert-success");
                    bindClickEvent(messageId);
                } else {
                    $("#submitMsg").text("留言失败:" + dataJson.message);
                    $("#submitMsg").addClass("alert-warning");
                }
                $("#submitMsg").show();
            });
        });

        function replyFormShow(messageId) {
            var replayForm = $(".reply-form[message-id='" + messageId + "']");
            if (replayForm.css("display") == "none") {
                $(this).text("收起");
                replayForm.show();
            } else {
                $(this).text("回复");
                replayForm.hide();
            }
        }

        function replySubmit(messageId) {
            var body = $(".txtReply[message-id='" + messageId + "']").val();
            console.log(body);
            var userName = $("#txtUserName").val();
            $.post("/message/submit", {body: body, parentId: messageId}, function (data) {
                var dataJson = JSON.parse(data);
                if (dataJson.code == 0) {
                    var replyHtml = '<p>\n' +
                        '   <strong>' + userName + '</strong>：<span>' + body + '</span>\n' +
                        '   </p>'
                    $(".reply-list[message-id='" + messageId + "']").append(replyHtml);
                } else {
                    alert(dataJson.message);
                }
            })
        }

        $(".reply-show").on("click", function () {
            replyFormShow($(this).attr("message-id"));
        });

        $(".btnReply").on("click", function () {
            replySubmit($(this).attr("message-id"));
        })

        function bindClickEvent(messageId) {
            $(".reply-show[message-id='" + messageId + "']").bind("click", function () {
                replyFormShow($(this).attr("message-id"));
            });

            $(".btnReply[message-id='" + messageId + "']").bind("click", function () {
                replySubmit($(this).attr("message-id"));
            })

        }
    </script>
</#macro>