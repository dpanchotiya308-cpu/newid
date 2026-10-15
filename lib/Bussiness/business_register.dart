import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bussiness/business_home.dart';
import '../App_Style/App_Screen_Style.dart';
import '../Resources/profile_data_store.dart';
import '../Screen/role_screen.dart'; // 👈 1. Role Screen import for Back button

class BusinessRegisterScreen extends StatefulWidget {
  const BusinessRegisterScreen({super.key});

  @override
  State<BusinessRegisterScreen> createState() => _BusinessRegisterScreenState();
}

class _BusinessRegisterScreenState extends State<BusinessRegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text Controllers
  final TextEditingController _shopNameController = TextEditingController();
  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  // 👈 Machine Capabilities Tags list
  final List<String> _allCapabilities = [
    'CNC',
    'Lathe',
    'Laser',
    'Fabrication',
    'Manual Miling',
  ];

  // 'CNC' and 'Lathe' selected initially as per screenshot
  final Set<String> _selectedCapabilities = {'CNC', 'Lathe'};

  @override
  void dispose() {
    _shopNameController.dispose();
    _ownerNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // 👈 Redirects to Home Page on clicking Submit button
  void _handleSubmit() {
    // Close keyboard
    FocusScope.of(context).unfocus();

    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedCapabilities.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select at least one machine capability!'),
            backgroundColor: Colors.orangeAccent,
          ),
        );
        return;
      }

      // 👈 Save registered details to Global Store so Business Profile Page displays them
      BusinessDataStore.update(
        workshopName: _shopNameController.text.trim(),
        ownerName: _ownerNameController.text.trim(),
        email: _emailController.text.trim(),
        machineCapabilities: Set.from(_selectedCapabilities),
      );

      // Success SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Business Profile Created Successfully!'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 1),
        ),
      );

      // 👈 Navigate to Business Home Page
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const BusinessHomeScreen()),
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 👈 Header with Back Button
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppColors.accentOrange,
                        size: 24,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      // 👈 Pressing Back button redirects to Role Page
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectRoleScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 14),
                    const Text(
                      'Business Register',
                      style: AppTextStyles.businessRegisterTitle,
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                // Subtitle
                const Padding(
                  padding: EdgeInsets.only(left: 38.0),
                  child: Text(
                    'Create your SubSetu Partner Profile',
                    style: AppTextStyles.businessRegisterSubtitle,
                  ),
                ),

                const SizedBox(height: 28),

                // 1. Workshop / Shop Name
                const Text('Workshop / Shop Name', style: AppTextStyles.fieldLabel),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _shopNameController,
                  style: AppTextStyles.whiteInputFieldText,
                  decoration: AppStyles.businessInputDecoration(
                    hintText: 'e.g., Excel Machinery',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter workshop or shop name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // 2. Owner Full Name
                const Text('Owner Full Name', style: AppTextStyles.fieldLabel),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _ownerNameController,
                  style: AppTextStyles.whiteInputFieldText,
                  decoration: AppStyles.businessInputDecoration(
                    hintText: 'Enter your name',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter owner name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // 3. Email Address
                const Text('Email Address', style: AppTextStyles.fieldLabel),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: AppTextStyles.whiteInputFieldText,
                  decoration: AppStyles.businessInputDecoration(
                    hintText: 'Enter your Email Address',
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter email address';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value.trim())) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // 4. Password
                const Text('Password', style: AppTextStyles.fieldLabel),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  style: AppTextStyles.whiteInputFieldText,
                  decoration: AppStyles.businessInputDecoration(
                    hintText: 'Enter your Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.subtitleGray,
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 30),

                // 5. Machine Capabilities Tagging Section
                const Text(
                  'Machine Capabilities Tagging',
                  style: AppTextStyles.capabilitiesTitle,
                ),
                const SizedBox(height: 4),
                const Text(
                  'Select all equipment available at your unit',
                  style: AppTextStyles.machineCapabilitySub,
                ),

                const SizedBox(height: 16),

                // 👈 Clickable Multi-Select Tags (as per screenshot)
                Wrap(
                  spacing: 12.0,
                  runSpacing: 12.0,
                  children: _allCapabilities.map((capability) {
                    final bool isSelected = _selectedCapabilities.contains(capability);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isSelected) {
                            _selectedCapabilities.remove(capability);
                          } else {
                            _selectedCapabilities.add(capability);
                          }
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
                        decoration: AppStyles.capabilityChipDecoration(isSelected),
                        child: Text(
                          capability,
                          style: isSelected
                              ? AppTextStyles.capabilityChipSelected
                              : AppTextStyles.capabilityChipUnselected,
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 38),

                // 👈 Create Business Profile Button
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _handleSubmit,
                    style: AppStyles.createBusinessButtonStyle,
                    child: const Text(
                      'Create Business Profile',
                      style: AppTextStyles.createBusinessProfileButtonText,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}