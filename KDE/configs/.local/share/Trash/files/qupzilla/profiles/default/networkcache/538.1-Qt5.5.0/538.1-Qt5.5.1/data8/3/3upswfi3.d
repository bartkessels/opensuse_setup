   �         Khttps://s.ytimg.com/yts/jsbin/www-en_US-vfl37Rnia/watch_autoplayrenderer.js     %, 	�      %���         
     O K           �      Vary   Accept-Encoding   Content-Encoding   gzip   Content-Type   text/javascript   Timing-Allow-Origin   https://www.youtube.com   Date   Fri, 18 Dec 2015 10:48:20 GMT   Expires   Sat, 26 Dec 2015 10:48:20 GMT   Last-Modified   Thu, 17 Dec 2015 21:25:22 GMT   X-Content-Type-Options   nosniff   Server   sffe   X-XSS-Protection   1; mode=block   Cache-Control   public, max-age=691200   Age   390136   Alternate-Protocol   443:quic,p=1   Alt-Svc   -quic=":443"; ma=604800; v="30,29,28,27,26,25" (function(g){var window=this;var M8=function(a){return"_"+(0,window.encodeURIComponent)(a).replace(/[.!~*'()%]/g,function(a){return cPa[a]})},O8=function(a,b){this.B=a;
this.A=null;if(g.x&&!(9<=g.Pg)){N8||(N8=new g.hi);this.A=N8.get(a);this.A||(b?this.A=window.document.getElementById(b):(this.A=window.document.createElement("userdata"),this.A.addBehavior("#default#userData"),window.document.body.appendChild(this.A)),N8.set(a,this.A));try{this.A.load(this.B)}catch(c){this.A=null}}},P8=function(a){try{a.A.save(a.B)}catch(b){throw"Storage mechanism: Quota exceeded";
}},Q8=function(a){return a.A.XMLDocument.documentElement},dPa=function(){var a=g.aj("visibilityState",window.document);
return!(!a||"visible"==a)},R8=function(a,b){var c;
b?c=null:(c=g.Av(a))||(c=new O8(a||"UserDataSharedStore"),c=c.isAvailable()?c:null);this.A=c?new g.Eo(c):null},S8=function(){return!g.jf(g.ef.getInstance(),140)},fPa=function(){if(g.t("AUTONAV_EXTRA_CHECK")){var a=S8(),b=!ePa.get("autonav_disabled"),c="";
a!=b&&(c="Cookie does not match localstorage value cookie:"+a+" LocalStorage:"+b);c&&g.Db(Error(c),"WARNING")}},oPa=function(){T8.push(g.Mb("player-playback-start",g.ra(U8,!0)));
T8.push(g.Mb("player-autonav-change-request",gPa));T8.push(g.Mb("player-autonav-pause-request",hPa));(0,g.u)(["check","uncheck","change"],function(a){V8.push(g.F(W8,a,iPa))});
T8.push(g.Mb("page-scroll",jPa));V8.push(g.F(g.y("watch8-secondary-actions"),"click",kPa,!0));V8.push(g.F(window.document.body,"focus",lPa,!0));V8.push(g.F(window.document.body,"blur",mPa,!0));T8.push(g.Mb("yt-www-comments-sharebox-open",lPa));V8.push(g.F(window.document,"visibilitychange",X8));var a=g.uB();a.addEventListener("onVolumeChange",X8);g.t("PREFETCH_AUTONAV")&&a.addEventListener("onStateChange",nPa)},kPa=function(){pPa=g.Ab(function(){var a=g.y("watch-action-panels");
if(a){for(var b=g.Ih("pause-resume-autoplay"),c=!1,d=0;d<b.length;d++)if(g.A(b[d],"yt-uix-button-toggled")){c=!0;break}!c&&g.A(a,"hid")?(Y8=!1,g.Cb(pPa)):Y8=!0;U8()}},500)},qPa=function(){Z8=window.document.activeElement&&"IFRAME"==window.document.activeElement.tagName.toUpperCase();
U8()},jPa=function(){$8=-200>a9.getBoundingClientRect().top;
U8()},rPa=function(a){return"INPUT"==a.tagName||"TEXTAREA"==a.tagName||!!a.isContentEditable},lPa=function(a){if(a&&rPa(a.target)){if("autoplay-checkbox"==a.target.id)return;
b9=!0}U8()},X8=function(){if(sPa()){var a=g.uB();
c9=dPa()&&(a.isMuted()||0==a.getVolume());U8()}},hPa=function(a){d9=a;
U8()},tPa=function(){e9=!0;
U8();f9=0},uPa=function(){e9=!1;
U8();f9&&g.Bb(f9);f9=g.zb(tPa,144E5-g.ce())},mPa=function(a){dPa()||(a&&rPa(a.target)&&(b9=!1),U8())},U8=function(a){g9=$8||Z8||b9||c9||d9||Y8||e9;
var b;b=S8()?g9?3:2:1;var c=g.uB(),d=sPa();d&&!c.setAutonav&&g.Db(Error("Player is ready but setAutonav is not"),"WARNING");d&&(a||vPa!=b)&&(c.setAutonavState(b),vPa=b);fPa()},sPa=function(){var a=g.uB();
return a&&a.isReady()},iPa=function(){var a=W8.checked,b=S8();
a!=b&&(b=g.nd({state:a?"enabled":"disabled"}),g.ej("autoplay",b,void 0),b=g.ef.getInstance(),a||g.ih(141,!0),g.ih(140,!a),b.save(),ePa.set("autonav_disabled",!a));U8()},gPa=function(a){W8.checked=a;
iPa()},nPa=function(a){if(0==a&&S8()&&!g9&&(a=g.z("autoplay-bar"),a=g.z("spf-link",a))){var b=g.or(a);
b.autonav=1;b.feature="related-auto";b.playnext=1;var c=g.ce();0<c&&(b.lact=c);(c=g.uB())&&c.shouldSendVisibilityState()&&(c=c.getVisibilityState(),0!=c&&(b.vis=c));g.hA(a.href,!!g.t("PREBUFFER_AUTONAV"),b)}},cPa={".":".2E",
"!":".21","~":".7E","*":".2A","'":".27","(":".28",")":".29","%":"."},N8=null;g.q(O8,g.wo);g.h=O8.prototype;g.h.isAvailable=function(){return!!this.A};
g.h.set=function(a,b){this.A.setAttribute(M8(a),b);P8(this)};
g.h.get=function(a){a=this.A.getAttribute(M8(a));if(!g.la(a)&&null!==a)throw"Storage mechanism: Invalid value was encountered";return a};
g.h.remove=function(a){this.A.removeAttribute(M8(a));P8(this)};
g.h.rb=function(){return Q8(this).attributes.length};
g.h.pc=function(a){var b=0,c=Q8(this).attributes,d=new g.Vh;d.next=function(){if(b>=c.length)throw g.Rg;var d;d=c[b++];if(a)return(0,window.decodeURIComponent)(d.nodeName.replace(/\./g,"%")).substr(1);d=d.nodeValue;if(!g.la(d))throw"Storage mechanism: Invalid value was encountered";return d};
return d};
g.h.clear=function(){for(var a=Q8(this),b=a.attributes.length;0<b;b--)a.removeAttribute(a.attributes[b-1].nodeName);P8(this)};R8.prototype.set=function(a,b,c,d){c=c||31104E3;this.remove(a);if(this.A)try{this.A.set(a,b,(0,g.yd)()+1E3*c);return}catch(f){}var e="";if(d)try{e=(0,window.escape)(g.Pn(b))}catch(f){return}else e=(0,window.escape)(b);g.oe(a,e,c,window.document.domain)};
R8.prototype.get=function(a,b){var c=void 0,d=!this.A;if(!d)try{c=this.A.get(a)}catch(e){d=!0}if(d&&(c=g.pe(a))&&(c=(0,window.unescape)(c),b))try{c=g.Mn(c)}catch(e){this.remove(a),c=void 0}return c};
R8.prototype.remove=function(a){this.A&&this.A.remove(a);g.fk(a,"/",window.document.domain)};var ePa=new R8("yt.autonav");var V8=[],T8=[],a9=null,W8=null,wPa=0,pPa=0,f9=0,g9=!1,$8=!1,b9=!1,Y8=!1,Z8=!1,c9=!1,d9=!1,e9=!1,vPa=1;g.Yb(g.il({name:"www/autoplayrenderer",deps:["www/watch"],page:"watch",init:function(){a9=g.y("player");if(W8=g.y("autoplay-checkbox"))g.uB()?(wPa=g.Ab(qPa,500),uPa(),T8.push(g.Mb("USER_ACTIVE",uPa)),W8.checked=S8(),oPa(),jPa(),X8(),fPa()):g.Db(Error("Autoplay player is missing"),"WARNING")},
dispose:function(){g.$d(V8);V8.length=0;g.Nb(T8);f9&&(g.Bb(f9),f9=0);T8.length=0;W8=a9=null;$8=!1;g.Cb(wPa);var a=g.uB();a&&(a.removeEventListener("onStateChange",nPa),a.removeEventListener("onVolumeChange",X8));e9=d9=c9=Y8=Z8=b9=$8=g9=!1}}));})(_yt_www);
