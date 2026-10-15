import 'package:flutter/material.dart';
import 'package:flutter_application_1/Resources/supplier_footer.dart';
import 'package:flutter_application_1/Resources/supplier_header.dart';
import 'package:flutter_application_1/Supplier/supplier_setting.dart';
import 'package:flutter_application_1/Supplier/supplier_profile.dart';
import 'package:flutter_application_1/Supplier/supplier_menu.dart';
import 'package:flutter_application_1/Supplier/supplier_notification.dart';
import 'package:flutter_application_1/Supplier/supplier_current_order.dart';
import '../App_Style/App_Screen_Style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentNavIndex = 0; // 0 = Home Tab

  // 👈 States to toggle View More open/closed for both cards
  bool _isCncExpanded = false;
  bool _isCuttingExpanded = false;

  // 👈 Handle clicks on navigation bar
  void _onNavTapped(int index) {
    if (index == 1) {
      // 👈 Clicking Current Order navigates to SupplierCurrentOrderScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SupplierCurrentOrderScreen()),
      );
    } else if (index == 2) {
      // 👈 Clicking Settings navigates to SettingScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SettingScreen()),
      );
    } else if (index == 3) {
      // 👈 Clicking Notification navigates to SupplierNotificationScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SupplierNotificationScreen()),
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
      backgroundColor: Colors.white,

      // 👈 1. Header
      appBar: CustomHeader(
        onProfileTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SupplierProfileScreen(),
            ),
          );
        },
        onMenuTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SupplierMenuScreen(),
            ),
          );
        },
      ),

      // 👈 2. Body (CNC & Cutting Technology Cards)
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // --- Card 1: Best CNC Technology ---
            _buildTechCard(
              imagePath: 'assets/images/i1.jpeg',
              companyName: 'Logo Text Here technology pty.ltd',
              subtitle: 'Best CNC Technology',
              // 👈 Card 1 message (as per screenshot)
              description:
                  'High-precision 5-axis CNC machining, milling, and turning operations with tight tolerances (±0.005mm) for aerospace, automotive, and industrial components.',
              isExpanded: _isCncExpanded,
              onToggle: () {
                setState(() {
                  _isCncExpanded = !_isCncExpanded;
                });
              },
            ),

            const SizedBox(height: 36),

            // --- Card 2: Best Cutting Technology ---
            _buildTechCard(
              imagePath: 'assets/images/i1.jpeg',
              companyName: 'Logo Text Here technology pty.ltd',
              subtitle: 'Best Cutting Technology',
              // 👈 Card 2 message
              description:
                  'Advanced industrial laser, plasma, and waterjet cutting solutions offering superior edge quality and high-speed processing for diverse metal sheets.',
              isExpanded: _isCuttingExpanded,
              onToggle: () {
                setState(() {
                  _isCuttingExpanded = !_isCuttingExpanded;
                });
              },
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),

      // 👈 3. Footer
      bottomNavigationBar: CustomFooter(
        selectedIndex: _currentNavIndex,
        onItemTapped: _onNavTapped,
      ),
    );
  }

  // 👈 Circular logo, title, arrow, and expandable message box
  Widget _buildTechCard({
    required String imagePath,
    required String companyName,
    required String subtitle,
    required String description,
    required bool isExpanded,
    required VoidCallback onToggle,
  }) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Circular logo (image)
          Container(
            width: 155,
            height: 155,
            decoration: AppStyles.supplierHomeLogoDecoration,
            child: ClipOval(
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.primaryNavy,
                    child: const Center(
                      child: Icon(
                        Icons.settings,
                        color: AppColors.accentOrange,
                        size: 60,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 14),

          // 2. Company title
          Text(
            companyName,
            textAlign: TextAlign.center,
            style: AppTextStyles.homeCardTitle,
          ),

          const SizedBox(height: 4),

          // 3. Subtitle
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.homeCardSubtitle,
          ),

          const SizedBox(height: 8),

          // 4. "View More" clickable button (toggles arrow up/down)
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'View More',
                    style: AppTextStyles.viewMoreText,
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up   // 👈 Arrow up when open
                        : Icons.keyboard_arrow_down, // 👈 Arrow down when closed
                    color: AppColors.darkText,
                    size: 24,
                  ),
                ],
              ),
            ),
          ),

          // 5. 👈 Expandable message box with smooth animation (as per screenshot)
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity, height: 0),
            secondChild: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 14.0),
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 14.0),
              decoration: AppStyles.supplierHomeExpandDecoration,
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: AppTextStyles.homeExpandDescription,
              ),
            ),
            crossFadeState: isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }
}