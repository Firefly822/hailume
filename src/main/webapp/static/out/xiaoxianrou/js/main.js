var Config = {allTime: 3E4,liveTimeStart: 3E3,liveTimeEnd: 1E3,num: 3,meiziLen: 13,interval: 200}, Res = "img/0.jpg img/1.jpg img/2.jpg img/3.jpg img/4.jpg img/5.jpg img/6.jpg img/7.jpg img/8.jpg img/9.jpg img/10.jpg img/11.jpg img/12.jpg".split(" ");
timeoutData = [{max: 30,desc: "\u80a5\u7682\u8bda\u53ef\u8d35\uff0c\u57fa\u53cb\u4ef7\u66f4\u9ad8\uff01\u82e5\u4e3a\u59b9\u7eb8\u6545\uff0c\u4e8c\u8005\u7686\u53ef\u629b~\uff01\u8fd9\u4f4d\u58ee\u58eb\u53ea\u4eb2\u5230 #score# \u4f4d\u59b9\u7eb8\uff0c\u8fd8\u9700\u52aa\u529b\u554a~"}, {max: 50,desc: "\u773c\u524d\u7684\u59b9\u7eb8\u662f\u6211\u7684\u5fc3\u5934\u7231\uff0c\u60f3\u8981\u4eb2\u5979\u5c31\u8981\u70b9\u7684\u5feb~\u8fd9\u4f4d\u58ee\u58eb\u672c\u6b21\u4eb2\u5230 #score# \u4f4d\u59b9\u7eb8\uff0c\u518d\u6765\u4e00\u6b21\uff01\u53ef\u4ee5\u4eb2\u66f4\u591a\u7684\u59b9\u7eb8\u5462~\uff01"}, 
    {max: 90,desc: "\u8fd9\u4f4d\u58ee\u58eb\u773c\u75be\u624b\u5feb\u4eb2\u5230\u4e86 #score# \u4f4dshowgirl\uff0c\u5b8c\u7f8e\u95ea\u907f\u51fa\u73b0\u7684\u5b85\u7537~\u4e0d\u4e8f\u662f\u771f\u00b7\u6c49\u7eb8\u00b7\u65e0\u53cc\uff01"}, {max: 30,desc: "\u8fd9\u4f4d\u58ee\u58eb\u5b8c\u7f8e\u95ea\u907f\u5982\u82b1\uff0c\u4eb2\u5230 #score# \u4e2ashowgirl\uff01\u4f60\u884c\uff1f\u6765\u8bd5\u8bd5\uff1f"}, {max: 1E6,desc: "\u8fd9\u4f4d\u58ee\u58eb\u771f\u76f4\u7537\uff01\u7231\u7f8e\u5973\uff01\u4e0d\u754f\u57fa\u53cb\u548c\u80a5\u7682\u7684\u8bf1\u60d1\uff0c\u5c45\u7136\u4eb2\u5230\u4e86 #score# \u4f4d\u59b9\u7eb8\uff01\u771f\u662f\u53f9\u4e3a\u89c2\u6b62~\uff01"}];
suicideData = [{max: 0,desc: "\u606d\u559c\u60a8\u4eb2\u5230\u4e86\u5973\u795e\u5982\u82b1\uff0c\u4ed6\u5df2\u51b3\u5b9a\u4e3a\u4f60\u751f\u513f\u80b2\u5973\uff0c\u548c\u7f8e\u4e3d\u7684showgirl say goodbye\u5427~"}, {max: 20,desc: "\u4eba\u56fa\u6709\u4e00\u6b7b\uff0c\u6216\u6b7b\u4e8e\u8001\u773c\u660f\u82b1\u9519\u70b9\u5982\u82b1\uff0c\u6216\u6b7b\u4e8e\u624b\u901f\u592a\u5feb\u8bef\u70b9\u5b85\u7537\uff01\u9a6c\u4e0a\u518d\u6765\u4e00\u6b21\uff0c\u4e0d\u4eb2\u5230\u59b9\u7eb8\u4e0d\u7f62\u4f11~"}, {max: 40,
        desc: "\u6b64\u4eba\u6b7b\u4e8e\u624b\u592a\u5feb\uff0c\u9519\u628a\u5982\u82b1\u5f53\u7f8e\u5973~\u4f60\u6765\u4eb2\u4eb2\u7f8e\u5973\u8bd5\u8bd5\uff1f"}, {max: 60,desc: "\u606d\u559c\u60a8\u4eb2\u5230\u4e86\u5973\u795e\u5982\u82b1\uff0c\u4ed6\u5df2\u51b3\u5b9a\u4e3a\u4f60\u751f\u513f\u80b2\u5973\uff0c\u548c\u7f8e\u4e3d\u7684showgirl say goodbye\u5427~"}, {max: 80,desc: "\u58ee\u58eb\u65ad\u8155\uff0c\u4f60\u52c7\u4e8e\u727a\u7272\u81ea\u5df1\u62ef\u6551\u59b9\u5b50\u7684\u7cbe\u795e\u5df2\u611f\u52a8\u5982\u82b1\uff0c\u771f\u82f1\u96c4\uff0c\u4e0d\u754f\u57fa\uff01"}, 
    {max: 1E5,desc: "\u867d\u7136\u4f60\u4eb2\u5230\u4e86\u5927\u6ce2\u7684\u7f8e\u5973\uff0c\u4f46\u8fd8\u662f\u6ca1\u80fd\u9003\u8fc7\u5b85\u7537\u3010\u738b\u5927\u9524\u3011\u7684\u837c\u6bd2\u2026\u2026\u83ca\u82b1\u6b8b\uff0c\u6ee1\u5730\u4f24\u2026\u2026\u4f60\u7684\u5f71\u5b50\u5df2\u2026\u2026"}];
rankData = [{max: 30,name: "\u9c9c\u8089\u83dc\u9e1f"}, {max: 50,name: "\u9c9c\u8089\u597d\u624b"}, {max: 70,name: "\u9c9c\u8089\u997f\u72fc"}, {max: 90,name: "\u9c9c\u8089\u9886\u8896"}, {max: 1E5,name: "\u9c9c\u8089\u7fd8\u695a"}];
beatData = [{max: 3,percent: 0}, {max: 5,percent: 8}, {max: 10,percent: 20}, {max: 15,percent: 40}, {max: 30,percent: 70}, {max: 40,percent: 85}, {max: 50,percent: 98.5}, {max: 60,percent: 99.2}, {max: 70,percent: 99.4}, {max: 80,percent: 99.6}, {max: 90,percent: 99.8}, {max: 1E5,percent: 99.9}];
!function(q) {
    var m = $("#layout"), s = $("#box"), w = ($(".page"), $("#box .hole")), n = $("#box .meizi"), r = ($("#box .kiss"), $(".count_down")), t = $(".score span"), k = [], p = [], u = 0, f = {title: shareDataX.tTitle,desc: shareDataX.tContent}, v = {init: function() {
            this.inited || (this.initEvent(), this.initShareEvent());
            this.inited = !0
        },load: function() {
            function a() {
                c++;
                b == c && (v.init(), e.switchPage("index"))
            }
            for (var b = Res.length, c = 0, e = this, d = 0; b > d; d++) {
                var g = new Image;
                g.onload = a;
                g.src = Res[d]
            }
        },renderUI: function() {
            var a, b, c, e, d = q.innerWidth - 
            20, g = q.innerHeight - 50;
            1.2 < g / d ? (a = Math.min(d, 500), c = (a - 12) / 3, e = 1.2 * c, b = 3 * e + 12) : (b = Math.min(g, 500), a = b / 1.2, c = (a - 12) / 3, e = 1.2 * c);
            s.width(a).height(b);
            w.width(c).height(e);
            n.width(c).height(e)
        },initEvent: function() {
            var a = "ontouchstart" in document.documentElement ? "touchend" : "click";
            s.on(a, ".hole>div", _.bind(this.checkTap, this));
            m.on(a, ".js_start_game", _.bind(this.start, this));
            m.on(a, ".js_pause_game", _.bind(this.pause, this));
            m.on(a, ".js_game_again", _.bind(this.again, this));
            m.on(a, ".js_game_continue", _.bind(this.resume, 
            this))
        },start: function() {
            this.reset();
            ////console.log(">> start");
            t.text(0);
            r.text(Config.allTime / 1E3);
            this.switchPage("game");
            this.renderUI();
            k = this.initThree();
            ////console.log(k);
            for (var a = 0; 9 > a; a++)
                0 < k[a] ? this.addMeizi(a) : p.push(!1);
            this.tick()
            _hmt.push(["_trackEvent", "游戏开始", "游戏开始按钮"]);
            LBShare.showAd({pos: 'banner',  hide: true });
            LBShare.showAd({pos: 'top' , hide: true});
            LBShare.showAd({pos: 'footer', hide: true});
        },initThree: function() {
            for (var a = [], b = 0; 9 > b; b++)
                a.push(3 > b ? Config.liveTimeStart : 0);
            return _.shuffle(a)
        },tick: function(a) {
            function b(a) {
                c = c || a;
                a = Date.now();
                e = a - c;
                if (e >= g) {
                    var n = e, l = Date.now();
                    if (h.time = l - f, h.time >= Config.allTime)
                        h.gameOver("timeout");
                    else {
                        6E3 > h.time && 
                        r.addClass("danger");
                        for (l = 0; 9 > l; l++) {
                            var m = k[l] - n;
                            0 < m ? k[l] = m : p[l] && (h.removeMeizi(l), h.addMeizi())
                        }
                        r.text(Math.round((Config.allTime - h.time) / 1E3))
                    }
                    c = a
                }
                return h._gameover ? void (d && q.cancelAnimationFrame(d)) : h._pause ? void (d && q.cancelAnimationFrame(d)) : void (d = q.requestAnimationFrame(b))
            }
            var c, e, d, g = Config.interval, h = this, f = Date.now();
            ////console.log("startTime", f);
            "resume" == a && (f -= h.time);
            c = Date.now();
            d = q.requestAnimationFrame(b)
        },resume: function() {
            ////console.log(">> resume");
            this._pause = !1;
            this.switchPage("game");
            this.tick("resume")
        },pause: function() {
            ////console.log(">> pause");
            this._pause = !0;
            this.switchPage("game_pause")
            _hmt.push(["_trackEvent", "暂停游戏", "游戏被暂停"]);
        },checkTap: function(a) {
            if (!this._gameover) {
                var b = this;
                a = $(a.currentTarget).data();
                var c = a.id;
                a = a.value;
                p[c] && (u = a, a ? (this.kiss(c, function() {
                    b.removeMeizi(c)
                }), this.addMeizi(), this.setScore()) : this.gameOver("suicide"))
            }
        },setScore: function() {
            this.score += 1;
            t.text(this.score)
        },again: function() {
            //console.log(">> again");
            this.start();
            this.switchPage("game")
        },gameOver: function(a) {
            //console.log(">> gameover");
            this._gameover = !0;
            this.switchPage("gameover");
            var b, c, e, d = this.score, g = this.filterText(d, beatData).percent;
            0 < d ? "\u6211\u4e00\u5206\u949f\u4eb2\u4e86" + this.score + "\u4e2ashowgirl\uff01\u80af\u5b9a\u6bd4\u4f60\u591a\uff0c\u4e0d\u4fe1\u4f60\u8bd5\u8bd5\uff1f" : shareDataX.tTitle;
            "timeout" == a ? (b = this.filterText(d, timeoutData), c = b.desc.replace(/#score#/, d), e = "\u606d\u559c\u4f60\u5c06\u5979\u9886\u56de\u5bb6~", f.title = "\u6211\u4eb2\u5230" + d + "\u4e2a\u7f8e\u5973\uff0c\u51fb\u8d25\u4e86\u5168\u56fd" + g + "%\u7684\u52c7\u58eb\uff0c\u5f81\u670d\u4e00\u4e2a\u9886\u56de\u5bb6\uff0c\u5f00\u5fc3\u56de\u5bb6\u751f\u5b69\u5b50\u54af~\uff01") : 
            (b = this.filterText(d, suicideData), c = b.desc, e = "\u606d\u559c\u4f60\u5c06\u4ed6\u9886\u56de\u5bb6~", f.title = 0 < d ? "\u4e07\u5343showgirl\u4e1b\u4e2d\u8fc7\uff0c\u504f\u504f\u773c\u778e\u4eb2\u5982\u82b1\uff01\u6211\u53ea\u51fb\u8d25\u4e86\u5168\u56fd" + g + "%\u7684\u52c7\u58eb\u2026\u2026\u4f60\u6765\u8bd5\u8bd5\uff1f" : "\u5f88\u9057\u61be\uff01\u6211\u6ca1\u6709\u4eb2\u5230\u7f8e\u5973\uff0c\u662f\u5168\u56fd\u552f\u4e00\u57ab\u5e95\u7684\u52c7\u58eb\uff01\u53ea\u6709\u5982\u82b1\u548c\u6211\u56de\u5bb6\uff01");
            f.desc = "\u6211\u4eb2\u5230" + d + "\u4e2a\u7f8e\u5973\uff01\u770b\u770b\u4f60\u80fd\u4eb2\u5230\u51e0\u4e2a\uff1f\u80af\u5b9a\u6bd4\u4f60\u591a\uff0c\u4e0d\u4fe1\u4f60\u8bd5\u8bd5\uff01\uff01\uff01";
            a = $("#tpl_gameover").html();
            c = _.template(a, {score: this.score,desc: c,img: Res[u],name: this.filterText(d, rankData).name,doMore: "\u518d\u591a\u4eb2" + this.random(4, 2) + "\u4e2a\u5c31\u80fd\u591a\u51fb\u8d25" + this.random(5, 2) + "%\u7684\u73a9\u5bb6\uff0c\u52a0\u6cb9\u54e6~",congratulation: e,percent: g});
            //console.log(f);
            $("#gameover").html(c);
            n.removeClass()
            LBShare.showAd({pos: 'banner', bannerShowOps: [2, 4] });
            LBShare.showAd({pos: 'top' });
            LBShare.showAd({pos: 'footer'});
            _hmt.push(["_trackEvent", "游戏结束", "游戏自动结束"]);

        },filterText: function(a, b) {
            return _.filter(b, function(b) {
                return a <= b.max
            })[0]
        },reset: function() {
            k = [];
            p = [];
            this.time = Config.allTime;
            this.score = 0;
            this._gameover = null;
            this._pause = !1;
            Date.now()
        },switchPage: function(a) {
            a && ($(".page").addClass("hide"), $("#" + a).addClass("show").removeClass("hide"))
        },random: function(a, b) {
            return Math.floor(Math.random() * (a - b + 1)) + b
        },randomSurplusOnly: function() {
            function a() {
                var c = Math.floor(9 * Math.random()) + 0;
                return b[c] ? a() : c
            }
            var b = _.clone(p);
            return a()
        },removeMeizi: function(a) {
            k[a] = 0;
            p[a] = !1;
            $(n[a]).removeClass()
        },addMeizi: function(a) {
            a = _.isUndefined(a) ? this.randomSurplusOnly() : a;
            var b = this.random(Config.meiziLen - 1, 0);
            p[a] = !0;
            k[a] = this.getliveTime();
            $(n[a]).addClass("meizi_" + b).addClass("meizi").data("value", b)
        },initShareEvent: function() {
            var a = this;

            document.addEventListener("WeixinJSBridgeReady", function() {
                WeixinJSBridge && WeixinJSBridge.call("hideToolbar");
                WeixinJSBridge && (WeixinJSBridge.on("menu:share:appmessage", function() {
                    0 < a.score ? 
                    "\u6211\u4e00\u5206\u949f\u4eb2\u4e86" + a.score + "\u4e2ashowgirl\uff01\u80af\u5b9a\u6bd4\u4f60\u591a\uff0c\u4e0d\u4fe1\u4f60\u8bd5\u8bd5\uff1f" : shareDataX.tTitle;
                    WeixinJSBridge.invoke("sendAppMessage", {img_url: shareDataX.imgUrl,link: shareDataX.timeLineLink,desc: f.desc,title: f.title}, function() {
                        document.location.href = hotUrl
                    })
                }), WeixinJSBridge.on("menu:share:timeline", function() {
                    WeixinJSBridge.invoke("shareTimeline", {img_url: shareDataX.imgUrl,img_width: "640",img_height: "640",link: shareDataX.timeLineLink,
                        desc: f.desc,title: f.title}, function() {
                        document.location.href = hotUrl
                    })
                }))
            }, !1)

            // shareDataX.tTitle = 0 < a.score ? "\u6211\u4e00\u5206\u949f\u4eb2\u4e86" + a.score + "\u4e2ashowgirl\uff01\u80af\u5b9a\u6bd4\u4f60\u591a\uff0c\u4e0d\u4fe1\u4f60\u8bd5\u8bd5\uff1f" : shareDataX.tTitle;
            // alert(shareDataX.tTitle);
            // LBShare.updateData({
            //     title: shareDataX.tTitle,
            //     imgUrl: shareDataX.imgUrl,
            //     desc: shareDataX.tContent
            // });
        },kiss: function(a, b) {
            var c = $(n[a]);
            c.html('<img src="img/lip.png" />');
            c.find("img").fadeOut(300, b);
        },getliveTime: function() {
            return Config.liveTimeStart - (Config.liveTimeStart - Config.liveTimeEnd) / Config.allTime * this.time
        }};
    v.load()
}(window);
