   �         Bhttps://s.ytimg.com/yts/jsbin/www-en_US-vfl37Rnia/ypc_bootstrap.js     %, 	
�      %���         
     O K           �      Vary   Accept-Encoding   Content-Encoding   gzip   Content-Type   text/javascript   Timing-Allow-Origin   https://www.youtube.com   Date   Fri, 18 Dec 2015 10:47:34 GMT   Expires   Sat, 26 Dec 2015 10:47:34 GMT   Last-Modified   Thu, 17 Dec 2015 21:25:22 GMT   X-Content-Type-Options   nosniff   Server   sffe   X-XSS-Protection   1; mode=block   Cache-Control   public, max-age=691200   Age   390180   Alternate-Protocol   443:quic,p=1   Alt-Svc   -quic=":443"; ma=604800; v="30,29,28,27,26,25" (function(g){var window=this;var iJa=function(a,b,c){g.Hm(a,b,c,null)||g.nb(g.ra(b,a))},jJa=function(){var a=I3;
return new g.tm(function(b,c){var d=a.length,e=[];if(d)for(var f=function(a,c){d--;e[a]=c;0==d&&b(e)},k=function(a){c(a)},p=0,r;p<a.length;p++)r=a[p],iJa(r,g.ra(f,p),k);
else b(e)})},J3=function(a){var b=g.t("YPC_LOADER_CSS",void 0),c=g.t("YPC_LOADER_JS",void 0);
kJa&&(c="www/ypc_core");I3.length||(I3.push(new g.tm(function(a){g.yf(b,a)})),I3.push(new g.tm(function(a){g.Cc(c,a)})));
jJa().then(function(){a&&a()})},L3=function(a,b,c,d,e){if(g.rr())J3(function(){g.m("yt.www.ypc.checkout.showYpcOverlay")(a,b,c,d,e)});
else{var f={ypc_it:a,ypc_ii:b,ypc_ft:c};d&&(f.ypc_irp=d);e&&(f.ypc_cc=e);f=K3(f);g.te(f)}},lJa=function(a,b){if(g.rr())J3(function(){g.m("yt.www.ypc.checkout.showYpcOverlayForInnertubeRequestParams")(a,b)});
else{var c=K3({ypc_ft:a,ypc_irp:b});g.te(c)}},mJa=function(a,b,c,d,e){if(g.rr())J3(function(){g.m("yt.www.ypc.checkout.offerpurchaser.purchaseOffer")(a,b,c,"D",d,e)});
else{var f={ypc_it:b,ypc_ii:c,ypc_ft:"D"};e&&(f.ypc_irp=e);f=K3(f);g.te(f)}},nJa=function(a,b){if(g.rr())J3(function(){g.m("yt.www.ypc.subscription.openUnsubscribeOverlay")(a,b)});
else throw Error("Unsubscribe triggered when user not signed in.");},K3=function(a){a=g.Fk(window.location.href,a);
var b=g.t("YPC_SIGNIN_URL",void 0),c=g.Gk(b)["continue"],c=g.Fk(c,{next:a});return g.Fk(b,{"continue":c})},oJa=function(a){if(a=a.currentTarget){var b=g.w(a,"ypc-offer-id"),c=g.w(a,"ypc-item-type"),d=g.w(a,"ypc-item-id"),e=g.w(a,"ypc-offer-jwt"),f=g.w(a,"ypc-irp");
try{var k=g.w(a,"innertube-clicktracking");k&&!g.t("SERVICE_CLICKTRACKING_ENABLED")&&g.ro(g.t("EVENT_ID",void 0),new g.je(k))}catch(p){M3("offer-button-click-logging-failed")}mJa(b,c,d,e,f)}},qJa=function(a){(a=a.currentTarget)&&pJa(a)},rJa=function(a){J3(a.sc)},sJa=function(a){M3("container-button-click-attempt");
(a=g.z("ypc-checkout-button",a.A))&&pJa(a)},tJa=function(a){var b=a.A;
a=b.itemId;var c=b.itemType,b=b.flowType;M3("paid-subscribe-button-click",{itemType:c,itemId:a});L3(c,a,b)},pJa=function(a){var b=g.w(a,"ypc-item-type"),c=g.w(a,"ypc-item-id"),d=g.w(a,"ypc-flow-type");
a=g.w(a,"ypc-irp")||void 0;g.rr()?M3("purchase-button-click",{itemId:c,itemType:b}):M3("signin-button-click");L3(b,c,d,a)},uJa=function(a){var b=a.currentTarget;
a=g.w(b,"ypc-item-type");b=g.w(b,"ypc-item-id");a&&b&&(M3("unsubscribe-button-click",{itemId:b,itemType:a}),nJa(a,b))},vJa=function(a){var b=a.A;
a=b.itemType;b=b.itemId;M3("paid-unsubscribe-button-click",{itemType:a,itemId:b});nJa(a,b)},M3=function(a,b){var c={};
g.Ya(c,{label:a,pageName:g.t("PAGE_NAME")});b&&g.Ya(c,b);c=g.nd(c);g.ej("ypc-checkout",c,void 0)},O3=function(a,b,c){this.D=this.C=this.A=null;
this.B=a;this.H=N3?b:null;this.P=c||window;this.G=this.P.location;this.K=this.G.href.split("#")[0];this.F=(0,g.n)(this.O,this)},P3=function(a){a=a.G.href;
var b=a.indexOf("#");return 0>b?"":a.substring(b+1)},wJa=function(a,b){var c=a.K+"#"+b,d=a.G.href;
d!=c&&d+"#"!=c&&g.xc(a.G,c)},Q3=function(a,b){var c=a.H.contentWindow.document,d="#"+g.wa(b);
if((c.body?c.body.innerHTML:"")!=d){var e=g.vc(g.uc("title",{},window.document.title||""),g.uc("body"));c.open("text/html");c.write(g.pc(e));g.yh(c.body,d);c.close()}},R3=function(a,b){this.B=this.H=this.A=null;
this.D=a;this.G=b||window;this.C=this.G.location;this.F=(0,g.n)(this.P,this)},yJa=function(){var a=xJa("state");
a.setEnabled.call(a,!0,!0)},zJa=function(a){var b=xJa();
b.replace.call(b,a,window.history&&window.history.state,!0)},xJa=function(a){a=a||"hash";
var b=g.m("yt.history.instance_");b||("state"==a?(b=new R3(AJa),R3.prototype.setEnabled=R3.prototype.Jb,R3.prototype.add=R3.prototype.X,R3.prototype.replace=R3.prototype.replace):(b=new O3(AJa,g.y("legacy-history-iframe")),O3.prototype.setEnabled=O3.prototype.Jb,O3.prototype.add=O3.prototype.X,O3.prototype.replace=O3.prototype.X),BJa=b,g.l("yt.history.instance_",BJa,void 0));return b},AJa=function(a,b){g.v("navigate",a,b)},EJa=function(){var a=g.Gk(window.location.href);
if(CJa){g.Ra(DJa,function(b){g.Ua(a,b)});
var b=g.od(window.location.href.split("?",2)[0],a);yJa();zJa(b)}},I3=[],kJa=!1;var S3=[],T3=[];var BJa,FJa=g.x&&8<=window.document.documentMode||g.Gc&&g.Mc("1.9.2")||g.Ic&&g.Mc("532.1"),N3=g.x&&!FJa;O3.prototype.Jb=function(a,b){this.C&&(g.$d(this.C),delete this.C);this.D&&(g.Cb(this.D),delete this.D);if(a){this.A=P3(this);if(N3){var c=this.H.contentWindow.document.body;c&&c.innerHTML||Q3(this,this.A)}b||this.B(this.A);FJa?this.C=g.F(this.P,"hashchange",this.F):this.D=g.Ab(this.F,200)}};
O3.prototype.O=function(){if(N3){var a;a=(a=this.H.contentWindow.document.body)?g.Ph(g.Vk(a).substring(1)):"";a!=this.A?(this.A=a,wJa(this,a),this.B(a)):(a=P3(this),a!=this.A&&(this.A=a,Q3(this,a),this.B(a)))}else a=P3(this),a!=this.A&&(this.A=a,this.B(a))};
O3.prototype.X=function(a,b,c){this.A=""+a;N3&&Q3(this,a);wJa(this,a);c||this.B(this.A)};var CJa=!!window.history.pushState&&(!g.Ic||g.Ic&&g.Mc("534.11"));R3.prototype.Jb=function(a,b){this.B&&(g.$d(this.B),delete this.B);this.H&&(g.Cb(this.H),delete this.H);a&&CJa&&(this.A=this.C.href,b||this.D(this.A),this.B=g.F(this.G,"popstate",this.F))};
R3.prototype.P=function(a){var b=this.C.href;if((a=a.state)||b!=this.A)this.A=b,this.D(b,a)};
R3.prototype.X=function(a,b,c){if(a||b)a=a||this.C.href,this.G.history.pushState(b,"",a),this.A=a,c||this.D(a,b)};
R3.prototype.replace=function(a,b,c){if(a||b)a=a||this.C.href,this.G.history.replaceState(b,"",a),this.A=a,c||this.D(a,b)};var DJa={iP:"ypc_cc",uP:"ypc_ft",PP:"ypc_irp",YP:"ypc_ii",ZP:"ypc_it"};g.Yb(g.il({name:"www/ypc_bootstrap",deps:["www/common"],page:"feed index results watch channel playlist subscription_manager unlimited".split(" "),init:function(){kJa=!0;g.z("ypc-delayedloader-target")&&J3();var a=g.Gk(window.location.href),b=a.ypc_it,c=a.ypc_ii,d=a.ypc_ft||"D",e=a.ypc_irp,f=a.ypc_cc;"channel"==g.t("PAGE_NAME")&&"fan_fund"in a&&(d="T",b="U",c=g.t("CHANNEL_ID",void 0));"channel"==g.t("PAGE_NAME")&&"ypc_cc"in a&&(b="U",c=g.t("CHANNEL_ID",void 0));if(e||c&&b)EJa(),c&&b?L3(b,c,d,e,f):
lJa(d,e);S3.push(g.mk(window.document.body,"click",qJa,"ypc-checkout-button"),g.mk(window.document.body,"click",oJa,"ypc-offer-button"),g.mk(window.document.documentElement,"click",uJa,"ypc-unsubscribe-link"),g.mk(window.document.documentElement,"click",uJa,"ypc-unsubscribe-button"));T3.push(g.Jk(g.uu,rJa),g.Jk(g.Zka,sJa),g.Jk(g.vu,tJa),g.Jk(g.yu,vJa))},
dispose:function(){I3.length=0;g.$d(S3);S3.length=0;g.Ik(T3);T3.length=0}}));
g.l("yt.www.ypc.bootstrap.api.loadOffers",L3,void 0);g.l("yt.www.ypc.bootstrap.api.loadOffersForInnertubeRequestParams",lJa,void 0);})(_yt_www);
