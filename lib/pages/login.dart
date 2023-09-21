import 'package:flutter/material.dart';
import 'package:simplechatappliction/customUI/background.dart';
import 'package:simplechatappliction/customUI/custom_input.dart';
import 'package:simplechatappliction/customUI/gradient_button.dart';
import 'package:simplechatappliction/pages/home.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late IO.Socket socket;

  TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Background(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomScrollView(
            reverse: true,
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 240,
                        child: Image.asset(
                          './assets/chat-box.png',
                          scale: 2.5,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: Center(
                          child: CustomInput(
                              controller: userName, hint: "User Name"),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: Center(
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            height: 50,
                            child: GradientButton(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: const Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                if (userName.text.trim().isNotEmpty) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return HomePage(
                                        userName: userName.text,
                                      );
                                    },
                                  ));
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
