import 'package:flutter/material.dart';
import 'package:flutter_application_1/Supplier/supplier_home.dart';
import '../App_Style/App_Screen_Style.dart';
import '../Resources/profile_data_store.dart';
import '../Screen/role_screen.dart'; // Select Role Screen Import
import '../Screen/login_screen.dart'; // Login Screen Import

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  // Text Editing Controllers
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();

  // Password Visibility States
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _companyController.dispose();
    super.dispose();
  }

  // 👈 2. Redirects to Settings Page on clicking Register / Submit button
  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      // 👈 Save registered details to Global Store so Profile Page shows them
      SupplierDataStore.update(
        fullName: _fullNameController.text.trim(),
        email: _emailController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        companyName: _companyController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account Created Successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      // Redirect to Home page:
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
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
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Header Row
                Row(
                  children: [
                    // Back Button (redirects to Role Page)
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: AppColors.accentOrange,
                        size: 22,
                      ),
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
                      'Create Your Account',
                      style: AppTextStyles.headerTitle,
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 1. Full Name
                _buildInputField(
                  label: 'Full Name',
                  controller: _fullNameController,
                  hintText: 'Dhruv Patel',
                  keyboardType: TextInputType.name,
                  prefixIcon: const Icon(
                    Icons.person_outline_rounded,
                    color: AppColors.iconColor,
                    size: 22,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your full name';
                    }
                    return null;
                  },
                ),

                // 2. Email
                _buildInputField(
                  label: 'Email',
                  controller: _emailController,
                  hintText: 'dhruv123@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: AppColors.iconColor,
                    size: 22,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),

                // 3. Password
                _buildInputField(
                  label: 'Password',
                  controller: _passwordController,
                  hintText: 'dhruv@123#',
                  obscureText: _obscurePassword,
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                    color: AppColors.iconColor,
                    size: 22,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.iconColor,
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                // 4. Confirm Password
                _buildInputField(
                  label: 'Confirm Password',
                  controller: _confirmPasswordController,
                  hintText: 'dhruv@123#',
                  obscureText: _obscureConfirmPassword,
                  prefixIcon: const Icon(
                    Icons.lock_reset_rounded,
                    color: AppColors.iconColor,
                    size: 22,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.iconColor,
                      size: 22,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),

                // 5. Phone Number
                _buildInputField(
                  label: 'Phone Number',
                  controller: _phoneController,
                  hintText: '9981643515',
                  keyboardType: TextInputType.phone,
                  prefixIcon: const Icon(
                    Icons.phone_outlined,
                    color: AppColors.iconColor,
                    size: 22,
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

                // 6. Company Name
                _buildInputField(
                  label: 'Company Name',
                  controller: _companyController,
                  hintText: 'Excel machinery pvt.ltd',
                  keyboardType: TextInputType.text,
                  prefixIcon: const Icon(
                    Icons.business_outlined,
                    color: AppColors.iconColor,
                    size: 22,
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter company name';
                    }
                    if (value.trim().length < 2) {
                      return 'Company name must be at least 2 characters';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 36),

                // 7. Submit / Register Button (connected to Setting Screen)
                Center(
                  child: SizedBox(
                    width: 210,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: _handleSubmit,
                      style: AppStyles.primaryButtonStyle,
                      child: const Text(
                        'Submit',
                        style: AppTextStyles.submitButtonText,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // 8. Footer: Already have an account? Sign In
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account ? ',
                        style: AppTextStyles.footerText,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
                          child: Text(
                            'Sign In',
                            style: AppTextStyles.footerLink,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reusable Form Field Widget
  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.fieldLabel,
          ),
          const SizedBox(height: 6),
          TextFormField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            style: AppTextStyles.inputText,
            cursorColor: Colors.black,
            validator: validator,
            decoration: AppStyles.inputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
          ),
        ],
      ),
    );
  }
}