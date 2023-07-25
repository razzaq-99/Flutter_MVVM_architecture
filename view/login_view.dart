import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';

import '../utils/utils.dart';
import 'home_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login")),
      ),
      body: InkWell(
          onTap: () {

            Utils.flushBarErrorMessage('no internet connection', context);
            // Utils.toastMessage("No internet connection");
            // Utils.toastMessage("I repeat ");

            // Navigator.pushNamed(context, RoutesName.home);

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
          child: const Center(child: Text("Clickable"))),
    );
  }
}
