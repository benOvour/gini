import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gini/screens/employer_home.dart';
import 'package:gini/screens/job_seeker_home.dart';
import 'home.dart'; // HomePages
import 'package:firebase_auth/firebase_auth.dart';

class TypeSelectionPage extends StatelessWidget {
  const TypeSelectionPage({super.key});

  Future<void> saveUserType(String type, BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser;
    print("Saving user type: $type");
    if (user != null) {
      print("User ID: ${user.uid}");

      try {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': user.email,
          'userType': type,
        });
        print("User data saved to Firestore!");

        // ✅ Navigate based on type selected
        if (type == 'Employer') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const EmployerHomePage()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const JobSeekerHomePage()),
          );
        }
      } catch (e) {
        print("Error saving user data: $e");
      }
    } else {
      print("No user found.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Select User Type',
          style: TextStyle(
            fontFamily: "Poppins",
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () => saveUserType('Employer', context),
              child: const Text(
                'Join as Employer',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () => saveUserType('Job Seeker', context),
              child: const Text(
                'Join as Job Seeker',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
