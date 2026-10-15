import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../App_Style/App_Screen_Style.dart';
import '../Resources/business_header.dart';
import '../Resources/business_footer.dart';
import 'business_home.dart';
import 'business_menu.dart';
import 'business_notification.dart';
import 'business_setting.dart';
import 'business_current_order.dart';

class BusinessLogMaterialYieldScreen extends StatefulWidget {
  const BusinessLogMaterialYieldScreen({super.key});

  @override
  State<BusinessLogMaterialYieldScreen> createState() =>
      _BusinessLogMaterialYieldScreenState();
}

class _BusinessLogMaterialYieldScreenState
    extends State<BusinessLogMaterialYieldScreen> {
  final int _currentNavIndex = 1; // Orders Tab

  // Controllers
  final TextEditingController _offcutController =
      TextEditingController(text: '15.5');
  final TextEditingController _scrapController =
      TextEditingController(text: '8.2');

  final double _totalIssued = 250.0;
  double _usableOffcut = 15.5;
  double _scrap = 8.2;

  @override
  void initState() {
    super.initState();
    _offcutController.addListener(_onValuesChanged);
    _scrapController.addListener(_onValuesChanged);
  }

  @override
  void dispose() {
    _offcutController.removeListener(_onValuesChanged);
    _scrapController.removeListener(_onValuesChanged);
    _offcutController.dispose();
    _scrapController.dispose();
    super.dispose();
  }

  void _onValuesChanged() {
    final offcut = double.tryParse(_offcutController.text.trim()) ?? 0.0;
    final scrap = double.tryParse(_scrapController.text.trim()) ?? 0.0;
    setState(() {
      _usableOffcut = offcut;
      _scrap = scrap;
    });
  }

  double get _finishedUnits {
    final finished = _totalIssued - _usableOffcut - _scrap;
    return finished < 0 ? 0 : finished;
  }

  double get _reconciliationPercent {
    if (_totalIssued == 0) return 0;
    final accountedFor = _finishedUnits + _usableOffcut + _scrap;
    final pct = (accountedFor / _totalIssued) * 100;
    return pct > 100 ? 100 : pct;
  }

  void _onSubmit() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Ledger Record Submitted: ${_finishedUnits.toStringAsFixed(1)} kg Finished Units recorded.',
        ),
        backgroundColor: const Color(0xFF1B5E20),
        duration: const Duration(seconds: 2),
      ),
    );
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
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 1. Business Header (Back arrow, "Log Material Yield" Title, Hamburger Menu)
      appBar: BusinessHeader(
        title: 'Log Material Yield',
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

      // 👈 2. Body (Responsive and Scrollable)
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 550), // Responsive Constraint
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 📦 Card 1: Total Raw Material Issued
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 22.0),
                    decoration: AppStyles.yieldCardDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Raw Material Issued',
                          style: AppTextStyles.yieldCardHeader,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '${_totalIssued.toStringAsFixed(2)} kg',
                          style: AppTextStyles.yieldCardTotalValue,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 📝 Field 1: Usable Offcut Weight (kg)
                  const Text(
                    'Usable Offcut Weight (kg)',
                    style: AppTextStyles.yieldInputLabel,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _offcutController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                    ],
                    style: AppTextStyles.yieldInputValue,
                    cursorColor: const Color(0xFF00B0FF),
                    decoration: AppStyles.yieldInputDecoration(
                      hintText: 'Enter offcut weight',
                    ),
                  ),

                  const SizedBox(height: 24),

                  // 📝 Field 2: Scrap / Metal Shavings (kg)
                  const Text(
                    'Scrap / Metal Shavings (kg)',
                    style: AppTextStyles.yieldInputLabel,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _scrapController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                    ],
                    style: AppTextStyles.yieldInputValue,
                    cursorColor: const Color(0xFF00B0FF),
                    decoration: AppStyles.yieldInputDecoration(
                      hintText: 'Enter scrap weight',
                    ),
                  ),

                  const SizedBox(height: 26),

                  // 📊 Card 2: Yield Balancing Preview (Blue border box)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    decoration: AppStyles.yieldPreviewDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Yield Balancing Preview',
                          style: AppTextStyles.yieldPreviewHeader,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Finished Units: ${_finishedUnits.toStringAsFixed(1)} kg',
                          style: AppTextStyles.yieldPreviewText,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Reconciliation match: ${_reconciliationPercent.toStringAsFixed(0)}%',
                          style: AppTextStyles.yieldPreviewText,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // 🔘 Submit Ledger Record Button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _onSubmit,
                      style: AppStyles.yieldSubmitButtonStyle,
                      child: const Text(
                        'Submit Ledger Record',
                        style: AppTextStyles.yieldSubmitButtonText,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),

      // 👈 3. Business Footer (Active on Orders Tab)
      bottomNavigationBar: BusinessFooter(
        selectedIndex: _currentNavIndex,
        onItemTapped: _onNavTapped,
      ),
    );
  }
}
