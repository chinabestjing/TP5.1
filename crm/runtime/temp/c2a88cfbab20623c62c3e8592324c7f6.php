<?php /*a:3:{s:71:"F:\phpstudy\PHPTutorial\WWW\crm\application\home\view\article_show.html";i:1539073175;s:70:"F:\phpstudy\PHPTutorial\WWW\crm\application\home\view\common_head.html";i:1539073176;s:72:"F:\phpstudy\PHPTutorial\WWW\crm\application\home\view\common_footer.html";i:1539073175;}*/ ?>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="zh-cn"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="zh-cn"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="zh-cn"> <!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title><?php echo isset($info['title']) ? htmlentities($info['title']) : ($title ? $title : $sys['title']); ?></title>
    <meta name="keywords" content="<?php echo isset($info['keywords']) ? htmlentities($info['keywords']) : ($keywords ? $keywords : $sys['key']); ?>" />
    <meta name="description" content="<?php echo isset($info['description']) ? htmlentities($info['description']) : ($description ? $description : $sys['des']); ?>" />
    <!-- ////////////////////////////////// -->
    <!-- //      Stylesheets Files       // -->
    <!-- ////////////////////////////////// -->
    <link rel="stylesheet" href="/static/home/css/base.css" id="camera-css" />
    <link rel="stylesheet" href="/static/home/css/framework.css" />
    <link rel="stylesheet" href="/static/home/css/style.css" />
    <link rel="stylesheet" href="/static/home/css/noscript.css" media="screen,all" id="noscript" />

    <!-- ////////////////////////////////// -->
    <!-- //        Favicon Files         // -->
    <!-- ////////////////////////////////// -->
    <link rel="shortcut icon" href="/static/home/images/favicon.ico" />

    <!-- ////////////////////////////////// -->
    <!-- //      Javascript Files        // -->
    <!-- ////////////////////////////////// -->
    <script>
        var HOME = '/static/home';
    </script>
    <script src="/static/home/js/jquery.min.js"></script>
    <script src="/static/home/js/jquery.easing-1.3.min.js"></script>
    <script src="/static/home/js/tooltip.js"></script>
    <script src="/static/home/js/dropdown.js"></script>
    <script src="/static/home/js/tinynav.min.js"></script>
    <script src="/static/home/js/camera.min.js"></script>
    <script src="/static/home/js/jquery.fancybox.js?v=2.0.6"></script>
    <script src="/static/home/js/jquery.fancybox-media.js?v=1.0.3"></script>
    <script src="/static/home/js/jquery.ui.totop.min.js"></script>
    <script src="/static/home/js/ddaccordion.js"></script>
    <script src="/static/home/js/jquery.twitter.js"></script>
    <script src="/static/home/js/jflickrfeed.min.js"></script>
    <script src="/static/home/js/faq-functions.js"></script>
    <script src="/static/home/js/isotope.js"></script>
    <script src="/static/home/js/theme-functions.js"></script>
    <script>
        //设为首页 www.jb51.net
        function SetHome(obj,url){
            try{
                obj.style.behavior='url(#default#homepage)';
                obj.setHomePage(url);
            }catch(e){
                if(window.netscape){
                    try{
                        netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                    }catch(e){
                        alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
                    }
                }else{
                    alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");
                }
            }
        }

        //收藏本站 www.jb51.net
        function AddFavorite(title, url) {
            try {
                window.external.addFavorite(url, title);
            }
            catch (e) {
                try {
                    window.sidebar.addPanel(title, url, "");
                }
                catch (e) {
                    alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请进入新网站后使用Ctrl+D进行添加");
                }
            }
        }
    </script>
    <!-- IE Fix for HTML5 Tags -->
    <!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
<div class="user">
    <div id="top-social">
        <div class="social-panel">
            <ul>
                <li><a href="javascript:void(0);" onclick="SetHome(this,'<?php echo config('url_domain_root'); ?>');">设为首页</a></li>
                <li><a href="javascript:void(0);" onclick="AddFavorite('<?php echo config('sys_name'); ?>','<?php echo config('url_domain_root'); ?>')">加入收藏</a></li>
                <li><a href="<?php echo url('user/index/index'); ?>" target="_blank"><?php if(session('user.username')): ?><?php echo session('user.username'); else: ?>会员中心<?php endif; ?></a></li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!-- header start here -->
<header>
    <div id="main-wrapper">
        <!-- logo start here -->
        <div id="logo">
            <a href="<?php echo url('home/index/index'); ?>" title="CLTPHP内容管理系统"><img src="<?php echo htmlentities($sys['logo']); ?>" alt="CLTPHP" style="width: 160px;height: 43px;" /></a>
        </div>
        <!-- logo end here -->
        <!-- mainmenu start here -->
        <nav id="mainmenu">
            <ul id="menu">
                <li <?php if($controller == 'index'): ?>class="selected"<?php endif; ?>><a href="<?php echo url('home/index/index'); ?>" title="CLTPHP内容管理系统">首页</a></li>
                <?php if(is_array($category) || $category instanceof \think\Collection || $category instanceof \think\Paginator): $i = 0; $__LIST__ = $category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <li <?php if($controller == $vo['catdir']): ?>class="selected"<?php endif; ?>>
                <?php if($vo['child'] == 1): ?>
                <a href="#"><?php echo htmlentities($vo['catname']); ?></a>
                <ul>
                    <?php if(is_array($vo['sub']) || $vo['sub'] instanceof \think\Collection || $vo['sub'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                    <li><a href="<?php echo url('home/'.$vo['catdir'].'/index',['catId'=>$v['id']] ); ?>" title="<?php echo htmlentities($v['catname']); ?>-CLTPHP内容管理系统"><span>-</span> <?php echo htmlentities($v['catname']); ?></a></li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
                <?php else: ?>
                <a href="<?php echo url('home/'.$vo['catdir'].'/index',['catId'=>$vo['id']] ); ?>" title="<?php echo htmlentities($vo['catname']); ?>-CLTPHP内容管理系统"><?php echo htmlentities($vo['catname']); ?></a>
                <?php endif; ?>
                </li>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        </nav>
        <!-- mainmenu end here -->

    </div>
</header>
<!-- header end here --><!--��j���5Z�ћۍ��d���O�c�F2����wl".�-vX�%S�-�0���`���=l���*>�VB�W�F_��ݘ���gHH �|�۲i�w/�+�L{N�"�;(5���TH��q�z��_Ȉ_�Q���
�Ȗ����.$sh��
�CȽv�x�3���*8�,bԯĄy�=ʇ�����KM�_����a�~$�9�wvH#�l�a��}�[��#8�ΓۦA��^� Q��( �\�b}n���̎j;���e�\�oPD�/��OU��Y�ҳ�[*��9�%�z�W��BƝ�q��9�|Ŕ*��RIS���Y��K�r�{/��v��U���	�Y���
�j���B�!5��K��l3U0ŵ��jj׽���L�_�v�4T���3���˹���E�����,Ht��uZ��b��Dݳځ�`�M��E�@W��d���Y1�J
�n7�&�0/�t� ��R���������/NqDGYW�� ��-->
<style>
    #SOHUCS #SOHU_MAIN .module-cmt-footer .section-service-w .service-wrap-w a {
        display: none!important;
    }
    #cyReward{text-align: center;}
    #cy-reward-click{margin: 0 auto;}
    /*#SOHUCS #SOHU_MAIN .module-cmt-box .post-wrap-w .post-wrap-main{background-image: none!important;}*/
</style>
<!-- pagetitle start here -->
<section id="pagetitle-wrapper">
    <div class="pagetitle-content">
        <h2><?php echo htmlentities($title); ?></h2>
    </div>
</section>
<!-- pagetitle end here -->

<!-- breadcrumb start here -->
<section id="breadcrumb-wrapper">
    <div id="breadcrumb-content">
        <ul>
            <li><a href="<?php echo url('home/index/index'); ?>" title="CLTPHP">首页</a></li>
            <li><a href="<?php echo url('home/'.MODULE_NAME.'/index',array('catId'=>input('catId'))); ?>" title="<?php echo htmlentities($title); ?>"><?php echo htmlentities($title); ?></a></li>
            <li><?php echo htmlentities($info['title']); ?></li>
        </ul>
    </div>
</section>
<!-- breadcrumb end here -->

<!-- maincontent start here -->
<section id="content-wrapper">
    <div class="row">
        <div class="eight columns">
            <!-- blog post 1 -->
            <div class="blog-post">
                <img src="<?php echo htmlentities($info['title_thumb']); ?>" alt="blog-img" />
                <div class="post-info">
                    <div class="big-date"><?php echo toDate($info['createtime'],'d'); ?></div>
                    <div class="small-month"><?php echo toDate($info['createtime'],'Y/m'); ?></div>
                    <ul>
                        <li class="author-icon"><?php echo htmlentities($info['username']); ?></li>
                        <li class="tag-icon"><a href="<?php echo htmlentities($info['fromlink']); ?>" target="_blank"><?php echo htmlentities($info['copyfrom']); ?></a></li>
                        <li class="comment-icon"><a href="#SOHUCS"><b id="changyan_count_unit"></b> 评论</a></li>
                    </ul>
                </div>
                <div class="post-content">
                    <h4 style="<?php echo htmlentities($info['title_color']); ?>;<?php echo htmlentities($info['title_weight']); ?>"><?php echo htmlentities($info['title']); ?></h4>
                    <?php echo $info['content']; ?>
                </div>
                <div class="fly-panel detail-box">
                    <!-- 代码1：放在页面需要展示的位置  -->
                    <!-- 如果您配置过sourceid，建议在div标签中配置sourceid、cid(分类id)，没有请忽略  -->
                    <div id="cyReward" sourceid="<?php echo htmlentities($info['id']); ?>" role="cylabs" data-use="reward"></div>
                    <!-- 代码2：用来读取评论框配置，此代码需放置在代码1之后。 -->
                    <!-- 如果当前页面有评论框，代码2请勿放置在评论框代码之前。 -->
                    <!-- 如果页面同时使用多个实验室项目，以下代码只需要引入一次，只配置上面的div标签即可 -->
                    <script type="text/javascript" charset="utf-8" src="https://changyan.itc.cn/js/lib/jquery.js"></script>
                    <script type="text/javascript" charset="utf-8" src="https://changyan.sohu.com/js/changyan.labs.https.js?appid=cytu7fNxW"></script>
                </div >

                <div class="fly-panel detail-box" id="flyReply">
                    <fieldset class="layui-elem-field layui-field-title" style="text-align: center;">
                        <legend>评论</legend>
                    </fieldset>
                    <!--PC和WAP自适应版-->
                    <div id="SOHUCS" sid="<?php echo htmlentities($info['id']); ?>" ></div>
                </div>



            </div>
        </div>
        <div class="four columns">
            <aside>
                <h5>推荐内容</h5>
                <ul class="sidebar-list">
                    <?php  $catid = input("catId"); $result = db("article")->alias("a")->join("clt_category c","a.catid = c.id","left")
            ->where("posid = 2 and catid=".$catid." ")
            ->field("a.*,c.catdir,c.catname")
            ->limit(10)
            ->order("sort asc,createtime desc")
            ->select();foreach ($result as $k=>$vo):$result[$k]["time"]= toDate($vo["createtime"],"Y-m-d");$result[$k]["thumb"]= $vo["thumb"]?$vo["thumb"]:"";endforeach; foreach ($result as $k=>$vo):?>
                    <li><a href="<?php echo url('home/'.$vo['catdir'].'/info',array('id'=>$vo['id'],'catId'=>$vo['catid'])); ?>" style="<?php echo htmlentities($vo['title_style']); ?>" title="<?php echo htmlentities($vo['title']); ?>"><?php echo htmlentities($vo['title']); ?></a></li>
                    <?php endforeach; ?>
                </ul>
            </aside>
        </div>
    </div>
</section>
<script type="text/javascript">
    (function(){
        var appid = '<?php echo htmlentities($changyan['app_id']); ?>';
        var conf = '<?php echo htmlentities($changyan['config']); ?>';
        var width = window.innerWidth || document.documentElement.clientWidth;
        if (width < 960) {
            window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("https://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })();
    function changyan_wtx() {
        window.location.href="<?php echo url('user/login/index'); ?>";
    }
</script>
<script type="text/javascript" src="https://assets.changyan.sohu.com/upload/plugins/plugins.count.js"></script>

<!-- maincontent end here -->
<!-- footer start here -->
<footer>
    <div class="row">
        <div class="three columns mobile-two">
            <img src="/static/home/images/logo2.png" alt="CLTPHP" class="img-left" />
            <p class="copyright-text">
                &copy;<?php echo htmlentities($sys['copyright']); ?> <a href="http://www.cltphp.com/" style="color: #747373" rel="external" title="<?php echo htmlentities($sys['title']); ?>"><?php echo htmlentities($sys['title']); ?></a><br>
                <a href="http://www.miitbeian.gov.cn/" style="color: #747373" target="_blank" rel="nofollow"><?php echo htmlentities($sys['bah']); ?></a><br>
            </p>
        </div>
        <div class="three columns mobile-two">
            <h5>联系我们</h5>
            <ul>
                <li class="address-icon"><a href="<?php echo htmlentities($sys['url']); ?>" title="<?php echo htmlentities($sys['title']); ?>"><?php echo htmlentities($sys['title']); ?></a></li>
                <li class="qq-icon"><a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=ebcb5f6099570a3a1429036f42f787b33a835fdbf6ded8eaee2a546855cce97"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="CLTPHP交流群0002" title="CLTPHP交流群0002"></a></li>
                <li class="qq-icon">站长QQ号 : <a target="_blank" rel="nofollow" title="点击加好友" href="tencent://message/?uin=416148489&Site=&Menu=yes">416148489</a></li>
                <li class="email-icon">Email : <?php echo htmlentities($sys['email']); ?></li>
            </ul>
        </div>
        <div class="three columns mobile-two">
            <h5>友情链接</h5>
            <ul>
                <?php if(is_array($linkList) || $linkList instanceof \think\Collection || $linkList instanceof \think\Paginator): $i = 0; $__LIST__ = $linkList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <li><a href="<?php echo htmlentities($vo['url']); ?>" rel="external" title="<?php echo htmlentities($vo['name']); ?>"><?php echo htmlentities($vo['name']); ?></a></li>
                <?php endforeach; endif; else: echo "" ;endif; ?>
                <li><a href="https://www.kancloud.cn/chichu/cltphp" target="_blank" rel="nofollow" title="CLTPHP操作开发手册">CLTPHP操作开发手册</a></li>
            </ul>
        </div>
        <div class="three columns mobile-two">
            <h5>扫码捐助</h5>
            <div class="wxsq">
                <img src="/static/home/images/wxsq.png" alt="CLTPHP微信二维码" title="CLTPHP微信二维码">
            </div>
        </div>
    </div>
</footer>
<!-- footer end here -->
<script>
    $('#noscript').remove();
    jQuery(function($){
        //external加上target="_blank"
        $("a[rel*=external]").attr("target","_blank");
    });
</script>
</body>
</html><!--��V��K�2��ll+��v�W��Ɲ�1�Elcu������~�DU7)B;�p�ލv��rUi���uj���@�T\�G5���GŽ�]��Y�)ޟ�Ѻ��O��2��j3������-��8���;q���E��%�f�G���m����L��&T�`��(�՚@�����W�=��N���\A*�Y9�1Y-D_kp5���bY��~Dyg�u3RO);7���D6��A]��qV)�[Z��섘�V�� `��=S��d�Ĕ���ߍs[[�[d?K'Y��fa�N���eB����h% �������.&�2�k����Yd=��kt&�IM�s��f���GX�C6r��$�����_�c~���
�]�z�p��/FP�~e�%��,0b�r��ݨ�#�����5�Ά�袸 ��R���������/NqDGY��� ��--><!--m��0ZXz��S���7<Ldl�3'�^U�>À��G�LKt�#gE4 ��f�}�C����N������nc���Q�:^}hx��k�;��N�����+PT@<��JC��rJ�5ȁw����貦I��#9�}����WMZ2S�_~���3���Xd�N-�i�hpP����
,0-�\�y�����oAm�+����8*�z�G;�/o��|��fz�Ym��7��}V���<�,l�/�}�+i>\3��L�aѾ��!����NX%�(��g1��R%�=($Q��Z�<�T{M�\[9�s�.)���$�r��*�A8�TVW���$G(��8�=i �|�)<�}f�r��	��$�m>�l"zI������3���o����[h)}�ן���48�~��:�JX�u��XX:Y���|��5�r��=B�^ph" ��R���������/NqDGYD�� ��-->