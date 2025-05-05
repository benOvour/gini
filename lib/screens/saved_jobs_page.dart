import 'package:flutter/material.dart';

class SavedJobsPage extends StatelessWidget {
  const SavedJobsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      body: Center(
        child: Text("Saved Jobs Page", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
