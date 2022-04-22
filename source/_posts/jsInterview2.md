---
title: js 进阶问题
date: 2022-04-22 12:17:22
tags:
 - javascript
 - 干货
categories:
 - javascript
---
##### 1、html渲染过程
>参考回答: 浏览器渲染页面是一个从上至下的过程，当拿到html以后首先会生成dom树，加载解析css构建cssom树，解析css的时候不会阻塞进程，我们通常会把首屏样式放到head里面，然后加载执行js，在js里面可能会有动态创建修改dom的逻辑，浏览器为了优化整个渲染过程，会在解析到js的时候阻塞整个进程，我们通常把js放到body后面来优化首屏的加载速度，当dom以及cssom都构建完成后会生成渲染树，再根据渲染树将dom树上的节点布局到屏幕上的正确位置，最后遍历绘制的所有节点，为其添加对应的样式 
 延伸理解
重绘：改变dom的外观属性，如背景色，outline等 
重排:  改变dom的结构，几何属性等 
为了减少浏览器的重排重绘，我们应该将多次改变样式的操作合并成一次操作
##### 2、HTTPS和HTTP的区别及优缺点
>参考回答:
1.http是超文本传输协议,信息是明文传输, https是具有安全性的ssl加密传输协议
2.两者采用完全不同的连接方式，http连接是无状态的, https是由ssl＋http协议构建的可进行加密传输，身份认证的网络协议
3.两者用的端口也不一样，前者80后者443
4.https 需要证书
优点
https在seo以及安全性方面要高于http
缺点
https加载时间较长，证书收费
##### 3、js中this
>参考回答:
js中this的指向总是指向一个对象，而具体指向哪个对象是在运行时基于函数的执行环境动态绑定的， 而非函数被声明时的环境
具体到实际应用中，this 的指向大致可以分为以下几种
*作为对象的方法调用指向当前对象
*作为普通函数调用指向全局window
*构造函数调用指向返回的对象
*call,apply 调用指向其第一个参数
##### 4、怎么理解js中是原型链? 如何实现继承?
>参考回答:
每个构造函数都有一个原型对象
每个原型对象都包含一个指向构造函数的指针
每个实例都包含一个指向原型对象的指针
查找方式是一层层向上查找直至顶层Object.prototype
实现继承的方式常用的有:
原型链继承
借用构造函数(call,apply)
组合继承(原型链＋构造函数)
原型式继承
寄生式组合式继承 
延伸理解:
优缺点?
每一种继承的方式都有自己的优缺点
组合继承的特点是会调用构造函数两次,
都是将多种继承方式组合到一起相辅相成.
new 运算符具体干了什么?
创建一个空的对象
将空的对象的__proto__成员指向构造函数的prototype成员对象
调用构造函数将this指向前面创建的对象
##### 5、怎么理解js中的内存泄漏?
>参考回答:
内存泄漏的定义为当程序不再需要的内存，由于某种原因其不会返回到操作系统或可用内存池，内存泄漏会导致一系列问题，比如: 运行缓慢，崩溃，高延迟等
js中常见的内存泄露:
意外的全局变量
遗忘的计时器或回调函数
脱离文档的DOM引用
闭包
##### 6、如何理解浏览器的跨域问题？常用的解决方式有哪些？
>参考回答:
浏览器的同源策略会导致跨域，这里同源策略又分为以下两种 ：
DOM同源策略：禁止对不同源页面DOM进行操作。这里主要场景是iframe跨域的情况，不同域名的iframe是限制互相访问的。
XmlHttpRequest同源策略：禁止使用XHR对象向不同源的服务器地址发起HTTP请求。只要协议、域名、端口有任何一个不同，都被当作是不同的域，之间的请求就是跨域操作
注：协议、域名、端口有任何一个不同，都视为不同的域
常用的解决方式: 
1.CORS(Cross-origin resource sharing) 跨域资源共享  
注: 这种方式如果想要携带cookie需要xhr设置withCredentials为true, 服务端 Access-Control-Allow-Credentials:true
2.jsonp实现跨域(动态创建script,利用src属性进行跨域)
3.服务器代理(浏览器有跨域限制，服务端没有)
4.document.domain
5.window.name
6.hash传值 
7.possMessage
##### 7、函数防抖，函数节流的基本概念以及工作中实际使用到的场景？实现的思路是？
>参考回答:
函数防抖(debounce)
基本概念: 在事件被触发n秒后再执行回调，如果在这n秒内又被触发，则重新计时。
举例理解: 我们用手指一直按住一个弹簧，它将不会马上弹起直到你松手为止
使用场景:
按钮重复点击
输入框连续输入
判断scroll是否滑到底部
简单实现:
```js
const debounce = (fn,delay) => {
    let timer = null
    return () => {
        let ctx = this, args = arguments
        clearTimeout(timer)
        timer = setTimeout( ()=> {
          fn.apply(ctx,args)
        }, delay)
    }
}
```
>函数节流(throttle)
基本概念: 在规定的时间范围内相同的操作触发多次只执行一次
DOM拖拽
Canvas画笔
窗口resize
简单实现:
```js
const throttle = (fn,gapTime = 100) => {
    let timer = null
    let start_time = new Date().getTime()
    return () => {
        let ctx = this, args = arguments,
        current_time = new Date().getTime()
        clearTimeout(timer)
        if(curr_time - start_time >= gapTime()){
          fn.apply(ctx,args)
          start_time = current_time
        }else{
          timer = setTimeout( ()=> {
          fn.apply(ctx,args)
          }, gapTime)
        }
    }
}
```
##### 8、js中的eventloop机制？
>参考回答:
首先javascript是单线程机制，就是指当我们在执行一个任务的时候，其它的事情都得等待他执行完毕
在js中所有任务分为两种, 同步任务及异步任务
执行栈执行主线程任务，当有操作dom，ajax交互，使用定时器异步操作的时候，这些任务会被移入到 callback queue 任务队列中 当主线程任务执行完毕为空时，会读取callback queue队列中的函数，进入主线程执行 上述过程会不断重复，也就是常说的Event Loop(事件循环)
在一个事件循环中,异步任务返回结果后会被扔进一个任务列队中，根据异步事件上的类型，这个事件会被放到对应的宏任务或者微任务列队中去， 当执行栈为空的时候，主线程会先查看微任务中的事件列队，如果微任务不是空先依次执行微任务，如果是空的再去宏任务列队中取出一个事件并把对应的回调加入到当前执行栈，如此反复，进入循环
下面用一道题来加深印象
```js
setTimeout(function () {
    console.log(1);
});
new Promise( (resolve,reject) => {
    console.log(2)
}).then( (val) => {
    console.log(val);
})
输出的结果是2,1
```
##### 9、web安全攻击手段有哪些？以及如何防范
>常见的有xss, csrf, sql注入
xss(cross site scripting) 跨站脚本攻击
定义: 指攻击者在网页嵌入脚本，用户浏览网页触发恶意脚本执行
XSS攻击分为3类：存储型（持久型）、反射型（非持久型）、基于DOM
如何防范:
设置HttpOnly以避免cookie劫持的危险 
过滤，对诸如\<script\>、\<img\>、\<a\>等标签进行过滤 
编码，像一些常见的符号，如<>在输入的时候要对其进行转换编码 
限制，对于一些可以预期的输入可以通过限制长度强制截断来进行防御
csrf(cross site request forgery) 跨站请求伪造
定义: 是一种劫持受信任用户向服务器发送非预期请求的攻击方式
如何防范:
验证 HTTP Referer 字段
请求地址中添加 token 并验证
HTTP 头中自定义属性并验证
sql注入(SQL injection)
定义: 在未授权情况下，非法访问数据库信息
如何防范:
杜绝用户提交的参数入库并且执行 
在代码层，不准出现sql语句 
在web输入参数处，对所有的参数做sql转义 
上线测试，需要使用sql自动注入工具进行所有的页面sql注入测试

##### 10、说说你对前端模块化的理解。
>模块的定义:
可以理解成实现特定功能的相互独立的一组方法
为什么要使用模块化:
可维护性
命名空间
可复用性
模块化规范
CommonJS
AMD
UMD
CMD
Module(es6)
CommonJS
CommonJS 扩展了JavaScript声明模块的API,
通过CommonJS，每个JS文件独立地存储它模块的内容（就像一个被括起来的闭包一样）。在这种作用域中，我们通过 module.exports 语句来导出对象为模块，再通过 require 语句来引入
如：
```js
function myModule() {
  this.hello = function() {
    return 'hello!';
  }
}
module.exports = myModule;
```
>AMD （Asynchronous Module Definition）
特点: 
提倡依赖前置，在定义模块的时候就要声明其依赖的模块
如：
```js
require([module], callback);
```
>CMD (Common Module Definition)
CMD规范是国内SeaJS的推广过程中产生的 
提倡就近依赖（按需加载），在用到某个模块的时候再去require
```js
define(function (require, exports, module) {
  var one = require('./one')
  one.do()
// 就近依赖，按需加载
  var  two = require('./two')
  two.do() 
})
```
>UMD (Universal Module Definition)
AMD和CommonJS的结合,跨平台的解决方案,UMD先判断是否支持Node.js的模块（exports）是否存在，存在则使用Node.js模块模式。在判断是否支持AMD（define是否存在），存在则使用AMD方式加载模块
如：
```js
(function (window, factory) {
    if (typeof exports === 'object') {
        module.exports = factory();
    } else if (typeof define === 'function' && define.amd) {
        define(factory);
    } else {
        window.eventUtil = factory();
    }
})(this, function () {
    //module ...
});
```
>Module
原生ＪＳ(es6)解决方案
如:
```js
 export default myModule
 import myModule from './myModule'
 ```
 ##### 11、Call，apply，bind的使用与区别，如何实现一个bind？
>相同点:
都是使用于方法借用及明确this指向场景
第一个参数都是this要指向的对象
都可以利用后续参数传参
不同点:
参数传递方式不同
call,apply是立即调用,bind是动态调用
基本使用:
Array.prototype.slice.call(obj,0,1,2)
Array.prototype.slice.apply(obj,[0,1,2])
Array.prototype.slice.bind(obj)(0,1,2)
从上面的例子可以看出来call,apply 使用上几乎保持一致，而bind实际上是返回了一个函数
简易bind实现
```js
Function.prototype.bind = function(context){
    const _this = this
    return function() {
        _this.apply(context, Array.prototype.slice.call(arguments))
    }
}
```
>上面的bind只实现了方法的作用域绑定，参数已经固定，如果想要动态的参数我们得改写一下
```js
Function.prototype.bind = function(context){
    const _this = this
    const argus = Array.prototype.slice.apply(arguments,[1])
    return function() {
        _this.apply(context, argus.concat(Array.prototype.slice.call(arguments)))
    }
}
```
##### 12、前端的缓存有哪些？都适用什么场景？区别是什么？
>参考回答
前端缓存分为两部分:
http 缓存
浏览器缓存
http 缓存
强缓存
强缓存主要是采用响应头中的Cache-Control和Expires两个字段进行控制的
Cache-Control 值理解:
max-age 指定设置缓存最大的有效时间(单位为s) 
public 指定响应会被缓存，并且在多用户间共享 
private 响应只作为私有的缓存，不能在用户间共享 
no-cache 指定不缓存响应，表明资源不进行缓存 
no-store 绝对禁止缓存
Expires 理解:
缓存过期时间，用来指定资源到期的时间，是服务器端的具体的时间点, 需要和Last-modified结合使用
Last-modified 理解
服务器端文件的最后修改时间，需要和cache-control共同使用，是检查服务器端资源是否更新的一种方式
ETag 理解
根据实体内容生成一段hash字符串，标识资源的状态，由服务端产生。浏览器会将这串字符串传回服务器，验证资源是否已经修改
协商缓存(304)
协商缓存是指当强缓存机制如果检测到缓存失效，就需要进行服务器再验证
浏览器缓存
Cookie
LocalStorage
SessionStorage
Service Worker
Cookie
Cookie主要用于用户信息的存储, 容量为4KB
LocalStorage
LocalStorage的数据将一直保存在浏览器内，直到用户清除浏览器缓存数据为止, 容量为5MB
SessionStorage
SessionStorage的其他属性同LocalStorage, 不同是的当页面关闭时会随之清除
Service Worker
主要是为了提高web app的用户体验，可以实现离线应用消息推送等等一系列的功能, 可以看做是一个独立于浏览器的Javascript代理脚本, 在离线状态下也能提供基本的功能。 出于安全性的考虑，Service Worker 只能在https协议下使用
##### 13、Http常见状态码及其含义?
>http状态码分为5个大类
1** 信息相关
2** 请求成功
3** 重定向相关
4** 客户端错误相关，或无法完成请求
5** 服务端错误相关
301—永久移动。被请求的资源已被永久移动位置；
302—请求的资源现在临时从不同的 URI 响应请求；
305—使用代理。被请求的资源必须通过指定的代理才能被访问；
307—临时跳转。被请求的资源在临时从不同的URL响应请求；
400—错误请求；
402—需要付款。该状态码是为了将来可能的需求而预留的，用于一些数字货币或者是微支付；
403—禁止访问。服务器已经理解请求，但是拒绝执行它；
404—找不到对象。请求失败，资源不存在；
406—不可接受的。请求的资源的内容特性无法满足请求头中的条件，因而无法生成响应实体；
408—请求超时；
409—冲突。由于和被请求的资源的当前状态之间存在冲突，请求无法完成；
410—遗失的。被请求的资源在服务器上已经不再可用，而且没有任何已知的转发地址；
413—响应实体太大。服务器拒绝处理当前请求，请求超过服务器所能处理和允许的最大值。
417—期望失败。在请求头 Expect 中指定的预期内容无法被服务器满足；
418—我是一个茶壶。超文本咖啡罐控制协议，但是并没有被实际的HTTP服务器实现；
420—方法失效。
422—不可处理的实体。请求格式正确，但是由于含有语义错误，无法响应；
500—服务器内部错误。服务器遇到了一个未曾预料的状况，导致了它无法完成对请求的处理
##### 14、前端优化手段有哪些？
>静态资源合并压缩(js,css, images)
请求数量优化
Gzip压缩
带宽优化
CDN
就近节点，减少DNS查找
按需加载
lazyload
减少请求
骨架屏
优化白屏
web缓存
缓存ajax数据
减少重绘和重排
批量更新ＤＯＭ样式
页面结构
将样式表放在顶部，将脚本放在底部，尽早刷新文档的输出
##### 15、元素水平垂直居中的方式有哪些
>absolute加margin方案
fixed 加 margin 方案
display:table 方案
行内元素line-height方案
flex 弹性布局方案
transform 未知元素宽高解决方案
###### (1)、absolute加margin方案:
```
div{
        position: absolute;
        width: 100px;
        height: 100px;
        left: 50%;
        top: 50%:
        margin-top: -50px;
        margin-left: -50px;
    }
```
###### (2)、fixed 加 margin 方案
```
 div{
        position: fixed;
        width: 100px;
        height: 100px;
        top: 0;
        right:0;
        left: 0;
        bottom: 0;
        margin: auto;
    }
```
###### (3)、display:table 方案
```
div{
        display: table-cell;
        vertical-align: middle;
        text-align: center;
        width: 100px;
        height: 100px;
    }
```
###### (4)、行内元素line-height方案
```
div{
        text-align: center;
        line-height: 100px;
    }
```
###### (5)、flex 弹性布局方案
```
 div{
        display: flex;
        align-items: center;
        justify-content:center
    }
```
###### (6)、transform 未知元素宽高解决方案
```
 div{
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%)
    }
```
##### 16、var let const的区别及使用场景
>使用var声明的变量，其作用域为该语句所在的函数内，且存在变量提升现象，后面的覆盖前面的 
使用let声明的变量，其作用域为该语句所在的代码块内，不存在变量提升, 不能重复声明 
使用const声明的是常量，在后面出现的代码中不能再修改该常量的内存
##### 17、如何理解es6中的类？
>首先,JS作为一门非面向对象语言，在es6之前，并没有提供对类的支持，我们常用的做法是通过构造函数来模拟类的实现, 通过将属性及方法定义在原型上共享给其实例

>ES6 中的Class
es6中的class只是一个语法糖，class的写法只是让对象原型看起来更加清晰
每个类中都有一个constructor方法，如果没有显示定义， 会默认添加一个空的constructor，等同于ES5中的构造函数, 类的所有方法都是定义在类的prototype属性上面，二者的主要区别在于Class必须使用new调用, ES5中构造函数不使用new也可以调用, class 中新增静态方法(static)关键字, 静态方法不能被继承只有通过类本身来调用

>Extends 继承
class 也可以通过extends 关键字实现继承
extends 注意点
使用extends 继承时，子类构造函数中必须调用super(), 代表调用父类的构造函数
super虽然代码父类的constructor,但是返回的子类的实例
super作为函数调用时，代表类的构造函数
super作为对象调用时, 在普通方法中，指向父类的原型对象, 静态方法中指向父类
##### 18、如何理解es6中的Promise？
>参考回答
js是单线程的，也就是说一次只能完成一个任务，为了解决这个问题，js将任务的执行模式分为两种， 同步和异步, 在es5中我们处理异步只能通过的回调的方式进行处理，在多层异步中，回调会一层一层嵌套，也就是所谓的回调地狱，promise就是异步编程的一种解决方案

>Promise
特点:
对象的状态不受外界影响, promise对象代表一个异步操作，有三种状态pendding(进行中), fulfilled(成功), rejected(失败)
一旦状态改变，就不会再变, 状态的改变只有两种可能, pendding => fulfilled及pendding => rejected
基本用法:
```js
const promise = new Promise(function(resolve, reject){ 
// ... some code  
if
(
/* 异步操作成功 */
){
    resolve
(
value
);
// 将状态从pendding变成fulfilled
}
else
{
    reject
(
error
);
// 将状态从pendding变成rejected
}
});
```
>promise 生成实例后可以使用then方法接收resolved状态和rejected状态的回调函数
```js
promise.then(()=>{
console.log('resolved')
},()=>{
console.log('rejected')
})
```
>promise原型上具有catch方法， catch方法是rejection的别名， 用于指定发生错误时的回调函数

>promise原型上具有finally方法，用于不管promise对象最后的状态如何，都会执行的操作

>Promise.all方法用于将多个 Promise 实例，包装成一个新的 Promise 实例

```js
const p = Promise.all([p1,p2,p3...])
```
>特点:
参数都是promise实例，如果不是会调用promise.resolve方法将其转为promise实例
p的奖态由传入的promise实例的状态决定
promise实例状态都变成fulfilled,p状态为fulfilled
promise实例状态一个变成rejected,p状态为rejected

##### 19、如何理解es6中的Proxy？
>Proxy（代理） 定义
可以理解为为目标对象架设一层拦截，外界对该对象的访问，都必须通过这层拦截
简单示例:
```js
const obj = new Proxy
({}, {  
get
: (target, key, receiver) => {
return
'JS'
         console.log(
`get ${key}`
)
     },
set
: (target, key, value, receiver) => {
         console.log(
`set ${key}`
)
     },
 })
 obj.name = 'JS Proxy'
// set name
// JS Proxy
 obj.name 
// 这里进入get的回调函数，所有直接返回 JS 
```
>从上面的示例中可以看出，Proxy存在一种机制，可以对外界的读写操作进行改写
>Proxy 实例方法
proxy除了代理get,set操作，还能代理其它的操作，如下
```js
handler.getPrototypeOf()
// 在读取代理对象的原型时触发该操作，比如在执行 Object.getPrototypeOf(proxy) 时。
handler.setPrototypeOf()
// 在设置代理对象的原型时触发该操作，比如在执行 Object.setPrototypeOf(proxy, null) 时。
handler.isExtensible()
// 在判断一个代理对象是否是可扩展时触发该操作，比如在执行 Object.isExtensible(proxy) 时。
handler.preventExtensions()
// 在让一个代理对象不可扩展时触发该操作，比如在执行 Object.preventExtensions(proxy) 时。
handler.getOwnPropertyDescriptor()
// 在获取代理对象某个属性的属性描述时触发该操作，比如在执行 Object.getOwnPropertyDescriptor(proxy, "foo") 时。
handler.defineProperty()
// 在定义代理对象某个属性时的属性描述时触发该操作，比如在执行 Object.defineProperty(proxy, "foo", {}) 时。
handler.has()// 在判断代理对象是否拥有某个属性时触发该操作，比如在执行 "foo" in proxy 时。
handler.get()
// 在读取代理对象的某个属性时触发该操作，比如在执行 proxy.foo 时。
handler.set()
// 在给代理对象的某个属性赋值时触发该操作，比如在执行 proxy.foo = 1 时。
handler.deleteProperty()
// 在删除代理对象的某个属性时触发该操作，比如在执行 delete proxy.foo 时。
handler.ownKeys()
// 在获取代理对象的所有属性键时触发该操作，比如在执行 Object.getOwnPropertyNames(proxy) 时。
handler.apply()
// 在调用一个目标对象为函数的代理对象时触发该操作，比如在执行 proxy() 时。
handler.construct()
// 在给一个目标对象为构造函数的代理对象构造实例时触发该操作，比如在执行new proxy() 时。
```
>为什么要使用Proxy
拦截和监视外部对对象的访问
降低函数或类的复杂度
在复杂操作前对操作进行校验或对所需资源进行管理
##### 20、如何理解es6中的decorator？
>定义
Decorator是ES7中的提案，概念借鉴于python， 它作用于一个目标类为其添加属性于方法
我们用一个比喻来理解Decorator, 把孙悟空看成是一个类，那么棒子就是装饰器为其装备的武器
代码理解:
```js
@stick
class Monkey{
}
function stick(target){
// 第一个参数就是目标类的本身
target.ATK =100000
}
Monkey.ATK 
// 为悟空装备了棒子，攻击力提高了100000
// 如果一个参数不够用，可以在装饰器外层再包一层
function stick(atk){   
	return function(targt){
        target.ATK = atk
     }
}
@stick(200000)
// 这样我们就为悟空增加了200000攻击力
class Monkey{
}
```
>Decorator 不仅能修饰类，也能修饰类的方法
```js
class Monkey {
@setName
   name() {        
	this.name = '孙悟空'  
   }
}
```
>Decorator 只能修饰类及类的方法,不能修饰于函数,因为存在函数提升

>Mixin
在修饰器基础上，我们可以实现mixin(混入),意思在一个对象中混入另一个对象的方法
代码示例:
```js
export function mixins(...list) {  
	return function (target) {    
		Object.assign(target.prototype, ...list)  
	}
}
const skill = {
    shapeshifting() {
        console.log('72变')    
   }
}
@mixins(skill)
class Monkey {
}
Object.assign(Monkey.prototype, skill)
const swk = new Monkey()
swk.shapeshifting() 
// 72变
```
>使用Decorator的好处
扩展功能，相对于继承增加了更多的灵活性
代码可读性更高，装饰器正确命名相当于注释
##### 21、Es6中新增的数据类型有哪些？使用场景？
>es6中新增一种原始数据类型Symbol,最大的特点是唯一性，Symbol值通过Symbol函数生成, 在es5中对象的属性都是字符串，我们使用他人定义的对象，然后去新增自己的属性，这样容易起冲突覆盖原有的属性, Symbol也可以看成为一个字符串，不过这个字符能保证是独一无二的
基本示例:
```js
// Object
const obj ={
    name: 'JS'
}
obj.name = 'JS每日一题'
// Symbol
const name =Symbol('name') 
// 这里的参数没有特殊意义，可以看成为Symbol加了一个标记
obj[name] ='JS每日一题'
```
>Symbol用法
Symbol 目前有多种写法
```js
// 一
const title =Symbol()
const obj ={}
obj[title] = 'JS每日一题'
// 二
const obj = {    
[title]: 'JS每日一题'
}
// 三
Object.defineProperty(obj, title, {
 value: 'JS每日一题'
})
obj[title] 
// 输出的结果都为JS每日一题
这里注意一下，Symbol 做为属性名时，不能用点去读取
obj.title 
// undefined
```
>Symbol作为属性名，只有通过Object.getOwnPropertySymbols 方法返回
```js
const attrs = Object.getOwnPropertySymbols(obj)
// [Symbol[title]]
```
>Symbol.for()
如果我们想要重复Symbol可以使用Symbol.for， Smybol.for()及Smybol()的区别在于Symbol.for()会先去查找全局下有没有声明过，如果有就返回该值，没有就新建一个，Symbol()每一次调用都会新建一个
代码理解:
```js
const title = Symbol.for('JS每日一题')
....Symbol.for('JS每日一题')
//调用多次都是使用的第一次声明的值
Symbol.for('JS每日一题')  === Symbol.for('JS每日一题') // true
const title = Symbol('JS每日一题')
Symbol('JS每日一题') === Symbol('JS每日一题') // false
```
>总结
Symbol的特点
独一无二
不能隐式转换
不能与其它数据类型做运算
不能使用点运算符进行操作
ps: 今天答题的小伙伴多次都提到了map,set，，补充一下，新增的数据类型只有Symbol一种，map,set是新增的数据结构 ~_~

>持续更新中...[&copy;lzccheng](https://blog.csdn.net/angle_lzc)

