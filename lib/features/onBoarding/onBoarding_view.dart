import 'package:event/core/gen/assets.gen.dart';
import 'package:event/core/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late int selectedPage;
  late final PageController _pageController;

  @override
  void initState() {
    selectedPage = 0;
    _pageController = PageController(initialPage: selectedPage);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Assets.images.logo.image(
          width: 145,
          height: 27,
          alignment: Alignment.center,
        ),
        centerTitle: true,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Skip button
              if (selectedPage < 2)
                TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      2,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(color: Color(0xFF1E3A8A), fontSize: 16),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // PageView
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    selectedPage = page;
                  });
                },
                children: [
                  _buildOnboardingPage(
                    illustration: _buildFirstIllustration(),
                    title: 'Find Events That Inspire You',
                    description:
                        'Dive into a world of events crafted to fit your unique interests. Whether you\'re into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore themes, jump everyone in the most of every opportunity around you.',
                  ),
                  _buildOnboardingPage(
                    illustration: _buildSecondIllustration(),
                    title: 'Effortless Event Planning',
                    description:
                        'Take the hassle out of organizing events with our all-in-one platform. From setting up invites and managing RSVPs to scheduling reminders and coordinating logistics, everything is streamlined with ease and focus on what matters - creating an unforgettable experience for you and your guests.',
                  ),
                  _buildOnboardingPage(
                    illustration: _buildThirdIllustration(),
                    title: 'Connect with Friends & Share Moments',
                    description:
                        'Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.',
                    isLastPage: true,
                  ),
                ],
              ),
            ),

            // Dot indicator
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: PageViewDotIndicator(
                currentItem: selectedPage,
                count: 3,
                unselectedColor: Color(0xFFE5E7EB),
                selectedColor: Color(0xFF1E3A8A),
                size: Size(8, 8),
                unselectedSize: Size(8, 8),
                duration: Duration(milliseconds: 200),
                margin: EdgeInsets.symmetric(horizontal: 4),
              ),
            ),

            // Next/Get Started button
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedPage < 2) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // Navigate to main app
                      // Navigator.pushReplacement(context, ...);
                      Navigator.pushReplacementNamed(context, RouteName.login);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF1E3A8A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    selectedPage == 2 ? 'Get started' : 'Next',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage({
    required Widget illustration,
    required String title,
    required String description,
    bool isLastPage = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 40),
          // Illustration
          Expanded(flex: 3, child: Center(child: illustration)),
          SizedBox(height: 32),
          // Title
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF111827),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          // Description
          Expanded(
            flex: 2,
            child: Text(
              description,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  // Placeholder illustrations - replace with actual SVG or images
  Widget _buildFirstIllustration() {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Assets.images.theme1Img.image(
        // fit: BoxFit.cover,
        height: 400,
        width: double.infinity,
      ),
    );
  }

  Widget _buildSecondIllustration() {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Assets.images.theme2Img.image(
        // fit: BoxFit.cover,
        height: 400,
        width: double.infinity,
      ),
    );
  }

  Widget _buildThirdIllustration() {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Assets.images.theme3Img.image(
        // fit: BoxFit.cover,
        height: 400,
        width: double.infinity,
      ),
    );
  }
}
