   �         �https://apis.google.com/_/scs/abc-static/_/js/k=gapi.gapi.en.u14lLJaui1I.O/m=gapi_iframes_style_slide_menu/exm=card,gapi_iframes/rt=j/sv=1/d=1/ed=1/am=AAI/rs=AItRSTOQXh5W7RmvhkCxBgvo-53xlAGpzA/cb=gapi.loaded_1     %�*�      %~���`         
     O K           �      Vary   Accept-Encoding   Content-Encoding   gzip   Content-Type   text/javascript; charset=UTF-8   Last-Modified   Fri, 28 Aug 2015 23:06:04 GMT   Date   Tue, 08 Sep 2015 00:14:12 GMT   Expires   Wed, 07 Sep 2016 00:14:12 GMT   X-Content-Type-Options   nosniff   Server   sffe   X-XSS-Protection   1; mode=block   Cache-Control   public, max-age=31536000   Age   320203   Alternate-Protocol   443:quic,p=1   Alt-Svc   quic=":443"; p="1"; ma=604800 /* JS */ gapi.loaded_1(function(_){var window=this;
_.Tt=function(a){if(!_.ka(a))for(var b=a.length-1;0<=b;b--)delete a[b];a.length=0};_.Ut=function(a){_.pe.call(this);this.S=a;this.J={}};_.A(_.Ut,_.pe);var Vt=[];_.Ut.prototype.V=function(a,b,c,d){return _.Wt(this,a,b,c,d)};_.Wt=function(a,b,c,d,e,f){_.ka(c)||(c&&(Vt[0]=c.toString()),c=Vt);for(var g=0;g<c.length;g++){var k=_.Q(b,c[g],d||a.handleEvent,e||!1,f||a.S||a);if(!k)break;a.J[k.key]=k}return a};
_.Ut.prototype.Ya=function(a,b,c,d,e){if(_.ka(b))for(var f=0;f<b.length;f++)this.Ya(a,b[f],c,d,e);else c=c||this.handleEvent,e=e||this.S||this,c=_.Oe(c),d=!!d,b=_.Ce(a)?_.Ke(a.ef,String(b),c,d,e):a?(a=_.Qe(a))?_.Ke(a,b,c,d,e):null:null,b&&(_.We(b),delete this.J[b.key]);return this};_.Xt=function(a){_.Hd(a.J,function(a,c){this.J.hasOwnProperty(c)&&_.We(a)},a);a.J={}};_.Ut.prototype.ra=function(){_.Ut.R.ra.call(this);_.Xt(this)};_.Ut.prototype.handleEvent=function(){throw Error("M");};

var Lv;Lv=function(a,b){return a>b?1:a<b?-1:0};_.Mv=function(a,b){a.sort(b||Lv)};_.Nv=function(a,b){_.ka(b)||(b=[b]);var c=(0,_.kd)(b,function(a){return _.t(a)?a:a.uo+" "+a.duration+"s "+a.timing+" "+a.Ug+"s"});_.S(a,"transition",c.join(","))};
_.Ov=function(a){var b=!1,c;return function(){b||(c=a(),b=!0);return c}}(function(){if(_.P)return _.$d("10.0");var a=window.document.createElement("DIV"),b=_.Od?"-webkit":_.Nd?"-moz":_.P?"-ms":_.Ld?"-o":null,c={transition:"opacity 1s linear"};b&&(c[b+"-transition"]="opacity 1s linear");b=_.Js({style:c});a.innerHTML=_.Gg(b);a=a.firstChild;b=a.style[_.dd("transition")];return""!=("undefined"!==typeof b?b:a.style[_.Ps(a,"transition")]||"")});

var vE=function(a,b,c,d,e){this.width=a;this.height=b;this.G=c;this.I=d;this.opacity=e},wE=function(a,b,c,d){return new vE(void 0==b?a.width:b,void 0==c?a.height:c,a.G,a.I,void 0==d?a.opacity:d)};vE.prototype.equals=function(a){return this.width==a.width&&this.height==a.height&&this.G==a.G&&this.I==a.I&&this.opacity==a.opacity}; vE.prototype.interpolate=function(a,b){var c=1-b;return new vE(Math.round(this.width*c+a.width*b),Math.round(this.height*c+a.height*b),Math.round(this.G*c+a.G*b),Math.round(this.I*c+a.I*b),this.opacity*c+a.opacity*b)};
_.xE=function(a){_.Et.call(this,a);this.ya=new _.Ut(this)};_.A(_.xE,_.Gt);
_.zE=function(a){var b=Number(a.M(200,"widgetWidth","width")),c=Number(a.M(100,"widgetHeight","height")),d=a.M("auto","corner"),e=a.M({},"menuCss"),f=a.M(!0,"hideOnClick");a.ze=!!a.M(!0,"hideOnLeave");a.wb=!!a.M((0,_.Ov)(),"useCss3Transition");a.yd=!!a.M(!0,"allowOffset");var g=window.document.createElement("div");a.I=g;var k=_.Jt(a);k.parentNode.appendChild(g);var l=window.document.createElement("div");a.Y=l;g.appendChild(l);e.position="absolute";e.width=b+"px";e.height="0";e.border=e.border||"1px solid #aaa";
e.background=e.background||"#fff";e.zIndex=_.Lt(a);e.overflow="hidden";e.boxShadow=e.MozBoxShadow=e.webkitBoxShadow=e.boxShadow||"0 2px 2px rgba(0,0,0,0.3)";_.S(g,e);_.S(l,{left:"-1000px",top:"-1000px",position:"absolute",width:b+"px",height:c+"px"});a.Ad=g.offsetWidth-b;a.Bd=g.offsetHeight;e="auto"==d?["top","start"]:d.split("-");k=_.ft(k);a.mb="bottom"==e[0];a.Fa="right"==e[1]||"left"!=e[1]&&k;a.J=yE(a,b,c,"auto"==d);a.Sb=_.r.setTimeout((0,_.u)(a.zd,a),500);a.ya.V(g,"mouseover",a.cK);_.Wt(a.ya,
g,"mouseout",a.bK,!1,a);f&&_.r.setTimeout((0,_.u)(function(){this.W||this.ya.V(window.document,"click",this.aL)},a),0)};_.xE.prototype.open=function(){_.zE(this);this.Z.xe(this.I);this.Z.mc("resize",(0,_.u)(this.resize,this));this.Z.ed("showMenu",(0,_.u)(this.cC,this));var a=this.Z.methods;a.setHideOnLeave=(0,_.u)(this.gz,this);a.displayStateCallback&&(this.Tb=a.displayStateCallback,delete a.displayStateCallback);this.Z.$d(this.Y,{height:"100%"});_.AE(this,this.J)};_.xE.prototype.open=_.xE.prototype.open;
_.xE.prototype.Gc=function(a){this.W||(a=a||{},this.Y.style.left="0",this.Y.style.top="0",this.K&&(_.Zg(this.K),this.K=null),this.Sb&&(_.r.clearTimeout(this.Sb),this.Sb=null),BE(this,(0,window.parseInt)(a.width,10)||(0,window.parseInt)(this.Z.width,10)||this.J.width,(0,window.parseInt)(a.height,10)||(0,window.parseInt)(this.Z.height,10)||this.J.height))};_.xE.prototype.onready=_.xE.prototype.Gc;
_.xE.prototype.resize=function(a){this.W||BE(this,(0,window.isNaN)(+a.width)?this.J.width:+a.width,(0,window.isNaN)(+a.height)?this.J.height:+a.height)};_.xE.prototype.close=function(){this.Wa?CE(this):(this.Ha=!0,DE(this))};_.xE.prototype.close=_.xE.prototype.close;_.xE.prototype.M=function(a,b){for(var c,d=1,e=arguments.length;d<e&&(c=this.G[arguments[d]],void 0===c);++d);return void 0!==c?c&&"object"==typeof c?(d={},_.Ns(d,c),d):c:a};
var yE=function(a,b,c,d){var e=_.Jt(a),f=_.vt(e.offsetParent);f.right-=a.Ad;f.bottom-=a.Bd;if(d){var g=e.offsetLeft;d=g+b<f.right;g=g+e.offsetWidth-b>=f.left;a.Fa=a.Fa?!d||g:!d&&g;g=e.offsetTop;d=g+c<f.bottom;g=g+e.offsetHeight-c>=f.top;a.mb=a.mb?!d||g:!d&&g}d=EE(a.Fa,e.offsetLeft,e.offsetWidth,b,f.left,f.right);a=EE(a.mb,e.offsetTop,e.offsetHeight,c,f.top,f.bottom);return new vE(b,c,d,a,1)},EE=function(a,b,c,d,e,f){return a?(a=b+c,Math.min(f-a,Math.max(e+d-a,0))):Math.max(e-b,Math.min(f-b-d,0))},
BE=function(a,b,c){a.Z.Va().style.width=b+"px";a.Z.Va().style.height=c+"px";a.Y.style.width=b+"px";a.Y.style.height=c+"px";b=a.yd?yE(a,b,c,!1):wE(a.Na,b,c);a.J=b;a.O||FE(a,b)};_.h=_.xE.prototype;_.h.gz=function(a){this.ze=!!a};_.h.cK=function(){!this.O&&this.N&&(_.r.clearTimeout(this.N),this.N=null)};
_.h.bK=function(a){if(!(this.O||this.N||!this.ze||a.relatedTarget&&_.dh(this.I,a.relatedTarget))){var b=_.ut(this.I);a=a.clientY>b.top&&a.clientY<b.top+b.height?0:300;this.N=_.r.setTimeout((0,_.u)(this.rb,this),a)}};_.h.aL=function(a){_.Kt(this.I,a)||this.rb()};_.h.cC=function(a){this.show(!!a||void 0===a)};_.h.show=function(a){a?!this.W&&this.Wa&&(this.O=this.Wa=!1,_.AE(this,this.J)):this.rb()};
_.AE=function(a,b){GE(a,wE(b,void 0,0,0));_.r.setTimeout((0,_.u)(function(){this.O||(this.J=b,this.wb&&_.Nv(this.I,"width 350ms cubic-bezier(.23, .50, .32, 1),height 350ms cubic-bezier(.23, .50, .32, 1),left 350ms cubic-bezier(.23, .50, .32, 1),top 350ms cubic-bezier(.23, .50, .32, 1),opacity 350ms cubic-bezier(.23, .50, .32, 1)"),FE(this,b),this.va(!0,!1),this.ma&&(_.r.clearTimeout(this.ma),this.Ha=!1),this.ma=_.r.setTimeout((0,_.u)(this.va,this,!0,!0),350))},a),0)};
_.xE.prototype.rb=function(){this.O||DE(this)};
var DE=function(a){a.O||(a.va(!1,!1),FE(a,wE(a.Na,void 0,0,0)),a.O=!0,a.ma&&_.r.clearTimeout(a.ma),a.ma=_.r.setTimeout((0,_.u)(function(){this.Wa=!0;this.Ha?(CE(this),this.Ha=!1):(this.wb&&_.Nv(this.I,""),this.I.visibility="hidden",this.I.left="-1000px",this.I.top="-1000px");this.va(!1,!0)},a),350))},CE=function(a){a.W=!0;_.qe(a.ya);a.ya=null;a.N&&(_.r.clearTimeout(a.N),a.N=null);a.T&&(_.r.clearTimeout(a.T),a.T=null);_.Zg(a.I);a.I=null;_.Zg(_.Jt(a));a.Y=null;a.K=null};
_.xE.prototype.va=function(a,b){var c=this.Tb;c&&_.r.setTimeout(function(){c(a,b)},0)};_.xE.prototype.zd=function(){this.K=window.document.createElement("div");this.K.style.width=this.K.style.height="100%";this.K.style.position="absolute";this.K.style.background="url(//ssl.gstatic.com/ui/v1/activityindicator/loading_gs.gif) no-repeat "+(this.J.width-19)/2+"px "+(this.J.height-19)/2+"px";this.I.appendChild(this.K)};
var FE=function(a,b){if(!a.O)if(a.wb)GE(a,b);else{var c=(0,_.wa)()-20+350;a.T&&_.r.clearTimeout(a.T);a.Ob(a.Na,b,c)}},GE=function(a,b){var c=a.I,d=_.Jt(a);c.style.left=a.Fa?d.offsetLeft+d.offsetWidth+b.G-b.width+"px":d.offsetLeft+b.G+"px";c.style.width=b.width+"px";c.style.top=a.mb?d.offsetTop+d.offsetHeight+b.I-b.height+"px":d.offsetTop+b.I+"px";c.style.height=b.height+"px";_.mt(c,b.opacity);a.Na=b}; _.xE.prototype.Ob=function(a,b,c){this.T=null;if(!this.W&&!a.equals(b)){var d=(0,_.wa)();d>=c?GE(this,b):(d=Math.min(1-(c-d)/350,1),GE(this,a.interpolate(b,1-Math.pow(1-d,3))),this.T=_.r.setTimeout((0,_.u)(this.Ob,this,a,b,c),20))}};

_.sn["slide-menu"]=function(a){var b=new _.xE(_.zO(a)),c=new _.Qt(b);b.open=function(){};_.zE(b);a.attributes={height:"100%"};a.where=b.Y;a.onClose=function(){b.close()};a.onRestyle=function(a){if(a){var c=!1;a.hasOwnProperty("showMenu")&&(b.cC(a.showMenu),c=!0);a.hasOwnProperty("setHideOnLeave")&&(b.gz(a.setHideOnLeave),c=!0);c||b.resize(a)}};a.onCreate=function(a){a.$b=function(){return this.nk("openerIframe")};c.Z=b.Z=a;a.xe(b.I);a.register("_ready",(0,_.u)(b.Gc,b),_.cn);b.Tb=function(b,c){!a.Gb()&& a.cj([b,c])};_.AE(b,b.J);c.open()}};

});
// Google Inc.
