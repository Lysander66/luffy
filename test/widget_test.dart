import 'package:flutter_test/flutter_test.dart';
import 'package:luffy/app/common/logger.dart';
import 'package:luffy/app/dao/define.dart';
import 'package:luffy/app/dao/music_dao.dart';

main() {
  // test('adds one to input values', () {
  //   final calculator = Calculator();
  //   expect(calculator.addOne(2), 3);
  //   expect(calculator.addOne(-7), -6);
  //   expect(calculator.addOne(0), 1);
  // });
  initHttpClient('dev');
  test('one', () async {
    var pokemon = await MusicDao.search('荒唐 傅菁');
    vlog.i(pokemon.toString());
  });
}
