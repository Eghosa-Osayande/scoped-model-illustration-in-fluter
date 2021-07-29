import 'package:scoped_model/scoped_model.dart';
import 'package:ytv/api/API.dart';
import 'package:ytv/scoped_models/http_status_model.dart';

class UserModel extends StatusModel {
  String name='';
  String age='';
  String email='';
  String gender='';
  sCode code = sCode.loaded;

  loginUser(String email, String password) async {
    setToLoading();
    Map result = await API.loginUser(email, password);

    if (result['status'] == 200) {
      name = result['data']['name'];
      email = result['data']['email'];
      age = result['data']['age'];
      gender = result['data']['gender'];
      setToLogin();
      setToLoaded();
    } else {
      setToLogout();
      setToError();
    }
  }

  logOut() {
    name = '';
    email = '';
    age = '';
    gender = '';
    setToLogout();
  }
}
