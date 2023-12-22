import 'package:agics_project/app/layout/layout.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Layout(
      title: '설정',
      currentInx: 3,
      body: Text('ddd'),
      logo: false,
    );
  }
}
