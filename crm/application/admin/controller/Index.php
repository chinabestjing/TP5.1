<?php
namespace app\admin\controller;
use think\Db;
use think\db\Query;
use think\facade\Env;
use think\route\dispatch\View;

class Index extends Common
{
    public $menu;
    public function initialize(){
        parent::initialize();
        $authRule = cache('authRule');
        if(!$authRule){
            $authRule = db('auth_rule')->where('menustatus=1')->order('sort')->select();
            cache('authRule', $authRule, 3600);
        }
        //声明数组
        $menus = array();
        foreach ($authRule as $key=>$val){
            $authRule[$key]['href'] = url($val['href']);
            if($val['pid']==0){
                if(session('aid')!=1){
                    if(in_array($val['id'],$this->adminRules)){
                        $menus[] = $val;
                    }
                }else{
                    $menus[] = $val;
                }
            }
        }
        foreach ($menus as $k=>$v){
            foreach ($authRule as $kk=>$vv){
                if($v['id']==$vv['pid']){
                    if(session('aid')!=1) {
                        if (in_array($vv['id'], $this->adminRules)) {
                            $menus[$k]['children'][] = $vv;
                        }
                    }else{
                        $menus[$k]['children'][] = $vv;
                    }
                }
            }
        }
        $this->menu=$menus;
    }
    public function index(){
        // 获取缓存数据
        //ROOT D:\phpStudy\WWW\crm\public
    //var_dump(__ROOT__);die;
        session('__ROOT__',__ROOT__);
      session('url',str_replace('/','\\',session('__ROOT__').session('avatar')));
        $this->assign('menus',json_encode($this->menu,true));
        return $this->fetch();
    }
    public function main(){
        $version = Db::query('SELECT VERSION() AS ver');
        $config  = [
            'url'             => $_SERVER['HTTP_HOST'],
            'document_root'   => $_SERVER['DOCUMENT_ROOT'],
            'server_os'       => PHP_OS,
            'server_port'     => $_SERVER['SERVER_PORT'],
            'server_ip'       => $_SERVER['SERVER_ADDR'],
            'server_soft'     => $_SERVER['SERVER_SOFTWARE'],
            'php_version'     => PHP_VERSION,
            'mysql_version'   => $version[0]['ver'],
            'max_upload_size' => ini_get('upload_max_filesize')
        ];
        $this->assign('config', $config);
        return $this->fetch();
    }
    public function navbar(){
        return $this->fetch();
    }
    public function nav(){
        return $this->fetch();
    }
    public function clear(){
        $R = Env::get('runtime_path');
        if ($this->_deleteDir($R)) {
            $result['info'] = '清除缓存成功!';
            $result['status'] = 1;
        } else {
            $result['info'] = '清除缓存失败!';
            $result['status'] = 0;
        }
        $result['url'] = url('admin/index/index');
        return $result;
    }
    private function _deleteDir($R)
    {
        $handle = opendir($R);
        while (($item = readdir($handle)) !== false) {
            if ($item != '.' and $item != '..') {
                if (is_dir($R . '/' . $item)) {
                    $this->_deleteDir($R . '/' . $item);
                } else {
                    if (!unlink($R . '/' . $item))
                        die('error!');
                }
            }
        }
        closedir($handle);
        return rmdir($R);
    }

    //退出登陆账号
    public function logout(){
        session(null);
        $this->redirect('login/index');
    }
    //查看个人信息
    public function info(){
        $authRule = cache('authRule');
        if(!$authRule){
            $authRule = db('auth_rule')->where('menustatus=1')->order('sort')->select();
            cache('authRule', $authRule, 3600);
        }
        //声明数组
        $menus = array();
        foreach ($authRule as $key=>$val){
            $authRule[$key]['href'] = url($val['href']);
            if($val['pid']==0){
                if(session('aid')!=1){
                    if(in_array($val['id'],$this->adminRules)){
                        $menus[] = $val;
                    }
                }else{
                    $menus[] = $val;
                }
            }
        }
        foreach ($menus as $k=>$v){
            foreach ($authRule as $kk=>$vv){
                if($v['id']==$vv['pid']){
                    if(session('aid')!=1) {
                        if (in_array($vv['id'], $this->adminRules)) {
                            $menus[$k]['children'][] = $vv;
                        }
                    }else{
                        $menus[$k]['children'][] = $vv;
                    }
                }
            }
        }

        $this->assign('menus',json_encode($this->menu,true));
        return $this->fetch();
    }
    //修改密码
    public function updatePassword(){

    }
    //返回数据
    public function dataGet(){
        echo '111';
    }
    public function testData(){
        $list = db('rental_myuser')->where('uid>0')->order('uid')->select();
        for($i=0;$i<count($list);$i++){
            $shopname=0;
            $address=0;
            $phone=0;
            $turename=0;
            if(empty($list[$i]['shopname'])||$list[$i]['shopname']===null){
                $shopname=1;
                //unset($list[$i]);
            }else{
                $shopname=0;
            }

            if(empty($list[$i]['address'])||$list[$i]['address']===null){
                $address=1;
            }else{
                $address=0;
            }


            if(empty($list[$i]['phone'])||$list[$i]['phone']===null){
                $phone=1;
            }else{
                $phone=0;
            }

            if(empty($list[$i]['turename'])||$list[$i]['turename']===null){
                $turename=1;
            }else{
                $turename=0;
            }

            if($shopname==1&&$address==1&&$phone==1&&$turename==1){
                unset($list[$i]);
            }
            else{
                echo $i."不为空"."<br/>";
                $list[$i]['phone'].='*****'.$i;  //添加标识方便调试
            }
        }


        var_dump($list);die;
    }
}
