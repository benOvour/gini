import 'package:flutter/material.dart';
import '../navbar.dart';

class JobSeekerHomePage extends StatelessWidget {
  const JobSeekerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainNavigation(isEmployer: false);
  }
}
