import 'package:http/http.dart' as http;
import 'package:ytv/api/api_constants.dart';

class API {
  static Future<Map> loginUser(String email, String password) async {
    /*

    Uri url = Uri.parse(Routes.loginUser);
    var result = await http.get(url);

    return result.body;

    well our endpoint obviously doesn't exist....LOL

    */
    await Future.delayed(Duration(seconds: 2),);
    return {
      'status': 200,
      'message': "Login Successful",
      "data": {
        'name': 'John',
        'age': '15',
        'email': email,
        'gender': 'male',
      },
    };
  }
}
