import 'package:flutter/material.dart';

import '../global_data.dart'; // global job list
import 'package:gini/job_card.dart';

class EmployerHomeContent extends StatefulWidget {
  const EmployerHomeContent({super.key});

  @override
  State<EmployerHomeContent> createState() => _EmployerHomeContentState();
}

class _EmployerHomeContentState extends State<EmployerHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Welcome Employer",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Manage your posted jobs",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Your Job Listings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 43, 35, 3),
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.builder(
                  itemCount: globalJobList.length,
                  itemBuilder: (context, index) {
                    final job = globalJobList[index];
                    return JobCard(
                      companyName: job['company'],
                      jobTitle: job['title'],
                      salary: job['salary'],
                      tags: List<String>.from(job['tags']),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          setState(() {
            globalJobList.add({
              'company': 'New Company',
              'title': 'New Job Title',
              'salary': '10,00,000 - 15,00,000',
              'tags': ['Remote', 'Entry Level'],
            });
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
