import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bussiness/business_change_password.dart';
import 'package:flutter_application_1/Bussiness/business_help&support.dart';
import 'package:flutter_application_1/Resources/business_footer.dart';
// 👈 Imported Business files instead of Supplier
import '../App_Style/App_Screen_Style.dart';
import 'business_about_us.dart';
import 'business_contact_us.dart';
import '../Screen/login_screen.dart';
import "./business_home.dart"; // 👈 Business Home Page Import
import 'business_notification.dart';
import 'business_current_order.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // Settings tab (Index: 2) will be selected in Footer
  final int _currentNavIndex = 2;

  // 👈 Business Footer Navigation handler
  void _onNavTapped(int index) {
    if (index == 0) {
      // 👈 Clicking Home tab navigates to Business Home Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BusinessHomeScreen()),
      );
    } else if (index == 1) {
      // 👈 Clicking Current Order tab navigates to Business Current Order Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BusinessCurrentOrderScreen()),
      );
    } else if (index == 3) {
      // 👈 Clicking Notification tab navigates to Business Notification Screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BusinessNotificationScreen()),
      );
    }
  }

  // Logout Confirmation Popup Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          backgroundColor: AppColors.cardNavy,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(color: Colors.white12),
          ),
          title: const Text(
            'Logout',
            style: AppTextStyles.dialogTitle,
          ),
          content: const Text(
            'Are you sure you want to logout from your account?',
            style: AppTextStyles.dialogContent,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text(
                'Cancel',
                style: AppTextStyles.dialogCancel,
              ),
            ),
            ElevatedButton(
              style: AppStyles.dialogConfirmButtonStyle,
              onPressed: () {
                Navigator.pop(dialogContext); // Close dialog
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                  (route) => false,
                );
              },
              child: const Text(
                'Logout',
                style: AppTextStyles.dialogConfirm,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 2. Body (Business Settings Options)
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Header / App Bar (Centered Title with Back Button)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.accentOrange,
                          size: 20,
                        ),
                        // 👈 2. Pressing Back Button navigates directly to Business Home Page
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BusinessHomeScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    const Text(
                      'Settings',
                      style: AppTextStyles.settingsHeaderTitle,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 1. Help & Support
              _SettingsTile(
                icon: Icons.help_outline_rounded,
                title: 'Help & Support',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpSupportScreen(), // 👈 Business Screen
                    ),
                  );
                },
              ),

              // 2. About Us
              _SettingsTile(
                icon: Icons.info_outline_rounded,
                title: 'About Us',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUsScreen(), // 👈 Business Screen
                    ),
                  );
                },
              ),

              // 3. Contact Us
              _SettingsTile(
                customIcon: const Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Icon(Icons.person_outline_rounded, color: Colors.white, size: 26),
                    Positioned(
                      right: -4,
                      top: 0,
                      child: Text(
                        '?',
                        style: AppTextStyles.contactUsQuestionMark,
                      ),
                    ),
                  ],
                ),
                title: 'Contact Us',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ContactUsScreen(), // 👈 Business Screen
                    ),
                  );
                },
              ),

              // 4. Change Password
              _SettingsTile(
                icon: Icons.lock_reset_rounded,
                title: 'Change Password',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangePasswordScreen(), // 👈 Business Screen
                    ),
                  );
                },
              ),

              // 5. Logout
              _SettingsTile(
                icon: Icons.logout_rounded,
                title: 'Logout',
                onTap: () => _showLogoutDialog(context),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      // 👈 3. Business Footer (Settings tab selected)
      bottomNavigationBar: BusinessFooter(
        selectedIndex: _currentNavIndex, // 2 = Settings Icon Highlighted
        onItemTapped: _onNavTapped,
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final IconData? icon;
  final Widget? customIcon;
  final String title;
  final VoidCallback onTap;

  const _SettingsTile({
    this.icon,
    this.customIcon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Row(
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: Center(
                child: customIcon ??
                    Icon(
                      icon,
                      color: Colors.white,
                      size: 26,
                    ),
              ),
            ),
            const SizedBox(width: 24),
            Text(
              title,
              style: AppTextStyles.settingsTileTitle,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.white24,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}