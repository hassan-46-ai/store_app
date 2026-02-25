import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20),
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
              CustomTextFormField( value:'' ,hinttxt:'email' ,Controller:emailController ,)
                  ,
              SizedBox(height: 8),
              CustomTextFormField( value:'' ,hinttxt:'password' ,Controller:passwordController ,



              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  child: Text('forget your password?'),
                  alignment: Alignment.bottomRight,
                ),
              ),
              CustomElevatedBTN(
                text: 'Login',
                onPressed: (){},
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
  }
}
