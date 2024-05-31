import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nalsoft_web_application/blocs/authentication/bloc/login_bloc.dart';
import 'package:nalsoft_web_application/repos/authentication/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:customs/src.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.allowReassignment = true;

  AuthenticatonRepository authenticatonRepository =
      AuthenticatonRepository(api: sl());
  //Repo
  sl.registerLazySingleton(() => authenticatonRepository);

  //Bloc
  sl.registerLazySingleton(() => LoginBloc(authenticationRepository: sl()));

  //API
  CustomAPI api = CustomAPI(
      "https://paas.nalsoft.net:4443/ords/xxma/authentication/", Dio());
  sl.registerLazySingleton<CustomAPI>(() => api);

  // Initializations
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
