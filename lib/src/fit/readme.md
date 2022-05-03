<!--
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-03 12:55:34
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-03 20:47:49
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
