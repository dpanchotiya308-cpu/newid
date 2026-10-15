import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';
import '../Resources/supplier_header.dart';
import '../Resources/supplier_footer.dart';
import 'supplier_home.dart';
import 'supplier_setting.dart';
import 'supplier_menu.dart';
import 'supplier_notification.dart';
import 'supplier_current_order.dart';

class SupplierConformOrderScreen extends StatefulWidget {
  const SupplierConformOrderScreen({super.key});

  @override
  State<SupplierConformOrderScreen> createState() =>
      _SupplierConformOrderScreenState();
}

class _ConformOrderData {
  final String id;
  final String companyName;
  final String material;
  final String shape;
  final String length;
  final String pish;
  final String date;
  final String time;

  _ConformOrderData({
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

class _SupplierConformOrderScreenState
    extends State<SupplierConformOrderScreen> {
  // Footer navigation index (0 = Home, 1 = Current Order, 2 = Setting, 3 = Notification)
  final int _currentNavIndex = 1;

  // 👈 4 confirmed order cards as per Figma Page 12
  late List<_ConformOrderData> _orders;

  @override
  void initState() {
    super.initState();
    _loadInitialOrders();
  }

  void _loadInitialOrders() {
    _orders = [
      _ConformOrderData(
        id: '1',
        companyName: 'logo Text Here Technology Pty.Ltd',
        material: 'En-D-20',
        shape: 'Round',
        length: '45.32mm',
        pish: '20',
        date: '11/08/2015',
        time: '11:45 AM',
      ),
      _ConformOrderData(
        id: '2',
        companyName: 'logo Text Here Technology Pty.Ltd',
        material: 'En-D-20',
        shape: 'Round',
        length: '45.32mm',
        pish: '20',
        date: '11/08/2015',
        time: '11:45 AM',
      ),
      _ConformOrderData(
        id: '3',
        companyName: 'logo Text Here Technology Pty.Ltd',
        material: 'En-D-20',
        shape: 'Round',
        length: '45.32mm',
        pish: '20',
        date: '11/08/2015',
        time: '11:45 AM',
      ),
      _ConformOrderData(
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
        content: Text('Conformed Order #${removedOrder.id} deleted'),
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
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SupplierCurrentOrderScreen()),
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

      // 👈 1. Supplier Header (Title: "Conform Order", Back Button, Menu Button)
      appBar: CustomHeader(
        title: 'Conform Order',
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

      // 👈 2. Body (Figma Page 12 Responsive & Scrollable)
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
                          Icons.check_circle_outline,
                          size: 70,
                          color: AppColors.subtitleGray,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'No Conformed Orders Found',
                          style: AppTextStyles.conformOrderEmptyText,
                        ),
                        const SizedBox(height: 12),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _loadInitialOrders();
                            });
                          },
                          child: const Text(
                            'Reset Orders',
                            style: AppTextStyles.conformOrderResetText,
                          ),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 16.0,
                    ),
                    child: Column(
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _orders.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16.0),
                          itemBuilder: (context, index) {
                            final order = _orders[index];
                            return _buildConformOrderCard(order, index);
                          },
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),

      // 👈 3. Supplier Footer
      bottomNavigationBar: CustomFooter(
        selectedIndex: _currentNavIndex,
        onItemTapped: _onNavTapped,
      ),
    );
  }

  // 👈 Conform Order Card Widget as per Figma Page 12 (Trash / Delete Icon)
  Widget _buildConformOrderCard(_ConformOrderData order, int index) {
    return Container(
      decoration: AppStyles.conformOrderCardDecoration,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Company Name + Trash / Delete Icon (Figma Page 12 Trashcan)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  order.companyName,
                  style: AppTextStyles.currentOrderCompany,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _removeOrder(index),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Row 2: Material & Shape Specs
          Text(
            'Material  : - ${order.material} , ${order.shape}',
            style: AppTextStyles.currentOrderSpecs,
          ),

          const SizedBox(height: 2),

          // Row 3: Length & Piece Specs
          Text(
            'Length :-${order.length} ,Pish:-${order.pish}',
            style: AppTextStyles.currentOrderSpecs,
          ),

          const SizedBox(height: 14),

          // Row 4: Date & Time
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
