
# Scoped-Model Usage 

In this project, I implement a basic user login using the scoped-model package for state management. The app has two screens:
1. LoginScreen
2. HomeScreen
If the user is logged in, the HomeScreen is displayed else the LoginScreen.

https://user-images.githubusercontent.com/69315505/127476842-1de7ddb7-fdec-4a38-8f17-55f8232ee2f6.mp4

## Overview

The scoped-model package has 3 important classes:
1. ScopedModel 
2. ScopedModelDescendant
3. Model

Now when making your model class, you inherit from the the Model class which gives your model class a very handy method ```notifyListeners```.
Lets consider an example a CartModel.
```
class CartModel extends Model{
  int cartTotal;
  
  addToCart(){
    cartTotal+=1;
    notifyListeners();
  }
  
  removeFromCart(){
    cartTotal-=1;
    notifyListeners();
  }
  

}
```
```notifyListeners()``` tells all ScopedModelDescendant widgets to run their builder methods to reflect the changes made the model.


In our UI, lets say there is a cart icon (CartIcon) showing the amount of items in the cart which changed whenever we add or remove from cart,
we wrap CartIcon with a ScopedModelDescendant as shown below:
```
ScopedModelDescendant<CartModel>(
            builder: (BuilContext context, Widget widget, CartModel cart) {
                return CartIcon(cartTotal: cart.cartTotal);
```

However before we can have a ScopedModelDescendant widget in the widget tree, the must be parent Widget (ScopedModel) which provides the CartModel to all widgets that need it
```
class MyApp extends StatelessWidget {
  CartModel _cart = CartModel();
 
 @override
 Widget build(BuildContext context) {
    return ScopedModel<UserModel>( 
      model: _cart,// this is where we provide the CartModel to widget tree
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: ScopedModelDescendant<CartModel>(
                              ....
```


## Directory Structure

> lib
  - api
     - api_constants.dart
      - API.dart
  - pages
	   - login_screen.dart
	    - home.dart
   - scoped_models
      - http_status_model.dart
      - user_model.dart
   - main.dart

In api/Api.dart, I created an API class which contains static methods for interacting with a hypothetical Rest API
```
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
```

In the scoped_models/http_status_model.dart package, I implement a StatusModel class which inherits from the ScopedModel class. The StatusModel class has the following methods:
1. bool get isLoaded 
2. bool get isLoading
3. bool get isError
4. bool get isLoggedIn
5. bool get isLoggedOut
6. setToLoggedout
7. setToLogin
8. setToLoading
9. setToLoaded
10. setToError

The UserModel class is defined in scoped-model/user_model.dart and it inherits from the StatusModel which means it also inherits from the ScopedModel class:
```
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

```
## WidgetTree

![Screenshot (68)](https://user-images.githubusercontent.com/69315505/127475024-98ce2147-353a-40ed-aab6-36c8a78a817f.png)


