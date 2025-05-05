import 'package:flutter/material.dart';
import '../navbar.dart'; // ✅ Import your MainNavigation

class EmployerHomePage extends StatelessWidget {
  const EmployerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainNavigation(isEmployer: true);
  }
}
