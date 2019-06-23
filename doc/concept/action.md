# FAction

-   FAction contains two fields
    -   type
    -   payload
-   Recommended way of writing action
    -   Create an action.dart file for a component|adapter that contains two classes
        -   An enumeration class for the type field
        -   An ActionCreator class is created for the creator of the FAction, which helps to constrain the type of payload.
    -   Effect Accepted FAction which's type is named after `on{verb}`
    -   Reducer ccepted FAction which's type is named after `{verb}`
    -   Sample code

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
