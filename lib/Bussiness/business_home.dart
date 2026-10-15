import 'package:flutter/material.dart';
import 'package:flutter_application_1/Resources/business_header.dart'; // 👈 Business Header
import 'package:flutter_application_1/Resources/business_footer.dart'; // 👈 Business Footer
import '../App_Style/App_Screen_Style.dart';
import 'business_setting.dart'; // 👈 Business Settings screen import
import 'business_notification.dart';
import 'business_menu.dart';
import 'business_current_order.dart';
import 'business_profile.dart';
import 'business_order_details.dart';

class BusinessHomeScreen extends StatefulWidget {
  const BusinessHomeScreen({super.key});

  @override
  State<BusinessHomeScreen> createState() => _BusinessHomeScreenState();
}

class _BusinessHomeScreenState extends State<BusinessHomeScreen> {
  int _currentNavIndex = 0; // 0 = Home Tab Active

  // 👈 Navigation bar tab click handler
  void _onNavTapped(int index) {
    if (index == 1) {
      // Navigate to Current Order page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BusinessCurrentOrderScreen(),
        ),
      );
    } else if (index == 2) {
      // Navigate to Settings page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingScreen()),
      );
    } else if (index == 3) {
      // Navigate to Notification page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BusinessNotificationScreen(),
        ),
      );
    } else {
      setState(() {
        _currentNavIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 1. Business Header (Business Home Title & Menu)
      appBar: BusinessHeader(
        onProfileTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BusinessProfileScreen(),
            ),
          );
        },
        onMenuTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BusinessMenuScreen()),
          );
        },
      ),

      // 👈 2. Body (Total Job: 24, Pending: 10, Job Inbox)
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Subtitle
            const Text(
              'manage your cutting jobs',
              style: AppTextStyles.subheaderGray,
            ),

            const SizedBox(height: 18),

            // 👈 2x2 Stats Summary Grid (as per screenshot)
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: 'Total Job',
                    value: '24',
                    valueColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _buildStatCard(
                    title: 'Pending (Padding)',
                    value: '10',
                    valueColor: AppColors.accentOrange,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    title: 'In Progress',
                    value: '08',
                    valueColor: AppColors.statusBlue,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: _buildStatCard(
                    title: 'Ready',
                    value: '06',
                    valueColor: AppColors.statusGreen,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // 👈 Section Header: "Job Inbox (New Cards)"
            const Text(
              'Job Inbox (New Cards)',
              style: AppTextStyles.sectionTitle,
            ),

            const SizedBox(height: 16),

            // 👈 Order 1 Card
            _buildOrderCard(
              orderTitle: 'Order #1 - Tech Corp Inc.',
              orderDate: 'Date: 18 Feb 2026',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BusinessOrderDetailsScreen(
                      orderTitle: 'Order #1 Details',
                      companyName: 'Tech Corp Inc.',
                      status: 'PENDING',
                      orderedDate: '18 Feb 2026',
                      materialGrade: 'Mild Steel (EN8)',
                      tolerances: '±0.05 mm',
                      heatTreatment: 'Required',
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 14),

            // 👈 Order 2 Card
            _buildOrderCard(
              orderTitle: 'Order #2 - Alpha Ind.',
              orderDate: 'Date: 17 Feb 2026',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BusinessOrderDetailsScreen(
                      orderTitle: 'Order #2 Details',
                      companyName: 'Alpha Ind.',
                      status: 'PENDING',
                      orderedDate: '17 Feb 2026',
                      materialGrade: 'Mild Steel (EN8)',
                      tolerances: '±0.05 mm',
                      heatTreatment: 'Required',
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),

      // 👈 3. Business Footer (Home, Orders, Settings, Notification)
      bottomNavigationBar: BusinessFooter(
        selectedIndex: _currentNavIndex,
        onItemTapped: _onNavTapped,
      ),
    );
  }

  // Stats Card Widget
  Widget _buildStatCard({
    required String title,
    required String value,
    required Color valueColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: AppStyles.statCardDecoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.statCardLabel),
          const SizedBox(height: 8),
          Text(value, style: AppTextStyles.statCardValue(valueColor)),
        ],
      ),
    );
  }

  // Job Inbox Order Card Widget
  Widget _buildOrderCard({
    required String orderTitle,
    required String orderDate,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
        decoration: AppStyles.orderCardNavyDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(orderTitle, style: AppTextStyles.orderCardTitle),
            const SizedBox(height: 6),
            Text(orderDate, style: AppTextStyles.orderCardDate),
          ],
        ),
      ),
    );
  }
}
