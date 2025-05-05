import 'package:flutter/material.dart';

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
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(169, 169, 169, 0.5),
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
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            salary,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
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
                          color: Colors.black,
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
