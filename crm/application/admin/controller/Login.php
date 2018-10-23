<?php
namespace app\admin\controller;
use think\Controller;
use app\admin\model\Admin;
use think\captcha\Captcha;
use think\facade\Session;
class Login extends Controller
{
    private $cache_model,$system;
    public function initialize(){
        if (session('aid')) {


            $this->redirect('admin/index/index');
        }
        $this->cache_model=array('Module','AuthRule','Category','Posid','Field','System');
        $this->system = cache('System');
        $this->assign('system',$this->system);
        if(empty($this->system)){
            foreach($this->cache_model as $r){
                savecache($r);
            }
        }
    }
    public function index(){

        if(request()->isPost()) {  //登录提交post值
                   // echo '11';die;
            $data = input('post.');
            $admin = new Admin();
            $return = $admin->login($data,$this->system['code']);
            return ['code' => $return['code'], 'msg' => $return['msg'],'dataSession'=>$arrayName = array('imageUrl'=>Session::get('avatar'),'username'=>Session::get('username'),'aid'=>Session::get('aid'))];
        }else{ //进入非post判断  //进入控制器且返回验证码值
            //echo '22';die;
            //admin/Login/index 进入登录视图模板
           $data= Session::get('verify_c');
            return $this->fetch();
        }
    }
    public function verify(){
        $config =    [
            // 验证码字体大小
            'fontSize'    =>    25,
            // 验证码位数
            'length'      =>    4,
            // 关闭验证码杂点
            'useNoise'    =>    false,
            'bg'          =>    [255,255,255],
        ];
        $captcha = new Captcha($config);
        return $captcha->entry();
    }
}