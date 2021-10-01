import 'package:http/http.dart';
import 'dart:convert';
import 'package:ma_cloud_app/auth/user.dart';
import 'package:ma_cloud_app/settings/settings.dart' as settings;

class Auth{

  Future<User?> login(String userName,String password) async{
    print('send request');
    Response resp = await post(
      Uri.parse('${settings.url}users/login'),
      body: {
        'username':userName,
        'password':password
      }
    );

    var data = jsonDecode(resp.body);
    print(data['user']['username']);
    Map userResp = data['user'];
    var user = User(
      userName: userResp['username'],
      userId: userResp['user_id'],
      accessToken: data["access_token"],
      refreshToken: data["refresh_token"]
    );


    return user;
  }
}