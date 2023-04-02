import 'package:flutter/material.dart';
import 'package:flutter_loginpage/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _keyform = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_keyform.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeroute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _keyform,
          child: Column(
            children: [
              Image.asset('assets/images/login_img.png', fit: BoxFit.cover),
              SizedBox(height: 30),
              Text(
                'Weclome $name',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cann't be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold)),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Password cann't be empty";
                        } else if (value.length < 8) {
                          return "Password length";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Material(
                      color: context.theme.buttonColor,
                      borderRadius:
                          BorderRadius.circular(changeButton ? 50 : 0),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: changeButton ? 50 : 60,
                            width: 100,
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.pink,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              shape: changeButton
                                  ? BoxShape.circle
                                  : BoxShape.rectangle,
                            )),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
