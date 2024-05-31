import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFB5CAF4),
      body: Row(
        children: [
          Stack(
            children: [
              Image.asset(
                'images/login_side_img.jpg',
                fit: BoxFit.fitWidth,
                width: size.width * 0.45,
                height: size.height,
              ),
              Positioned(
                  top: 150,
                  bottom: 0,
                  left: 0,
                  right: 20,
                  child: Lottie.asset('animations/analytics.json',
                      fit: BoxFit.fitWidth))
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(5, 5), // Shift the shadow to the right
                    blurRadius: 10,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Color(0xFF7190CE)),
            height: size.height * 0.6,
            width: size.width * 0.38,
          )
        ],
      ),
    ));
  }
}
