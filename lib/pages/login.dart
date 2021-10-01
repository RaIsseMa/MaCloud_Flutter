import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ma_cloud_app/auth/auth_functions.dart' as auth;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isRememberMeChecked = false;
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();


  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.white;
  }

  void login() async {
    var user = await auth.Auth().login(usernameController.text,passwordController.text);
    print("user name : ${user!.userName}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.blue[800],
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:  [
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                  const SizedBox(height: 40.0),
                  TextField(
                    controller: usernameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                          borderSide:  BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width : 3.0
                          )
                      ),
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      enabledBorder:  OutlineInputBorder(
                          borderSide:  BorderSide(
                            color: Colors.white,
                            width: 1.0,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white,
                              width : 3.0
                          )
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height:10.0),
                  Row(
                    children: [
                      Checkbox(
                        value: isRememberMeChecked,
                        onChanged: (bool? value){
                          setState(() {
                            isRememberMeChecked = value!;
                          });
                        },
                        checkColor: Colors.blue,
                        fillColor: MaterialStateProperty.resolveWith(getColor),

                      ),
                      const Text("Remember me",
                        style: TextStyle(
                            color: Colors.white
                        ),)
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                  ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue
                      ),
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white),
                      )
                  ),
                  TextButton(
                      onPressed: (){},
                      child: const Text(
                        'Create an account?',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              )),
        ));
  }
}