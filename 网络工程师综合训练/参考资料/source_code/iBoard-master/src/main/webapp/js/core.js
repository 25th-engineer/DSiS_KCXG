var pathName = window.document.location.pathname;
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
//获取可视区宽度
var winWidth = function () {
    return document.documentElement.clientWidth || document.body.clientWidth;
}
//获取可视区高度
var winHeight = function () {
    return document.documentElement.clientHeight || document.body.clientHeight;
}


// 页面加载完成 将AjaxCard隐藏 当请求成功的时候再显示出来
$(document).ready(function () {
    // 隐藏用于Ajax动态显示的模版
    $("#ajaxCard").hide();

    // 隐藏底部Toast模版
    $("#bd").fadeOut();

    // 注册message窗体的右键行为
    $(".card").bind("contextmenu", contextmenuActionOnCard);
    // 默认右键菜单隐藏
    $("#menu").hide();
    // 当点到其他地方的时候 将菜单收起来
    $(document).bind("click", function (e) {
        $("#menu").hide(200);
    });

})

// 处理右键在 Message 上的事件
function contextmenuActionOnCard(e) {
    console.log(e);
    var card = $().add(e.toElement);
    // 一直拿父元素 直到拿到 card 根元素
    while (card.attr("class") !== "card") {
        card = card.parent();
    }
    ;
    card.attr("status", "now");
    console.log(card);
    mid = $("div[status='now'] span").attr('mid');
    card.attr("status", "");

    // 获得 mid 然后设置给菜单事件
    console.log("mid" + mid);

    // 这里很奇怪 Y 是相对整个页面的值
    var menu = $("#menu");
    var x = e.clientX;
    var y = e.pageY;

    // 设置弹出菜单 的事件行为
    $("#menu #edit").attr("onclick", "edit(" + mid + ")");
    $("#menu #share").attr("onclick", "share(" + mid + ")");

    // console.log("winWidth:"+winWidth()+"   menuOffserWidtgh:"+menu.width());
    // 当菜单到达屏幕视图之外的时候
    if (x >= (winWidth() - menu.width())) {
        x = winWidth() - menu.width();
    }
    // if(y>=(winHeight()-menu.height())){
    //     y = winHeight() - menu.height();
    // }
    // 设置菜单出现的位置
    menu.css("left", x + 'px');
    menu.css("top", y + 'px');
    // 展示菜单 并设置一个展示动画
    menu.show(200);
    // 阻止系统默认菜单弹出
    return false;
}


function edit(mid) {
    // 将页面内容放到顶部 编辑框
    var card = $("div[cardid=" + mid + "]");
    console.log(card);
    var content = $("div[cardid=" + mid + "] p").text();
    var author = $("div[cardid=" + mid + "] strong").text();
    $('textarea[name="content"]').val(content);
    $('input[name="author"]').val(author);

    // 修改submit 事件内内容 和 href
    var form = $("#submitform");
    $("#submitform button[type='submit']").attr('onclick', 'updateAjax()');
    $("#submitform input[name='id']").attr('value', mid);


    scrollOffset($('#submitform').offset());
    // Ajax 请求修改

    // 修改成功/失败 Toast提醒 若成功则将页面上的Card也修改成请求内容 若失败则不变化

    // 将页面 跳转到修改的留言处

}

function updateAjax() {

    $.ajax({
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        url: projectName + '/message/updateAjax',
        data: JSON.stringify({
            content: $('textarea[name="content"]').val(),
            author: $('input[name="author"]').val(),
            id: $('input[name="id"]').val(),
        }),
        success: function (result) {
            console.log(result);

            updateAjaxSuccess(result.id);

            if (result.status == 'success') {
                Toast(result.msg);
            } else {
                Toast(result.msg + ' 但前端已经修改了内容', 3000, 0);
            }
        },
        error: function (result) {
            console.log("submitAjax 出现错误");
            console.log(result);
        }
    });

}

function updateAjaxSuccess(id) {
    // 更新前端视图
    $("div[cardid=" + id + "] p").text($('textarea[name="content"]').val());
    $("div[cardid=" + id + "] strong").text($('input[name="author"]').val());

    // 提交请求后 清空表单
    $('textarea[name="content"]').val("");
    $('input[name="author"]').val("");

    // 跳转到更新过的留言
    scrollOffset($("div[cardid=" + id + "]").offset());

}

// jQuery 定位让body的scrollTop等于pos的top，就实现了滚动
function scrollOffset(scroll_offset) {
    $("body,html").animate({
        scrollTop: scroll_offset.top - 50
    }, 100);
}

// 鼠标 移到 点赞图标上的动画
function hover(element) {
    element.setAttribute('src', projectName + '/img/favorite-24px.svg')
}

function unhover(element) {
    element.setAttribute('src', projectName + '/img/favorite_border-24px.svg')
}

// 点赞的 Ajax 方法
function likesClick(element) {
    console.log(projectName);
    a = element.children;
    console.log(a);
    aa = a[1];
    aa.textContent = Number(aa.textContent) + 1;
    var classVal = aa.getAttribute("class");
    classVal = classVal.replace("is-hidden", "");
    aa.setAttribute("class", classVal);
    element.removeAttribute("onclick")
    a[0].removeAttribute("onmouseout");
    var mid = element.getAttribute("mid");
    $.ajax({
        url: projectName + '/message/likes?id=' + mid,
        success: function (result) {
            // 判断是否失败 若失败 则在前端提示
            console.log(result);
        },
        timeout: function (result) {
            // 失败 将前端恢复到之前状态
        }
    });
}


// 提交留言行为 SubmitAjax
function submitAjax() {
    // $("#ajaxCard").show(1000);

    $.ajax({
        type: "POST",
        dataType: "json",
        contentType: "application/json;charset=utf-8",
        url: projectName + '/message/saveAjax',
        data: JSON.stringify({
            content: $('textarea[name="content"]').val(),
            author: $('input[name="author"]').val(),
        }),
        success: function (result) {
            console.log(result);

            var id = result.id;

            submitSuccess(id);
        },
        error: function (result) {
            console.log("submitAjax 出现错误");
            console.log(result);
        }
    });
    return false;
}


function testButton() {
    var newCard = $('#ajaxCard').clone(true, true).attr('id', 'newCard');
    console.log(newCard);
    $('#mlist').prepend(newCard);
    console.log(newCard);
    newCard.show(1000);
}

// submitSuccess 成功后调用的主要方法 处理视图
function submitSuccess(id) {
    var newCard = $('#ajaxCard').clone(true, true).attr('id', 'newCard');
    console.log(newCard);
    $('#mlist').prepend(newCard);
    console.log(newCard);

    // 设置值 并清除id
    newCard.attr('cardid', id);
    $("#newCard #ajaxConten").text($('textarea[name="content"]').val());
    $("#newCard #ajaxAuthor").text($('input[name="author"]').val());
    $("#newCard #ajaxDate").text('1秒前');
    $('#newCard #ajaxConten').attr('id', '');
    $('#newCard #ajaxAuthor').attr('id', '');
    $('#newCard #ajaxDate').attr('id', '');
    // 删除按钮的链接 + 改成Ajax请求 不需要链接了
    // $('#newCard .delete').attr('href', projectName + '/message/deleteById?id=' + id);
    // 点赞按钮 所需的mid
    $('#newCard span').attr('mid', id);


    $("#newCard").show(1000);

    // 提交请求后 清空表单
    $('textarea[name="content"]').val("");
    $('input[name="author"]').val("");

}

// 删除事件的Ajax行为 DeleteSubmit
function deleteAjax(element) {
    console.log(element);
    // 拿到单条message的根div
    element = $().add(element);
    var card = element.parent().parent().parent();
    card.attr("status", "now");
    console.log(card);
    mid = $("div[status='now'] span").attr('mid');
    $.ajax({
        url: projectName + '/message/deleteByIdAjax?id=' + mid,
        type: "POST",
        success: function (result) {
            console.log(result);

            if (result.status == 'error') {
                Toast(result.msg + '但已经从页面上上移除内容', 5000, 0);
            } else {
                Toast(result.msg);
            }
            card.hide(1000);
        }
    });
    card.attr("status", "");
    return false;
}

// 底部提醒方法 直接调用 并传入参数
function Toast(msg, duration, status) {
    //status == 1 成功 绿色提醒 默认
    //status == 0 错误 红色提醒 ff6d8e
    if (status == 0) {
        console.log("Hello");
        $("#bd").css("background-color", "#ff6d8e");
    }
    duration = isNaN(duration) ? 5000 : duration;
    $("#bd strong").text(msg);
    $("#bd").fadeIn(500);
    setTimeout(function () {
        $("#bd").fadeOut(500);
    }, duration);
}