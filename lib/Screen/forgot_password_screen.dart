import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';
import 'verification_screen.dart'; 
import '../Supplier/supplier_register_screen.dart';   
import 'login_screen.dart'; // Imported Login Screen

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSend() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Verification code sent to your email!'),
          backgroundColor: Colors.green,
        ),
      );

      // Navigate directly to Verification Screen on Send button press
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VerificationScreen(),
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
                const SizedBox(height: 6),

                // 1. Top Header: Back Button + Centered "Forgot password"
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.accentOrange,
                          size: 22,
                        ),
                        onPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    const Text(
                      'Forgot password',
                      style: AppTextStyles.headerTitle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),

                const SizedBox(height: 110),

                // 2. Field Label: "Enter Email Address"
                const Text(
                  'Enter Email Address',
                  style: AppTextStyles.enterEmailHeading,
                ),
                const SizedBox(height: 12),

                // 3. Grey-Blue Pill Input Field (abc@gmail.com)
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: AppTextStyles.greyInputText,
                  cursorColor: Colors.white,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Enter email address';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                  decoration: AppStyles.greyInputDecoration(
                    hintText: 'abc@gmail.com',
                  ),
                ),
                const SizedBox(height: 18),

                // 4. "Back to Sign In" Centered Link
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Back to ',
                        style: AppTextStyles.backToPrompt,
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          // Navigate directly to Login Screen
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
                            style: AppTextStyles.signInOrange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 38),

                // 5. "Send" Button
                Center(
                  child: SizedBox(
                    width: 210,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: _handleSend,
                      style: AppStyles.primaryButtonStyle,
                      child: const Text(
                        'Send',
                        style: AppTextStyles.submitButtonText,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 90),

                // 6. Bottom Footer: Don't have an account ? / Sign Up
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Don’t have an account ?',
                        style: AppTextStyles.dontHaveAccountPrompt,
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            'Sign Up',
                            style: AppTextStyles.signUpBold16,
                          ),
                        ),
                      ),
                    ],
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