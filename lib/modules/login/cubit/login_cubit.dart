import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/login_model.dart';
import 'package:shopapp/modules/login/cubit/login_states.dart';
import 'package:shopapp/shared/network/end_points.dart';
import 'package:shopapp/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginIntitalState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);
  late ShopLoginModel loginModel;

  bool isPassword = false;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibitlity() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopLoginChangePasswordVisibilityState());
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      loginModel = ShopLoginModel.fromJson(value.data);
      emit(ShopLoginSuccessState(loginModel: loginModel));
    }).catchError((error) {
      emit(ShopLoginErrorState(error: error.toString()));
    });
  }
}
