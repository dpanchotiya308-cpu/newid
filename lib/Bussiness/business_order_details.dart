import 'package:flutter/material.dart';
import 'package:flutter_application_1/Resources/business_header.dart';
import 'package:flutter_application_1/Resources/business_footer.dart';
import '../App_Style/App_Screen_Style.dart';
import 'business_home.dart';
import 'business_menu.dart';
import 'business_notification.dart';
import 'business_setting.dart';
import 'business_current_order.dart';

class BusinessOrderDetailsScreen extends StatefulWidget {
  final String orderTitle;
  final String companyName;
  final String status;
  final String orderedDate;
  final String materialGrade;
  final String tolerances;
  final String heatTreatment;

  const BusinessOrderDetailsScreen({
    super.key,
    this.orderTitle = 'Order #1 Details',
    this.companyName = 'Tech Corp Inc.',
    this.status = 'PENDING',
    this.orderedDate = '18 Feb 2026',
    this.materialGrade = 'Mild Steel (EN8)',
    this.tolerances = '±0.05 mm',
    this.heatTreatment = 'Required',
  });

  @override
  State<BusinessOrderDetailsScreen> createState() =>
      _BusinessOrderDetailsScreenState();
}

class _BusinessOrderDetailsScreenState
    extends State<BusinessOrderDetailsScreen> {
  final int _currentNavIndex = 1; // Orders Tab Active

  void _onNavTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BusinessHomeScreen()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BusinessCurrentOrderScreen(),
        ),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SettingScreen()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BusinessNotificationScreen(),
        ),
      );
    }
  }

  void _onAcceptOrder() {
    debugPrint('Order accepted');
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Order accepted'),
        backgroundColor: AppColors.statusGreen,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _onDeclineOrder() {
    debugPrint('Order declined');
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Order declined'),
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 1. Business Header (Title: "Order #1 Details", Back Button, Menu Button)
      appBar: BusinessHeader(
        title: widget.orderTitle,
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
            MaterialPageRoute(builder: (context) => const BusinessMenuScreen()),
          );
        },
      ),

      // 2. Body (Figma Page 19 Responsive & Scrollable)
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Client Information Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: AppStyles.orderDetailsCardDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Client Information',
                    style: AppTextStyles.orderDetailsCardHeader,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoRow('Company:', widget.companyName),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      const SizedBox(
                        width: 90,
                        child: Text(
                          'Status:',
                          style: AppTextStyles.orderDetailsLabel,
                        ),
                      ),
                      Text(
                        widget.status,
                        style: AppTextStyles.orderDetailsStatusPending,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  _buildInfoRow('Ordered:', widget.orderedDate),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // Dimensions & Specs Section Title
            const Text(
              'Dimensions & Specs',
              style: AppTextStyles.sectionTitle,
            ),

            const SizedBox(height: 14),

            // Dimensions & Specs Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: AppStyles.orderDetailsCardDecoration,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSpecsRow('Material Grade: ', widget.materialGrade),
                  const SizedBox(height: 14),
                  _buildSpecsRow('Tolerances: ', widget.tolerances),
                  const SizedBox(height: 14),
                  _buildSpecsRow('Heat Treatment: ', widget.heatTreatment),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Accept Work Order Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _onAcceptOrder,
                style: AppStyles.orderDetailActionButtonStyle,
                child: const Text(
                  'Accept Work Order',
                  style: AppTextStyles.orderDetailButtonText,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Decline Work Order Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _onDeclineOrder,
                style: AppStyles.orderDetailActionButtonStyle,
                child: const Text(
                  'Decline Work Order',
                  style: AppTextStyles.orderDetailButtonText,
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),

      // 3. Business Footer (Orders Tab Active)
      bottomNavigationBar: BusinessFooter(
        selectedIndex: _currentNavIndex,
        onItemTapped: _onNavTapped,
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: AppTextStyles.orderDetailsLabel,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: AppTextStyles.orderDetailsValue,
          ),
        ),
      ],
    );
  }

  Widget _buildSpecsRow(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: AppTextStyles.orderDetailsLabel,
        ),
        Text(
          value,
          style: AppTextStyles.orderDetailsValue,
        ),
      ],
    );
  }
}
