---
title: flutter
date: 2022-04-21 16:07:38
tags:
 - flutter
 - dart
categories: flutter
---

### 基础入门
dart：
类型： `num、int、double、String、void、dynamic、set、list、map（Numbers、Strings、Booleans、Lists、Sets、Maps、Runes、Symbels、null）`
定义变量： `var、const、final`
字符串插值： `$变量、${变量}`
`?./??/泛型/minxins、`

空安全：
1、
可空（?）类型的使用：

我们可以通过将?跟在类型的后面来表示它后面的变量或参数可接受Null：
```dart
class CommonModel {
  String? firstName; //可空的成员变量
  int getNameLen(String? lastName /*可空的参数*/) {
    int firstLen = firstName?.length ?? 0;
    int lastLen = lastName?.length ?? 0;
    return firstLen + lastLen;
  }
}
```
对于可空的变量或参数在使用的时候需要通过Dart 的避空运算符?.来进行访问，否则会抛出编译错误。
2、
当程序启用空安全后，类的成员变量默认是不可空的，所以对于一个非空的成员变量需要指定其初始化方式：
```dart
class CommonModel {
  List names=[];//定义时初始化
  final List colors;//在构造方法中初始化
  late List urls;//延时初始化
  CommonModel(this.colors);
```
3、
延迟初始化（late）的使用
对于无法在定义时进行初始化，并且又想避免使用?.，那么延迟初始化可以帮到你。通过late修饰的变量，可以让开发者选择初始化的时机，并且在使用这个变量时可以不用?.。
```dart
  late List urls;//延时初始化
  setUrls(List urls){
    this.urls=urls;
  }
  int getUrlLen(){
    return urls.length;
  }
```
延时初始化虽然能为我们编码带来一定便利，但如果使用不当会带来空异常的问题，所以在使用的时候一定保证赋值和访问的顺序，切莫颠倒。
4、
State的空安全适配
State的空安全适配主要是根据它的成员变量是否可空进行分类：

可空的变量：通过?进行修饰
不可空的变量：可采用以下两种方式进行适配
定义时初始化
使用late修饰为延时变量

## flutter 组件库：[https://api.flutter.dev/flutter/painting/Accumulator-class.html](https://api.flutter.dev/flutter/painting/Accumulator-class.html)


## flutter 中文书： [https://book.flutterchina.club/preface.html](https://book.flutterchina.club/preface.html)
## flutter 功能例子： [https://ducafecat.tech/](https://ducafecat.tech/)

flutter组件： 
===
属性：
```dart
width: 172,  // 宽
height: 66,  // 高
margin: EdgeInsets.only(top: 15),  // margin  EdgeInsets
padding: EdgeInsets.only(top: 12, left: 30), // padding  EdgeInsets
decoration: BoxDecoration(
  color: Colors.white,  // 颜色或者背景色  Colors
  borderRadius: BorderRadius.circular(10),  // 圆角  BorderRadius
  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),  // 设置上左和上右的圆角
  border: Border.all(width: 3, style: BorderStyle.solid, color: ColorUtil.color('#EDEFF8'))  // 边框  Border  BorderStyle
  border: Border(left: BorderSide(color: ColorUtil.color('ECEDF4'), width: 3))  // 左边border  BorderSide，
  image: DecorationImage(  // 背景图设置  DecorationImage
    image: AssetImage('${imgPath}detail_bg.png'),  // 图片
    fit: BoxFit.fill,  // 填充方式
  ),
  gradient: LinearGradient(  // 渐变
    begin: Alignment.topCenter,  // 开始渐变方向
    end: Alignment.bottomCenter,  // 结束方向
    colors: [
       ColorUtil.color('80DDD8'),  // 开始颜色
       ColorUtil.color('448F87'),  // 结束颜色
    ]
  )
),
```
===
状态组件： 
```dart
StatefulWidget： 
@override
createState

MaterialApp/Scaffold/AppBar/BottomNavigationBar/RefeshInddcator/Image/TextField/PageView

StatelessWidget
@override
Widget build(BuildContext context)

Container/Text/Icon/CloseButton/BackButton/Chip/Divider/Card/AlertDialog
```
===
布局相关组件
```dart
Container
RenderObjectWidget: 
   SingleChildRenderObjectWidget: Opacity/ClipOval/ClipRRect/PhysicalModel/Align/Center/Padding/SizeBox/FranctionallySizeBox： widthFactor: 1/
   MultiChildRenderObjectWidget: Stack/Flex/Column/Row/Wrap/Flow
ParentDataWidget: Positioned/Flexible/Expanded
```
===
app组件： 
```dart
MaterialApp: title、theme、home、routes： Map<String, WidgetBuilder> routes;
```
===
页面组件： 
```dart
Scaffold: appBar、body
```
===
顶部导航： 
```dart
AppBar: title、leading、centerTitle
```
===
span： 
```dart
Text: text、style
```
===
button: 
```dart
TextButton: onPressed、child  // 文本按钮
IconButton: onPressed、icon  // 图标按钮
ElevatedButton: onPressed、child
BackButton: onPressed、color // 返回按钮
FloatingActionButton: onPressed、tooltip、child  // 浮动按钮
```
===
```dart
div: 
Row: children
Column: children
ListView: children // 移除padding： MediaQuery.removePadding(context: context, removeTop: true, child: Widget)
Container: child
Center:
Container({
  this.alignment, // Alignment.center,
  this.padding, //容器内补白，属于decoration的装饰范围  EdgeInsets.all(10), EdgeInsets: all、fromLTRB、only
  Color color, // 背景色
  Decoration decoration, // 背景装饰 decoration: BoxDecoration(color: Colors.purple, borderRadius: BorderRadius.circular(50)),
  Decoration foregroundDecoration, //前景装饰
  double width,//容器的宽度
  double height, //容器的高度
  BoxConstraints constraints, //容器大小的限制条件
  this.margin,//容器外补白，不属于decoration的装饰范围 EdgeInsets.fromLTRB(10, 50, 10, 30),
  this.transform, //变换
  this.child,
  ...
})
Padding： padding: EdgeInsets.all(18), child
```
* form表单：
```dart
final _formKey = GlobalKey<FormState>();
Form
  key: _formKey,
  TextFormField
  TextFormField(
		autovalidateMode: AutovalidateMode.always, // 是否字段校验
		validator: (val) {},  // 校验函数
                onSaved: (val) {  }, // 运行_formKey.currentState.save()时会被调用
              obscureText: obscureText, // 是否是密码框
              decoration: InputDecoration(
                hintText: hintText, // placeholder
                hintStyle: TextStyle(color: ColorUtil.color('#99A0B1')), // placeholder 样式
                border: InputBorder.none, // 边框
              ),
            )
```
* 表单提交：
```dart 
var _formState = _formKey.currentState;
if (_formState!.validate()) {
  _formState.save(); // 会调用TextFormField的onSaved方法，可用于保存数据
  print('validate ==== $_params');
}
```
* Image
```dart
// assets 本地图片、network 网络图片、memory、file
// base64图片：
Image.memory(Base64Decoder().convert($base64))
```
* swiper:
```dart
PageView: children
```
* flex:
```dart
Wrap: children
```
* flutter路由：
```dart
//导航路由 
Navigator: push、pop、pushNamed、replace、popUntil  
1、Navigator.push(BuildContext context, Route route)等价于Navigator.of(context).push(Route route)
2、路由传参
// 命名路由传参
Navigator.of(context).pushNamed("new_page", arguments: "hi");
//获取路由参数  
 var args=ModalRoute.of(context).settings.arguments;

        Navigator.push( 
          context,
          MaterialPageRoute(builder: (context) {
            return NewRoute();
          }),
        );
```
* fluter 事件
```dart
GusturDetector: onTop 点击/onLongPress 长按/onDoubleTap 双击/onTapCalcel 取消/onTapUp 松开/onTapDown 按下/onPanUpdate 拖动时触发，等同onMove事件
```

* 图片资源
```dart
// 本地：
1、在pubspec.yaml下导入
flutter:
  assets:
    - assets/my_icon.png
2、使用
Image( image: AssetsImage('assets/my_icon.png') ) / Image.assets('assets/my_icon.png')
// 网络图片：
Image( image: NetWorkImage(url) ) / Image.network(url)
```
* 打开第三方App
```dart
// 使用包url_launcher
var isOk = await canLaunch(url);
isOk ? launch(url) : $tips('打开失败');
```
* 生命周期
```dart
StatelessWidget只有createElement和build两个生命周期
StatefulWidget:
1、初始化
  createState、initState
2、更新期
  didChangeDependencies  // mounted
  build  // 
  didUpdateWidget
3、销毁期
  deactivcate、dispose
```
// 应用生命周期
进入前台
进入后台
挂起

* 动态修改主题
```dart
MaterialApp
  theme: ThemeData({ 
	brightness: Brightness.dark // dark 夜间模式、light 日间模式,
	primarySwatch: Colors.blue // 主题色
  })
```
* 自定义字体
```dart
// 1、下载并引入字体
pubspec.yaml
  fonts:
    - family: $fontName // 字体库名
        - asset: $Path // 字体路径
// 2、使用字体
//   全局使用：
    MaterialApp
      theme: ThemeData({ fontFamily: $fontName // 字体库名 })
//   局部使用：
    Text('mssage', style: TextStyle(fontFamily: $fontName // 字体库名))
```
* 选择手机图片 使用包： image_picker  // 需要兼容Android X配置

* 轮播swiper
```dart
// 使用包： flutter_swiper
            Swiper(
                itemCount: _images.length,
                autoplay: true,
                itemBuilder: (BuildContext context, i) {
                  return Image.network(_images[i], fit: BoxFit.fill,);
                },
                pagination: const SwiperPagination(builder: SwiperPagination.dots),
            )
// 移除padding： MediaQuery.removePadding(context: context, removeTop: true, child: Widget)
// 滚动监听： NotificationListener(onNotifation: (scrollNotication) {
  // scrollNotication is ScrollUpdateNavification 滚动是否更新条件
  // scrollNotication.depth == 0 监听child深度数条件
  if (scrollNotication is ScrollUpdateNavification && scrollNotication.depth == 0) { _onScroll(scrollNotication.metries.pixels) }
}, child: Widget)
```
* http网络请求 使用包： http、dart:convert

* 异步： Future、FutureBuilder
```dart
// 链式调用： 
Future: 
then // then((res){}, (err) {})
catchError // catchError((err) {}) 错误捕获
whenComplete // whenComplete((){}) 完成是调用
timeout // timeout(Duration({ seconds: 10 })) 超时设置
new Future.timeout(Duration({ secounds: 3 })).then().catchError((err){}).whenComplete((){})

FutureBuilder<T>： 
  future: Future,
  builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
    switch(snapshot.connectionState) {
      case: ConnectionState.waiting:
        // 等待状态
        return const CircularProgressIndicator();  // 返回loading Widget
    }
  }
```

* 加载中...loading Widget: CircularProgressIndicator

* shared_preferences本地存储
```dart
// shared_preferences包
final prefs = await SharedPreferences.getInstance(); // 获取实例
await prefs.setString('token', DateTime.now().toString()); // 设置setInt、setString等
final token = prefs.getString('token') ?? ''; // 获取getInt、getString等
prefs.remove('token') // 移除
```
* Toast 提示
```dart
// 使用包： fluttertoast // 若报错重启应用
_tips(msg) {
    Fluttertoast.showToast(
      msg: msg,
      gravity: ToastGravity.CENTER,
      backgroundColor: Color.fromRGBO(0, 0, 0, 0.7)
      // toastLength: Toast.LENGTH_LONG,
      // timeInSecForIos: 1,
    );
  }
```
* 解决中文乱码
```dart
import 'dart:convert';
Utf8Decoder().convert(res.bodyBytes
```
* ListView 水平滚动
```dart
ListView(
  scrollDirection: Axis.horizontal,  // 滚动方向
  children: []
)
```
* 下拉刷新上拉加载功能
```dart
// 下拉刷新：
RefreshIndicator，它是一个下拉刷新的widget，通过它我们可以实现列表的下拉刷新。
RefreshIndicator(
          onRefresh: _handleRefresh, // 接收一个Future返回值函数： Future<Null> _handleRefresh() async {}
          child: ListView(
            children: _buildList(),
          ),
        )
```
* 上拉加载：
```dart
// 步骤1、定义滚动controllor
ScrollControllor _scrollControllor = ScrollControllor（）；
// 步骤2、初始化时添加监听事件
@override
initState(){
  _scrollControllor.addListener(() {
    if (_scrollControllor.position.pixels == _scrollControllor.position.maxScrollExtent) {
       _loadData()  // 上拉到底是执行
    }
  });
}
// 步骤3、给ListView设置controller 
ListView(
  controllor: _scrollControllor,
  children: []
)
// 步骤4、销毁_scrollControllor

@override
dispose() {
  _scrollControllor.dispose();
}
```

* ExpansionTile展开收起效果组件
```dart
ExpansionTile（
  title: Widget,
  children: []
）
```

* GridView 网格布局
```dart
GridView.count(
  crossAxisCount: 3, // 多少列
  children: []
)
```

* 复制到粘贴板
```dart
import 'package:flutter/services.dart';
() async {
   await Clipboard.setData(ClipboardData(text: e['domainUrl'])); // 复制操作
   $tips('复制成功');
}
```

* uri转义空格、&、#等
```dart
Uri.encodeFull(String)
Uri.encodeComponent(String)
```

* 时间 DateTime
```dart
DateTime.now().millisecondsSinceEpoch  // 获取时间戳
时间格式化包： intl
import 'package:intl/intl.dart';
var date = DateTime.now();
var dd = DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
```
* 时间选择 showDatePicker 返回DateTime
```dart
var startTime = await showDatePicker(
            context: context,
            helpText: '开始时间',
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2023)
          );
```
* 时间范围选择 showDateRangePicker返回DateRangerTime取start和end属性是DateTime类型
```dart
var dateRange = await showDateRangePicker(
            context: context,
              helpText: '选择时间',
              saveText: '确定',
              firstDate: DateTime(2020),
              lastDate: DateTime(2023)
          );
```
* toast、loading包： flutter_easyloading
```dart
EasyLoading.showToast(msg); // 提示，showSuccess、showError、showInfo、showProg
ress
EasyLoading.show(  // 显示loading
      status: '加载中...'
    );
EasyLoading.dismiss(); // 关闭loading
```

* lading组件包： m_loading、flutter_spinkit

* 中文配置
```dart
// 1、
dependencies:
  flutter_localizations:
    sdk: flutter
// 2、main.dart
import 'package:flutter_localizations/flutter_localizations.dart';
MaterialApp
  localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ]
```
> 手机语言设置成中文即可显示中文

* 页面缓存
```dart
class $keepAlive extends StatefulWidget {
  const $keepAlive({
    Key? key,
    this.keepAlive = true,
    required this.child,
  }) : super(key: key);
  final bool keepAlive;
  final Widget child;

  @override
  _$keepAliveWrapperState createState() => _$keepAliveWrapperState();
}

class _$keepAliveWrapperState extends State<$keepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  void didUpdateWidget(covariant $keepAlive oldWidget) {
    if(oldWidget.keepAlive != widget.keepAlive) {
      // keepAlive 状态需要更新，实现在 AutomaticKeepAliveClientMixin 中
      updateKeepAlive();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  bool get wantKeepAlive => widget.keepAlive;
}
```
* 屏幕适配 flutter_screenutil

* table只加内部边框，用Container包一下可以给table加上borderRadius
```dart
Table(
  border: TableBorder.symmetric(
     inside: BorderSide(color: boderColor),  // 只加内部边框
  ),
  defaultVerticalAlignment: TableCellVerticalAlignment.middle,  // 垂直方向对齐方式
```
* drawer 侧边弹出框
```dart
// 1、创建一个globle key 用于打开drawer
final key = GlobalKey<ScaffoldState>();
// 2、添加drawer
Scaffold
  key: key,
  drawer: Drawer(child： child)  // 左边弹出
  endDrawer: Drawer(child： child)  // 右边弹出
// 3、

打开： key.currentState?.openDrawer() / key.currentState?.openEndDrawer()
关闭： Navigator.pop(context)
```

* 表单
* 多选框
```dart
Checkbox
  value: value,
  onChange: (val) {}
```
* 下拉框
```dart
DropdownButton
  icon: Icon(Icons.drop_down),
  isExpanded: true,  // 图标两边对齐
  underline: SizedBox(),  // 去掉下划线
  hint: Text('请选择'),  // placeholder
  items： Widget
  onChanged：(val){}
```
* 输入框
```dart
TextFormField
  onSaved: (value){},  // 调用formKey的currentState.save()时onSaved会被调用，可用于更改数据
  maxLines: maxLines,  // 设置多行可变成texteara
  textAlign: TextAlign.right,  // 对齐方式
  decoration: InputDecoration(
    border: InputBorder.none,  // 去掉边框
    hintStyle: hintStyle ?? TextStyle(color: ColorUtil.color('#DADBDE')),  // placeholder 样式
    hintText： hintText  // hintText
```
* flutter_picker 选择器

* base46图片
```dart
Image.memory(const Base64Decoder().convert(vertifyCode))
```

* dart 定时器
``` dart
import 'dart:async';
late Timer _timer;
_timer = Timer.periodic(const Duration(milliseconds: 1000), (timer) {  // 每秒执行一次
  timer.cancel(); // 内部取消定时器
})
_timer.cancel(); // 外部取消
```