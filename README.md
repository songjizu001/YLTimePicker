![Logo](http://images.cnitblog.com/blog2015/497279/201505/051004316736641.png)
MJExtension
===
- The fastest, most convenient and most nonintrusive conversion between JSON and model.
- 世界上转换速度最快、使用最简单方便的字典转模型框架

GitHub：[CoderMJLee](https://github.com/CoderMJLee) ｜ Blog：[mjios(Chinese)](http://www.cnblogs.com/mjios) ｜ PR is welcome，or [feedback](mailto:richermj123go@vip.qq.com)


## Contents
* [Getting Started 【开始使用】](#Getting_Started)
* [Features 【能做什么】](#Features)
* [Why MJExtension 【为什么使用MJExtension】](#Why_MJExtension)
* [Installation 【安装】](#Installation)
* [Examples 【示例】](#Examples)
* [JSON -> Model](#JSON_Model)
* [JSONString -> Model](#JSONString_Model)
* [Model contains model](#Model_contains_model)
* [Model contains model-array](#Model_contains_model_array)
* [Model name - JSON key mapping](#Model_name_JSON_key_mapping)
* [JSON array -> model array](#JSON_array_model_array)
* [Model -> JSON](#Model_JSON)
* [Model array -> JSON array](#Model_array_JSON_array)
* [Core Data](#Core_Data)
* [Coding](#Coding)
* [Camel -> underline](#Camel_underline)
* [NSString -> NSDate, nil -> @""](#NSString_NSDate)
* [More use cases](#More_use_cases)

---

# <a id="Getting_Started"></a> Getting Started【开始使用】

## <a id="Features"></a> Features【能做什么】
- MJExtension是一套字典和模型之间互相转换的超轻量级框架
* `JSON` --> `Model`、`Core Data Model`
* `JSONString` --> `Model`、`Core Data Model`
* `Model`、`Core Data Model` --> `JSON`
* `JSON Array` --> `Model Array`、`Core Data Model Array`
* `JSONString` --> `Model Array`、`Core Data Model Array`
* `Model Array`、`Core Data Model Array` --> `JSON Array`
* Coding all properties of model in one line code.
* 只需要一行代码，就能实现模型的所有属性进行Coding（归档和解档）

## <a id="Why_MJExtension"></a> Why use MJExtension, why not use JSONModel or Mantle
#### MJExtension is faster than JSONModel and Mantle【转换速率】
- `MJExtension` > `JSONModel` > `Mantle` _(Feel free to test it yourself)_
- 各位开发者也可以自行测试

#### MJExtension is more easy to go【MJExtension更加容易使用】
- `JSONModel`
- You `must` let `all` model class extend `JSONModel` class
- 要求所有模型类`必须`继承自JSONModel基类

- `Mantle`
- You `must` let `all` model class extend `MTModel` class.
- 要求所有模型类`必须`继承自MTModel基类

- `MJExtension`
- Your model class `doesn't need to` extend another base class. You don't need to modify any model file.  `Nonintrusive`, `convenient`.
- `不需要`你的模型类继承任何特殊基类，也不需要修改任何模型代码，毫无污染，毫无侵入性

## <a id="Installation"></a> Installation【安装】

### From CocoaPods【使用CocoaPods】

```ruby
pod 'MJExtension'
```

### Manually【手动导入】
- Drag all source files under floder `MJExtension` to your project.【将`MJExtension`文件夹中的所有源代码拽入项目中】
- Import the main header file：`#import "MJExtension.h"`【导入主头文件：`#import "MJExtension.h"`】

```objc
MJExtension.h
MJConst.h               MJConst.m
MJFoundation.h          MJFoundation.m
MJProperty.h            MJProperty.m
MJType.h                MJType.m
NSObject+MJCoding.h     NSObject+MJCoding.m
NSObject+MJProperty.h   NSObject+MJProperty.m
NSObject+MJKeyValue.h   NSObject+MJKeyValue.m
```

# <a id="Examples"></a> Examples【示例】

### <a id="JSON_Model"></a> The most simple JSON -> Model【最简单的字典转模型】

```objc
typedef enum {
SexMale,
SexFemale
} Sex;
