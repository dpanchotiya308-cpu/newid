import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../App_Style/App_Screen_Style.dart';
import '../Resources/supplier_header.dart';
import '../Resources/supplier_footer.dart';
import 'supplier_home.dart';
import 'supplier_setting.dart';
import 'supplier_menu.dart';
import 'supplier_current_order.dart';
import 'supplier_notification.dart';

class SupplierSendOrderScreen extends StatefulWidget {
  const SupplierSendOrderScreen({super.key});

  @override
  State<SupplierSendOrderScreen> createState() =>
      _SupplierSendOrderScreenState();
}

class _SupplierSendOrderScreenState extends State<SupplierSendOrderScreen> {
  final int _currentNavIndex = 1; // Current Order / Orders related tab

  // 0. Company Selection Dropdown
  String _selectedCompany = 'Excel Machinery pvt.ltd';
  final List<String> _companyOptions = [
    'Excel Machinery pvt.ltd',
    'Tech Corp Inc.',
    'Alpha Ind.',
    'Global Logistics',
    'Apex Steel & Alloys',
    'SubSetu Manufacturing Ltd',
  ];

  // 1. Material Dropdown Selection (Default 'EN-D')
  String _selectedMaterial = 'EN-D';
  final List<String> _materialOptions = [
    'EN-D',
    'EN-8',
    'EN-24',
    'Mild Steel',
    'SS-304',
  ];

  // 2. Width Input Controller (Default '20')
  late final TextEditingController _widthController;

  // 3. Diagram / Shape Dropdown Selection (Default 'Round')
  String _selectedDiagram = 'Round';
  final List<String> _diagramOptions = ['Round', 'Square', 'Hexagonal', 'Flat'];

  // 4. Length Input Controller (Default '45.32')
  late final TextEditingController _lengthController;

  // Unit Dropdown Selection (Default 'mm')
  String _selectedUnit = 'mm';
  final List<String> _unitOptions = ['mm', 'cm', 'inch'];

  // 5. Piece Input Controller (Default '20')
  late final TextEditingController _pieceController;

  @override
  void initState() {
    super.initState();
    _widthController = TextEditingController(text: '20');
    _lengthController = TextEditingController(text: '45.32');
    _pieceController = TextEditingController(text: '20');
  }

  @override
  void dispose() {
    _widthController.dispose();
    _lengthController.dispose();
    _pieceController.dispose();
    super.dispose();
  }

  void _onSend() {
    FocusScope.of(context).unfocus();
    final width = _widthController.text.trim();
    final length = _lengthController.text.trim();
    final piece = _pieceController.text.trim();

    if (width.isEmpty || length.isEmpty || piece.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the order specifications'),
          backgroundColor: Colors.orangeAccent,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Order Sent to $_selectedCompany: $_selectedMaterial, $_selectedDiagram, $length$_selectedUnit, $piece Pieces',
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
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
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SupplierCurrentOrderScreen(),
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
          builder: (context) => const SupplierNotificationScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 ૧. Supplier Header (Back Button, "Send order" Title, Hamburger Menu)
      appBar: CustomHeader(
        title: 'Send order',
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

      // 👈 ૨. Body (Figma Page 13 Responsive & Scrollable)
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 550,
            ), // Responsive Constraint
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 28.0,
                vertical: 24.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  // 🏢 0. Row: Company Selection
                  _buildSpecificationRow(
                    label: 'Company',
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      decoration: AppStyles.sendOrderPillDecoration,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedCompany,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                            size: 26,
                          ),
                          isExpanded: true,
                          style: AppTextStyles.sendOrderInputValue,
                          dropdownColor: const Color(0xFFD6DBE1),
                          items: _companyOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.apartment_rounded,
                                    color: AppColors.accentOrange,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      value,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                _selectedCompany = newValue;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // 🏷️ 1. Row: Material
                  _buildSpecificationRow(
                    label: 'Material',
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      decoration: AppStyles.sendOrderPillDecoration,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedMaterial,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                            size: 26,
                          ),
                          isExpanded: true,
                          style: AppTextStyles.sendOrderInputValue,
                          dropdownColor: const Color(0xFFD6DBE1),
                          items: _materialOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                _selectedMaterial = newValue;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // 🏷️ 2. Row: Width
                  _buildSpecificationRow(
                    label: 'Width',
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      decoration: AppStyles.sendOrderPillDecoration,
                      child: Center(
                        child: TextField(
                          controller: _widthController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.sendOrderInputValue,
                          cursorColor: Colors.black,
                          decoration: AppStyles.borderlessInputDecoration,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // 🏷️ 3. Row: Diagram
                  _buildSpecificationRow(
                    label: 'Diagram',
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      decoration: AppStyles.sendOrderPillDecoration,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _selectedDiagram,
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.black,
                            size: 26,
                          ),
                          isExpanded: true,
                          style: AppTextStyles.sendOrderInputValue,
                          dropdownColor: const Color(0xFFD6DBE1),
                          items: _diagramOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() {
                                _selectedDiagram = newValue;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // 🏷️ 4. Row: Length (Length input + Unit dropdown)
                  _buildSpecificationRow(
                    label: 'Length',
                    child: Row(
                      children: [
                        // Length Input
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14.0,
                            ),
                            decoration: AppStyles.sendOrderPillDecoration,
                            child: Center(
                              child: TextField(
                                controller: _lengthController,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(r'^\d*\.?\d*'),
                                  ),
                                ],
                                textAlign: TextAlign.center,
                                style: AppTextStyles.sendOrderInputValue,
                                cursorColor: Colors.black,
                                decoration: AppStyles.borderlessInputDecoration,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Unit Dropdown
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 48,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            decoration: AppStyles.sendOrderPillDecoration,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedUnit,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: Colors.black,
                                  size: 22,
                                ),
                                isExpanded: true,
                                style: AppTextStyles.sendOrderInputValue,
                                dropdownColor: const Color(0xFFD6DBE1),
                                items: _unitOptions.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Center(child: Text(value)),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _selectedUnit = newValue;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // 🏷️ 5. Row: Piece
                  _buildSpecificationRow(
                    label: 'Piece',
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      decoration: AppStyles.sendOrderPillDecoration,
                      child: Center(
                        child: TextField(
                          controller: _pieceController,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.sendOrderInputValue,
                          cursorColor: Colors.black,
                          decoration: AppStyles.borderlessInputDecoration,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 52),

                  // 🔘 Send Order Button (Properly Centered across the screen)
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: SizedBox(
                        width: 240,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _onSend,
                          style: AppStyles.sendOrderButtonStyle,
                          child: const Text(
                            'Send Order',
                            style: AppTextStyles.sendOrderButtonText,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),

      // 👈 ૩. Supplier Footer કૉલ કર્યો
      bottomNavigationBar: CustomFooter(
        selectedIndex: _currentNavIndex,
        onItemTapped: _onNavTapped,
      ),
    );
  }

  // Row helper ensuring responsive layout between Left Label and Right Input
  Widget _buildSpecificationRow({
    required String label,
    required Widget child,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 120,
          child: Text(label, style: AppTextStyles.sendOrderLabel),
        ),
        const SizedBox(width: 12),
        Expanded(child: child),
      ],
    );
  }
}
