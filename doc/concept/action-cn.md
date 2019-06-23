# FAction

-   FAction 包含两个字段
    -   type
    -   payload
-   推荐的写法是
    -   为一个组件|适配器创建一个 action.dart 文件，包含两个类
        -   为 type 字段起一个枚举类
        -   为 FAction 的创建起一个 ActionCreator 类，这样利于约束 payload 的类型。
    -   Effect 接受处理的 FAction，以 on{Verb} 命名
    -   Reducer 接受处理的 FAction，以{verb} 命名
    -   示例代码

```dart
enum MessageAction {
    onShare,
    shared,
}

class MessageActionCreator {
    static FAction onShare(Map<String, Object> payload) {
        return FAction(MessageAction.onShare, payload: payload);
    }

    static FAction shared() {
        return const FAction(MessageAction.shared);
    }
}
```
