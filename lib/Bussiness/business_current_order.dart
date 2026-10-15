import 'package:flutter/material.dart';
import 'package:flutter_application_1/Resources/business_header.dart';
import 'package:flutter_application_1/Resources/business_footer.dart';
import '../App_Style/App_Screen_Style.dart';
import 'business_home.dart';
import 'business_menu.dart';
import 'business_notification.dart';
import 'business_setting.dart';

class BusinessCurrentOrderScreen extends StatefulWidget {
  const BusinessCurrentOrderScreen({super.key});

  @override
  State<BusinessCurrentOrderScreen> createState() => _BusinessCurrentOrderScreenState();
}

class _OrderData {
  final String id;
  final String companyName;
  final String material;
  final String shape;
  final String length;
  final String pish;
  final String date;
  final String time;

  _OrderData({
    required this.id,
    required this.companyName,
    required this.material,
    required this.shape,
    required this.length,
    required this.pish,
    required this.date,
    required this.time,
  });
}

class _BusinessCurrentOrderScreenState extends State<BusinessCurrentOrderScreen> {
  final int _currentNavIndex = 1; // 1 = Orders Tab Active

  // 👈 4 orders data as per Figma Page 11
  late List<_OrderData> _orders;

  @override
  void initState() {
    super.initState();
    _loadInitialOrders();
  }

  void _loadInitialOrders() {
    _orders = [
      _OrderData(
        id: '1',
        companyName: 'logo Text Here Technology Pty.Ltd',
        material: 'En-D-20',
        shape: 'Round',
        length: '45.32mm',
        pish: '20',
        date: '11/08/2015',
        time: '11:45 AM',
      ),
      _OrderData(
        id: '2',
        companyName: 'logo Text Here Technology Pty.Ltd',
        material: 'En-D-20',
        shape: 'Round',
        length: '45.32mm',
        pish: '20',
        date: '11/08/2015',
        time: '11:45 AM',
      ),
      _OrderData(
        id: '3',
        companyName: 'logo Text Here Technology Pty.Ltd',
        material: 'En-D-20',
        shape: 'Round',
        length: '45.32mm',
        pish: '20',
        date: '11/08/2015',
        time: '11:45 AM',
      ),
      _OrderData(
        id: '4',
        companyName: 'logo Text Here Technology Pty.Ltd',
        material: 'En-D-20',
        shape: 'Round',
        length: '45.32mm',
        pish: '20',
        date: '11/08/2015',
        time: '11:45 AM',
      ),
    ];
  }

  void _removeOrder(int index) {
    final removedOrder = _orders[index];
    setState(() {
      _orders.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Order #${removedOrder.id} removed'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Undo',
          textColor: AppColors.accentOrange,
          onPressed: () {
            setState(() {
              _orders.insert(index, removedOrder);
            });
          },
        ),
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
    } else if (index == 2) {
      // Navigate to Settings
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SettingScreen()),
      );
    } else if (index == 3) {
      // Navigate to Notification
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BusinessNotificationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 1. Business Header
      appBar: BusinessHeader(
        title: 'Current Order',
        showBackButton: true,
        centerTitle: true,
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

      // 👈 2. Body (Responsive & Scrollable)
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600), // Responsive Max Width for Tablets/Web
            child: _orders.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.inbox_rounded,
                          size: 64,
                          color: AppColors.subtitleGray,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'No Current Orders',
                          style: AppTextStyles.emptyOrderText,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _loadInitialOrders();
                            });
                          },
                          style: AppStyles.primaryButtonStyle,
                          child: const Text('Reload Orders'),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                    child: Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _orders.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 16),
                          itemBuilder: (context, index) {
                            final order = _orders[index];
                            return _buildOrderCard(order, index);
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
          ),
        ),
      ),

      // 👈 3. Business Footer (Orders Tab Active / Highlighted)
      bottomNavigationBar: BusinessFooter(
        selectedIndex: _currentNavIndex, // 1 = Orders
        onItemTapped: _onNavTapped,
      ),
    );
  }

  // 👈 Current Order Card Widget as per Figma Page 11
  Widget _buildOrderCard(_OrderData order, int index) {
    return Container(
      decoration: AppStyles.currentOrderCardDecoration,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Company Name (Underlined) & Close Icon (✕)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  order.companyName,
                  style: AppTextStyles.currentOrderCompany,
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _removeOrder(index),
                child: const Padding(
                  padding: EdgeInsets.only(left: 8.0, bottom: 4.0),
                  child: Icon(
                    Icons.close_rounded,
                    color: Colors.black,
                    size: 22,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Specs Line 1: Material & Shape
          Text(
            'Material : - ${order.material} , ${order.shape}',
            style: AppTextStyles.currentOrderSpecs,
          ),

          const SizedBox(height: 4),

          // Specs Line 2: Length & Pish
          Text(
            'Length :-${order.length} , Pish:-${order.pish}',
            style: AppTextStyles.currentOrderSpecs,
          ),

          const SizedBox(height: 12),

          // Bottom Row: Date (Left) & Time (Right)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.date,
                style: AppTextStyles.currentOrderDateTime,
              ),
              Text(
                order.time,
                style: AppTextStyles.currentOrderDateTime,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
