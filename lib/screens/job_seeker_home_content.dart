import 'package:flutter/material.dart';

class JobSeekerHomeContent extends StatelessWidget {
  const JobSeekerHomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome, James",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Find your dream job",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      'assets/profile.png',
                    ), // 🖼️ Add asset
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Find Company, Job, People',
                    hintStyle: TextStyle(fontFamily: "Poppins"),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.filter_list),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Recent Job List",
                style: TextStyle(
                  color: Color.fromARGB(255, 66, 55, 2),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView(
                  children: [
                    JobCard(
                      companyName: "Amazon",
                      jobTitle: "Data Analyst",
                      salary: "8,00,000 - 12,00,000",
                      tags: ["Remote", "Intermediate", "Full Time"],
                    ),
                    const SizedBox(height: 15),
                    JobCard(
                      companyName: "Webflow",
                      jobTitle: "Web Developer",
                      salary: "8,00,000 - 12,00,000",
                      tags: ["Remote", "Full Time"],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Job Card Widget
class JobCard extends StatelessWidget {
  final String companyName;
  final String jobTitle;
  final String salary;
  final List<String> tags;

  const JobCard({
    super.key,
    required this.companyName,
    required this.jobTitle,
    required this.salary,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(158, 158, 158, 0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            companyName,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.orange,
              fontFamily: "Poppins",
            ),
          ),
          const SizedBox(height: 5),
          Text(
            jobTitle,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
            ),
          ),
          const SizedBox(height: 5),
          Text(
            salary,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.blueGrey,
              fontFamily: "Poppins",
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            children:
                tags
                    .map(
                      (tag) => Chip(
                        label: Text(tag),
                        backgroundColor: Colors.grey.shade200,
                        labelStyle: const TextStyle(
                          fontFamily: "Poppins",
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 12,
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
