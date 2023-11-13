import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/core/config/app_typography.dart';
import 'package:weather_app/presentation/auth/login/pages/login_screen.dart';

class HeaderItem extends StatelessWidget {
  const HeaderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: Offset(4, 0),
        )]
      ),
      child: Row(
        children: [
          const Icon(
            Icons.account_circle,
            size: 32,
            color: Colors.black,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              "Hi,\n${FirebaseAuth.instance.currentUser?.email ?? "-"}",
              style: AppTypography.copyWith(
                size: 14,
                weight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.red),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
