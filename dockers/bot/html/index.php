<?php
session_start();
if(substr(md5($_GET[code]),0,5)!==$_SESSION[code]){
session_destroy();
die(json_encode(["success"=>false]));
}
$code=$_GET['id'];

$info=["id"=>$code];

//实例化redis
$redis = new Redis();
//连接
$redis->connect('127.0.0.1', 6379);
$redis->lpush("MSGQ",json_encode($info));

session_destroy();
echo json_encode(["success"=>"true"]);
