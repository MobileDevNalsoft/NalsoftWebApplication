import 'package:customs/src.dart';

class AuthenticatonRepository {
  AuthenticatonRepository({required this.api});

  CustomAPI api;

  Future<int> login(
      {required String username, required String password}) async {
    ApiResponse response = await api.get('authenticate');
    return response.response!.statusCode!;
  }
}
