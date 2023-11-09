import 'package:flutter/material.dart';
import 'package:shopapp/modules/login/login_screen.dart';
import 'package:shopapp/shared/component/component.dart';
import 'package:shopapp/shared/network/local/cach_helper.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton(
            onPressed: () {
              CachHelper.removeData(key: 'token').then((value) {
                if (value) navigateAndFinish(context, ShopLoginScreen());
              });
            },
            child: Text('Logout')),
        const Center(
          child: Text(
            'Settings Screen',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
