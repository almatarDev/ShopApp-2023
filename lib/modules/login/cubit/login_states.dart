import 'package:shopapp/models/login_model.dart';

abstract class ShopLoginStates {}

class ShopLoginIntitalState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {
  final ShopLoginModel loginModel;
  ShopLoginSuccessState({
    required this.loginModel,
  });
}

class ShopLoginErrorState extends ShopLoginStates {
  final String error;
  ShopLoginErrorState({
    required this.error,
  });
}

class ShopLoginChangePasswordVisibilityState extends ShopLoginStates {}
