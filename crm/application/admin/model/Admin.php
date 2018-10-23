<?php
namespace app\admin\model;
use think\Model;
use think\Db;
class Admin extends Model
{
    protected $pk = 'admin_id';
    public function login($data,$code){  //登陆传入$data
        //dataSession:
      //  aid: 1  账号主键
//imageUrl: "/uploads/20180929/2e1d2ed6f213d0af68751d804168e068.jpg"
//username: "admin"
        //验证码判断
//        if($code=='open'){
//            if(!$this->check($data['vercode'])){
//                return ['code' => 0, 'msg' => '验证码错误'];
//            }
//        }
        //$data['vercode'];//输入的验证码

        $user=Db::name('admin')->where('username',$data['username'])->find();
        if($user) {
            if ($user['is_open']==1 && $user['pwd'] == md5($data['password'])){
                if(!$this->check($data['vercode'])){
              return ['code' => 0, 'msg' => '验证码错误'];
                }else{
                    session('username', $user['username']);
                    session('aid', $user['admin_id']);
                    $avatar = $user['avatar'] == '' ? '/static/admin/images/0.jpg' : $user['avatar'];
                    session('avatar', $avatar);
                    return ['code' => 1, 'msg' => '登录成功!']; //信息正确
                }
            }else{
                return ['code' => 0, 'msg' => '用户名或者密码错误，重新输入!'.$data['vercode']]; //密码错误
            }
        }else{
            return ['code' => 0, 'msg' => '用户不存在!']; //用户不存在
        }
    }
    public function getInfo($admin_id){
        $info = Db::name('admin')->field('pwd',true)->find($admin_id);
        return $info;
    }
    public function check($code){
        return captcha_check($code);
    }

}

