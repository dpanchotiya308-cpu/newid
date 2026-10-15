import 'package:flutter/material.dart';
import 'package:flutter_application_1/Resources/business_header.dart';
import 'package:flutter_application_1/Resources/business_footer.dart';
import '../App_Style/App_Screen_Style.dart';
import 'business_home.dart';
import 'business_menu.dart';
import 'business_notification.dart';
import 'business_setting.dart';
import 'business_current_order.dart';

class BusinessOrderStatusScreen extends StatefulWidget {
  const BusinessOrderStatusScreen({super.key});

  @override
  State<BusinessOrderStatusScreen> createState() => _BusinessOrderStatusScreenState();
}

class _StageItem {
  final String title;
  final String subtitle;
  bool isCompleted;
  bool isActive;

  _StageItem({
    required this.title,
    required this.subtitle,
    required this.isCompleted,
    this.isActive = false,
  });
}

class _BusinessOrderStatusScreenState extends State<BusinessOrderStatusScreen> {
  final int _currentNavIndex = 1; // 1 = Orders Tab Active

  // 👈 4 stages as per Figma Page 20
  late List<_StageItem> _stages;

  @override
  void initState() {
    super.initState();
    _stages = [
      _StageItem(
        title: 'Material Dispatched',
        subtitle: 'By Supplier: 18 Feb, 10:00 AM',
        isCompleted: true,
      ),
      _StageItem(
        title: 'Material Received',
        subtitle: 'Acknowledged via PoD',
        isCompleted: true,
      ),
      _StageItem(
        title: 'Cutting In Progress',
        subtitle: 'Currently active stage',
        isCompleted: true,
        isActive: true,
      ),
      _StageItem(
        title: 'Ready for Quality Assembly',
        subtitle: 'Awaiting completion',
        isCompleted: false,
      ),
    ];
  }

  // 👈 1-Tap: Action for "Mark as Ready" button
  void _markAsReady() {
    setState(() {
      final isAlreadyReady = _stages[3].isCompleted;
      if (!isAlreadyReady) {
        _stages[2].isActive = false;
        _stages[3].isCompleted = true;
        _stages[3].isActive = true;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Order #1 marked as Ready for Quality Assembly!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        // Toggle back
        _stages[3].isCompleted = false;
        _stages[3].isActive = false;
        _stages[2].isActive = true;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Status reverted to Cutting In Progress'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  void _onNavTapped(int index) {
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
    final bool isReady = _stages[3].isCompleted;

    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 1. Business Header (Title: "Update Status", Subtitle: "Order #1 - 4-Stage Sync")
      appBar: BusinessHeader(
        title: 'Update Status',
        subtitle: 'Order #1 - 4-Stage Sync',
        showBackButton: true,
        showMenuButton: true,
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

      // 👈 2. Body (Responsive & Interactive)
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600), // Responsive Width for Tablets/Desktop
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  // 👈 4-Stage Sync List
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _stages.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 38),
                    itemBuilder: (context, index) {
                      final stage = _stages[index];
                      return _buildStageRow(stage, index);
                    },
                  ),

                  const SizedBox(height: 60),

                  // 👈 1-Tap: Mark as Ready Button (Interactive)
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: _markAsReady,
                        style: AppStyles.primaryButtonStyle,
                        child: Text(
                          isReady ? '✓ Status: Ready Marked' : '1-Tap: Mark as Ready',
                          style: AppTextStyles.orderStatusButtonText,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),

      // 👈 3. Business Footer (Orders Tab Active)
      bottomNavigationBar: BusinessFooter(
        selectedIndex: _currentNavIndex, // 1 = Orders
        onItemTapped: _onNavTapped,
      ),
    );
  }

  // 👈 Stage Row Widget as per Figma Page 20
  Widget _buildStageRow(_StageItem stage, int index) {
    TextStyle titleStyle;
    if (stage.isActive) {
      titleStyle = AppTextStyles.statusActiveTitle; // Highlighted Orange
    } else if (stage.isCompleted) {
      titleStyle = AppTextStyles.statusCompletedTitle; // White Bold
    } else {
      titleStyle = AppTextStyles.statusPendingTitle; // Subtitle Gray
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          stage.isCompleted = !stage.isCompleted;
          if (index == 3) {
            _stages[2].isActive = !stage.isCompleted;
            stage.isActive = stage.isCompleted;
          }
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Checkbox Box
          Container(
            width: 28,
            height: 28,
            decoration: stage.isCompleted
                ? AppStyles.statusCheckedBox
                : AppStyles.statusUncheckedBox,
            child: stage.isCompleted
                ? const Icon(
                    Icons.check,
                    color: Colors.black,
                    size: 20,
                  )
                : null,
          ),

          const SizedBox(width: 22),

          // Titles Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  stage.title,
                  style: titleStyle,
                ),
                if (stage.subtitle.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    stage.subtitle,
                    style: AppTextStyles.statusStageSubtitle,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
