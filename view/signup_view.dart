
import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../resources/components/round_button.dart';
import '../utils/utils.dart';
import '../view_model/auth_view_model.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
        title: const Center(child: Text("Sign Up")),
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
                title: 'Sign Up',
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
                    authViewModel.SignUpAPi(data, context);
                    Utils.flushBarErrorMessage("Api hit", context);                  }
                },
              ),
              SizedBox(
                height: height * .02,
              ),
              InkWell(
                  onTap: (){
                   Navigator.pushNamed(context, RoutesName.login);
                  },
                  child: const Text("Already have any account? login",style: TextStyle(fontSize: 18),)),

            ],
          ),
        ),
      ),
    );
  }
}

