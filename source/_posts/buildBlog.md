---
title: 快速搭建博客
date: 2022-04-21 16:26:16
categories: 教程文档
tags: 
 - 快速搭建博客
 - 教程文档
comments: true
---

### 现成框架hexo
#### 文档地址：[https://hexo.io/](https://hexo.io/)
1、安装hexo-cli
```bash
npm i hexo-cli -g
```
2、创建项目
```bash
hexo init <folder>
cd <folder>
npm install
```

生成的是默认的主题，可自行更换主题，[https://hexo.io/themes/](https://hexo.io/themes/)

3、生成新文章
```bash
hexo new [layout] <title>
```
即可生成新文章，可在source目录下找到对应title名字的md文件，自行编辑即可，想了解更详细可访问文档[https://hexo.io](https://hexo.io)

md文件顶部基本属性：
```bash
---
title: 文章标题  // 标题
date: 1970-01-01 00:00:00  // 时间
categories: Demo  // 分类
tags:  // 标签
- Tag0
- Tag1
- Tag2
sticky: 100  // (number)重要的文章，把它们置顶吧！数字越大优先级越高哦~
pic:  // 可以指定这篇文章是否使用自定义的缩略图名称（在文章资源文件夹内），而不是使用随机化的图标
comments: true  // (true/false)是否为单篇文章指定开启或关闭评论区
toc: true  // (true/false)该文章是否需要生成目录
only:  // 指定文章显示的位置，有以下关键词：
- home  // 在首页显示
- category  // 在分类页显示
- tag  // 在标签页显示 留空或是不配置此项，则文章在所有该出现的位置都会显示。 层级之间相互平等，没有覆盖关系。 特别地，如果配置了此项，但是使用的并不是以上的关键词（例如只留了一个- none，那么文章就被隐藏起来了）
---
```


推荐主题：[https://github.com/Candinya/Kratos-Rebirth](https://github.com/Candinya/Kratos-Rebirth)

> 该主题自带鼠标点击效果