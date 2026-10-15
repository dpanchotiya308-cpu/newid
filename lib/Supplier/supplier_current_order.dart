import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';
import '../Resources/supplier_header.dart';
import '../Resources/supplier_footer.dart';
import 'supplier_home.dart';
import 'supplier_setting.dart';
import 'supplier_menu.dart';
import 'supplier_notification.dart';

class SupplierCurrentOrderScreen extends StatefulWidget {
  const SupplierCurrentOrderScreen({super.key});

  @override
  State<SupplierCurrentOrderScreen> createState() =>
      _SupplierCurrentOrderScreenState();
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

class _SupplierCurrentOrderScreenState
    extends State<SupplierCurrentOrderScreen> {
  final int _currentNavIndex = 1; // 1 = Current Order Tab Active

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

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Order #${removedOrder.id} removed'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'UNDO',
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SettingScreen()),
      );
    } else if (index == 3) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SupplierNotificationScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 1. Supplier Header (Title: "Current Order", Back Button, Menu Button)
      appBar: CustomHeader(
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

      // 👈 2. Body (Responsive & Scrollable)
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600), // Responsive Constraint
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

      // 👈 3. Supplier Footer (Current Order Tab Active / Highlighted)
      bottomNavigationBar: CustomFooter(
        selectedIndex: _currentNavIndex, // 1 = Current Order
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
                  padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Icon(
                    Icons.close_rounded,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Specs Line 1: Material & Shape
          Text(
            'Material  : - ${order.material} , ${order.shape}',
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
