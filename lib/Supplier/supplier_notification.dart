import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';
import '../Resources/supplier_header.dart';
import '../Resources/supplier_footer.dart';
import 'supplier_home.dart';
import 'supplier_setting.dart';
import 'supplier_menu.dart';

class SupplierNotificationScreen extends StatefulWidget {
  const SupplierNotificationScreen({super.key});

  @override
  State<SupplierNotificationScreen> createState() =>
      _SupplierNotificationScreenState();
}

class _SupplierNotificationItem {
  final String id;
  final String title;
  final String subtitle;
  final String time;
  bool isUnread;

  _SupplierNotificationItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    this.isUnread = false,
  });
}

class _SupplierNotificationScreenState
    extends State<SupplierNotificationScreen> {
  final int _currentNavIndex = 3; // 3 = Notification Tab Active

  // 👈 Notifications List as per Figma Page 22
  final List<_SupplierNotificationItem> _notifications = [
    _SupplierNotificationItem(
      id: '1',
      title: 'New Order Received',
      subtitle: 'Tech Corp Inc. placed Order #12',
      time: '2 mins ago',
      isUnread: true,
    ),
    _SupplierNotificationItem(
      id: '2',
      title: 'Vendor Verified',
      subtitle: 'Global Logistics is now active.',
      time: '1 hour ago',
      isUnread: false,
    ),
    _SupplierNotificationItem(
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SettingScreen()),
      );
    } else if (index == 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Current Order Clicked'),
          duration: Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 1. Supplier Header (Back Arrow, "Notifications" Title, Menu Button)
      appBar: CustomHeader(
        title: 'Notifications',
        showBackButton: true,
        showMenuButton: true,
        onBackTap: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        },
        onMenuTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SupplierMenuScreen()),
          );
        },
      ),

      // 👈 2. Body (Figma Page 22 Responsive & Scrollable)
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600), // Responsive Constraint
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 👈 Right Aligned "Mark all as read"
                  Align(
                    alignment: Alignment.centerRight,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: _markAllAsRead,
                        borderRadius: BorderRadius.circular(8),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                          child: Text(
                            'Mark all as read',
                            style: AppTextStyles.markAllReadText,
                          ),
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

      // 👈 3. Supplier Footer (Notification Tab Active)
      bottomNavigationBar: CustomFooter(
        selectedIndex: _currentNavIndex,
        onItemTapped: _onNavTapped,
      ),
    );
  }

  // 👈 Notification Card Widget as per Figma Page 22
  Widget _buildNotificationCard(_SupplierNotificationItem item) {
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
