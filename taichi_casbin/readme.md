### 这份文档是摘自 [casbin官方文档](https://casbin.org/docs/zh-CN/how-it-works)

# 工作原理

在 Casbin 中, 访问控制模型被抽象为基于 **PERM (Policy, Effect, Request, Matcher)** 的一个文件。 因此，切换或升级项目的授权机制与修改配置一样简单。 您可以通过组合可用的模型来定制您自己的访问控制模型。 例如，您可以在一个model中结合RBAC角色和ABAC属性，并共享一组policy规则。

PERM模式由四个基础（政策、效果、请求、匹配）组成，描述了资源与用户之间的关系。

### 请求

定义请求参数。基本请求是一个元组对象，至少需要主题(访问实体)、对象(访问资源) 和动作(访问方式)

例如，一个请求可能长这样： `r={sub,obj,act}` 

> ```dart``` 没有元组类型，google官方倒是提供了一个三方的[tuple](https://pub.flutter-io.cn/packages/tuple)包

它实际上定义了我们应该提供访问控制匹配功能的参数名称和顺序。

### 策略

定义访问策略模式。事实上，它是在政策规则文件中定义字段的名称和顺序。

例如： `p={sub, obj, act}` 或 `p={sub, obj, act, eft}`

注：如果未定义eft (policy result)，则策略文件中的结果字段将不会被读取， 和匹配的策略结果将默认被允许。

### 匹配器

匹配请求和政策的规则。

例如： `m = r.sub == p.sub && r.act == p.act && r.obj == p.obj` 这个简单和常见的匹配规则意味着如果请求的参数(访问实体，访问资源和访问方式)匹配， 如果可以在策略中找到资源和方法，那么策略结果（`p.eft`）便会返回。 策略的结果将保存在 `p.eft` 中。

### 效果

它可以被理解为一种模型，在这种模型中，对匹配结果再次作出逻辑组合判断。

例如： `e = some (where (p.eft == allow))`

这句话意味着，如果匹配的策略结果有一些是允许的，那么最终结果为真。

让我们看看另一个示例： `e = some (where (p.eft == allow)) && !some(where (p.eft == deny)` 此示例组合的逻辑含义是：如果有符合允许结果的策略且没有符合拒绝结果的策略， 结果是为真。 换言之，当匹配策略均为允许（没有任何否认）是为真（更简单的是，既允许又同时否认，拒绝就具有优先地位)。

Casbin中最基本、最简单的model是ACL。ACL中的model 配置为:

```ini
# Request definition
[request_definition]
r = sub, obj, act

# Policy definition
[policy_definition]
p = sub, obj, act

# Policy effect
[policy_effect]
e = some(where (p.eft == allow))

# Matchers
[matchers]
m = r.sub == p.sub && r.obj == p.obj && r.act == p.act

```

ACL模型的一个示例策略类似：

```
p, alice, data1, read
p, bob, data2, write
```

它意味着：

- alice可以读取data1
- bob可以编写data2

> 这里还有多行模式和 ```in``` 的写法



【参考资料】

[casbin-权限管理](https://www.cnblogs.com/wang_yb/p/9987397.html)
