import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otlob_task/bloc/login_states.dart';
import 'package:otlob_task/constants.dart';
import 'package:otlob_task/model/login_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginIntialState());

  static LoginCubit get(context) => BlocProvider.of(context);
  LoginModel loginModel;
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }

  void userLogin({
    @required String mobile,
    @required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGINENDPOINT,
      data: {
        'mobile': mobile,
        'password': password,
        'access_key': 'Gdka52DASWE3DSasWE742Wq',
        'access_password': 'yH52dDDF85sddEWqPNV7D12sW5e',
      },
    ).then((value) {
      loginModel=LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error));
    });
  }
}

class DioHelper {
  static Dio dio;

  static int() {
    dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: 'https://otlob.accuragroup-eg.net/api/',
        headers: {'Content-Type': 'application/json'},
      ),
    );
  }

  static Future<Response> postData({
    @required Map<String, dynamic> data,
    @required String url,
  }) async {
    return dio.post(url, data: data);
  }
}
