import 'package:flutter/material.dart';
import 'package:flutter_application_1/Resources/business_header.dart';
import 'package:flutter_application_1/Resources/business_footer.dart';
import '../App_Style/App_Screen_Style.dart';
import 'business_home.dart';
import 'business_notification.dart';
import 'business_setting.dart';
import 'business_help&support.dart';
import 'business_contact_us.dart';
import '../Supplier/calculater.dart';
import 'business_current_order.dart';
import 'business_order_status.dart';
import 'business_log_material_yield.dart';

class BusinessMenuScreen extends StatelessWidget {
  const BusinessMenuScreen({super.key});

  void _onNavTapped(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BusinessHomeScreen()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BusinessCurrentOrderScreen()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SettingScreen()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BusinessNotificationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 👈 7 menu items as per Figma Page 18
    final List<_MenuItemData> menuItems = [
      _MenuItemData(
        title: 'Notifications',
        icon: Icons.notifications_none_rounded,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BusinessNotificationScreen(),
            ),
          );
        },
      ),
      _MenuItemData(
        title: 'Current Order',
        icon: Icons.chat_bubble_outline_rounded,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BusinessCurrentOrderScreen(),
            ),
          );
        },
      ),
      _MenuItemData(
        title: 'Order Status',
        icon: Icons.send_rounded,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BusinessOrderStatusScreen(),
            ),
          );
        },
      ),
      _MenuItemData(
        title: 'Log Material Yield',
        icon: Icons.notifications_rounded,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BusinessLogMaterialYieldScreen(),
            ),
          );
        },
      ),
      _MenuItemData(
        title: 'Calculator',
        icon: Icons.inventory_2_outlined, // Cube icon as per Figma Page 18
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CalculaterScreen(),
            ),
          );
        },
      ),
      _MenuItemData(
        title: 'Help & Support',
        icon: Icons.calculate_outlined, // Calculator/math icon as per Figma Page 18
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HelpSupportScreen(),
            ),
          );
        },
      ),
      _MenuItemData(
        title: 'Contact Us',
        icon: Icons.settings_outlined, // Gear icon as per Figma Page 18
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ContactUsScreen(),
            ),
          );
        },
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 1. Business Header (Back Button, "Menu" Title)
      appBar: BusinessHeader(
        title: 'Menu',
        showBackButton: true,
        centerTitle: true,
        showMenuButton: false, // Hamburger button hidden on Menu page
        onBackTap: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const BusinessHomeScreen()),
            );
          }
        },
      ),

      // 👈 2. Body (Responsive & Scrollable)
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600), // Responsive Max Width for Tablets/Web
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: menuItems.map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: item.onTap,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
                        child: Row(
                          children: [
                            Icon(
                              item.icon,
                              color: Colors.white,
                              size: 28,
                            ),
                            const SizedBox(width: 24),
                            Text(
                              item.title,
                              style: AppTextStyles.menuItemText,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),

      // 👈 3. Business Footer
      bottomNavigationBar: BusinessFooter(
        selectedIndex: -1, // No tab active when on Menu
        onItemTapped: (index) => _onNavTapped(context, index),
      ),
    );
  }
}

class _MenuItemData {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  _MenuItemData({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
