import 'package:flutter/material.dart';
import 'package:flutter_application_1/Resources/business_header.dart';
import 'package:flutter_application_1/Resources/business_footer.dart';
import '../App_Style/App_Screen_Style.dart';
import 'business_home.dart';
import 'business_setting.dart';
import 'business_menu.dart';
import 'business_current_order.dart';

class BusinessNotificationScreen extends StatefulWidget {
  const BusinessNotificationScreen({super.key});

  @override
  State<BusinessNotificationScreen> createState() => _BusinessNotificationScreenState();
}

class _NotificationItem {
  final String id;
  final String title;
  final String subtitle;
  final String time;
  bool isUnread;

  _NotificationItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    this.isUnread = false,
  });
}

class _BusinessNotificationScreenState extends State<BusinessNotificationScreen> {
  final int _currentNavIndex = 3; // 3 = Notification Tab Active

  // 👈 Notifications list as per Figma Page 22
  final List<_NotificationItem> _notifications = [
    _NotificationItem(
      id: '1',
      title: 'New Order Received',
      subtitle: 'Tech Corp Inc. placed Order #12',
      time: '2 mins ago',
      isUnread: true,
    ),
    _NotificationItem(
      id: '2',
      title: 'Vendor Verified',
      subtitle: 'Global Logistics is now active.',
      time: '1 hour ago',
      isUnread: false,
    ),
    _NotificationItem(
      id: '3',
      title: 'PoD Approved',
      subtitle: 'Alpha Industries verified materials.',
      time: 'Yesterday, 4:30 PM',
      isUnread: false,
    ),
  ];

  void _markAllAsRead() {
    setState(() {
      for (var item in _notifications) {
        item.isUnread = false;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All notifications marked as read'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _onNavTapped(int index) {
    if (index == _currentNavIndex) return;

    if (index == 0) {
      // Navigate to Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BusinessHomeScreen()),
      );
    } else if (index == 1) {
      // Navigate to Current Order
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BusinessCurrentOrderScreen()),
      );
    } else if (index == 2) {
      // Navigate to Settings
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SettingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 1. Business Header (Back Button, "Notifications" Title & Menu Icon)
      appBar: BusinessHeader(
        title: 'Notifications',
        showBackButton: true,
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
        onMenuTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const BusinessMenuScreen(),
            ),
          );
        },
      ),

      // 👈 2. Body (Responsive & Scrollable)
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600), // Responsive Max Width for Tablets/Web
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 👈 Mark all as read Button (Right Aligned)
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: _markAllAsRead,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                        child: Text(
                          'Mark all as read',
                          style: AppTextStyles.markAllReadText,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // 👈 Notification Cards List
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _notifications.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 14),
                    itemBuilder: (context, index) {
                      final item = _notifications[index];
                      return _buildNotificationCard(item);
                    },
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),

      // 👈 3. Business Footer (Notification Tab Active / Highlighted)
      bottomNavigationBar: BusinessFooter(
        selectedIndex: _currentNavIndex, // 3 = Notification
        onItemTapped: _onNavTapped,
      ),
    );
  }

  // 👈 Notification Card Widget as per Figma Page 22
  Widget _buildNotificationCard(_NotificationItem item) {
    return GestureDetector(
      onTap: () {
        if (item.isUnread) {
          setState(() {
            item.isUnread = false;
          });
        }
      },
      child: Container(
        decoration: AppStyles.notificationCardDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row (Blue Dot for Unread + Title)
            Row(
              children: [
                if (item.isUnread) ...[
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: AppStyles.notificationDotDecoration,
                  ),
                ],
                Expanded(
                  child: Text(
                    item.title,
                    style: AppTextStyles.notificationTitle,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Subtitle
            Text(
              item.subtitle,
              style: AppTextStyles.notificationSubtitle,
            ),

            const SizedBox(height: 8),

            // Time
            Text(
              item.time,
              style: AppTextStyles.notificationTime,
            ),
          ],
        ),
      ),
    );
  }
}
