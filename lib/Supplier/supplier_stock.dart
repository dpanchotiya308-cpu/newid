import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';
import '../Resources/supplier_header.dart';
import '../Resources/supplier_footer.dart';
import 'supplier_home.dart';
import 'supplier_setting.dart';
import 'supplier_menu.dart';
import 'supplier_notification.dart';
import 'supplier_current_order.dart';

class SupplierStockScreen extends StatefulWidget {
  const SupplierStockScreen({super.key});

  @override
  State<SupplierStockScreen> createState() => _SupplierStockScreenState();
}

class _StockItem {
  final String id;
  final String materialName;
  final String grade;
  final String shape;
  final String dimensions;
  final int availablePieces;
  final double totalWeightKg;
  final bool inStock;

  _StockItem({
    required this.id,
    required this.materialName,
    required this.grade,
    required this.shape,
    required this.dimensions,
    required this.availablePieces,
    required this.totalWeightKg,
    this.inStock = true,
  });
}

class _SupplierStockScreenState extends State<SupplierStockScreen> {
  // Footer navigation index (0 = Home, 1 = Current Order, 2 = Setting, 3 = Notification)
  final int _currentNavIndex = 1;

  // Search controller
  final TextEditingController _searchController = TextEditingController();

  // Stock inventory list matching Figma material specifications
  late List<_StockItem> _allStock;
  late List<_StockItem> _filteredStock;

  @override
  void initState() {
    super.initState();
    _loadInitialStock();
    _filteredStock = List.from(_allStock);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadInitialStock() {
    _allStock = [
      _StockItem(
        id: '1',
        materialName: 'EN-D Raw Steel Bar',
        grade: 'EN-D-20',
        shape: 'Round',
        dimensions: 'Dia: 20mm x Length: 45.32mm',
        availablePieces: 850,
        totalWeightKg: 425.5,
        inStock: true,
      ),
      _StockItem(
        id: '2',
        materialName: 'Mild Steel Rod',
        grade: 'MS-Grade A',
        shape: 'Round',
        dimensions: 'Dia: 25mm x Length: 60.00mm',
        availablePieces: 420,
        totalWeightKg: 310.0,
        inStock: true,
      ),
      _StockItem(
        id: '3',
        materialName: 'Stainless Steel Rod',
        grade: 'SS-304',
        shape: 'Hexagonal',
        dimensions: 'Dia: 18mm x Length: 50.00mm',
        availablePieces: 190,
        totalWeightKg: 145.2,
        inStock: true,
      ),
      _StockItem(
        id: '4',
        materialName: 'Aluminium Bar Stock',
        grade: 'AL-6061',
        shape: 'Square',
        dimensions: 'Width: 30mm x Length: 100.00mm',
        availablePieces: 45,
        totalWeightKg: 38.0,
        inStock: false,
      ),
    ];
  }

  void _onSearchChanged(String query) {
    setState(() {
      if (query.trim().isEmpty) {
        _filteredStock = List.from(_allStock);
      } else {
        _filteredStock = _allStock.where((item) {
          final q = query.toLowerCase();
          return item.materialName.toLowerCase().contains(q) ||
              item.grade.toLowerCase().contains(q) ||
              item.shape.toLowerCase().contains(q);
        }).toList();
      }
    });
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
    final totalUnits = _allStock.fold<int>(0, (sum, i) => sum + i.availablePieces);
    final totalKg = _allStock.fold<double>(0, (sum, i) => sum + i.totalWeightKg);

    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 1. Supplier Header (Title: "Stock", Back Button, Menu Button)
      appBar: CustomHeader(
        title: 'Stock',
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

      // 👈 2. Body (Figma Supplier Theme Responsive & Scrollable)
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600), // Responsive Max Width
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 📊 Stock Inventory Summary Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
                    decoration: AppStyles.stockSummaryCardDecoration,
                    child: Row(
                      children: [
                        Expanded(
                          child: _buildSummaryItem(
                            label: 'Total Materials',
                            value: '${_allStock.length} Types',
                          ),
                        ),
                        Container(width: 1, height: 38, color: Colors.white12),
                        Expanded(
                          child: _buildSummaryItem(
                            label: 'Total Pieces',
                            value: '$totalUnits Pcs',
                          ),
                        ),
                        Container(width: 1, height: 38, color: Colors.white12),
                        Expanded(
                          child: _buildSummaryItem(
                            label: 'Weight',
                            value: '${totalKg.toStringAsFixed(1)} kg',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // 🔍 Search Stock Field (Dual Tone matching Figma Style)
                  Container(
                    height: 50,
                    decoration: AppStyles.stockSearchDecoration,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search_rounded,
                          color: AppColors.accentOrange,
                          size: 22,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onChanged: _onSearchChanged,
                            style: AppTextStyles.stockSearchInputText,
                            cursorColor: AppColors.accentOrange,
                            decoration: AppStyles.stockSearchInputDecoration,
                          ),
                        ),
                        if (_searchController.text.isNotEmpty)
                          GestureDetector(
                            onTap: () {
                              _searchController.clear();
                              _onSearchChanged('');
                            },
                            child: const Icon(
                              Icons.close_rounded,
                              color: AppColors.subtitleGray,
                              size: 18,
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // 📦 Stock Material Items List
                  if (_filteredStock.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 40.0),
                        child: Column(
                          children: [
                            const Icon(
                              Icons.inventory_2_outlined,
                              size: 60,
                              color: AppColors.subtitleGray,
                            ),
                            const SizedBox(height: 12),
                            const Text(
                              'No matching stock items found',
                              style: AppTextStyles.stockEmptyText,
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _filteredStock.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 16),
                      itemBuilder: (context, index) {
                        final item = _filteredStock[index];
                        return _buildStockCard(item);
                      },
                    ),

                  const SizedBox(height: 24),
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

  Widget _buildSummaryItem({required String label, required String value}) {
    return Column(
      children: [
        Text(value, style: AppTextStyles.stockSummaryNumber),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.stockSummaryLabel),
      ],
    );
  }

  // 👈 Stock Card Widget as per Figma Light Grey Material Card
  Widget _buildStockCard(_StockItem item) {
    return Container(
      decoration: AppStyles.stockCardDecoration,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Material Name + In-Stock Badge
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.materialName,
                  style: AppTextStyles.stockItemTitle,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: AppStyles.stockBadgeDecoration(inStock: item.inStock),
                child: Text(
                  item.inStock ? 'IN STOCK' : 'LOW STOCK',
                  style: AppTextStyles.stockBadgeText,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Row 2: Material Grade & Shape Specs
          Text(
            'Material  : - ${item.grade} , ${item.shape}',
            style: AppTextStyles.stockItemSubtitle,
          ),

          const SizedBox(height: 4),

          // Row 3: Dimensions
          Text(
            'Dimensions: ${item.dimensions}',
            style: AppTextStyles.stockItemSubtitle,
          ),

          const SizedBox(height: 12),

          // Row 4: Available Quantity & Weight
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            decoration: AppStyles.stockAvailableDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Available: ${item.availablePieces} Pieces',
                    style: AppTextStyles.stockAvailableText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Weight: ${item.totalWeightKg} kg',
                  style: AppTextStyles.stockAvailableText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
