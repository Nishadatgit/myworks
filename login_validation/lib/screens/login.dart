import 'package:flutter/material.dart';
import 'package:login_validation/screens/signup.dart';

class StudentLogin extends StatelessWidget {
  StudentLogin({Key? key}) : super(key: key);

  final _loginFormState = GlobalKey<FormState>();
  final _passController = TextEditingController();

  static const blueColor = Color.fromARGB(255, 4, 53, 94);

  @override
  Widget build(BuildContext context) {
    const name = 'nishad';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.1),
                    child: const Icon(
                      Icons.menu,
                      size: 30,
                      color: blueColor,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.withOpacity(0.2)),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: _loginFormState,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30, top: 100),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              filled: true,
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              fillColor: Colors.white,
                              border: _border,
                              labelText: 'Name',
                              isDense: true,
                              labelStyle: const TextStyle(color: Colors.black),
                              contentPadding: const EdgeInsets.all(15)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required field';
                            } else if (value != name) {
                              return "No account found with name '$value'";
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              filled: true,
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              fillColor: Colors.white,
                              border: _border,
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove_red_eye)),
                              labelText: 'Password',
                              labelStyle: const TextStyle(color: Colors.black),
                              isDense: true,
                              contentPadding: const EdgeInsets.all(15)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required field';
                            } else if (value.length < 4) {
                              return 'Password must contain minumum 4 characters';
                            }

                            return null;
                          },
                          controller: _passController,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: 300,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: blueColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              onPressed: () {
                                if (_checkSignupForm()) {
                                  if (checkPasswords(context)) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(signupSnackbar);
                                  }
                                }
                              },
                              child: const Text('Login')),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StudentSignup(),
                            ));
                          },
                          child: const Text(
                            "Don't have an account?",
                            style: TextStyle(color: blueColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final _border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: blueColor, width: 2));

  bool _checkSignupForm() {
    if (_loginFormState.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  final signupSnackbar = const SnackBar(
    content: Text(
      'Login  Successfull',
      style: TextStyle(color: blueColor),
    ),
    margin: EdgeInsets.only(bottom: 30, right: 20, left: 20),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    dismissDirection: DismissDirection.endToStart,
    clipBehavior: Clip.antiAlias,
  );

  final passSnack = const SnackBar(
    margin: EdgeInsets.only(bottom: 30, right: 20, left: 20),
    content: Text(
      'Incorrect password entered',
      style: TextStyle(color: Colors.white),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Color.fromARGB(255, 166, 19, 9),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
  );

  bool checkPasswords(BuildContext ctx) {
    const password = 'nishad';
    final pass = _passController.text;

    if (pass != password) {
      ScaffoldMessenger.of(ctx).showSnackBar(passSnack);
      return false;
    } else {
      return true;
    }
  }
}
