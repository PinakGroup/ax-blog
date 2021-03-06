<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>管理员界面</title>
    <link rel="stylesheet" type="text/css" href="/frontend/css/icofont.css">
    <link rel="stylesheet" href="/frontend/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">阿薛个人博客后台</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    贤心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/logout">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a href="javascript:;">管理选项</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/classify.html">分类管理</a></dd>
                        <dd><a href="/admin/article.html">博客管理</a></dd>
                        <dd class="layui-this"><a href="javascript:;">用户管理</a></dd>
                        <dd><a href="/admin/leave.html">留言管理</a></dd>
                        <dd><a href="/admin/img.html">首页图片管理</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="/admin/admin.html">管理员管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="/admin/authorization.html">角色权限管理</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
                <legend>用户管理</legend>
            </fieldset>
            <table class="layui-hide" id="user" lay-filter="user-table"></table>
        </div>
    </div>

    <div class="layui-footer">
        © 136290357qq.com --- 阿薛制作
    </div>
</div>

<div class="layui-form" id="user-dialog" action="" lay-filter="user"
     style="z-index: 111111; display: none; padding: 10px 0px;">

    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-inline">
            <input type="text" name="username" lay-verify="required" lay-reqtext="用户名是必填项，岂能为空？" placeholder="请输入"
                   autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">手机号</label>
            <div class="layui-input-inline">
                <input type="tel" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">邮箱</label>
            <div class="layui-input-inline">
                <input type="text" name="email" lay-verify="required|email" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">注册时间</label>
            <div class="layui-input-inline">
                <input type="text" name="date" id="date" lay-verify="required|date" placeholder="yyyy-MM-dd"
                       autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="sex" value="男" title="男" checked="">
            <input type="radio" name="sex" value="女" title="女">
            <input type="radio" name="sex" value="禁" title="人妖" disabled="">
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="/frontend/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="/frontend/js/axquery.js"></script>
<script type="text/javascript" src="/frontend/js/template-web.js"></script>
<script type="text/javascript" src="/frontend/layui/layui.all.js"></script>

<script type="text/html" id="topDemo">
    <button type="button" class="layui-btn layui-btn-primary layui-btn-sm" lay-event="delete">
        <i class="layui-icon">&#xe640;</i>
    </button>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script>
    layui.use(['table', 'form', 'layer'], function () {
        var table = layui.table,
            form = layui.form,
            layer = layui.layer;

        form.render('radio');

        table.render({
            elem: '#user',
            url: '/admin/user/select',
            toolbar: '#topDemo',
            title: '用户数据表',
            cols: [[
                {type: 'checkbox', fixed: 'left'}
                , {field: 'id', title: 'ID', width: 110, sort: true, fixed: 'left'}
                , {field: 'username', title: '用户名', width: 200}
                , {field: 'emali', title: '邮箱', width: 170, sort: true}
                , {field: 'cellphone', title: '手机号', width: 150, sort: true}
                , {field: 'articleCount', title: '博客发布量', width: 120}
                , {field: 'fansCount', title: '粉丝量', width: 120}
                , {field: 'sex', title: '性别', width: 80}
                , {field: 'registerTime', title: '注册时间', width: 150}
                , {fixed: 'right', width: 165, align: 'center', toolbar: '#barDemo'}
            ]],
            page: true,
            limit: 20,
            limits: [10, 20, 30, 40, 50]
        });

        //监听头工具栏事件
        table.on('toolbar(user-table)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id)
                , data = checkStatus.data; //获取选中的数据
            switch (obj.event) {
                case 'add':
                    layer.msg('添加');
                    break;
                case 'edit':
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else if (data.length > 1) {
                        layer.msg('只能同时编辑一个');
                    } else {
                        layer.alert('编辑 [id]：' + checkStatus.data[0].id);
                    }
                    break;
                case 'delete':
                    if (data.length === 0) {
                        layer.msg('请选择一行');
                    } else {
                        layer.msg('删除');
                    }
                    break;
            }
            ;
        });

        //监听行工具事件
        table.on('tool(user-table)', function (obj) {
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var data = obj.data;
            if (layEvent === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    Ax.rest('/admin/user/delete', data.id, function (data) {
                        layer.msg('删除成功');
                    })
                });
            } else if (layEvent === 'edit') {
                form.val('user', data);
                layer.open({
                    type: 1,
                    area: '385px',
                    title: '用户编辑',
                    content: $('#user-dialog') //这里content是一个DOM，注意：最好该元素要存放在body最外层，否则可能被其它的相对元素所影响
                });
            } else if (layEvent === 'detail') {
                layer.msg(data.id);
            }
        });
    });

</script>
