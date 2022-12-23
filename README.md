# Luffy

## get_cli

### create

```
get create project
get create page:splash

get create view:incoming on home
get create view:outgoing on home

get create controller:incoming on home
get create controller:outgoing on home
```

### internationalization

```
get generate locales assets/locales
```

## dependencies

```
flutter pub add logger
flutter pub add http
flutter pub add get_storage
flutter pub add path_provider
flutter pub add json_annotation
flutter pub add json_serializable --dev
flutter pub add build_runner --dev
```

- [Generating code for nested classes](https://docs.flutter.dev/development/data-and-backend/json)

To make this work, pass `explicitToJson: true` in the `@JsonSerializable()` annotation over the class declaration.

```
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch --delete-conflicting-outputs
```

## get_storage

- [get_storage](https://pub.dev/packages/get_storage)
- [shared_preferences](https://pub.dev/packages/shared_preferences)

## WillPopScope

- [避免误触导致 App 退出](https://book.flutterchina.club/chapter7/willpopscope.html)

## path_provider

android/app/src/main/AndroidManifest.xml

```xml
<manifest >
    <application
        android:requestLegacyExternalStorage="true"
    </application>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
</manifest>
```

## 点击空白处隐藏键盘

```dart
builder: (context, child) => Scaffold(
  // Global GestureDetector that will dismiss the keyboard
  body: GestureDetector(
    onTap: () {
      KeyboardUtils.hideKeyboard(context);
    },
    child: child,
  ),
),
```
