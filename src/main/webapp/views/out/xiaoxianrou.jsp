<%--
  Created by IntelliJ IDEA.
  User: liming_liu
  Date: 15/5/5
  Time: 下午3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta name="game-id" content="memeda" />
    <meta http-equiv="Cache-Control" content="no-cache, must-revalidate" />
    <meta http-equiv="expires" content="-1" />
    <link rel="stylesheet" type="text/css" href="/static/out/xiaoxianrou/js/m.min.css" />
    <link rel="apple-touch-icon" href="http://yx8.com/game/memeda/icon.png" />
    <link rel="shortcut icon" href="http://yx8.com/game/memeda/icon.png" />
    <link rel="icon" href="http://yx8.com/game/memeda/icon.png" />
    <title>小鲜肉么么哒</title>
    <meta name="keywords" content="小鲜肉么么哒,小鲜肉么么哒html5游戏" />
    <meta name="description" content="小鲜肉么么哒html5游戏,小鲜肉么么哒手机在线游戏" />
    <style id="style-1-cropbar-clipper">
        .en-markup-crop-options {
            top: 18px !important;
            left: 50% !important;
            margin-left: -100px !important;
            width: 200px !important;
            border: 2px rgba(255,255,255,.38) solid !important;
            border-radius: 4px !important;
        }

        .en-markup-crop-options div div:first-of-type {
            margin-left: 0px !important;
        }
    </style>
</head>
<body youdao="bind" style="">
<script async="" src="/static/out/xiaoxianrou/js/analytics.js"></script>
<script src="/static/out/xiaoxianrou/js/hm.js"></script>
<script type="text/javascript">
    var _hmt = _hmt || [];
</script>
<script src="/static/out/xiaoxianrou/js/jquery.min.js"></script>
<script src="/static/out/xiaoxianrou/js/underscore-min.js"></script>
<script type="text/javascript">
    (function(f,o){'callShare more statScore getRank showAd'.replace(/\S+/g,function(a){o[a]=f});var a=o._sd={};o.updateData=function(b){for(var i in b)if(b.hasOwnProperty(i))a[i]=b[i]}})(function(){},LBShare={});document.write('')
    shareDataX = {
        imgUrl: 'http://yx8.com/game/memeda/img/ico_large.png',
        timeLineLink: 'http://yx8.com/game/memeda',
        tTitle: "要玩一起玩，小鲜肉么么哒",
        tContent: "爱我你就吻我吧!"
    };
    hotUrl = "http://yx8.com/game/memeda/?from=memeda";
    LBShare.updateData({
        title: shareDataX.tTitle,
        imgUrl: shareDataX.imgUrl,
        desc: shareDataX.tContent
    });
</script>

<div id="layout">
    <div id="loading" class="page show hide">
        loading
    </div>
    <div id="index" class="page show">
        <div class="app_name">
            小鲜肉 么么哒
        </div>
        <div class="app_desc">
            爱我你就吻我吧
        </div>
        <div class="p_btns">
            <span class="btn_start_game js_start_game">开始游戏</span>
        </div>
        <div class="p_btns">
            <span class="btn_play_again js_game_share">分享到朋友圈</span>
        </div>
    </div>
    <div id="game" class="page hide">
        <div id="game_header">
            <span class="score">得分：<span>0</span></span>
            <span class="count_down"></span>
            <span class="btn_pause js_pause_game">暂停</span>
        </div>
        <div id="box">
            <div class="inner">
                <div class="hole" id="hole1">
                    <div class="meizi" data-id="0"></div>
                </div>
                <div class="hole" id="hole2">
                    <div class="meizi" data-id="1"></div>
                </div>
                <div class="hole" id="hole3">
                    <div class="meizi" data-id="2"></div>
                </div>
                <div class="hole" id="hole4">
                    <div class="meizi" data-id="3"></div>
                </div>
                <div class="hole" id="hole5">
                    <div class="meizi" data-id="4"></div>
                </div>
                <div class="hole" id="hole6">
                    <div class="meizi" data-id="5"></div>
                </div>
                <div class="hole" id="hole7">
                    <div class="meizi" data-id="6"></div>
                </div>
                <div class="hole" id="hole8">
                    <div class="meizi" data-id="7"></div>
                </div>
                <div class="hole" id="hole9">
                    <div class="meizi" data-id="8"></div>
                </div>
            </div>
        </div>
    </div>
    <div id="gameover" class="page hide"></div>
    <div id="game_pause" class="page hide">
        <div class="pause_txt">
            游戏暂停
        </div>
        <div class="p_btns">
            <span class="btn_continue js_game_continue">继续</span>
        </div>
        <div class="p_btns">
            <span class="btn_play_again js_game_share">分享到朋友圈</span>
        </div>
    </div>
</div>
<script type="text/html" id="tpl_gameover">
    <div class="score">
        <p class="result">亲到 <%= score %> 个小鲜肉~ 击败了 <%= percent %> %的玩家。堪称：</p>
        <p class="name"><%= name %></p>
        <p class="congratulation"><%= congratulation %></p>
    </div>
    <div class="pic"><img src="<%= img %>" alt=""></div>
    <div class="msg"><%= desc %></div>
    <div class="do_more"><%= doMore %></div>
    <div class="p_btns">
        <span class="btn_play_again js_game_again">再来一次</span>
    </div>
    <div class="p_btns">
        <span class="btn_play_again js_game_share">分享到朋友圈</span>
    </div>
</script>
<script src="/static/out/xiaoxianrou/js/libs.min.js"></script>
<script src="/static/out/xiaoxianrou/js/main.js"></script>
<script type="text/javascript">
    $(".js_download_game").on("click", function(){
        _hmt.push(["_trackEvent", "更多游戏", "更多游戏按钮"]);
        LBShare.more();
        return false;
    })
    $("#layout").delegate(".js_game_share", "click", function(){
        LBShare.callShare();
    })
</script>
</body>
</html>