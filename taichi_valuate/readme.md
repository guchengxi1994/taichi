<!--
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-06-25 22:17:36
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-07-01 21:23:31
-->
# taichi_valuate

## taichi_valuate 是一个计算字符串结果的库，类似python中的`eval`方法。

## 实现的功能
1. 计算四则运算结果（int类型）
   ```dart
    IntegerQuatenionOperation operation =
        IntegerQuatenionOperation(expression: "48*((70-65)-43)+8*1");
    IntegerQuatenionOperation operation2 =
        IntegerQuatenionOperation(expression: "4*(6+78)+53-9/2+45*8");

    test("测试是不是相等的", () {
        expect(operation.getResult(), -1816);
        expect(operation2.getResult(), 744);
    });
   ```
   > 这种四则运算在dart中使用的场景有限，不过后续会补上float类型的四则运算
2. 逻辑运算
   ```dart
   /// without "()""
    final BooleanQuatenionOperation operation =
        BooleanQuatenionOperation(expression: "5 != 6 && 7 == 8 && 9 >= 10");
    final BooleanQuatenionOperation operation2 =
        BooleanQuatenionOperation(expression: "5 != 6");
    final BooleanQuatenionOperation operation3 =
        BooleanQuatenionOperation(expression: "5 < 6");
    final BooleanQuatenionOperation operation4 =
        BooleanQuatenionOperation(expression: " 6>5");
    final BooleanQuatenionOperation operation5 =
        BooleanQuatenionOperation(expression: " 6》5");
    final BooleanQuatenionOperation operation7 =
        BooleanQuatenionOperation(expression: " 9>=10");

    test("测试bool值", () {
        expect(operation.getResult(), false);
        expect(operation2.getResult(), true);
        expect(operation3.getResult(), true);
        expect(operation4.getResult(), true);
        expect(operation5.getResult(), null);
        expect(operation7.getResult(), false);
    });

    /// with "()"
    final BooleanQuatenionOperation operation6 =
        BooleanQuatenionOperation(expression: "5 != 6 && (7 >= 8 && (9 <= 10))");

    final BooleanQuatenionOperation operation8 =
        BooleanQuatenionOperation(expression: "5 != 6 || (7 >= 8 && (9 <= 10))");
    test("测试bool值", () {
        expect(operation6.getResult(), false);
        expect(operation8.getResult(), true);
    });
   ```
   这个功能可以用来做权限管理，在`taichi_accessible_widget`中使用了valuate中`BooleanQuatenionOperation`功能，类似以下写法：
   ```yaml
    rules:
    - role: test user
        resources:
        - pagename == /page2 && widgetname == CenterText && visible == true && accessible == true
        - pagename == /page2 && widgetname == ebutton && visible == true && accessible == false
    - role: admin
        resources:
        - pagename == /page2 && widgetname == CenterText && visible == false && accessible == false
        - pagename == /page2 && widgetname == ebutton && visible == true && accessible == true
   ```
   通过`pagename`,`widgetname`判断哪个元素（依靠provider并且把原来的widget包裹在AccessWidget中），然后读取visible和accessable做权限管理；通过dio的拦截器做http请求上的权限管理（还在实现中）  
   在`taichi_accessible_widget`中是通过正则等手段替换等号或者不等号左边内容，最后完成比对。
3. ...
   

- [ ] 当前还不支持既包含逻辑运算又包括四则运算的情况。