import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mvvm/repository/auth_repo.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';

import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> LoginApi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((value) {
      Utils.flushBarErrorMessage("Login Successfully", context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        // Utils.flushBarErrorMessage(error.toString(), context);

        print(error.toString());
      }
    });
  }

  Future<void> SignUpAPi(dynamic data, BuildContext context) async {
    _myRepo.registerApi(data).then((value) {
      Utils.flushBarErrorMessage("Sign Up Successfully", context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      if(kDebugMode){
        // Utils.flushBarErrorMessage(error.toString(), context);

        print(error.toString());
      }
    });
  }
}
