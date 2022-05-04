<!--
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-03 12:55:34
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-04 20:42:08
-->
# 太极 屏幕自适应

参考 [flutter_smart_dialog](https://github.com/fluttercandies/flutter_smart_dialog/blob/master/lib/src/init_dialog.dart)

参考 [flutter_screenutil](https://github.com/OpenFlutter/flutter_screenutil)



> 我看了 ```flutter_screenutil``` 源码，觉得像是 ```FlutterWindow``` 这样的类，
> 
> 或是 ```MediaQuery```有些相关的方法，平时可能用的很少，
> 
> 我自己可能学习的也不是特别完整和扎实，很多内在底层的实现也很模糊
> 
> 觉得还是用 ```provider``` 实现自适应可能更加容易理解一点。
> 
> 当然，最好是不要依靠第三方组件，也许我也会实现一个自己的 ```provider``` 也说不一定。这就是后话中的后话了。


# 使用

> v 0.0.2-alpha 版本使用说明（持续优化中）

> 第一种方法： 不传入 ```context``` 的调用

因为用到了```provider``` ,所以不能在 ```MaterialApp``` 中完成所有的初始化操作，代码如下：

```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ...,
      // 这里传入一个 builder 函数，主要是声明provider的 
      builder: TaichiFitnessUtil.rootBuilder(),
    );
  }
}
```

然后需要在```build```方法中写入：

```dart
TaichiFitnessUtil.init(context);
```

这是保证```TaichiFitnessUtil```这个单例存在一个context。

然后就可以使用```300.w```等类似的方法调用了。

> 第二种方法，传入 ```context``` 调用

这种更加容易理解，因为使用 ```provider``` 需要context，所以每次调用的时候就写入一个context，然后再进行适配字体```300.setHeight(context)```。

> 所有```context```都能为空,为空时原值传出。

