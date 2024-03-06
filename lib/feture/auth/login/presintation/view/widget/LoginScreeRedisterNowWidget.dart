import 'package:chat_app/feture/auth/sinUp/presintation/view/signUpScreen.dart';
import 'package:flutter/material.dart';

class LoginScreeRedisterNowWidget extends StatelessWidget {
  const LoginScreeRedisterNowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: const Text(
            "Register Here",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
