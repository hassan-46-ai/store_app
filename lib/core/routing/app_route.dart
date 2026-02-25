import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/core/routing/routes.dart';
import 'package:store/features/login/views/login_screen.dart';
import 'package:store/home.dart';

class AppRoute
{
  Route generateRoute(RouteSettings settings)
  {
    switch(settings.name)
    {
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_)=>Home());

        case Routes.loginScreen:
        return MaterialPageRoute(builder: (_)=>LoginScreen());

      default :
        return MaterialPageRoute(builder: (_)=>Scaffold( body: Center(child: Text('no route defined'),),));

    }
  }
}