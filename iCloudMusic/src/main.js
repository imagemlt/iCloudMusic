
const { ipcRenderer, remote} =require('electron');
const request =require('request');
 const Lyric =require('lyric-parser');



const { Menu} = remote;
ipcRenderer.on('play_music',(event, arg) => {
  console.log(arg)
  view.style.visibility="hidden"
  init(arg);
});

let currentFile = null; //当前文档保存的路径
let isSaved = true;     //当前文档是否已保存
let search=document.getElementById("search");
let input=document.getElementById("input");
let audio=document.getElementById('audio');
let avator=document.getElementById('avator');
let musicname=document.getElementById('musicName');
let play=document.getElementById('play');
let pause=document.getElementById('pause');
let prev=document.getElementById('prev');
let next=document.getElementById('next');
let refresh=document.getElementById("refresh");
let tracks=[];
let num=0;
let setted=false;
let rotateInterval;
let lyric=document.getElementById('lrc');
let history;

document.title = "Image-Music"; //设置文档标题，影响窗口标题栏名称

let filter=(input)=>{
  input=input.replace(/=|\'|\"|\(|\)/g,'');
  return input;
}

//给文本框增加右键菜单
const contextMenuTemplate=[
  { role: 'undo' },       //Undo菜单项
  { role: 'redo' },       //Redo菜单项
  { type: 'separator' },  //分隔线
  { role: 'cut' },        //Cut菜单项
  { role: 'copy' },       //Copy菜单项
  { role: 'paste' },      //Paste菜单项
  { role: 'delete' },     //Delete菜单项
  { type: 'separator' },  //分隔线
  { role: 'selectall' }   //Select All菜单项
];
const contextMenu=Menu.buildFromTemplate(contextMenuTemplate);

//监听与主进程的通信

String.prototype.trim=function(){
  return this.replace(/(^\s*)|(\s*$)/g, "");
}
//只去除字符串左边空白
String.prototype.ltrim=function(){
  return this.replace(/(^\s*)/g,"");
}
//只去除字符串右边空白
String.prototype.rtrim=function(){
  return this.replace(/(\s*$)/g,"");

}

let lyricManager;
lyricManager = {
  lyric: '',
  lyricArray:new Array(),
  currentParser: {},
  handler: function({ lineNum, txt }){
    lyric.innerHTML = txt;
  },
  load: function(lrc) {
    console.log(lrc);
    console.log(this);
    this.lyric = lrc;
    this.lyricArray=lrc.split("\n");
    this.currentParser = new Lyric(lrc, this.handler);
  },
  play: function(){
    this.currentParser.play();
  },
  stop: function(){
    this.currentParser.stop();
  },
  togglePlay: function(){
    this.currentParser.togglePlay();
  }
};

function getMusic(pos){

  avator.src = tracks[pos]['al']['picUrl'];
  musicname.innerText=tracks[pos]['name'];
  let id=tracks[pos]['id'];
  request.get('http://cloudmusic.imagemlt.xyz:3000/song/url?id='+id,
    (err,res,b)=>{
      if(!err && res.statusCode==200) {
        let url = JSON.parse(b);
        console.log(url);
        console.log(url['data'][0]['url']);
        if(url["data"][0]["url"]==null){
          next.onclick(false);
          return;
        }
        audio.src = url['data'][0]['url'];

        request.get("http://cloudmusic.imagemlt.xyz:3000/lyric?id="+id,(er,r,body)=>{

          if(!er && r.statusCode==200){
            let lrc=JSON.parse(body);
            if(typeof lrc["lrc"]["lyric"] == 'string'){
              //console.log(lrc["lrc"]["lyric"]);
              try {
                lyricManager.stop();
              }
              catch(e){
                console.log(e);
              }
              try {
                lyricManager.load(lrc["lrc"]["lyric"]);
                lyric.innerHTML="";
                lyricManager.play();
                audio.play();
              }
              catch(e){
                console.log(e);
                audio.play();
                lyric.innerHTML="暂无歌词";
              }
            }
          }
          else{
            audio.play();
            lyric.innerHTML="暂无歌词";
          }
        })
        if (!setted) {
          setCss3(avator, { transform: "rotate(10deg)", "transform-origin": "50% 50%" });
          let angel = 0;
          rotateInterval = setInterval(function () {
            angel += 1 ;
            setCss3(avator, {
              transform: "rotate(" + angel + "deg)",
              "transform-origin": "50% 50%"
            })
          }, 100)
          setted=true;
        }
      }
    });
}

function setCss3(obj,objAttr){
  //循环属性对象
  for(let i in objAttr){
    let newi=i;
    //判断是否存在transform-origin这样格式的属性
    if(newi.indexOf("-")>0){
      var num=newi.indexOf("-");
      newi=newi.replace(newi.substr(num,2),newi.substr(num+1,1).toUpperCase());
    }
    //考虑到css3的兼容性问题,所以这些属性都必须加前缀才行
    obj.style[newi]=objAttr[i];
    newi=newi.replace(newi.charAt(0),newi.charAt(0).toUpperCase());
    obj.style[newi]=objAttr[i];
    obj.style["webkit"+newi]=objAttr[i];
    obj.style["moz"+newi]=objAttr[i];
    obj.style["o"+newi]=objAttr[i];
    obj.style["ms"+newi]=objAttr[i];
  }
}

let init=function(id){
  console.log('window loaded');
  window.playId=id;
  document.getElementById("chooseBoard").style.visibility="hidden";
  document.getElementById("music").style.visibility="visible";
  request.get('http://cloudmusic.imagemlt.xyz:3000/playlist/detail?id='+id, (error, response, body) => {
      if (!error && response.statusCode == 200) {
        let res_json = JSON.parse(body);
        console.log(body);
        tracks=res_json['playlist']['tracks'];
        console.log(tracks.length,tracks[0]);
        document.body.style.backgroundImage= res_json['playlist']['avataUrl'];
        history=new Array();
        num=0;
        getMusic(0);
      } else {
        init(id);
      }
    }
  )

}


play.onclick=function(){
  console.log('play');
  if(audio.paused) {
    audio.play();
    lyricManager.togglePlay();
  }
}

pause.onclick=function(){
  if(audio.played){
    audio.pause();
    lyricManager.togglePlay();
    }
  clearInterval(rotateInterval);
  setted=false;
}

audio.addEventListener('ended',function(){
  next.onclick();
},false);

prev.onclick = function(){
  if(history.length>0)num=history.pop();
  else
    num = Math.floor(Math.random()* tracks.length);
  getMusic(num);
}

// 下一首
next.onclick = function(add=true){
  if(add)
    history.push(num);
  num = Math.floor(Math.random()* tracks.length);
  getMusic(num);
}

refresh.onclick=function(){
  try{
    lyricManager.stop();
  }
  catch(e){
    console.log(e);
  }
  init(window.playId);
}

search.onclick=function(){
  console.log("searching");
  request.get(
    "http://cloudmusic.imagemlt.xyz:3000/playlist/detail?id="+encodeURIComponent(document.getElementById("input").value)+"&time="+Date.now(),

      (error,responce,body)=>{
      if (!error && responce.statusCode==200){
        let res=JSON.parse(body);
        console.log(res);
        if(res.code==200){
          let currentId=remote.getCurrentWebContents().id;

            searchRes.style.minHeight="400px";
            let js_to_run = `
            window.music_info={header:'${res.playlist.coverImgUrl}',title:'${res.playlist.name.substr(0,10).replace(/\n/g,'')}',desc:'${res.playlist.description.substr(0,50).replace(/\n/g,'')}'};
            console.log(music_info);
            window.pid=${res.playlist.id};
            window.fid=${currentId};
            avator.src=music_info['header'];
            avName.innerText=music_info['title'];
            avDesp.innerText=music_info['desc'];
            avator.onclick=play;
            refreshCode();
          `
          view.style.visibility="visible"
          view.executeJavaScript(js_to_run)
        }
      }
      else{
        console.log(responce.statusCode);
        if(responce.statusCode==404){
          document.getElementById("searchRes").innerHTML="<p style='width:90%;text-align:center;color:white'>没有找到您的歌单</p>";
        }
      }
  });
};

input.onkeypress=function (e) {
  console.log(e.key);
  if(e.key=="Enter"){
    search.onclick();
  }
}

