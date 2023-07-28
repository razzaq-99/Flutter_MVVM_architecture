import 'package:flutter/material.dart';


import '../view_model/Services/splash_service.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Splash Screen")),
        ),
        body: const Center(
          child: Text("Splash Screen",
              style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
        ),
        ),
    );
  }
}
