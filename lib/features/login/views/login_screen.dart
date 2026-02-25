import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/features/login/cubit/login_cubit.dart';
import 'package:store/features/login/cubit/login_states.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: BlocProvider(
        create: (context) {
          return LoginCubit(Dio());
        },
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if(state is LoginSuccessState)
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Login Successful "),
                  ),
                );


              }
            if (state is LoginErrorState)
              {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Login failed "),
                  ),
                );              }
          },
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(right: 20.0, left: 20),
                child: Form(
                  key: loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 10),
                          SizedBox(
                            child: Image.asset('assets/images/logo.png'),
                            width: 300,
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomTextFormField(
                        value: '',
                        hinttxt: 'username',
                        Controller: usernameController,
                      ),
                      SizedBox(height: 8),
                      CustomTextFormField(
                        value: '',
                        hinttxt: 'password',
                        Controller: passwordController,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          child: Text('forget your password?'),
                          alignment: Alignment.bottomRight,
                        ),
                      ),
                      state is LoginLoadState
                          ? Center(child: CircularProgressIndicator())
                          : CustomElevatedBTN(
                            text: 'Login',
                            onPressed: () {
                              if (loginFormKey.currentState!.validate()) {
                                context.read<LoginCubit>().login(
                                  name: usernameController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                          ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Dont have an account ?   '),
                          Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
