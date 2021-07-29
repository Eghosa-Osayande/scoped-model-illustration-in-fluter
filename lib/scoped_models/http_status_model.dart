import 'package:scoped_model/scoped_model.dart';

enum sCode {
  loading,
  loaded,
  error,  
}

enum uAuth {
  login,
  logout,
}

class StatusModel extends Model {
  sCode code = sCode.loading;

  uAuth auth = uAuth.logout;

  bool get isLoaded {
    return (code == sCode.loaded);
  }

  bool get isLoading {
    return (code == sCode.loading);
  }

  bool get isError {
    return (code == sCode.loaded);
  }

  bool get isLoggedIn {
    return (auth == uAuth.login);
  }

  bool get isLoggedOut {
    return (auth == uAuth.logout);
  }


  setToLogout() {
    auth = uAuth.logout;
    notifyListeners();
  }

  setToLogin() {
    auth = uAuth.login;
    notifyListeners();
  }
  

  setToLoading() {
    code = sCode.loading;
    notifyListeners();
  }

  setToLoaded() {
    code = sCode.loaded;
    notifyListeners();
  }

  setToError() {
    code = sCode.error;
    notifyListeners();
  }
}