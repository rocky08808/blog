---
title: js基础面试题
date: 2022-04-22 12:04:06
tags:
 - javascript
 - 干货
categories: javascript
---

### 1、`undefined `和 `null`有什么区别？
相同：它们是属于虚值，可以使用`Boolean(value)`或`!!value`将其转换为布尔值时，值为`false`
区别：
`undefined`：是未指定特定值的变量的默认值，或者函数默认返回值
`null`：是“不代表任何值的值”。null是已明确定义给变量的值。
### 2、符号运算
`&&`：可作为if短路运算，满足左边条件才执行右边语句
`||`：可为变量赋值默认值
`+`：快速将右边值转为数字类型
`!!`：快速将右边值转为布尔值
### 3、什么是事件传播?
事件传播有三个阶段：
（1）捕获阶段：事件从 `window `开始，然后向下到每个元素，直到到达目标元素。
（2）目标阶段：事件已达到目标元素。
（3）冒泡阶段：事件从目标元素冒泡，然后上升到每个元素，直到到达 `window`。
+ `addEventListener`方法具有第三个可选参数`isCapture`，默认值为false
 + 当`isCapture`为`false`时，事件在冒泡阶段发生即从当前元素开始搜索并执行相同类型事件，直到`window`结束
+ 当`isCapture`为`true`时，事件在捕获阶段发生即从`window`开始搜索并执行相同类型事件，直到当前元素
### 4、`event.preventDefault()` 和 `event.stopPropagation()`方法之间有什么区别？
+ `event.preventDefault()` ：阻止元素默认事件
+ `vent.stopPropagation()`：阻止事件传播（冒泡和捕获）
### 5、`event.target` 和`event.currentTarget`的区别
```js
<div click="click">
	<button>button</button>
</div>
<script>
function click(event) {
	console.log(event.target) // button
	console.log(event.currentTarget) // div
}
</script>
```
+ `event.target`：当前触发事件的元素
+ `event.currentTarget`：当前绑定事件的元素
### 6、`==` 和 `===` 有什么区别
+ `==`：一般比较，会转换后比较，比较值
```js
1 == '1' // true  1 === Number('1')
null == undefined // true Boolean(null) === Boolean(undefined)
0 == false // true Boolean(0) === false
'1,2' == [1, 2] // true '1,2' === [1,2].toString()
'[object Object]' == {} // true '[object Object]' === {}.toString()
```
+ `===`：严格比较，比较类型和值，类型和值其中一个不同即为`false`
### 7、什么是作用域？
JavaScript 中的作用域是我们可以有效访问变量或函数的区域。JS 有三种类型的作用域：全局作用域、函数作用域和块作用域(ES6)。
+ 全局作用域：在全局命名空间中声明的变量或函数位于全局作用域中，因此在代码中的任何地方都可以访问它们。
+ 函数作用域：在函数中声明的变量、函数和参数可以在函数内部访问，但不能在函数外部访问。
+ 块作用域：在块{}中声明的变量（`let，const`）只能在其中访问。

作用域也是一组用于查找变量的规则。如果变量在当前作用域中不存在，它将向外部作用域中查找并搜索，如果该变量不存在，它将再次查找直到到达全局作用域，如果找到，则可以使用它，否则引发错误，这种查找过程也称为`作用域链`。
### 8、什么是提升？
提升：是用来描述变量和函数移动到其(全局或函数)作用域顶部的术语
>为了理解提升，需要来了解一下执行上下文。执行上下文是当前正在执行的“代码环境”。执行上下文有两个阶段:编译和执行。
>编译：在此阶段，JS 引荐获取所有函数声明并将其提升到其作用域的顶部，以便我们稍后可以引用它们并获取所有变量声明（使用var关键字进行声明），还会为它们提供默认值：`undefined`。
>执行：在这个阶段中，它将值赋给之前提升的变量，并执行或调用函数(对象中的方法)。
+ 注意：只有使用var声明的变量，或者函数声明才会被提升，相反，函数表达式或箭头函数，`let`和`const`声明的变量，这些都不会被提升。
### 9、什么是闭包？
闭包就是一个函数在声明时能够记住当前作用域、父函数作用域、及父函数作用域上的变量和参数的引用，直至通过作用域链上全局作用域，基本上闭包是在声明函数时创建的作用域。
### 10、JavaScript 中的虚值是什么？
```js
const list= ['', 0, null, undefined, NaN, false]
```
+ 简单的来说虚值就是是在转换为布尔值时变为 `false` 的值。
### 11、'use strict' 是干嘛用的？
"use strict" 是 ES5 特性，它使我们的代码在函数或整个脚本中处于严格模式。严格模式帮助我们在代码的早期避免 bug，并为其添加限制。
严格模式的一些限制：
+ 变量必须声明后再使用
+ 函数的参数不能有同名属性，否则报错
+ 不能使用`with`语句
+ 不能对只读属性赋值，否则报错
+ 不能使用前缀 0 表示八进制数，否则报错
+ 不能删除不可删除的属性，否则报错
+ 不能删除变量`delete prop`，会报错，只能删除属性`deleteglobal[prop]`
+ `eval`不能在它的外层作用域引入变量
+ `eval`和`arguments`不能被重新赋值
+ `arguments`不会自动反映函数参数的变化
+ 不能使用`arguments.callee`
+ 不能使用`arguments.caller`
+ 禁止`this`指向全局对象
+ 不能使用`fn.caller`和`fn.arguments`获取函数调用的堆栈
+ 增加了保留字（比如`protected、static`和`interface`）

设立”严格模式”的目的，主要有以下几个：
+ 消除Javascript语法的一些不合理、不严谨之处，减少一些怪异行为;
+ 消除代码运行的一些不安全之处，保证代码运行的安全；
+ 提高编译器效率，增加运行速度；
+ 为未来新版本的Javascript做好铺垫。
###  12、JavaScript 中 `this` 值是什么？
`this`指的是当前正在执行或调用该函数的对象的值。`this`值的变化取决于我们使用它的上下文和我们在哪里使用它。
+ 箭头函数没有自己的 `this`
+ apply和call可以改变`this`的指向
+ 在全局作用域内声明的函数，对象内部方法中的匿名函数和内部函数的this具有默认值，该值指向window对象。
### 13、什么是 IIFE，它的用途是什么？
IIFE或立即调用的函数表达式是在创建或声明后将被调用或执行的函数。创建IIFE的语法是，将function (){}包裹在在括号()内，然后再用另一个括号()调用它，如：(function(){})()
+ IIFE的一个主要作用是避免与全局作用域内的其他变量命名冲突或污染全局命名空间
### 14、`call、apply、bind`的区别
`call`和`apply`：调用一个指定`this`值的函数，`call`传的是参数列表，`apply`传的是数组
`bind`：创建一个新的函数并指定`this`值，传参和`call`都是参数列表
### 15、`arguments` 的对象是什么？
`arguments`对象是函数中传递的参数值的集合。它是一个类似数组的对象，因为它有一个`length`属性，我们可以使用数组索引表示法`arguments[1]`来访问单个值，但它没有数组中的内置方法，如：`forEach、reduce、filter和map`
+ 可以使用`Array.prototype.slice`将`arguments`对象转换成一个数组
```js
Array.prototype.slice.call(arguments)
```
+ 箭头函数中没有arguments对象。
### 16、ES6或ECMAScript 2015有哪些新特性？
+ 箭头函数
+ 类
+ 模板字符串
+ 加强的对象字面量
+ 对象解构
+ `Promise`
+ 生成器
+ 模块
+ `Symbol`
+ 代理
+ `Set`
+ 函数默认参数
+ `rest` 和展开
+ 块作用域
### 17、`var`,`let`和`const`的区别是什么？
+ 全局作用域下`var`声明的变量会挂载在`window`上，而`let`和`const`声明的变量不会
+ `var`声明变量存在变量提升，`let`和`const`不存在变量提升
+ `let`和`const`声明形成块作用域
+ 同一作用域下`let`和`const`不能声明同名变量，而`var`可以
+ 暂存死区
```js
var a = 100;

if(1){
    a = 10;
    //在当前块作用域中存在a使用let/const声明的情况下，给a赋值10时，只会在当前作用域找变量a，
    // 而这时，还未到声明时候，所以控制台Error:a is not defined
    let a = 1;
}
```
+ const
> + 一旦声明必须赋值,不能使用null占位。
> + 声明后不能再修改
> + 如果声明的是复合类型数据，可以修改其属性
### 18、什么是箭头函数？
+ 箭头函数表达式的语法比函数表达式更简洁
+ 没有自己的this，arguments，super或new.target
+ 不能用作构造函数
### 19、什么是类？
类(class)是在 JS 中编写构造函数的新方法。它是使用构造函数的语法糖，在底层中使用仍然是原型和基于原型的继承。
### 20、什么是 ES6 模块？
+ es5 commonjs：module.exports/exports[prop]导出，require导入
+ es6 模块：export default/export 导出，import导入
### 21、什么是`Set`对象，它是如何工作的？
`Set` 对象允许你存储任何类型的唯一值，无论是原始值或者是对象引用
+ `add`方法：向`Set`实例中添加一个新值
+ `has`方法：检查`Set`实例中是否存在特定的值。
+ `size`属性：获得`Set`实例的长度
+ `clear`方法：清楚`Set`实例的数据
+ 由于存储的是唯一值，传入数组，可以对数组去重
###  22、Promise 是什么？
`promise`是异步编程的一种解决方案，从语法上讲，`promise`是一个对象
有三种状态，状态一旦改变，就不会再变
+ pending(等待态）
+ fulfiled(成功态)
+ rejected(失败态)

创造promise实例后，它会立即执行。
### 23、什么是 `async/await` 及其如何工作？
async/await是 JS 中编写异步或非阻塞代码的新方法。它建立在Promises之上，让异步代码的可读性和简洁度都更高。
+ 使用 async关键声明函数会隐式返回一个Promise
+ await关键字只能在async function中使用。在任何非async function的函数中使用await关键字都会抛出错误。await关键字在执行下一行代码之前等待右侧表达式(可能是一个Promise)返回。
### 24、展开(spread )运算符和 剩余(Rest) 运算符有什么区别？
```js
const obj = { a: 1, b: 2, c: 3 } 
const bObj = { ...obj } // 展开(spread )运算符
cosnt { a, ...rest } = obj // 剩余(Rest) 运算符
```
### 25、什么是包装对象（wrapper object）？
JS数据类型被分为两大类，基本类型和引用类型。
+ 基本类型：Undefined,Null,Boolean,Number,String,Symbol,BigInt
+ 引用类型：Object,Array,Date,RegExp等，说白了就是对象。

除null和undefined之外的每个基本类型都有自己包装对象。
```js
let name = "marko";

console.log(typeof name); // "string"
console.log(name.toUpperCase()); // "MARKO"  
// new String(name).toUpperCase()  
// 基本类型的值被临时转换或强制转换为对象
// 在完成访问属性或调用方法之后，新创建的对象将立即被丢弃。
```
### 26、什么是`NaN`？以及如何检查值是否为`NaN`？
`NaN`表示“非数字”是 JS 中的一个值，该值是将数字转换或执行为非数字值的运算结果，因此结果为`NaN`
+ 在 JS 中，`NaN`是唯一的值，它不等于自己
+ JS 有一个内置的`isNaN`方法，用于测试值是否为`isNaN`值，但是这个函数有一个奇怪的行为，建议使用`Number.isNaN`
```js
console.log(isNaN()); // true
console.log(isNaN(undefined)); // true
console.log(isNaN({})); // true
console.log(isNaN(String('a'))); // true
console.log(isNaN(() => { })); // true
```
可以使用自己的辅助函数：
```js
function isNaN(val) {
	return val !== val
}
```
### 27、如何检查对象中是否存在某个属性
+ 使用`in`操作符，包括原型上的属性
```js
const o = { 
  "prop" : "bwahahah",
  "prop2" : "hweasa"
};

console.log("prop" in o); // true
console.log("prop1" in o); // false
```
+ `hasOwnProperty` 方法：对象自身的属性，不包括原型上的
+ `obj[pro]`为`undefined`则不存在
### 28、函数表达式和函数声明之间有什么区别？
函数声明会将函数提升到作用域的顶部，函数表达式不会
```js
console.log(fn) // function() {}
console.log(fn2) // undefined
var fn = function() {}
var fn2 = functiion() {}
```
### 29、`new` 关键字有什么作用？
`new`关键字做了4件事:
+ 创建空对象` {}`
+ 将空对象分配给 `this` 值
+ 将空对象的`proto`指向构造函数的`prototype`
+ 如果没有使用显式`return`语句，则返回`this`

看下面事例：
```ks
function Person() {
 this.name = 'lai'
}
```
根据上面描述的，`new Person()`做了：
+ 创建一个空对象：`var obj = {}`
+ 将空对象分配给 `this` 值：`this = obj`
+ 将空对象的`proto__`指向构造函数的`prototype`：`this.__proto = Person().prototype`
+ 返回`this`: `return this`