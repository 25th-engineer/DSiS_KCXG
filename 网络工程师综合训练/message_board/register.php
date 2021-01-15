<?php
//注册功能模块
require_once 'config.php';
require_once 'common.php';
require_once 'medoo.php';

$error = '';
if (isPost()) {
    $data = $_POST;
    $email = $data['email'] ?? '';
    $password = $data['password'] ?? '';

    if (!$email || !$password)
        $error = '参数有误';

    if (!filter_var($data['email'], FILTER_VALIDATE_EMAIL))
        $error = '邮箱格式错误';

    $database = new \Medoo\Medoo($config['db']);
    $result = $database->get('user', 'id', ['email' => $data['email']]);
    if ($result)
        $error = '邮箱已注册';

    if (!$error) {
        $database->insert('user', [
            'email' => $data['email'],
            'password' => md5($data['password'])
        ]);
        $id = $database->id();

        $user = $database->get('user', '*', ['id' => $id]);
        session_start();
        $_SESSION['user'] = json_encode($user);

        header('Location: profile.php');
    }
}
?>

<html>
<head>
    <meta charset="utf-8">
    <title>注册</title>
    <link rel="stylesheet" href="plugins/layui/css/layui.css">
    <link rel="stylesheet" href="css/main.css">
    <style>
        body {
            position: relative;
            overflow: hidden;
            background-image: -webkit-radial-gradient(ellipse farthest-corner at center top, #000d4d 0%, #000105 100%);
            background-image: radial-gradient(ellipse farthest-corner at center top, #000d4d 0%, #000105 100%);
        }

        .code {
            float: left;
            width: 180px;
        }

        #canvas {
            float: right;
            width: 100px!important;
            height: 38px!important;
        }
    </style>
</head>
<body>
<canvas id="canv"></canvas>
<form class="login-form layui-form" id="loginform" method="post">
    <h2>注册</h2>
    <div class="layui-form-item input-item">
        <input type="text" placeholder="请输入邮箱" class="layui-input" name="email">
    </div>
    <div class="layui-form-item input-item">
        <input type="password" placeholder="请输入密码" name="password" class="layui-input">
    </div>
    <div class="layui-form-item input-item">
        <input type="password" placeholder="请输入确认密码" name="confirm_password" id="confirmPassword" class="layui-input">
    </div>
    <div class="layui-form-item input-item code-box">
        <input type="text" placeholder="请输入验证码" name="code" id="code" class="layui-input code">
        <canvas id="canvas" width="100px" height="38px"></canvas>
    </div>
    <div class="layui-form-item">
        <button class="layui-btn w100  btn-register" id="btn">注册</button>
        <p class="text-right"><a href="login.php">已有账号,去登陆</a></p>
    </div>
</form>
<script src="js/jquery.min.js"></script>
<script src="js/code.js"></script>
<script src="plugins/layui/layui.all.js"></script>
<script>
    $('.btn-register').on('click', function (e) {
        e.preventDefault();
        var form = $(this).parents('form');
        var data = form.serializeArray();
        var d = {};
        $.each(data, function() {
            d[this.name] = this.value;
        });

        if (!/^([a-zA-Z]|[0-9])(\w|\-)+@[a-zA-Z0-9]+\.([a-zA-Z]{2,4})$/.test(d.email)) {
            layer.msg('邮箱格式不正确', {icon: 5});
            return false;
        }

        if (!d.password) {
            layer.msg('密码不能为空', {icon: 5});
            return false;
        }

        if (d.password != d.confirm_password) {
            layer.msg('两次密码不一致', {icon: 5});
            return false;
        }

        if (d.code != $('#canvas').attr('data-code')) {
            layer.msg('验证码错误', {icon: 5});
            code_draw();
            return false;
        }

        $(this).prop('disabled', true);
        form.submit();
    });

    code_draw();
    // 点击后刷新验证码
    $("#canvas").on('click', function() {
        code_draw();
    })

    var num = 200;
    var w = window.innerWidth;
    var h = window.innerHeight;
    var max = 100;
    var _x = 0;
    var _y = 0;
    var _z = 150;
    var dtr = function (d) {
        return d * Math.PI / 180;
    };

    var rnd = function () {
        return Math.sin(Math.floor(Math.random() * 360) * Math.PI / 180);
    };
    var dist = function (p1, p2, p3) {
        return Math.sqrt(Math.pow(p2.x - p1.x, 2) + Math.pow(p2.y - p1.y, 2) + Math.pow(p2.z - p1.z, 2));
    };

    var cam = {
        obj: {
            x: _x,
            y: _y,
            z: _z
        },
        dest: {
            x: 0,
            y: 0,
            z: 1
        },
        dist: {
            x: 0,
            y: 0,
            z: 200
        },
        ang: {
            cplane: 0,
            splane: 0,
            ctheta: 0,
            stheta: 0
        },
        zoom: 1,
        disp: {
            x: w / 2,
            y: h / 2,
            z: 0
        },
        upd: function () {
            cam.dist.x = cam.dest.x - cam.obj.x;
            cam.dist.y = cam.dest.y - cam.obj.y;
            cam.dist.z = cam.dest.z - cam.obj.z;
            cam.ang.cplane = -cam.dist.z / Math.sqrt(cam.dist.x * cam.dist.x + cam.dist.z * cam.dist.z);
            cam.ang.splane = cam.dist.x / Math.sqrt(cam.dist.x * cam.dist.x + cam.dist.z * cam.dist.z);
            cam.ang.ctheta = Math.sqrt(cam.dist.x * cam.dist.x + cam.dist.z * cam.dist.z) / Math.sqrt(cam.dist.x * cam.dist.x + cam.dist.y * cam.dist.y + cam.dist.z * cam.dist.z);
            cam.ang.stheta = -cam.dist.y / Math.sqrt(cam.dist.x * cam.dist.x + cam.dist.y * cam.dist.y + cam.dist.z * cam.dist.z);
        }
    };

    var trans = {
        parts: {
            sz: function (p, sz) {
                return {
                    x: p.x * sz.x,
                    y: p.y * sz.y,
                    z: p.z * sz.z
                };
            },
            rot: {
                x: function (p, rot) {
                    return {
                        x: p.x,
                        y: p.y * Math.cos(dtr(rot.x)) - p.z * Math.sin(dtr(rot.x)),
                        z: p.y * Math.sin(dtr(rot.x)) + p.z * Math.cos(dtr(rot.x))
                    };
                },
                y: function (p, rot) {
                    return {
                        x: p.x * Math.cos(dtr(rot.y)) + p.z * Math.sin(dtr(rot.y)),
                        y: p.y,
                        z: -p.x * Math.sin(dtr(rot.y)) + p.z * Math.cos(dtr(rot.y))
                    };
                },
                z: function (p, rot) {
                    return {
                        x: p.x * Math.cos(dtr(rot.z)) - p.y * Math.sin(dtr(rot.z)),
                        y: p.x * Math.sin(dtr(rot.z)) + p.y * Math.cos(dtr(rot.z)),
                        z: p.z
                    };
                }
            },
            pos: function (p, pos) {
                return {
                    x: p.x + pos.x,
                    y: p.y + pos.y,
                    z: p.z + pos.z
                };
            }
        },
        pov: {
            plane: function (p) {
                return {
                    x: p.x * cam.ang.cplane + p.z * cam.ang.splane,
                    y: p.y,
                    z: p.x * -cam.ang.splane + p.z * cam.ang.cplane
                };
            },
            theta: function (p) {
                return {
                    x: p.x,
                    y: p.y * cam.ang.ctheta - p.z * cam.ang.stheta,
                    z: p.y * cam.ang.stheta + p.z * cam.ang.ctheta
                };
            },
            set: function (p) {
                return {
                    x: p.x - cam.obj.x,
                    y: p.y - cam.obj.y,
                    z: p.z - cam.obj.z
                };
            }
        },
        persp: function (p) {
            return {
                x: p.x * cam.dist.z / p.z * cam.zoom,
                y: p.y * cam.dist.z / p.z * cam.zoom,
                z: p.z * cam.zoom,
                p: cam.dist.z / p.z
            };
        },
        disp: function (p, disp) {
            return {
                x: p.x + disp.x,
                y: -p.y + disp.y,
                z: p.z + disp.z,
                p: p.p
            };
        },
        steps: function (_obj_, sz, rot, pos, disp) {
            var _args = trans.parts.sz(_obj_, sz);
            _args = trans.parts.rot.x(_args, rot);
            _args = trans.parts.rot.y(_args, rot);
            _args = trans.parts.rot.z(_args, rot);
            _args = trans.parts.pos(_args, pos);
            _args = trans.pov.plane(_args);
            _args = trans.pov.theta(_args);
            _args = trans.pov.set(_args);
            _args = trans.persp(_args);
            _args = trans.disp(_args, disp);
            return _args;
        }
    };

    (function () {
        "use strict";
        var threeD = function (param) {
            this.transIn = {};
            this.transOut = {};
            this.transIn.vtx = (param.vtx);
            this.transIn.sz = (param.sz);
            this.transIn.rot = (param.rot);
            this.transIn.pos = (param.pos);
        };

        threeD.prototype.vupd = function () {
            this.transOut = trans.steps(
                this.transIn.vtx,
                this.transIn.sz,
                this.transIn.rot,
                this.transIn.pos,
                cam.disp
            );
        };

        var Build = function () {
            this.vel = 0.04;
            this.lim = 360;
            this.diff = 200;
            this.initPos = 100;
            this.toX = _x;
            this.toY = _y;
            this.go();
        };

        Build.prototype.go = function () {
            this.canvas = document.getElementById("canv");
            this.canvas.width = window.innerWidth;
            this.canvas.height = window.innerHeight;
            this.$ = canv.getContext("2d");
            this.$.globalCompositeOperation = 'source-over';
            this.varr = [];
            this.dist = [];
            this.calc = [];

            for (var i = 0, len = num; i < len; i++) {
                this.add();
            }

            this.rotObj = {
                x: 0,
                y: 0,
                z: 0
            };
            this.objSz = {
                x: w / 5,
                y: h / 5,
                z: w / 5
            };
        };

        Build.prototype.add = function () {
            this.varr.push(new threeD({
                vtx: {
                    x: rnd(),
                    y: rnd(),
                    z: rnd()
                },
                sz: {
                    x: 0,
                    y: 0,
                    z: 0
                },
                rot: {
                    x: 20,
                    y: -20,
                    z: 0
                },
                pos: {
                    x: this.diff * Math.sin(360 * Math.random() * Math.PI / 180),
                    y: this.diff * Math.sin(360 * Math.random() * Math.PI / 180),
                    z: this.diff * Math.sin(360 * Math.random() * Math.PI / 180)
                }
            }));
            this.calc.push({
                x: 360 * Math.random(),
                y: 360 * Math.random(),
                z: 360 * Math.random()
            });
        };

        Build.prototype.upd = function () {
            cam.obj.x += (this.toX - cam.obj.x) * 0.05;
            cam.obj.y += (this.toY - cam.obj.y) * 0.05;
        };

        Build.prototype.draw = function () {
            this.$.clearRect(0, 0, this.canvas.width, this.canvas.height);
            cam.upd();
            this.rotObj.x += 0.1;
            this.rotObj.y += 0.1;
            this.rotObj.z += 0.1;

            for (var i = 0; i < this.varr.length; i++) {
                for (var val in this.calc[i]) {
                    if (this.calc[i].hasOwnProperty(val)) {
                        this.calc[i][val] += this.vel;
                        if (this.calc[i][val] > this.lim) this.calc[i][val] = 0;
                    }
                }

                this.varr[i].transIn.pos = {
                    x: this.diff * Math.cos(this.calc[i].x * Math.PI / 180),
                    y: this.diff * Math.sin(this.calc[i].y * Math.PI / 180),
                    z: this.diff * Math.sin(this.calc[i].z * Math.PI / 180)
                };
                this.varr[i].transIn.rot = this.rotObj;
                this.varr[i].transIn.sz = this.objSz;
                this.varr[i].vupd();
                if (this.varr[i].transOut.p < 0) continue;
                var g = this.$.createRadialGradient(this.varr[i].transOut.x, this.varr[i].transOut.y, this.varr[i].transOut.p, this.varr[i].transOut.x, this.varr[i].transOut.y, this.varr[i].transOut.p * 2);
                this.$.globalCompositeOperation = 'lighter';
                g.addColorStop(0, 'hsla(255, 255%, 255%, 1)');
                g.addColorStop(.5, 'hsla(' + (i + 2) + ',85%, 40%,1)');
                g.addColorStop(1, 'hsla(' + (i) + ',85%, 40%,.5)');
                this.$.fillStyle = g;
                this.$.beginPath();
                this.$.arc(this.varr[i].transOut.x, this.varr[i].transOut.y, this.varr[i].transOut.p * 2, 0, Math.PI * 2, false);
                this.$.fill();
                this.$.closePath();
            }
        };
        Build.prototype.anim = function () {
            window.requestAnimationFrame = (function () {
                return window.requestAnimationFrame ||
                    function (callback, element) {
                        window.setTimeout(callback, 1000 / 60);
                    };
            })();
            var anim = function () {
                this.upd();
                this.draw();
                window.requestAnimationFrame(anim);
            }.bind(this);
            window.requestAnimationFrame(anim);
        };

        Build.prototype.run = function () {
            this.anim();

            window.addEventListener('mousemove', function (e) {
                this.toX = (e.clientX - this.canvas.width / 2) * -0.8;
                this.toY = (e.clientY - this.canvas.height / 2) * 0.8;
            }.bind(this));
            window.addEventListener('touchmove', function (e) {
                e.preventDefault();
                this.toX = (e.touches[0].clientX - this.canvas.width / 2) * -0.8;
                this.toY = (e.touches[0].clientY - this.canvas.height / 2) * 0.8;
            }.bind(this));
            window.addEventListener('mousedown', function (e) {
                for (var i = 0; i < 100; i++) {
                    this.add();
                }
            }.bind(this));
            window.addEventListener('touchstart', function (e) {
                e.preventDefault();
                for (var i = 0; i < 100; i++) {
                    this.add();
                }
            }.bind(this));
        };
        var app = new Build();
        app.run();
    })();
    window.addEventListener('resize', function () {
        canvas.width = w = window.innerWidth;
        canvas.height = h = window.innerHeight;
    }, false);

    <?php if ($error):?>
        layer.msg('<?= $error;?>', {icon: 5})
    <?php endif;?>
</script>
</body>
</html>
