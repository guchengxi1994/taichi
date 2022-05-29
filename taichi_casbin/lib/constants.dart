// ignore_for_file: constant_identifier_names

/*
 * @Descripttion: 
 * @version: 
 * @Author: xiaoshuyui
 * @email: guchengxi1994@qq.com
 * @Date: 2022-05-28 17:34:35
 * @LastEditors: xiaoshuyui
 * @LastEditTime: 2022-05-29 17:45:34
 */

/// perm symbols
///
/// equals  ```==```
///
/// and   ```&&```
///
/// or   ```||```
///
/// not  ```!```
///
/// nt  ```!=```
enum Symbols { equals, and, or, not, nt, allow, deny }

/// perm keys
///
/// some ```some```
///
/// where ```where```
enum Keywords { some, where, sub, obj, act, eft }

/// perm types
enum PermTypes { ACL, RBAC, ABAC }

/// perm conf keys
enum PermKeywords {
  request_definition,
  policy_definition,
  policy_effect,
  matchers,

  /// rbac
  role_definition,
}

extension ToStr on PermKeywords {
  String toStr() {
    switch (this) {
      case PermKeywords.matchers:
        return "matchers";
      case PermKeywords.request_definition:
        return "request_definition";
      case PermKeywords.policy_definition:
        return "policy_definition";
      case PermKeywords.policy_effect:
        return "policy_effect";
      case PermKeywords.role_definition:
        return "role_definition";
      default:
        return "";
    }
  }
}
