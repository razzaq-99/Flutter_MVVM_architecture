
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils{


  static toastMessage(String message){
       Fluttertoast.showToast(msg: message,
         backgroundColor: Colors.grey,
         textColor: Colors.black
       );
  }


  static void flushBarErrorMessage(String message, BuildContext context){

    showFlushbar(context: context, flushbar: Flushbar(
      message: message,
      flushbarPosition: FlushbarPosition.TOP,
      forwardAnimationCurve: Curves.decelerate,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: EdgeInsets.all(15),
      duration: const Duration(seconds: 3),
      reverseAnimationCurve: Curves.easeInOut,
      positionOffset: 20,
      icon: Icon(Icons.error,size: 20,color: Colors.red,),
    )..show(context),
    );
  }


}