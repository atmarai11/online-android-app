import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:techno_gadgets/widgets/mycolors.dart';
import 'package:wear/wear.dart';

import '../../model/user.dart';
import '../../repository/user_repository.dart';

class WearOsScreen extends StatefulWidget {
  const WearOsScreen({Key? key}) : super(key: key);

  @override
  State<WearOsScreen> createState() => _WearOsScreenState();
}

class _WearOsScreenState extends State<WearOsScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  _navigateToScreen(bool isLogin) {
    if (isLogin) {
      Navigator.pushReplacementNamed(context, '/wearosdashboardscreen');
    } else {
      Fluttertoast.showToast(
          msg: 'Either username or password is incorrect',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.transparent,
          textColor: Colors.redAccent);
    }
  }

  _login() async {
    try {
      UserRepository userRepository = UserRepository();
      bool isLogin = await userRepository.login(
        _emailController.text,
        _passwordController.text,
      );
      if (isLogin) {
        _navigateToScreen(true);
      } else {
        _navigateToScreen(false);
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Error: ${e.toString()}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.transparent,
          textColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text(
                              "Email",
                              style: TextStyle(color: MyColors.myGreen),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text(
                                "Password",
                                style: TextStyle(
                                  color: MyColors.myGreen,
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            User user = User(
                                email: _emailController.text,
                                password: _passwordController.text);
                            _login();
                          },
                          child: const Text(
                            "Login",
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              MyColors.myGreen,
                            ),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 15),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
