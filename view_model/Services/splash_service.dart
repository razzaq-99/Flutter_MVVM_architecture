


import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/data/Model/user_model.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view_model/user_view_model.dart';

class SplashServices {

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async{
    getUserData().then((value) async {
       if(value.token=='null'|| value.token==''){
         await Future.delayed(const Duration(seconds: 3));
       Navigator.pushNamed(context , RoutesName.login);
       }
       else{
         await Future.delayed(const Duration(seconds: 3));

        Navigator.pushNamed(context, RoutesName.home);
       }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}