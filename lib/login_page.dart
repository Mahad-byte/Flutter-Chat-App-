import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/text_style.dart';
import 'package:chat_app/widgets/login_text-field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final userName = TextEditingController();
  final passWord = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> login(BuildContext context) async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      //Navigator.pushNamed(context, '/chat', arguments: userName.text);
      await context.read<AuthService>().loginUser(userName.text);
      Navigator.pushReplacementNamed(context, '/chat',
          arguments: userName.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        margin: EdgeInsets.only(top: 24),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  // 'Let\'s sign you in',
                  "Hi, \nWelcome",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                verticalSpace(20),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      LoginFields(
                        validator: (value) {
                          if (value != null &&
                              value.isNotEmpty &&
                              value.length < 5) {
                            return "Please Enter a valid email";
                          } else if (value!.isEmpty) {
                            return "Enter an Email";
                          } else {
                            return null;
                          }
                        },
                        controller: userName,
                        hintText: 'Enter your username',
                        obscureText: false,
                      ),
                      verticalSpace(24),
                      LoginFields(
                        hintText: "Add your Password",
                        controller: passWord,
                        validator: (value) {},
                        obscureText: true,
                      ),
                      verticalSpace(24),
                    ],
                  ),
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () async {
                    await login(context);
                  },
                  child: Text("Login", style: ThemeTextStyle.btnTextStyle),
                ),

                //OutlinedButton(onPressed: () {}, child: FlutterLogo(size: 24,)),
                //TextButton(onPressed: () {}, child: Text("Hello", style: TextStyle(fontSize: 24),))

                GestureDetector(
                  onTap: () async {
                    if (!await launch("https://www.google.com")) {
                      throw "Could not reach this";
                    }
                  },
                  child: const Column(
                    children: [
                      Text("Find us on"),
                      Text("www.google.com"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SocialMediaButton.instagram(),
                          SocialMediaButton.facebook()
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
