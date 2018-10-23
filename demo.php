<?PHP
$list=array(
0=>array('uid'=>'1','shopname'=>null,'address'=>'','phone'=>null,'turename'=>''),
1=>array('uid'=>'2','shopname'=>'shop','address'=>'123','phone'=>'13','turename'=>'123'),
2=>array('uid'=>'3','shopname'=>'shop','address'=>'123','phone'=>'13','turename'=>'123'),
);

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
?>