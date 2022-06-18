import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_validation/screens/login.dart';

class StudentSignup extends StatelessWidget {
  StudentSignup({Key? key}) : super(key: key);

  final _signupForm = GlobalKey<FormState>();

  static const blueColor = Color.fromARGB(255, 4, 53, 94);

  final passwordField = TextEditingController();
  final confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      child: IconButton(
                        padding: EdgeInsets.only(),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: blueColor,
                        ),
                      )),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey.withOpacity(0.2)),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                    key: _signupForm,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30, top: 50),
                          child: Text(
                            'Create Your Account',
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
                            } else if (value.contains(RegExp(r'[1-9]'))) {
                              return 'Enter a valid name';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(2)
                          ],
                          decoration: InputDecoration(
                              filled: true,
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              fillColor: Colors.white,
                              border: _border,
                              labelText: 'Age',
                              labelStyle: const TextStyle(color: Colors.black),
                              isDense: true,
                              contentPadding: const EdgeInsets.all(15)),
                          validator: (age) {
                            if (age == null || age.isEmpty) {
                              return 'Required field';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          keyboardType: const TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                              filled: true,
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              fillColor: Colors.white,
                              border: _border,
                              labelText: 'Phone',
                              labelStyle: const TextStyle(color: Colors.black),
                              isDense: true,
                              contentPadding: const EdgeInsets.all(15)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required field';
                            } else if (value.length < 10) {
                              return 'Enter a valid mobile number';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: passwordField,
                          decoration: InputDecoration(
                              filled: true,
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.all(15),
                              border: _border,
                              labelStyle: const TextStyle(color: Colors.black),
                              labelText: 'Password',
                              isDense: true),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Required field';
                            } else if (value.length < 4) {
                              return 'Password must contain minumum 4 characters';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: confirmPassword,
                          decoration: InputDecoration(
                              filled: true,
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              fillColor: Colors.white,
                              border: _border,
                              labelStyle: const TextStyle(color: Colors.black),
                              labelText: 'Confirm password',
                              isDense: true,
                              contentPadding: const EdgeInsets.all(15)),
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
                              child: const Text('Save')),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => StudentLogin(),
                            ));
                          },
                          child: const Text(
                            'Already have a account?',
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
    if (_signupForm.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  final signupSnackbar = const SnackBar(
    content: Text(
      'Account created Successfully',
      style: TextStyle(color: Colors.white),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: blueColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    dismissDirection: DismissDirection.endToStart,
    clipBehavior: Clip.antiAlias,
  );

  final passSnack = const SnackBar(
    content: Text(
      'Password and confirm password does not match',
      style: TextStyle(color: Colors.white),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Color.fromARGB(255, 166, 19, 9),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
  );

  bool checkPasswords(BuildContext ctx) {
    final pass = passwordField.text;
    final confirmPass = confirmPassword.text;

    if (pass != confirmPass || pass == null || confirmPass == null) {
      ScaffoldMessenger.of(ctx).showSnackBar(passSnack);
      return false;
    } else {
      return true;
    }
  }
}
