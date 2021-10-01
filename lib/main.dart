import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ma_cloud_app/pages/login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes:{
      '/':(context)=>const Login(),
    },
  ));
}
