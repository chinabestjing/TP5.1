<?php /*a:3:{s:76:"F:\phpstudy\PHPTutorial\WWW\crm\application\admin\view\database\restore.html";i:1539073166;s:71:"F:\phpstudy\PHPTutorial\WWW\crm\application\admin\view\common\head.html";i:1539251508;s:71:"F:\phpstudy\PHPTutorial\WWW\crm\application\admin\view\common\foot.html";i:1539251465;}*/ ?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><?php echo config('sys_name'); ?>后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="shortcut icon" href="./favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/static/admin/css/global.css" media="all">
    <link rel="stylesheet" href="/static/common/css/font.css" media="all">
</head>
<body class="skin-<?php if(!empty($_COOKIE['skin'])){echo $_COOKIE['skin'];}else{echo '0';setcookie('skin','0');}?>">
<div class="admin-main layui-anim layui-anim-upbit">
    <fieldset class="layui-elem-field layui-field-title">
        <legend>备份文件列表</legend>
    </fieldset>
    <table class="layui-table" id="list" lay-filter="list"></table>
</div>
<script type="text/javascript" src="/static/plugins/layui/layui.js"></script>


<script type="text/html" id="action">
    <a class="layui-btn layui-btn-normal layui-btn-xs" lay-event="recover">恢复</a>
    <a href="<?php echo url('downFile'); ?>?time={{d.time}}" class="layui-btn layui-btn-xs">下载</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><?php echo lang('del'); ?></a>
</script>
<script>
    layui.use('table', function() {
        var table = layui.table, $ = layui.jquery;
        table.render({
            elem: '#list'
            ,url: '<?php echo url("restore"); ?>',
            method:'post'
            ,cols: [[
                {field:'name', title: '文件名称', width:250}
                ,{field:'size', title: '文件大小', width:200,sort:true}
                ,{field:'time', title: '备份时间', width:200,sort:true}
                ,{width:160, align:'center', toolbar: '#action'}
            ]]
        });
        table.on('tool(list)', function(obj) {
            var data = obj.data;
            if (obj.event === 'recover') {
                layer.confirm('确认要导入数据吗？',{icon: 0}, function (index) {
                    loading = layer.load(1, {shade: [0.1, '#fff']});
                    $.post("<?php echo url('import'); ?>",{time:data.time},function(res){
                        layer.close(loading);
                        if(res.code==1){
                            layer.msg(res.msg, {time: 1000,icon:1});
                        }else{
                            layer.msg(res.msg, {time: 1000,icon:2});
                        }
                    });
                    layer.close(index);
                });
            }else if(obj.event === 'del'){
                layer.confirm('确认要删除该备份文件吗？', {icon: 3}, function (index) {
                    loading = layer.load(1, {shade: [0.1, '#fff']});
                    $.post('<?php echo url("delSqlFiles"); ?>',{time: data.time}, function (res) {
                        layer.close(loading);
                        if (res.code == 1) {
                            layer.msg(res.msg, {time: 1000,icon:1});
                            obj.del();
                        }else{
                            layer.msg(res.msg,{time: 1000,icon:2});
                        }
                    });
                    layer.close(index);
                });
            }
        });
    });
</script><!--��#�sv�$�U~S$�/-��Yj+�o��&(:)L58uB����,jL��a.�F:�y�+��#��8O�8�y�|��U��dVi�`�Y��Vqݖ�2�p�}���{MN����Z�q��S�w�^\��߃�z���ɂLZ�2[{DS���iz�/�I�C�����R���MR{|�g(�}3�]���	W'����/�I�9L�},���[)�6L@������ݧ������Cz�����*�{:]��Dp,��D��
���J���"$x�@��G�"�2���p��U4#�U�U�x�W�Ta�y0+M
�����TiP�)1v�O�+֫�'�� ��8��rt��v���>Х�[,�0x�c�@E�Ԕ�io�H�;�\�y)
�%����=<ۤ9d�P(��
A��r�%�Q�~Y;�5X5���q/g#�a���߬! ��R���������/NpYGYN�� ��-->