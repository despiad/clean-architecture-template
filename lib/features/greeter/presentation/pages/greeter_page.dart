import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import '../../../../core/router/router.gr.dart';

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
              style: Theme.of(context).textTheme.headline5,
            ),
            TextButton(
              onPressed: () {
                context.router.replace(HomeRoute());
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
