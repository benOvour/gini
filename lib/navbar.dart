import 'package:flutter/material.dart';
import 'package:gini/screens/employer_home.dart';
import './screens/job_seeker_home.dart';
import './screens/saved_jobs_page.dart';
import './screens/notifications_page.dart';
import './screens/profile_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import './screens/job_seeker_home_content.dart';
import './screens/employer_home_content.dart';

class MainNavigation extends StatefulWidget {
  final bool isEmployer;
  const MainNavigation({super.key, required this.isEmployer});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      widget.isEmployer
          ? const EmployerHomeContent()
          : const JobSeekerHomeContent(),
      const SavedJobsPage(),
      const NotificationsPage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.98),
        body: _pages[_currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              30,
            ), // Make the whole navbar rounded
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: GNav(
                  gap: 8,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  backgroundColor: Colors.black,
                  color: Colors.grey.shade400, // unselected icon color
                  activeColor: Colors.white, // selected icon color
                  tabBackgroundColor:
                      Colors.grey.shade800, // selected tab background
                  tabBorderRadius: 20, // small rounded corners for selected tab
                  selectedIndex: _currentIndex,
                  onTabChange: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  tabs: const [
                    GButton(icon: Icons.home, text: ''),
                    GButton(icon: Icons.bookmark_border, text: ''),
                    GButton(icon: Icons.notifications_none, text: ''),
                    GButton(icon: Icons.person_outline, text: ''),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
