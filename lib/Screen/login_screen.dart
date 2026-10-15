import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';
import 'forgot_password_screen.dart'; // Connect to Forgot Password page
import 'role_screen.dart'; // Navigate to Role Screen on clicking Sign Up
import '../Supplier/supplier_home.dart';
import '../Bussiness/business_home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Selected Login Role: 'supplier' or 'business' (Default: 'supplier')
  String _selectedRole = 'supplier';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _selectedRole == 'supplier'
                ? 'Logging in as Supplier...'
                : 'Logging in as Business...',
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 1),
        ),
      );

      // Redirect to dashboard based on role:
      if (_selectedRole == 'supplier') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BusinessHomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 28.0,
              vertical: 24.0,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),

                  // 1. SubSetu Circular Logo (assets/images/i1.jpeg)
                  Container(
                    width: 140,
                    height: 140,
                    decoration: AppStyles.loginLogoDecoration,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/i1.jpeg',
                        fit: BoxFit.cover,
                        // Fallback icon displayed if image not found
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.cardNavy,
                            child: const Icon(
                              Icons.hub_rounded,
                              size: 60,
                              color: AppColors.accentOrange,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // 2. Title: "Login to Account"
                  const Text(
                    'Login to Account',
                    style: AppTextStyles.loginAccountTitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 28),

                  // 🏷️ Role Selection Segment Buttons (Supplier & Business)
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(maxWidth: 380),
                    padding: const EdgeInsets.all(4),
                    decoration: AppStyles.roleToggleContainerDecoration,
                    child: Row(
                      children: [
                        // Option 1: Supplier
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedRole = 'supplier';
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(vertical: 11),
                              decoration: AppStyles.roleSegmentDecoration(
                                _selectedRole == 'supplier',
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.apartment_rounded,
                                    size: 18,
                                    color: _selectedRole == 'supplier'
                                        ? Colors.black
                                        : AppColors.subtitleGray,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Supplier',
                                    style: _selectedRole == 'supplier'
                                        ? AppTextStyles.roleSegmentActiveText
                                        : AppTextStyles.roleSegmentInactiveText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // Option 2: Business
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedRole = 'business';
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.symmetric(vertical: 11),
                              decoration: AppStyles.roleSegmentDecoration(
                                _selectedRole == 'business',
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.corporate_fare_rounded,
                                    size: 18,
                                    color: _selectedRole == 'business'
                                        ? Colors.black
                                        : AppColors.subtitleGray,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'Business',
                                    style: _selectedRole == 'business'
                                        ? AppTextStyles.roleSegmentActiveText
                                        : AppTextStyles.roleSegmentInactiveText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  // 3. Email Input Field (Split Box: Grey Icon + Orange Input)
                  _buildSplitInputField(
                    label: 'Email',
                    controller: _emailController,
                    hintText: 'Enter your Email',
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter your email';
                      }
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),

                  // 4. Password Input Field (Split Box: Grey Icon + Orange Input)
                  _buildSplitInputField(
                    label: 'Password',
                    controller: _passwordController,
                    hintText: 'Enter your Password',
                    icon: Icons.lock_outline_rounded,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  // 5. "Forgot password?" Link (Right Aligned)
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        // Navigate to Forgot Password page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordScreen(),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          'Forgot password?',
                          style: AppTextStyles.forgotPasswordLink,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 38),

                  // 6. Login Button (Orange Pill Button)
                  SizedBox(
                    width: 170,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _handleLogin,
                      style: AppStyles.primaryButtonStyle,
                      child: const Text(
                        'Login',
                        style: AppTextStyles.loginButtonText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),

                  // 7. Footer: Need an Account ? Sign Up
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Need an Account ? ',
                          style: AppTextStyles.needAccountPrompt,
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            // Navigate to Role Screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectRoleScreen(),
                              ),
                            );
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 4.0,
                              vertical: 6.0,
                            ),
                            child: Text(
                              'Sign Up',
                              style: AppTextStyles.signUpOrange,
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
      ),
    );
  }

  // Dual-tone Input Field as per design (Grey icon on left + Orange input on right)
  Widget _buildSplitInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return FormField<String>(
      validator: validator != null ? (_) => validator(controller.text) : null,
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Field Label (White)
            Text(label, style: AppTextStyles.splitFieldLabel),
            const SizedBox(height: 8),

            // Dual-tone Rounded Pill Box
            Container(
              height: 52,
              decoration: AppStyles.splitFieldContainerDecoration,
              clipBehavior:
                  Clip.antiAlias, // Anti-alias to clip rounded corners
              child: Row(
                children: [
                  // Left side grey icon container
                  Container(
                    width: 52,
                    height: double.infinity,
                    decoration: AppStyles.splitFieldIconContainerDecoration,
                    alignment: Alignment.center,
                    child: Icon(icon, color: Colors.black87, size: 22),
                  ),

                  // Right side orange textfield container
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      color: AppColors.accentOrange,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      alignment: Alignment.center,
                      child: TextFormField(
                        controller: controller,
                        obscureText: obscureText,
                        keyboardType: keyboardType,
                        style: AppTextStyles.splitInputText,
                        cursorColor: Colors.black,
                        onChanged: (text) => state.didChange(text),
                        decoration: AppStyles.splitFieldInputDecoration(
                          hintText,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Error Message (shown if validation fails)
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 6.0, left: 14.0),
                child: Text(
                  state.errorText ?? '',
                  style: AppTextStyles.splitErrorText,
                ),
              ),
          ],
        );
      },
    );
  }
}
