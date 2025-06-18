import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> _banners = [
    {
      'image': 'assets/banner.JPG',
      'texts': [
        'India Positive\nCitizen Challenge',
        '52 Weeks. 52 Actions.\nStart with you!',
        'Small actions = Big impact.',
        'Join students nationwide in real-world challenges that create change!',
      ]
    },
    {
      'image': 'assets/banner1.webp',
      'texts': [
        'Be the Change!',
        'Your small effort today\ncan inspire millions tomorrow.',
      ]
    },
    {
      'image': 'assets/banner2.png',
      'texts': [
        'Together, We Rise',
        'Uniting young minds to\nbuild a better society.',
      ]
    },
  ];

  Widget _buildCapsule({
    required Widget child,
    EdgeInsets padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xFFFFF6C8),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _buildBanner(Map<String, dynamic> banner) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(banner['image']),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.black.withOpacity(0.6), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: (banner['texts'] as List<String>).map((text) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) => Text(
        title,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.amber[100],
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCapsule(
                    child: Row(
                      children: [
                        Image.asset('assets/logo.png', height: 24, width: 24),
                        const SizedBox(width: 8),
                        const Text(
                          'POSITIVE CITIZENS',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  _buildCapsule(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: const Row(
                      children: [
                        Icon(Icons.search, size: 20),
                        SizedBox(width: 10),
                        Icon(Icons.notifications_none, size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 240,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: PageView.builder(
                controller: _pageController,
                itemCount: _banners.length,
                itemBuilder: (_, i) => _buildBanner(_banners[i]),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _banners.length,
                effect: const WormEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  activeDotColor: Colors.redAccent,
                  dotColor: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey.shade300,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About Challenges', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(
                    'The India Positive Citizen Challenge is a transformative digital platform designed to engage students in meaningful social actions. Through 52 weekly tasks spread across a year, participants will actively contribute to their communities, fostering a spirit of social responsibility, inclusiveness, and collective progress. To inspire and empower young individuals to become responsible global citizens, embracing the philosophy of Vasudhaiva Kutumbakam - The World is One Family.',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _sectionTitle('Our Impact'),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(4, (_) {
                      return Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
