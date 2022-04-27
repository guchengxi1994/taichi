# taichi(太极)

[EN](./README_en.md)

<img src="./md_images/taichi.gif" alt="taichi" style="zoom:20%;" />

> 别盯着logo看，搞不好晃眼睛

一个包含一个或者多个组件的组件库。

## 1.安装

> 前两天我想发布到 ```pub.dev```上的，但是又是身份验证又是要梯子，把我整不会了，所以现在只支持通过```git```这种方式安装。或者下载源码之后相对路径导入。

```
taichi:
    git:
        url: https://github.com/guchengxi1994/taichi
        ref: stable
```

## 2.支持的特性

### 2.1 画一个简单而又普通的太极图

<details>
  <summary>
    例如：
  </summary>

> 需要填入 ```size``` 参数.

```dart
import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TaichiGraph.simple(size: 300),
    );
  }
}
```
</details>

### 2.2 画一个自定义的太极图

<details>
  <summary>
    例如：
  </summary>

> 参数 ```size``` 是必须的.
> 其它随意

``` dart
import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TaichiGraph.custom(
              size: 300,
              color1: Colors.amber,
              color2: Colors.indigo,
              angle: 180,
            ),
    );
  }
}
```
</details>

### 2.3 定义一个自定义太极图样式


<details>
  <summary>
    例如：
  </summary>

```dart
import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TaichiGraphStyle style = TaichiGraphStyle(
      color1: Colors.amber,
      color2: Colors.indigo,
      dotFactor: 0.15,
      dotColor1: Colors.brown,
      dotColor2: Colors.deepOrange,
      size: 400,
      angle: 45,
    );

    return Scaffold(
      body: TaichiGraph.fromStyle(style),
    );
  }
}
```
</details>

#### 看以上的效果

| ![image-20220424172310394](./md_images/image-20220424172310394.png) | ![image-20220424172450290](./md_images/image-20220424172450290.png) | ![image-20220424172753461](./md_images/image-20220424172753461.png) |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |

### 2.4 自动旋转的太极图
> 这里用了第三方package ```provider```

<details>
  <summary>
    例如：
  </summary>

> 参数 ```size``` 是必须的.

```dart
import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TaichiAutoRotateGraph.simple(size: 100),
      ),
    );
  }
}
```

![20220424_1](./md_images/20220424_1.gif)
</details>

### 2.5 基于会自动旋转的太极图的载入动画

<details>
  <summary>
    例如：
  </summary>

```dart
import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TaichiOverlay.simple(
        isLoading,
        Scaffold(
          appBar: AppBar(
              leading: IconButton(
            icon: const Icon(Icons.arrow_left),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )),
          body: SizedBox(
            height: 100,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isLoading = !isLoading;
                });
                Future.delayed(const Duration(milliseconds: 2000))
                    .then((value) {
                  setState(() {
                    isLoading = !isLoading;
                  });
                });
              },
              child: const Text("change state"),
            ),
          ),
        ));
  }
}
```

![20220424_2](./md_images/20220424_2.gif)
</details>

### 2.6 自定义旋转太极图

<details>
  <summary>
    例如：
  </summary>
</details>

### 2.7 基于2.6的载入动画

<details>
  <summary>
    例如：
  </summary>
</details>

### 2.8 分裂的太极图 （整活第一步）

<details>
  <summary>
    例如：
  </summary>

  ``` dart
import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            TaichiGraph.splited(color: Colors.blue, size: 500, gradient: true),
      ),
    );
  }
}
  ```
![image](./md_images/0427-1.png)

</details>

### 2.9 写轮眼 （整活第二步）
<details>
  <summary>
    例如：
  </summary>
  
  ``` dart
import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: TaichiGraph.uchiha(size: 100),
        ),
      ),
    );
  }
}
  ```
![image](./md_images/0427-2.png)

</details>

### 2.10 动态加载器

> 参数表
> double initialValue ， 进程初始值，值域 0~100,
> double width ， 组件宽度 默认 80,
> double height ， 组件高度，默认 160,
> Color frontColor ，组件前景颜色（会随着进程改变的区域），默认是深蓝色 
> Color backColor ，组件背景颜色，默认为蓝色 
> double? duration, 如果定义了这个参数，代表会动态更新进程值，否则是静态的
> double? percentageValue 如果定义了duration参数，这个值的初始值就是initialValue的值，然后随着时间推移发生变化（基于provider）；如果没有定义duration参数，那么initialValue失效，静态展示的是这个值
> double maxVal ，进程最大值，0~100%，默认 100,
> double minVal ，进程最小值，默认为0

> 当前这个还只支持胶囊形状的container,后续考虑拓展一下形状

<details>
  <summary>
    例如：
  </summary>
  



``` dart
import 'package:flutter/material.dart';
import 'package:taichi/taichi.dart';

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_left),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ProcessLoader.customWaveLoader(
                percentageValue: 30,
                maxVal: 80,
                backColor: const Color.fromARGB(255, 200, 43, 43),
                frontColor: const Color.fromARGB(255, 7, 255, 156)),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: ProcessLoader.customWaveLoader(
                percentageValue: 30,
                duration: 2,
                maxVal: 80,
                backColor: Colors.white,
                frontColor: Colors.amber),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: ProcessLoader.customWaveLoader(
                percentageValue: 30,
                duration: 5,
                maxVal: 100,
                backColor: const Color.fromARGB(255, 255, 255, 255),
                frontColor: const Color.fromARGB(255, 38, 68, 138)),
          ),
        ],
      ),
    );
  }
}
```

![image](./md_images/20220427_01.gif)

</details>
