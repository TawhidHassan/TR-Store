import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/route_path.dart';


class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Page"),
      ),
      body: Container(
        child: Column(
          children: [
            TextButton(
                onPressed: (){
                  context.pushNamed(Routes.LoginPage);
                },
                child: Text("xx")
            )
          ],
        ),
      ),
    );
  }
}
