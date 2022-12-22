# Luffy

## create
```
get create project
get create page:splash

get create view:incoming on home
get create view:outgoing on home

get create controller:incoming on home
get create controller:outgoing on home
```

## dependencies
```
flutter pub add logger
flutter pub add http
flutter pub add get_storage
flutter pub add path_provider
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

