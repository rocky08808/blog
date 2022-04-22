---
title: vue进阶问题
date: 2022-04-22 12:09:27
tags:
 - javascript
 - 干货
 - vue
categories:
 - javascript
---
##### 1.为什么要使用vue？
>重点考察对vue的特性了解，三大框架的优缺点对比，以及跟传统操作dom的区别
##### 2.vue有哪些生命周期及其使用场景？
##### 3.vue-router中keepalive怎么理解？
>keep-alive是vue源码中实现的一个组件, 感兴趣的可以研究源码 https://github.com/vuejs/vue/blob/dev/src/core/components/keep-alive.js

>什么是keepalive
我们平时开发中, 总有部分组件没有必要多次init, 我们需要将组件进行持久化，使组件状态维持不变，在下一次展示时， 也不会进行重新init
keepalive音译过来就是保持活着, 所以在vue中我们可以使用keepalive来进行组件缓存
基本使用

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190219140738851.png)
>上面提到被keepalive包含的组件不会被再次init，也就意味着不会重走生命周期函数, 但是平常工作中很多业务场景是希望我们缓存的组件在再次渲染的能做一些事情,vue为keepalive提供了两个额外的hook
activated 当keepalive包含的组件再次渲染的时候触发
deactivated 当keepalive包含的组件销毁的时候触发
注: 2.1.0 版本后keepalive包含但被exclude排除的组件不会有以上两个hook
参数
keepalive可以接收3个属性做为参数进行匹配对应的组件进行缓存
include 包含的组件
exclude 排除的组件
max 缓存组件的最大值
其中include,exclude可以为字符，数组，以及正则表达式
max 类型为字符或者数字
代码理解

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190219140854442.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FuZ2xlX2x6Yw==,size_16,color_FFFFFF,t_70)
>配合router使用

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190219140936526.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FuZ2xlX2x6Yw==,size_16,color_FFFFFF,t_70)
>总结
keepalive是一个抽象组件，缓存vnode，缓存的组件不会被mounted，为此提供activated 和 deactivated 钩子函数, 使用props max 可以控制缓存组件个数

##### 4.Vue.use中都发生了什么？
>源码地址: https://github.com/vuejs/vue/blob/dev/src/core/global-api/use.js

>定义
vue.use()往全局注入一个插件，供全局真接使用, 不需要单独引用
代码理解:

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190219141134298.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FuZ2xlX2x6Yw==,size_16,color_FFFFFF,t_70)
>理解了其基本使用及作用，我们来看一下vue.use中都发生了什么
源码很少，所以直接摘抄了

![在这里插入图片描述](https://img-blog.csdnimg.cn/2019021914120826.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FuZ2xlX2x6Yw==,size_16,color_FFFFFF,t_70)
>结合代码理解

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190219141238472.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FuZ2xlX2x6Yw==,size_16,color_FFFFFF,t_70)
>总结
vue.use()为注册全局插件所用，接收函数或者一个包含install属性的对象为参数，如果参数带有install就执行install, 如果没有就直接将参数当install执行, 第一个参数始终为vue对象, 注册过的插件不会重新注册
##### 5.New vue()中发生了什么？
>先从语法上分析，new关键字在js语言中代表实例化一个对象, 而Vue实际上是一个类, 我们简单看一下源码，源码地址 https://github.com/vuejs/vue/blob/dev/src/core/instance/index.js

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190219141427419.png)
>接着我们追踪至_init函数，源码地址 https://github.com/vuejs/vue/blob/dev/src/core/instance/init.js

![在这里插入图片描述](https://img-blog.csdnimg.cn/2019021914195930.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FuZ2xlX2x6Yw==,size_16,color_FFFFFF,t_70)![在这里插入图片描述](https://img-blog.csdnimg.cn/20190219142043510.png)
>从上面的代码我们看见_init很清淅的干了几件事, 合并相关配置, 初始化生命周期，初始化事件中心，初始化渲染，初始化 data、props、computed、watcher 等
题外话
Vue初始化逻辑非常清淅，把不同的功能拆成一些单独的函数执行，这种思想值得借鉴和学习
##### 6.Vue.js的template编译过程？
##### 7.Vue中的nextTick如何理解？
>讲在前面: 在vue中，数据发生变化之后DOM并不会立即变化，而是等同一事件循环中的所有数据变化完成之后，再统一进行视图更新，代码理解

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190219142549957.png)
>nextTick什么情况下会触发
在同一事件循环中的数据变化后，DOM更新完成, 执行nextTick(callback)内的回调
对事件循环不理解的可以点这里
vue中nextTick的实现 ，源码地址 https://github.com/vuejs/vue/blob/dev/src/core/util/next-tick.js

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190219142704534.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FuZ2xlX2x6Yw==,size_16,color_FFFFFF,t_70)
>总结
数据的变化到 DOM 的重新渲染是一个异步过程, 我们必须在 nextTick 后执行DOM相关的操作
##### 8.Vue-router有哪些钩子？使用场景？
>前面我们用大白话讲过什么是钩子，这里在重复一下，就是在什么什么之前,什么什么之后,英文叫hooks,专业点叫生命周期，装逼点可以叫守卫...
vue-router中也存在钩子的概念,分为三步记忆
全局守卫
路由独享守卫
组件独享守卫
全局守卫
很好理解，全局守卫就是能监听到全局的router动作
router.beforeEach 路由前置时触发![在这里插入图片描述](https://img-blog.csdnimg.cn/20190219142855100.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FuZ2xlX2x6Yw==,size_16,color_FFFFFF,t_70)
>组件独享守卫
组件内新一个守卫, beforeRouteUpdate,在组件可以被复用的情况下触发，如 /demo/:id, 在/demo/1 跳转/demo/2的时候，/demo 可以被复用，这时会触发beforeRouteUpdate

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190219143045407.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L2FuZ2xlX2x6Yw==,size_16,color_FFFFFF,t_70)
>注意在beforeRouteEnter前不能拿到当前组件的this，因为组件还有被创建，我们可以通过next(vm => {console.log(vm)}) 回传当前组件的this进行一些逻辑操作
>使用场景
路由进入前最典型的可以做一些权限控制, 路由离开时清除或存储一些信息,任务等等
总结
vue-router中钩子分为全局的，局部的，以及组件三种形式, 他们都有前置守卫以及后置守卫, 其中组件的前置守卫不能拿到当前组件的this，因组件还没有被创建，可以通过next的参数进行回传this，前置守卫必须调用next方法，否则不会进入下一个管道
##### 9.什么情况下适合使合vuex？ Vuex使用中有几个步骤?

>持续更新中...
