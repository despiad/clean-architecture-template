import 'package:clean_architecture_template/core/router/router.gr.dart';
import 'package:clean_architecture_template/injection.dart';
import 'package:flutter/material.dart';

class GreeterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'WELCOME TO THE APP',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: () {
                AppRouter().push(HomeRoute());
              },
              child: Text(
                'Continue',
                style: Theme.of(context).textTheme.button,
              ),
            )
          ],
        ),
      ),
    );
  }
}
