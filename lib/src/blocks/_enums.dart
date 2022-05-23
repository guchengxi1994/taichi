/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-19 19:03:30
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-23 19:57:59
 */
/// ```stack``` 固定位置
///
/// ```scrollerView``` 可滚动的组件
///
/// ```common``` 不可滚动，非固定位置自适应
///
/// dev+5 版本引入 custom 类型，代表可自定义样式的
/// 单个组件
///
/// 通过单个组件样式定义，后续可以添加到左侧列表中作为自定义组件样式
enum BoardType { stack, scrollView, common, custom }

/// ```ltr``` 从左往右
///
/// ```ttb``` 从上到下
enum BoardDirection { ltr, ttb }
