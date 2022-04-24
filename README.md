# taichi
 A(n) (combinition of) interesting UI widget(s).

## 1.How to use

> because I upload package to pub.dev failed, so just ```github``` is supported.

```
taichi:
    git:
        url: https://github.com/guchengxi1994/taichi
        ref: main
```

## 2. Features

### 2.1 draw a simple taichi graph

> parameter ```size``` is required.

```dart
class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TaichiStatelessWidget(
        size: 300,
      ),
    );
  }
}
```