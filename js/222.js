
var testObject;

function setImageClickFunction(){
    var imgs = document.getElementsByTagName("img");
    for (var i=0;i<imgs.length;i++){
        var src = imgs[i].src;
        imgs[i].setAttribute("onClick","click(src)");
    }
    document.location = imageurls;
}

function click(imagesrc){
    var url="ClickImage:"+imagesrc;
    document.location = url;
}


function sayHello() {
    if (document.getElementById('foo').innerHTML == 'Hi there'){
        document.getElementById('foo').innerHTML = 'Click me!';
        
    }else{
        document.getElementById('foo').innerHTML = 'Hi there';
    }
    
     document.location = "finish";
}

function buttonClick()
{
    jakilllog("hello world");
    testObject.dismiss();
}
