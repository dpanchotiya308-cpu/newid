import 'package:flutter/material.dart';
import 'business_home.dart';
import '../App_Style/App_Screen_Style.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thank you! We will get in touch with you shortly.'),
          backgroundColor: Colors.green,
        ),
      );
      _nameController.clear();
      _emailController.clear();
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryNavy,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 6),

              // Header: Back Button + Centered Title
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
                              builder: (context) => const BusinessHomeScreen(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const Text(
                    'Contact Us',
                    style: AppTextStyles.headerTitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Feel free to connect with our team',
                  style: AppTextStyles.subtitle,
                ),
              ),
              const SizedBox(height: 28),

              // Contact Information Cards
              _buildContactDetailTile(
                icon: Icons.location_on_rounded,
                title: 'Head Office',
                subtitle: 'Plot No. 42, GIDC Industrial Estate, Ahmedabad, Gujarat',
              ),
              const SizedBox(height: 12),
              _buildContactDetailTile(
                icon: Icons.phone_rounded,
                title: 'Phone Number',
                subtitle: '+91 98765 43210 / +91 79 2345 6789',
              ),
              const SizedBox(height: 12),
              _buildContactDetailTile(
                icon: Icons.mail_rounded,
                title: 'Email Address',
                subtitle: 'info@subsetu.in',
              ),
              const SizedBox(height: 12),
              _buildContactDetailTile(
                icon: Icons.access_time_rounded,
                title: 'Business Hours',
                subtitle: 'Monday - Saturday: 9:00 AM - 7:00 PM',
              ),
              const SizedBox(height: 32),

              // Get In Touch Form
              const Text('Get In Touch', style: AppTextStyles.sectionTitle),
              const SizedBox(height: 14),

              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    const Text('Your Name', style: AppTextStyles.fieldLabel),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _nameController,
                      style: AppTextStyles.inputText,
                      cursorColor: Colors.black,
                      validator: (value) =>
                          value == null || value.trim().isEmpty ? 'Enter your name' : null,
                      decoration: AppStyles.inputDecoration(
                        hintText: 'John Doe',
                        prefixIcon: const Icon(
                          Icons.person_outline_rounded,
                          color: AppColors.iconColor,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Email
                    const Text('Your Email', style: AppTextStyles.fieldLabel),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: AppTextStyles.inputText,
                      cursorColor: Colors.black,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                      decoration: AppStyles.inputDecoration(
                        hintText: 'john@example.com',
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: AppColors.iconColor,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Message
                    const Text('Your Message', style: AppTextStyles.fieldLabel),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _messageController,
                      maxLines: 4,
                      style: AppTextStyles.inputText,
                      cursorColor: Colors.black,
                      validator: (value) =>
                          value == null || value.trim().isEmpty ? 'Enter your message' : null,
                      decoration: AppStyles.textAreaDecoration(
                        hintText: 'How can we help your business?',
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Send Button
                    Center(
                      child: SizedBox(
                        width: 210,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: _handleSubmit,
                          style: AppStyles.primaryButtonStyle,
                          child: const Text(
                            'Send Message',
                            style: AppTextStyles.submitButtonText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactDetailTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: AppStyles.cardDecoration,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: AppStyles.contactIconCircleDecoration,
            child: Icon(icon, color: AppColors.accentOrange, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.cardTitle),
                const SizedBox(height: 3),
                Text(subtitle, style: AppTextStyles.cardDescription),
              ],
            ),
          ),
        ],
      ),
    );
  }
}