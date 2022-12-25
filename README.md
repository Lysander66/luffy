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
flutter pub add json_annotation
flutter pub add json_serializable --dev
flutter pub add build_runner --dev
flutter pub add get_storage
flutter pub add path_provider
flutter pub add flutter_dotenv
flutter pub add http
```

- [http](https://docs.flutter.dev/cookbook/networking/fetch-data)

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

## --dart-define

- [Using --dart-define in Flutter](https://dartcode.org/docs/using-dart-define-in-flutter/)

```
flutter run --dart-define=API_KEY=example_key --dart-define=APP_NAME=example_app
```

```dart
print(const String.fromEnvironment('API_KEY'));
print(const String.fromEnvironment('APP_NAME'));
```

`flutter run --dart-define=AppEnvironment=prod`

## flutter_dotenv

一般用于存放账号密码等敏感信息

- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)

Remember to add the .env file as an entry in your .gitignore if it isn't already unless you want it included in your version control.

```
*.env
```
