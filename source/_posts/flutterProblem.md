---
title: flutter填坑记
date: 2022-04-21 17:45:15
tags:
 - flutter
 - dart
categories: flutter
---
### 1、
environment:
  sdk: ">=2.12.0 <3.0.0"
该版本默认开启了空安全校验
假如有包不支持空安全
在flutter run时会报错： Cannot run with sound null safety, because the following dependencies don't support null safety
>解决方案： 增加参数： --no-sound-null-safety
```bash
flutter run --no-sound-null-safety
```
### 2、
图片路径配置时，只支持当前文件夹下的图片，读取不到子文件夹的图片
```dart
assets:
  - lib/assets/images/  // 只能读取images下的图片，读取不到- lib/assets/images/login/下的图片
```
### 3、
bottomNavigationBar设置4个及更多会变白色
>解决方案： BottomNavigationBar的type设置BottomNavigationBarType.fixed

```dart
 type: BottomNavigationBarType.fixed,
```
### 4、
AppBar的titleTextStyle不生效
>解决方案： AppBar设置backwardsCompatibility: false,
### 5、
AppBar的leading换行
>解决方案： AppBar设置leadingWidth: 200
### 6、
http中文乱码
>解决方案： 
```dart
import 'dart:convert';
Utf8Decoder().convert(res.bodyBytes)
```
### 7、
http的headers加上'content-type': 'application/json;charset=UTF-8'时需要对post请求body进行jsonEncode
>解决方案：
```dart
body: jsonEncode(body??{})
```
### 8、
主题色primarySwatch接收的是MaterialColor，自定义16进制颜色需要自己实现转换返回MaterialColor
>解决方案： 
```dart
// color 转换
static createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
// 使用
theme: ThemeData(
        primarySwatch: createMaterialColor(ColorUtil.color('4BA8A1')),
      ),
```
### 9、
http拦截需要无context转跳
>解决方案： 利用GlobalKey<NavigatorState>绑定在MaterialApp的navigatorKey上进行转跳
代码：
```dart
// 步骤1、
class $navigator {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }
}
// 步骤2、设置MaterialApp的navigatorKey为$navigator.navigatorKey
MaterialApp
  navigatorKey: $navigator.navigatorKey,
// 步骤3、引入并调用$navigator.navigateTo('login');
```