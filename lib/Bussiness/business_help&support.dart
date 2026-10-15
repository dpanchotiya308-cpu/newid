import 'package:flutter/material.dart';
import 'business_home.dart';
import '../App_Style/App_Screen_Style.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // FAQs list
  final List<Map<String, String>> _faqs = [
    {
      'question': 'How do I track my material workflow?',
      'answer':
          'You can track your orders and real-time material status from the dashboard under the "Track Workflow" tab.',
    },
    {
      'question': 'How to switch between Supplier & Business roles?',
      'answer':
          'Go to Profile > Account Settings > Change Role to request or switch your active workspace role.',
    },
    {
      'question': 'How does PoD production sync work?',
      'answer':
          'Once a job is finished, upload proof of delivery (PoD) directly to automatically sync and close the batch.',
    },
    {
      'question': 'How can I change my registered phone number?',
      'answer':
          'Navigate to Profile Settings > Edit Details, enter your new number, and verify it with the OTP sent to your phone.',
    },
  ];

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSendMessage() {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Your message has been sent to our support team!'),
          backgroundColor: Colors.green,
        ),
      );
      _subjectController.clear();
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

              // 1. Top Header: Centered Title with Back Button
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
                    'Help & Support',
                    style: AppTextStyles.headerTitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Subtitle
              const Center(
                child: Text(
                  'We are here to help you 24/7',
                  style: AppTextStyles.roleSubtitle,
                ),
              ),
              const SizedBox(height: 28),

              // 2. Quick Contact Cards (Call, Email, WhatsApp)
              const Text(
                'Contact Us Directly',
                style: AppTextStyles.sectionTitle,
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: _buildContactCard(
                      icon: Icons.phone_in_talk_rounded,
                      title: 'Call Us',
                      subtitle: '+91 98765 43210',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Calling support...')),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildContactCard(
                      icon: Icons.email_rounded,
                      title: 'Email Us',
                      subtitle: 'support@subsetu.in',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Opening email app...')),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildContactCard(
                      icon: Icons.chat_bubble_rounded,
                      title: 'WhatsApp',
                      subtitle: 'Live Chat',
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Opening WhatsApp chat...')),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // 3. FAQ Section
              const Text(
                'Frequently Asked Questions',
                style: AppTextStyles.sectionTitle,
              ),
              const SizedBox(height: 14),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _faqs.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final faq = _faqs[index];
                  return Container(
                    decoration: AppStyles.faqCardDecoration,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          dividerColor: Colors.transparent,
                        ),
                        child: ExpansionTile(
                          iconColor: AppColors.accentOrange,
                          collapsedIconColor: Colors.white70,
                          title: Text(
                            faq['question']!,
                            style: AppTextStyles.faqQuestion,
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  faq['answer']!,
                                  style: AppTextStyles.faqAnswer,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),

              // 4. Send Message Form
              const Text(
                'Send Us a Query',
                style: AppTextStyles.sectionTitle,
              ),
              const SizedBox(height: 14),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subject Field
                    const Text('Subject', style: AppTextStyles.fieldLabel),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _subjectController,
                      style: AppTextStyles.inputText,
                      cursorColor: Colors.black,
                      validator: (value) =>
                          value == null || value.trim().isEmpty ? 'Enter subject' : null,
                      decoration: AppStyles.inputDecoration(
                        hintText: 'e.g. Issue in tracking order',
                        prefixIcon: const Icon(
                          Icons.topic_outlined,
                          color: AppColors.iconColor,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Message Area Field
                    const Text('Describe your issue', style: AppTextStyles.fieldLabel),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: _messageController,
                      maxLines: 4,
                      style: AppTextStyles.inputText,
                      cursorColor: Colors.black,
                      validator: (value) =>
                          value == null || value.trim().isEmpty ? 'Enter your message' : null,
                      decoration: AppStyles.textAreaDecoration(
                        hintText: 'Explain the issue in detail...',
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Submit Query Button
                    Center(
                      child: SizedBox(
                        width: 220,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: _handleSendMessage,
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

  // Quick Action Contact Card Widget
  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        decoration: AppStyles.supportCardDecoration,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: AppStyles.contactIconCircleDecoration,
              child: Icon(
                icon,
                color: AppColors.accentOrange,
                size: 22,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: AppTextStyles.supportCardTitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: AppTextStyles.supportCardSubtitle,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}