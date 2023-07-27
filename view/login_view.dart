import 'package:flutter/material.dart';
import 'package:flutter_mvvm/resources/components/round_button.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';
import 'home_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailcontroller.dispose();
    emailFocus.dispose();

    _obsecurePassword.dispose();
    passwordcontroller.dispose();
    passwordFocus.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final authViewModel = Provider.of<AuthViewModel>(context);



    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Login")),
      ),
      // body: InkWell(
      //     onTap: () {
      //
      //       Utils.flushBarErrorMessage('no internet connection', context);
      //       // Utils.toastMessage("No internet connection");
      //       // Utils.toastMessage("I repeat ");
      //
      //       // Navigator.pushNamed(context, RoutesName.home);
      //
      //       // Navigator.push(context,
      //       //     MaterialPageRoute(builder: (context) => const HomeScreen()));
      //     },
      //     child: const Center(child: Text("Clickable"))),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailcontroller,
                focusNode: emailFocus,
                decoration: const InputDecoration(
                  hintText: "email",
                  // labelText: "Enter your Email",
                  prefixIcon: Icon(Icons.alternate_email),
                  suffixIcon: Icon(Icons.email_outlined),
                ),
                onFieldSubmitted: (value) {
                  // FocusScope.of(context).requestFocus(passwordFocus);

                  Utils.focusChange(context, emailFocus, passwordFocus);
                },
              ),
              ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      controller: passwordcontroller,
                      focusNode: passwordFocus,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        hintText: "password",
                        // labelText: "Enter your Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility)),
                      ),
                    );
                  }),
              SizedBox(
                height: height * .1,
              ),
              RoundButton(
                title: "Login",
                onPress: () {
                  if(emailcontroller.text.isEmpty){
                    Utils.flushBarErrorMessage("Please enter email", context);
                  }
                  else if(passwordcontroller.text.isEmpty){
                     Utils.flushBarErrorMessage("Please enter password", context);
                  }
                  else if(passwordcontroller.text.length <6){
                     Utils.flushBarErrorMessage("Password must be strong", context);
                  }
                  else{
                       Map data ={
                         'email' : emailcontroller.text.toString(),
                         'password' : passwordcontroller.text.toString()
                       };
                    authViewModel.LoginApi(data,context);
                        Utils.flushBarErrorMessage("Api hit", context);                  }
                },
              ),
              SizedBox(
                height: height * .02,
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.signUp );
                },
                  child: const Text("don't have any account? Sign Up",style: TextStyle(fontSize: 18),)),

            ],
          ),
        ),
      ),
    );
  }
}
