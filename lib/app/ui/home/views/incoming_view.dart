import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../../common/logger.dart';

class IncomingView extends StatefulWidget {
  const IncomingView({Key? key}) : super(key: key);

  @override
  State<IncomingView> createState() => _IncomingViewState();
}

class _IncomingViewState extends State<IncomingView> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    //从文件读取点击次数
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<String?> getDownloadPath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = Directory('/storage/emulated/0/Download');
        // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
        // ignore: avoid_slow_async_io
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err, stack) {
      vlog.e('Cannot get download folder path');
    }
    return directory?.path;
  }

  static Future<String> createFolderInAppDocDir(String folderName) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    // final Directory appDocDirFolder = Directory('${appDocDir.path}/$folderName/');
    vlog.d('appDocDir ${appDocDir.path}');

    final Directory appDocDirFolder = Directory(folderName);
    if (await appDocDirFolder.exists()) {
      vlog.d('exists ${appDocDirFolder.path}');
      return appDocDirFolder.path;
    }
    final Directory appDocDirNewFolder =
        await appDocDirFolder.create(recursive: true);
    vlog.i('create ${appDocDirNewFolder.path}');
    return appDocDirNewFolder.path;
  }

  Future<File> _getLocalFile() async {
    final downloadPath = await getDownloadPath();
    final dir = '$downloadPath/lysander';
    await createFolderInAppDocDir(dir);
    return File('$dir/counter.txt');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // 读取点击次数（以字符串）
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // 将点击次数以字符串类型写到文件中
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('文件操作')),
      body: Center(
        child: Text('点击了 $_counter 次'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
