import 'package:chat_app/src/screens/register/register_controller.dart';
import 'package:chat_app/src/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterController _registerController;

  @override
  void initState() {
    super.initState();
    _registerController = RegisterController(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
        stream: _registerController.streamController.stream,
        builder: (context, snapshot) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/signup_back.jpg'))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        TextField(
                          cursorColor: Theme.of(context).primaryColor,
                          controller: _registerController.nameController,
                          decoration: InputDecoration(labelText: 'Full Name'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          cursorColor: Theme.of(context).primaryColor,
                          controller: _registerController.usernameController,
                          decoration: InputDecoration(labelText: 'username'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          cursorColor: Theme.of(context).primaryColor,
                          controller: _registerController.passwordController,
                          decoration: InputDecoration(labelText: 'password'),
                          obscureText: true,
                        ),
                        SizedBox(
                          height: 45,
                        ),
                        MyButton(
                          title: _registerController.formSubmitting
                              ? 'Initializing...'
                              : 'Sign up',
                          onTap: () => _registerController.submitForm(),
                          disabled: !_registerController.isFormValid ||
                              _registerController.formSubmitting,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/login');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                "Have an account yet? Login.",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<RegisterController>(
        '_registerController', _registerController));
  }
}
