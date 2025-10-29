import 'package:desenvolvimento_flutter_iniciante/controllers/pessoa_controller.dart';
import 'package:desenvolvimento_flutter_iniciante/controllers/theme_controller.dart';
import 'package:desenvolvimento_flutter_iniciante/sevices/api_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> injector() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<ApiClient>(() => ApiClient( dio: Dio(), baseUrl: 'http://192.168.15.3:3000'));

  getIt.registerLazySingleton(() => PessoaController(getIt<ApiClient>()));
  getIt.registerLazySingleton(() => ThemeController(sharedPreferences: sharedPrefs));
}