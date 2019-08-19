const {ipcRenderer} =require('electron');
const request = require('request')

global.request=request;
//global.request=request;
Object.freeze(global.location);
global.WebSocket=WebSocket;

global.play=function() {
    ipcRenderer.sendTo(window.fid, 'play_music', window.pid);
}

global.refreshCode=function(){

        request.get('http://127.0.0.1:5000/code.php',{},(error,response,body)=>{
            if(!error && response.statusCode==200){
                global.session=response.headers['set-cookie'];
                res=JSON.parse(body)
                code.innerText=`substr(md5($code),0,5)==${res.code}`
            }
        });

}
