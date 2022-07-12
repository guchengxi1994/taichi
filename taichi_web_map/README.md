# taichi_web_map_plugin

## 改版后的高德地图web js api，调用之前需要添加自己的安全密钥到html文件中
```html
 <script type="text/javascript">
    window._AMapSecurityConfig = {
        securityJsCode:'your secret key',
    }
</script>
  <script src="https://webapi.amap.com/loader.js"></script>
  <script src="main.dart.js" type="application/javascript"></script>
```
