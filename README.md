# taichi
<img src="./md_images/taichi.gif" alt="taichi" style="zoom:20%;" />

> Don't stare at the logo, it may make you dizzy.

 A(n) (combinition of) interesting UI widget(s).

## 1.How to use

> because I upload package to pub.dev failed, so just ```github``` is supported.

```
taichi:
    git:
        url: https://github.com/guchengxi1994/taichi
        ref: stable
```


## 2. Features

### 2.1 draw a simple taichi graph

<details>
  <summary>
    example
  </summary>

> parameter ```size``` is required.

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



### 2.2 draw a custom taichi graph

<details>
  <summary>
    example
  </summary>

> parameter ```size``` is required.
> others are optional

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



### 2.3 draw a taichi graph from style


<details>
  <summary>
    example
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



| ![image-20220424172310394](./md_images/image-20220424172310394.png) | ![image-20220424172450290](./md_images/image-20220424172450290.png) | ![image-20220424172753461](./md_images/image-20220424172753461.png) |
| ------------------------------------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------------------------------- |

### 2.4 auto rotate taichi

<details>
  <summary>
    example
  </summary>

> parameter ```size``` is required.

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



### 2.5 taichi overlay


<details>
  <summary>
    example
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

### 2.6 custom rotate taichi 

<details>
  <summary>
    example
  </summary>
</details>

### 2.7 custom taichi overlay

<details>
  <summary>
    example
  </summary>
</details>
