import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

import '../model/user.dart';
import '../repository/user_repository.dart';
import '../widgets/mycolors.dart';
import '../widgets/text_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ageController = TextEditingController();

  _showMotionToastSucess() {
    MotionToast.success(description: const Text("User registered sucessfully"))
        .show(context);
  }

  _showMotionToastError() {
    MotionToast.error(description: const Text("User is not registered"))
        .show(context);
  }

  _registerUser(User user) async {
    bool isLogin = await UserRepository().registerUser(user);
    if (isLogin) {
      _showMotionToastSucess();
    } else {
      _showMotionToastError();
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
                  padding: EdgeInsets.only(left: 78),
                  child: Text(
                    "Register",
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
                    color: MyColors.myGreen,
                    height: 100,
                    width: 100,
                  ),
                ),
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: MyColors.myGreen,
                  ),
                ),
                const SizedBox(
                  height: 28,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextInput(
                        key: const ValueKey('txtUsername'),
                        controller: _usernameController,
                        msg: "Please enter username",
                        icon: Icons.people,
                        hint: "Full Name",
                        inputAction: TextInputAction.next,
                      ),
                      TextInput(
                          controller: _emailController,
                          msg: 'Please enter email',
                          icon: Icons.email,
                          hint: "Email",
                          inputAction: TextInputAction.next),
                      TextInput(
                          controller: _phoneController,
                          msg: "Please enter Phone Number",
                          icon: Icons.phone,
                          hint: "Phone",
                          inputAction: TextInputAction.next),
                      TextInput(
                          controller: _ageController,
                          msg: "Please enter age",
                          icon: Icons.height,
                          hint: "Age",
                          inputAction: TextInputAction.next),
                      TextInput(
                          controller: _passwordController,
                          msg: "Please enter password",
                          icon: Icons.lock,
                          hint: "Password",
                          obscureText: true,
                          inputAction: TextInputAction.done),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                User user = User(
                                  email: _emailController.text,
                                  phoneNo: _phoneController.text,
                                  password: _passwordController.text,
                                  fullName: _usernameController.text,
                                  age: _ageController.text,
                                );
                                _registerUser(user);
                              }
                            },
                            child: const Text(
                              "Register",
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
                      "Already have an account?",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/loginscreen");
                      },
                      child: const Text(
                        "Login",
                        style:
                            TextStyle(fontSize: 20, color: MyColors.myGreen),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

