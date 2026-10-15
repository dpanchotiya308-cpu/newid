import 'package:flutter/material.dart';
import 'business_home.dart';
import '../App_Style/App_Screen_Style.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),

              // Header: Back Button + Centered Title
              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.accentOrange,
                        size: 22,
                      ),
                      onPressed: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BusinessHomeScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const Text(
                    'About Us',
                    style: AppTextStyles.headerTitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // App / Company Brand Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: AppStyles.cardDecoration,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: AppStyles.aboutLogoDecoration,
                      child: const Icon(
                        Icons.hub_rounded,
                        size: 42,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'SubSetu',
                      style: AppTextStyles.brandTitle,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Connecting Enterprises & Businesses seamlessly',
                      style: AppTextStyles.subtitle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Our Mission
              _buildSectionCard(
                icon: Icons.flag_rounded,
                title: 'Our Mission',
                description:
                    'To streamline supply chain, job orders, and real-time material workflows with high transparency and seamless communication between suppliers and manufacturers.',
              ),
              const SizedBox(height: 16),

              // Our Vision
              _buildSectionCard(
                icon: Icons.remove_red_eye_rounded,
                title: 'Our Vision',
                description:
                    'Empowering every enterprise and local workshop with next-generation digital tools, automated PoD production syncing, and transparent verification.',
              ),
              const SizedBox(height: 24),

              // Core Values / Features
              const Text('Why Choose SubSetu?', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 14),
              _buildFeatureItem(Icons.verified_rounded, 'Verified Suppliers & Businesses'),
              _buildFeatureItem(Icons.timeline_rounded, 'Real-time Material Workflow Tracking'),
              _buildFeatureItem(Icons.sync_alt_rounded, 'Automated Proof-of-Delivery Syncing'),
              _buildFeatureItem(Icons.security_rounded, 'Secure & Transparent Operations'),

              const SizedBox(height: 32),

              // Version Info
              const Center(
                child: Text(
                  'App Version 1.0.0 • Made with ❤️',
                  style: AppTextStyles.aboutVersionText,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: AppStyles.cardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.accentOrange, size: 22),
              const SizedBox(width: 10),
              Text(title, style: AppTextStyles.cardTitle),
            ],
          ),
          const SizedBox(height: 8),
          Text(description, style: AppTextStyles.cardDescription),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle_rounded, color: AppColors.accentOrange, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: AppTextStyles.aboutFeatureText,
            ),
          ),
        ],
      ),
    );
  }
}