<?php

session_start();
$t=mt_rand(10000,100000);
$_SESSION['code']=substr(md5($t),0,5);
echo json_encode(['code'=>$_SESSION['code']]);
