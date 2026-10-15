import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';
import '../Resources/business_header.dart';
import '../Resources/business_footer.dart';
import '../Resources/profile_data_store.dart';
import 'business_home.dart';
import 'business_menu.dart';
import 'business_notification.dart';
import 'business_setting.dart';
import 'business_current_order.dart';

class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({super.key});

  @override
  State<BusinessProfileScreen> createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
  // Settings tab active in footer (or Home tab)
  final int _currentNavIndex = 2; // 2 = Settings Tab

  void _onNavTapped(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BusinessHomeScreen()),
      );
    } else if (index == 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BusinessCurrentOrderScreen(),
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
          builder: (context) => const BusinessNotificationScreen(),
        ),
      );
    }
  }

  void _onEditProfile() {
    final currentData = BusinessDataStore.current.value;
    final workshopController = TextEditingController(
      text: currentData.workshopName,
    );
    final ownerController = TextEditingController(text: currentData.ownerName);
    final emailController = TextEditingController(text: currentData.email);
    final phoneController = TextEditingController(text: currentData.phone);
    final selectedCaps = Set<String>.from(currentData.machineCapabilities);
    final editFormKey = GlobalKey<FormState>();

    final allCaps = ['CNC', 'Lathe', 'Milling', 'Drilling', 'Welding'];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.primaryNavy,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (bottomSheetContext) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 20,
                bottom:
                    MediaQuery.of(bottomSheetContext).viewInsets.bottom + 24,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: editFormKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 48,
                          height: 4,
                          decoration: AppStyles.modalDragHandleDecoration,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Edit Business Profile',
                            style: AppTextStyles.modalTitle,
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white70,
                            ),
                            onPressed: () => Navigator.pop(bottomSheetContext),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),

                      // Workshop / Company Name
                      const Text(
                        'Workshop / Company Name',
                        style: AppTextStyles.fieldLabel,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: workshopController,
                        style: AppTextStyles.whiteInputFieldText,
                        decoration: AppStyles.businessInputDecoration(
                          hintText: 'Enter workshop name',
                        ),
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return 'Enter workshop name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Owner Full Name
                      const Text(
                        'Owner Full Name',
                        style: AppTextStyles.fieldLabel,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: ownerController,
                        style: AppTextStyles.whiteInputFieldText,
                        decoration: AppStyles.businessInputDecoration(
                          hintText: 'Enter owner name',
                        ),
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return 'Enter owner name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Email Address
                      const Text(
                        'Email Address',
                        style: AppTextStyles.fieldLabel,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: AppTextStyles.whiteInputFieldText,
                        decoration: AppStyles.businessInputDecoration(
                          hintText: 'Enter email address',
                        ),
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return 'Enter email address';
                          }
                          if (!RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          ).hasMatch(val.trim())) {
                            return 'Enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Phone Number
                      const Text(
                        'Phone Number',
                        style: AppTextStyles.fieldLabel,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        style: AppTextStyles.whiteInputFieldText,
                        decoration: AppStyles.businessInputDecoration(
                          hintText: 'Enter phone number',
                        ),
                        validator: (val) {
                          if (val == null || val.trim().isEmpty) {
                            return 'Enter phone number';
                          }
                          if (val.trim().length < 10) {
                            return 'Enter a valid 10-digit phone number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      // Machine Capabilities
                      const Text(
                        'Machine Capabilities',
                        style: AppTextStyles.capabilitiesTitle,
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: allCaps.map((cap) {
                          final isSelected = selectedCaps.contains(cap);
                          return GestureDetector(
                            onTap: () {
                              setModalState(() {
                                if (isSelected) {
                                  selectedCaps.remove(cap);
                                } else {
                                  selectedCaps.add(cap);
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: AppStyles.modalCapabilityChipDecoration(isSelected),
                              child: Text(
                                cap,
                                style: isSelected
                                    ? AppTextStyles.modalCapabilitySelected
                                    : AppTextStyles.modalCapabilityUnselected,
                              ),
                            ),
                          );
                        }).toList(),
                      ),

                      const SizedBox(height: 26),

                      // Save Changes Button
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            if (editFormKey.currentState?.validate() ?? false) {
                              if (selectedCaps.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Select at least one machine capability',
                                    ),
                                    backgroundColor: Colors.orangeAccent,
                                  ),
                                );
                                return;
                              }
                              BusinessDataStore.update(
                                workshopName: workshopController.text.trim(),
                                ownerName: ownerController.text.trim(),
                                email: emailController.text.trim(),
                                phone: phoneController.text.trim(),
                                machineCapabilities: Set.from(selectedCaps),
                              );
                              Navigator.pop(bottomSheetContext);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Business Profile Updated Successfully!',
                                  ),
                                  backgroundColor: Colors.green,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          style: AppStyles.modalSaveButtonStyle,
                          child: const Text(
                            'Save Changes',
                            style: AppTextStyles.saveChangesButtonText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _onAppSettings() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SettingScreen()),
    );
  }

  void _onMachineCapabilities(Set<String> caps) {
    final listStr = caps.isEmpty ? 'None' : caps.join(', ');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Machine Capabilities: $listStr (Active)'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  String _getInitials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty || parts[0].isEmpty) return 'EM';
    if (parts.length == 1) {
      return parts[0].substring(0, parts[0].length >= 2 ? 2 : 1).toUpperCase();
    }
    return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<BusinessProfileData>(
      valueListenable: BusinessDataStore.current,
      builder: (context, profileData, child) {
        final initials = _getInitials(profileData.workshopName);
        final capsText = profileData.machineCapabilities.isEmpty
            ? 'None'
            : profileData.machineCapabilities.join(', ');

        return Scaffold(
          backgroundColor: AppColors.primaryNavy,

          // 👈 1. Business Header (Title: "Business Profile", Back Button, Menu Button)
          appBar: BusinessHeader(
            title: 'Business Profile',
            showBackButton: true,
            showMenuButton: true,
            onBackTap: () {
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
            onMenuTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BusinessMenuScreen(),
                ),
              );
            },
          ),

          // 👈 2. Body (Figma Page 23 Responsive & Scrollable)
          body: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 550,
                ), // Responsive Constraint
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),

                      // 🔵 Blue Ring Avatar with Initial
                      Container(
                        width: 100,
                        height: 100,
                        decoration: AppStyles.profileAvatarDecoration,
                        child: Center(
                          child: Text(
                            initials,
                            style: AppTextStyles.profileAvatarInitials,
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Company / Workshop Title
                      Text(
                        profileData.workshopName,
                        style: AppTextStyles.profileCompanyName,
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 6),

                      // Email & Phone
                      Text(
                        '${profileData.email} | ${profileData.phone}',
                        style: AppTextStyles.profileCompanyDetails,
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 14),

                      // ✏️ Edit Profile Pill Button (Editable modal)
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: _onEditProfile,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 8,
                            ),
                            decoration: AppStyles.editProfilePillDecoration,
                            child: const Text(
                              'Edit Profile',
                              style: AppTextStyles.editProfileButtonText,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // 📋 All Registered Information Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 18.0,
                        ),
                        decoration: AppStyles.businessInfoCardDecoration,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Icon(
                                  Icons.badge_outlined,
                                  color: AppColors.accentOrange,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Business Information',
                                  style: AppTextStyles.businessInfoSectionTitle,
                                ),
                              ],
                            ),
                            const SizedBox(height: 14),
                            _buildInfoRow(
                              icon: Icons.storefront_outlined,
                              label: 'Workshop Name',
                              value: profileData.workshopName,
                            ),
                            const Divider(color: Colors.white10, height: 20),
                            _buildInfoRow(
                              icon: Icons.person_outline,
                              label: 'Owner Full Name',
                              value: profileData.ownerName,
                            ),
                            const Divider(color: Colors.white10, height: 20),
                            _buildInfoRow(
                              icon: Icons.email_outlined,
                              label: 'Email Address',
                              value: profileData.email,
                            ),
                            const Divider(color: Colors.white10, height: 20),
                            _buildInfoRow(
                              icon: Icons.phone_outlined,
                              label: 'Phone Number',
                              value: profileData.phone,
                            ),
                            const Divider(color: Colors.white10, height: 20),
                            _buildInfoRow(
                              icon: Icons.precision_manufacturing_outlined,
                              label: 'Machine Capabilities',
                              value: capsText,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // ⚙️ Action Tile 1: App Settings & Language
                      _buildProfileTile(
                        title: 'App Settings & Language',
                        onTap: _onAppSettings,
                      ),

                      const SizedBox(height: 14),

                      // 🔧 Action Tile 2: Machine Capabilities (Display current capabilities)
                      _buildProfileTile(
                        title: 'Machine Capabilities ($capsText)',
                        onTap: () => _onMachineCapabilities(
                          profileData.machineCapabilities,
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // 👈 3. Business Footer (Active on Settings Tab)
          bottomNavigationBar: BusinessFooter(
            selectedIndex: _currentNavIndex,
            onItemTapped: _onNavTapped,
          ),
        );
      },
    );
  }

  Widget _buildProfileTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 16.0),
          decoration: AppStyles.profileActionTileDecoration,
          child: Text(title, style: AppTextStyles.profileActionTileText),
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: AppColors.subtitleGray),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.profileInfoLabel),
              const SizedBox(height: 3),
              Text(
                value.isEmpty ? '-' : value,
                style: AppTextStyles.profileInfoValue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
