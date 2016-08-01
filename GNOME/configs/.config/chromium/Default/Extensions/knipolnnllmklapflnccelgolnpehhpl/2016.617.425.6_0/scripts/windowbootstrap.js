"use strict";this.default_windowbootstrap=this.default_windowbootstrap||{};(function(_){var window=this;
try{
var aa,da,ba,fa,ga,ha,ia,ja,ka,la,ma;aa="undefined"!=typeof window&&window===this?this:"undefined"!=typeof window.global?window.global:this;_.ca=function(){aa.Symbol||(aa.Symbol=ba);_.ca=function(){}};da=0;ba=function(a){return"jscomp_symbol_"+a+da++};_.ea=function(){_.ca();aa.Symbol.iterator||(aa.Symbol.iterator=aa.Symbol("iterator"));_.ea=function(){}};
fa=function(a,b){_.ea();a instanceof String&&(a+="");var c=0,d={next:function(){if(c<a.length){var e=c++;return{value:b(e,a[e]),done:!1}}d.next=function(){return{done:!0,value:void 0}};return d.next()}};_.ca();_.ea();_.ca();_.ea();d[window.Symbol.iterator]=function(){return d};return d};ga=function(a,b){!Array.prototype[a]&&Object.defineProperties&&Object.defineProperty&&Object.defineProperty(Array.prototype,a,{configurable:!0,enumerable:!1,writable:!0,value:b})};
ha=function(a,b,c){if(null==a)throw new TypeError("The 'this' value for String.prototype."+c+" must not be null or undefined");if(b instanceof RegExp)throw new TypeError("First argument to String.prototype."+c+" must not be a regular expression");return a+""};ia=function(a){var b=ha(this,null,"repeat");if(0>a||1342177279<a)throw new window.RangeError("Invalid count value");a|=0;for(var c="";a;)if(a&1&&(c+=b),a>>>=1)b+=b;return c};
ja=function(a){var b=ha(this,null,"codePointAt"),c=b.length;a=Number(a)||0;if(0<=a&&a<c){a|=0;var d=b.charCodeAt(a);if(55296>d||56319<d||a+1===c)return d;a=b.charCodeAt(a+1);return 56320>a||57343<a?d:1024*(d-55296)+a+9216}};ka=function(a,b){return-1!==ha(this,a,"includes").indexOf(a,b||0)};la=function(a,b){var c=ha(this,a,"startsWith");a+="";for(var d=c.length,e=a.length,f=Math.max(0,Math.min(b|0,c.length)),h=0;h<e&&f<d;)if(c[f++]!=a[h++])return!1;return h>=e};
ma=function(a,b){var c=ha(this,a,"endsWith");a+="";void 0===b&&(b=c.length);for(var d=Math.max(0,Math.min(b|0,c.length)),e=a.length;0<e&&0<d;)if(c[--d]!=a[--e])return!1;return 0>=e};String.prototype.endsWith||(String.prototype.endsWith=ma);String.prototype.startsWith||(String.prototype.startsWith=la);String.prototype.includes||(String.prototype.includes=ka);String.prototype.codePointAt||(String.prototype.codePointAt=ja);String.prototype.repeat||(String.prototype.repeat=ia);
ga("values",function(){return fa(this,function(a,b){return b})});ga("keys",function(){return fa(this,function(a){return a})});ga("entries",function(){return fa(this,function(a,b){return[a,b]})});_.na=_.na||{};_.l=this;_.oa="closure_uid_"+(1E9*Math.random()>>>0);_.pa=Date.now||function(){return+new Date};

}catch(e){_._DumpException(e)}
try{
_.Zg="https://support.google.com/chrome/answer/185277?hl="+window.chrome.i18n.getMessage("@@ui_locale");window.chrome.i18n.getMessage("@@ui_locale");_.$g="https://support.google.com/hangouts/?p=chrome_desktop_app_outdated&hl="+window.chrome.i18n.getMessage("@@ui_locale");

}catch(e){_._DumpException(e)}
try{
window.location.search&&window.addEventListener("load",function(){window.chrome.runtime.getBackgroundPage(function(a){a.__onExtWindowLoad(window)})});
}catch(e){_._DumpException(e)}
}).call(this,this.default_windowbootstrap);
// Google Inc.
