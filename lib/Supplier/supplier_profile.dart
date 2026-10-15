import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';
import '../Resources/supplier_header.dart';
import '../Resources/supplier_footer.dart';
import '../Resources/profile_data_store.dart';
import 'supplier_home.dart';
import 'supplier_setting.dart';

class SupplierProfileScreen extends StatefulWidget {
  const SupplierProfileScreen({super.key});

  @override
  State<SupplierProfileScreen> createState() => _SupplierProfileScreenState();
}

class _SupplierProfileScreenState extends State<SupplierProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers connected to SupplierDataStore
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _companyController;

  final int _currentNavIndex =
      2; // Settings Tab active (as Profile is under account settings)

  @override
  void initState() {
    super.initState();
    final profile = SupplierDataStore.current.value;
    _nameController = TextEditingController(text: profile.fullName);
    _emailController = TextEditingController(text: profile.email);
    _phoneController = TextEditingController(text: profile.phoneNumber);
    _companyController = TextEditingController(text: profile.companyName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _companyController.dispose();
    super.dispose();
  }

  void _onUpdate() {
    FocusScope.of(context).unfocus();
    if (_formKey.currentState?.validate() ?? false) {
      // 👈 Save updated details back into Global Store
      SupplierDataStore.update(
        fullName: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        companyName: _companyController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Profile Updated Successfully!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _onNavTapped(int index) {
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            index == 1 ? 'Current Order Clicked' : 'Notification Clicked',
          ),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,

      // 👈 1. Supplier Header (Title: "Profile", Back Button, Menu Button)
      appBar: CustomHeader(
        title: 'Profile',
        centerTitle: true,
        showBackButton: true,
        showMenuButton: false,
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

      // 👈 2. Body (Figma Page 9 Responsive & Scrollable)
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
                vertical: 20.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),

                    // 👤 Center Circular Avatar with person icon (Figma Page 9)
                    Center(
                      child: Container(
                        width: 130,
                        height: 130,
                        decoration: AppStyles.supplierProfileAvatarDecoration,
                        child: const Center(
                          child: Icon(
                            Icons.person,
                            size: 96,
                            color: Color(0xFF1B2838),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 36),

                    // 📝 1. Full Name Label & Editable Input
                    const Text(
                      'Full Name',
                      style: AppTextStyles.supplierProfileLabel,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _nameController,
                      style: AppTextStyles.supplierProfileInputText,
                      cursorColor: Colors.white,
                      decoration: AppStyles.greyInputDecoration(
                        hintText: 'Enter full name',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter full name';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 24),

                    // 📝 2. Enter Email Address Label & Editable Input
                    const Text(
                      'Enter Email Address',
                      style: AppTextStyles.supplierProfileLabel,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: AppTextStyles.supplierProfileInputText,
                      cursorColor: Colors.white,
                      decoration: AppStyles.greyInputDecoration(
                        hintText: 'Enter email address',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter email address';
                        }
                        if (!RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 24),

                    // 📝 3. Phone Number Label & Editable Input
                    const Text(
                      'Phone Number',
                      style: AppTextStyles.supplierProfileLabel,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      style: AppTextStyles.supplierProfileInputText,
                      cursorColor: Colors.white,
                      decoration: AppStyles.greyInputDecoration(
                        hintText: 'Enter phone number',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter phone number';
                        }
                        if (value.trim().length < 10) {
                          return 'Enter a valid 10-digit phone number';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 24),

                    // 📝 4. Company Name Label & Editable Input
                    const Text(
                      'Company Name',
                      style: AppTextStyles.supplierProfileLabel,
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _companyController,
                      keyboardType: TextInputType.text,
                      style: AppTextStyles.supplierProfileInputText,
                      cursorColor: Colors.white,
                      decoration: AppStyles.greyInputDecoration(
                        hintText: 'Enter company name',
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter company name';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 40),

                    // 🔘 Update Button (Edits and persists details)
                    Center(
                      child: SizedBox(
                        width: 240,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _onUpdate,
                          style: AppStyles.supplierProfileUpdateButtonStyle,
                          child: const Text(
                            'Update',
                            style: AppTextStyles.supplierProfileButtonText,
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
      ),

      // 👈 3. Supplier Footer (Active on Settings Tab)
      bottomNavigationBar: CustomFooter(
        selectedIndex: _currentNavIndex,
        onItemTapped: _onNavTapped,
      ),
    );
  }
}
