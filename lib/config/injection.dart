import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;

// digunakan unuk menginisiasi semua dependency injection yang digunakan di seluruh aplikasi
// secara sederhana, ketika ingin digunakan, tidak perlu menginisiasi lagi, cukup memanggilnya dengan di.get<T>() atau di<T>()

// contohnya :
// final _prefs = di<SharedPreferences>();
// ketika digunaknanya :
// _prefs.setString(Constant.userDetail, jsonEncode(_userDetail?.toJson()));
class Injection {
  Future<void> initialize() async {
    try {
      final sharedPreferences = await SharedPreferences.getInstance();
      di.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

      // SERVICES

      // REPOSITORY
    } catch (e) {}
  }
}
