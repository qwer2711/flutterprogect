import 'package:agics_project/app/layout/layout.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      title: '마이페이지',
      currentInx: 2,
      body: Text('ddd'),
      logo: false,
    );
  }
}
