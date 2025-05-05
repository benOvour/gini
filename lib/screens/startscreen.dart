import 'package:flutter/material.dart';
import 'package:gini/screens/sign.dart';
import 'package:marquee/marquee.dart';
import 'dart:async';
import 'sign.dart'; // ✅ import your SignUpPage

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // 🔵 Background wave
            Positioned.fill(
              child: Image.asset(
                'assets/wave.png',
                fit: BoxFit.contain, // Stretch the wave image nicely
                alignment: Alignment.center, // Adjust if needed
              ),
            ),

            // 🔵 Foreground Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  // Logo
                  Center(
                    child: Image.asset(
                      'assets/logo.png',
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Job Categories
                  Column(
                    children: [
                      ScrollingRow(jobs: jobsRow1),
                      const SizedBox(height: 10),
                      ScrollingRow(
                        jobs: jobsRow2,
                        reverseDirection: true,
                        bounceMode: false,
                      ),
                      const SizedBox(height: 10),
                      ScrollingRow(jobs: jobsRow3),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // 🔥 No need separate Center() for wave now (already background)
                  const SizedBox(height: 200),

                  // Title Text
                  Text(
                    'Find Your Dream\nJob Here',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Subtitle
                  Text(
                    'Here is the place where you can find the job vacancies you want',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),

                  const Spacer(),

                  // Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 90,
                          vertical: 15,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Find Your Job',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> jobsRow1 = [
    {"title": "UI Designer", "image": "assets/ui.png"},
    {"title": "Web Developer", "image": "assets/web.png"},
    {"title": "Data Analyst", "image": "assets/data.png"},
    {"title": "Mobile Developer", "image": "assets/mobile.png"},
    {"title": "Flutter Developer", "image": "assets/flutter.png"},
    {"title": "Backend Engineer", "image": "assets/backend.png"},
  ];

  // Similarly create jobsRow2 and jobsRow3 if you want more rows
  final List<Map<String, dynamic>> jobsRow2 = [
    {"title": "Product Manager", "image": "assets/pm.png"},
    {"title": "Cyber Security Expert", "image": "assets/security.png"},
    {"title": "Game Developer", "image": "assets/game.png"},
    {"title": "Full Stack Developer", "image": "assets/fullstack.png"},
  ];

  final List<Map<String, dynamic>> jobsRow3 = [
    {"title": "Blockchain Developer", "image": "assets/blockchain.png"},
    {"title": "AI Engineer", "image": "assets/ai.png"},
    {"title": "SEO Specialist", "image": "assets/seo.png"},
    {"title": "UI/UX Researcher", "image": "assets/research.png"},
  ];

  // Helper Widget for Job Categories
  Widget _buildJobCategory(
    String title, {
    IconData? icon,
    bool isHighlighted = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: isHighlighted ? Colors.greenAccent : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: isHighlighted ? Colors.black : Colors.black,
              size: 20,
            ),
          if (icon != null) const SizedBox(width: 5),
          Text(
            title,
            style: TextStyle(
              color: isHighlighted ? Colors.black : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollingRow extends StatefulWidget {
  final List<Map<String, dynamic>> jobs;
  final bool reverseDirection; // left-right or right-left
  final bool bounceMode; // 🔥 New: whether bounce or continuous

  const ScrollingRow({
    Key? key,
    required this.jobs,
    this.reverseDirection = false,
    this.bounceMode = true,
  }) : super(key: key);

  @override
  State<ScrollingRow> createState() => _ScrollingRowState();
}

class _ScrollingRowState extends State<ScrollingRow> {
  late ScrollController _controller;
  late Timer _timer;
  bool isScrollingForward = true;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();

    _timer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (_controller.hasClients) {
        double maxScroll = _controller.position.maxScrollExtent;
        double minScroll = _controller.position.minScrollExtent;
        double currentScroll = _controller.offset;
        double moveBy = 1;

        if (!widget.bounceMode) {
          // 🔥 Continuous scrolling mode
          if (widget.reverseDirection) {
            if (currentScroll <= minScroll) {
              _controller.jumpTo(maxScroll);
            } else {
              _controller.jumpTo(currentScroll - moveBy);
            }
          } else {
            if (currentScroll >= maxScroll) {
              _controller.jumpTo(minScroll);
            } else {
              _controller.jumpTo(currentScroll + moveBy);
            }
          }
        } else {
          // 🔥 Bounce mode
          if (isScrollingForward) {
            _controller.jumpTo(currentScroll + moveBy);
            if (currentScroll >= maxScroll) {
              isScrollingForward = false;
            }
          } else {
            _controller.jumpTo(currentScroll - moveBy);
            if (currentScroll <= minScroll) {
              isScrollingForward = true;
            }
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: widget.jobs.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                if (widget.jobs[index]['image'] != null)
                  Image.asset(
                    widget.jobs[index]['image'],
                    height: 20,
                    width: 20,
                  ),
                const SizedBox(width: 5),
                Text(
                  widget.jobs[index]['title'],
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
