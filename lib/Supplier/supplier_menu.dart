import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';
import '../Resources/supplier_header.dart';
import 'supplier_home.dart';
import 'supplier_setting.dart';
import 'supplier_notification.dart';
import 'supplier_current_order.dart';
import 'supplier_send_order.dart';
import 'supplier_conform_order.dart';
import 'supplier_stock.dart';
import 'calculater.dart';

class _SupplierMenuItemData {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  _SupplierMenuItemData({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}

class SupplierMenuScreen extends StatelessWidget {
  const SupplierMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 👈 Menu items and icons as per Figma Page 10
    final List<_SupplierMenuItemData> menuItems = [
      _SupplierMenuItemData(
        title: 'Notifications',
        icon: Icons.notifications_none_rounded,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SupplierNotificationScreen(),
            ),
          );
        },
      ),
      _SupplierMenuItemData(
        title: 'Current Order',
        icon: Icons.chat_bubble_outline_rounded,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SupplierCurrentOrderScreen(),
            ),
          );
        },
      ),
      _SupplierMenuItemData(
        title: 'Send Order',
        icon: Icons.send_rounded,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SupplierSendOrderScreen(),
            ),
          );
        },
      ),
      _SupplierMenuItemData(
        title: 'Conform Order',
        icon: Icons.notifications_rounded, // Bell icon as per Figma Page 10
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SupplierConformOrderScreen(),
            ),
          );
        },
      ),
      _SupplierMenuItemData(
        title: 'Stock',
        icon: Icons.inventory_2_outlined, // Cube / Stock icon as per Figma Page 10
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SupplierStockScreen(),
            ),
          );
        },
      ),
      _SupplierMenuItemData(
        title: 'Calculator',
        icon: Icons.calculate_outlined, // Calculator icon as per Figma Page 10
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CalculaterScreen(),
            ),
          );
        },
      ),
      _SupplierMenuItemData(
        title: 'Settings',
        icon: Icons.settings_outlined, // Gear icon as per Figma Page 10
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SettingScreen(),
            ),
          );
        },
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 1. Supplier Header (Back Button, "Menu" Title, No Hamburger Menu)
      appBar: CustomHeader(
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
              MaterialPageRoute(builder: (context) => const HomeScreen()),
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
                      onTap: item.onTap,
                      borderRadius: BorderRadius.circular(10),
                      splashColor: AppColors.accentOrange.withValues(alpha: 0.15),
                      highlightColor: AppColors.accentOrange.withValues(alpha: 0.08),
                      child: Padding(
                        padding: AppStyles.menuItemPadding,
                        child: Row(
                          children: [
                            // Left Icon
                            Icon(
                              item.icon,
                              color: Colors.white,
                              size: 28,
                            ),
                            const SizedBox(width: 24),
                            // Title Text
                            Expanded(
                              child: Text(
                                item.title,
                                style: AppTextStyles.supplierMenuItemText,
                              ),
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
    );
  }
}
