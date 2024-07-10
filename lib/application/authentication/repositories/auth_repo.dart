import 'package:dio/dio.dart';
import '../../../core/data/local_data/shared_pref.dart';
import '../../../core/data/new_remote/network_service.dart';
import '../../../core/values/constant.dart';
import '../models/User.dart';

abstract class AuthRepo {
Future<UserModel> logInUseCase ({required UserModel user});
}

class AuthRepoImpl implements AuthRepo{
  NetworkService networkService;
  AuthRepoImpl(this.networkService);
  @override
  Future<UserModel> logInUseCase({required UserModel user}) async {
    Response response = await networkService
        .sendRequest(LOGIN_API, method: HttpMethod.post, body: {
      "user_name": user.username,
      "password": user.password,
    });

    var res = await NetworkService.handleResponse(response);
    if (res is Map<String, dynamic>) {
      String? token = response.headers['authorization'].toString();
      await setValue(TOKEN, token);

      return UserModel.fromJson(res['model']);
    }
    return res;
  }
}