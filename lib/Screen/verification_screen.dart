import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../App_Style/App_Screen_Style.dart';
import 'new_password.dart'; // Navigate here after verification

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  // Controllers for 4 OTP Boxes
  final TextEditingController _otp1 = TextEditingController();
  final TextEditingController _otp2 = TextEditingController();
  final TextEditingController _otp3 = TextEditingController();
  final TextEditingController _otp4 = TextEditingController();

  // FocusNodes
  final FocusNode _focus1 = FocusNode();
  final FocusNode _focus2 = FocusNode();
  final FocusNode _focus3 = FocusNode();
  final FocusNode _focus4 = FocusNode();

  @override
  void dispose() {
    _otp1.dispose();
    _otp2.dispose();
    _otp3.dispose();
    _otp4.dispose();
    _focus1.dispose();
    _focus2.dispose();
    _focus3.dispose();
    _focus4.dispose();
    super.dispose();
  }

  void _handleVerify() {
    String otp = _otp1.text + _otp2.text + _otp3.text + _otp4.text;

    if (otp.length < 4) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter the full 4-digit code!'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Code Verified Successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate to New Password page after verification
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const NewPasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,
      body: SafeArea(
        // 👈 Added SingleChildScrollView to resolve 28-pixel overflow
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 6),

              // 1. Top Header: Back Button + Centered "Verification" Title
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
                        }
                      },
                    ),
                  ),
                  const Text(
                    'Verification',
                    style: AppTextStyles.headerTitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),

              // 👈 Changed from 120 to 55 to fit screen perfectly
              const SizedBox(height: 55),

              // 2. "Enter Verification Code" with Blue Underline
              const Center(
                child: Text(
                  'Enter Verification Code',
                  style: AppTextStyles.enterVerificationCodeHeading,
                ),
              ),

              const SizedBox(height: 36),

              // 3. Four Circular OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildOtpCircle(
                    controller: _otp1,
                    focusNode: _focus1,
                    nextFocus: _focus2,
                    prevFocus: null,
                  ),
                  const SizedBox(width: 14),
                  _buildOtpCircle(
                    controller: _otp2,
                    focusNode: _focus2,
                    nextFocus: _focus3,
                    prevFocus: _focus1,
                  ),
                  const SizedBox(width: 14),
                  _buildOtpCircle(
                    controller: _otp3,
                    focusNode: _focus3,
                    nextFocus: _focus4,
                    prevFocus: _focus2,
                  ),
                  const SizedBox(width: 14),
                  _buildOtpCircle(
                    controller: _otp4,
                    focusNode: _focus4,
                    nextFocus: null,
                    prevFocus: _otp3.text.isEmpty ? _focus3 : null,
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // 4. Resend Code Text
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'if you didn’t receive a code! ',
                      style: AppTextStyles.didntReceiveCodePrompt,
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('A new code has been sent!'),
                            backgroundColor: Colors.blueAccent,
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
                        child: Text(
                          'Resend',
                          style: AppTextStyles.resendCodeOrange,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 42),

              // 5. Verify Button
              Center(
                child: SizedBox(
                  width: 210,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: _handleVerify,
                    style: AppStyles.primaryButtonStyle,
                    child: const Text(
                      'Verify',
                      style: AppTextStyles.submitButtonText,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Circular OTP Input Field Widget
  Widget _buildOtpCircle({
    required TextEditingController controller,
    required FocusNode focusNode,
    FocusNode? nextFocus,
    FocusNode? prevFocus,
  }) {
    return Container(
      width: 64,
      height: 64,
      decoration: AppStyles.otpCircleDecoration,
      alignment: Alignment.center,
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: AppTextStyles.otpDigitText,
        cursorColor: Colors.black,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: AppStyles.otpInputDecoration,
        onChanged: (value) {
          if (value.isNotEmpty && nextFocus != null) {
            nextFocus.requestFocus();
          } else if (value.isEmpty && prevFocus != null) {
            prevFocus.requestFocus();
          }
        },
      ),
    );
  }
}