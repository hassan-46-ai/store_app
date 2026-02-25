import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/login/cubit/login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(this.dio) : super(InitialState());
  final Dio dio;
  Future <void> login({required String name, required String password}) async{
emit (LoginLoadState());
    try {
    final res=await  dio.post(
        'https://dummyjson.com/auth/login',
        data: {"username": name, "password": password},
        options: Options(
          headers: {
            "Content-Type":"application/json",
          }
        )
      );
    if (res.statusCode==200)
      {
        emit(LoginSuccessState());
      }
    else {
      emit(LoginErrorState());
    }
  }
  catch (e) {
emit(LoginErrorState( ));

  }
  }
}
