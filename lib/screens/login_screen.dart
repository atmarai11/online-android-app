import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:techno_gadgets/repository/user_repository.dart';
import 'package:motion_toast/motion_toast.dart';

import '../widgets/mycolors.dart';
import '../widgets/text_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    _checkNotificationsEnabled();
    super.initState();
  }

  _checkNotificationsEnabled() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      (isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      };
    });
  }

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  // _navigateToScreen(bool isLogin) {
  //   if (isLogin) {
  //     Navigator.pushReplacementNamed(context, '/dashboardscreen');
  //   } else {
  //     MotionToast.error(
  //       description: const Text("Either username or password is not correct"),
  //     ).show(context);
  //   }
  // }

  _login() async {
    try {
      UserRepository userRepository = UserRepository();
      bool isLogin = await userRepository.login(
        _emailController.text,
        _passwordController.text,
      );

      if (isLogin) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, '/dashboardscreen');
      } else {
        // ignore: use_build_context_synchronously
        MotionToast.error(
          description: const Text("Either username or password is not correct"),
        ).show(context);
      }
    } catch (e) {
      MotionToast.error(
        description: Text("Error : ${e.toString()}"),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: MyColors.myGreen,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 98),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: MyColors.myGreen,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.more_vert,
                  size: 28,
                  color: MyColors.myGreen,
                )
              ],
            ),
          ),
          Container(
            height: 798,
            decoration: const BoxDecoration(
              color: MyColors.myWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34),
                topRight: Radius.circular(34),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
                  child: Image.asset(
                    'assets/images/register.png',
                    height: 100,
                    width: 100,
                    color: MyColors.myGreen,
                  ),
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      color: MyColors.myGreen),
                ),
                const SizedBox(
                  height: 58,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextInput(
                          controller: _emailController,
                          key: const ValueKey('txtEmail'),
                          msg: "Please enter email",
                          icon: Icons.email,
                          hint: "Email",
                          inputAction: TextInputAction.next),
                      TextInput(
                          controller: _passwordController,
                          key: const ValueKey('txtPassword'),
                          msg: "Please enter password",
                          icon: Icons.phone,
                          hint: "Password",
                          obscureText: true,
                          inputAction: TextInputAction.done),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 38),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Forget Password?",
                                style: TextStyle(
                                    fontSize: 16, color: MyColors.myGreen),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 328,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: ElevatedButton(
                            key: const ValueKey('btnLogin'),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _login();
                                AwesomeNotifications().createNotification(
                                  content: NotificationContent(
                                    id: 1,
                                    channelKey: 'basic_channel',
                                    title: 'TechnoGadgets Notification',
                                    body:
                                        'You have logged in into TechnoGadgets eCommerce application',
                                  ),
                                );
                              }
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 24,
                              ),
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
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?   ",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/registerscreen");
                      },
                      child: const Text(
                        "Sign Up",
                        style:
                            TextStyle(fontSize: 24, color: MyColors.myGreen),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

