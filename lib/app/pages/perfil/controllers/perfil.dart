import 'package:app/app/utils/db_helper.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
part 'perfil.g.dart';

class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  final Future<Database> database = DatabaseHelper.instance.database;
  @action
  updateAvatar() async {
    final Database db = await database;
    final SharedPreferences pref = await SharedPreferences.getInstance();

    int? _count = Sqflite.firstIntValue(await db
        .rawQuery('SELECT COUNT(*) FROM avatar WHERE id = ? LIMIT 1', [1]));
    if (_count! > 0) {
      List<Map<String, dynamic>> _avatar =
          await db.rawQuery('SELECT svg FROM avatar WHERE id = ? LIMIT 1', [1]);

      if (_avatar[0]['svg'] != pref.getString('fluttermoji')) {
        await db.rawUpdate('UPDATE avatar SET svg = ? WHERE id = ?',
            [pref.getString('fluttermoji'), 1]);

        print('Avatar alterado com sucesso');
      }
    } else {
      await db.rawInsert('INSERT INTO avatar (id, svg) VALUES (?, ?)',
          [1, pref.getString('fluttermoji')]);

      print('Avatar criado com sucesso');
    }
  }
}
