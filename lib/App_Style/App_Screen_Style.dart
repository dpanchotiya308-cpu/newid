import 'package:flutter/material.dart';

/// 1. Application Colors (App Colors)
class AppColors {
  static const Color primaryNavy = Color(0xFF2C3E5D); // Primary Background
  static const Color cardNavy = Color(0xFF202F46); // Card Background
  static const Color cardNavyLight = Color(0xFF263852);
  static const Color selectedBorder = Color(0xFF2196F3);
  static const Color accentOrange = Color(0xFFF9A81B); // Main Accent Orange
  static const Color inputTextColor = Color(0xFF1E1E1E);
  static const Color iconColor = Color(0xFF2D2D2D);
  static const Color subtitleGray = Color(0xFF8FA3BE);
  static const Color unselectedIndicator = Color(0xFF2E4057);
  static const Color white = Colors.white;
  static const Color errorColor = Colors.orangeAccent;
  static const Color buttonTextColor = Colors.black;
  static const Color dividerColor = Colors.white12;
  static const Color otpCircleFill = Color(0xFFD9DDE2);
  static const Color footerInactive =
      Colors.white70; // Inactive footer icon/text
  static const Color darkText = Color(0xFF1E1E1E);
  static const Color statusBlue = Color(0xFF2196F3); // In Progress (Cyan/Blue)
  static const Color statusGreen = Color(0xFF00E676);
  static const Color notificationDot = Color(
    0xFF00B0FF,
  ); // Blue Unread Indicator
  static const Color orderCardBg = Color(
    0xFFDEE3E9,
  ); // Current Order Card Light Grey Background
  static const Color orderTextDark = Color(0xFF1E1E1E);
}

/// 2. Typography / Text Styles
class AppTextStyles {
  // Header Titles
  static const TextStyle headerTitle = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.3,
  );

  static const TextStyle roleHeaderTitle = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
  );

  // Subtitle (For About Us, Contact Us, Role)
  static const TextStyle subtitle = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle roleSubtitle = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  // Section Heading
  static const TextStyle sectionTitle = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
  );

  // General Card Title & Description (For About Us and Contact Us)
  static const TextStyle cardTitle = TextStyle(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle cardDescription = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 13,
    height: 1.4,
  );

  // Brand Name (SubSetu)
  static const TextStyle brandTitle = TextStyle(
    color: AppColors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  // Role Card Title & Description
  static const TextStyle roleCardTitle = TextStyle(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle roleCardDescription = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  // Support Cards
  static const TextStyle supportCardTitle = TextStyle(
    color: AppColors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle supportCardSubtitle = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  // FAQ Question & Answer
  static const TextStyle faqQuestion = TextStyle(
    color: AppColors.white,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle faqAnswer = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 13,
    height: 1.4,
  );

  // Input Field Label
  static const TextStyle fieldLabel = TextStyle(
    color: AppColors.white,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  // Input Text
  static const TextStyle inputText = TextStyle(
    color: AppColors.inputTextColor,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  // Hint Text
  static TextStyle inputHint = TextStyle(
    color: AppColors.inputTextColor.withValues(alpha: 0.6),
    fontSize: 15,
  );

  // Submit / Send / Continue Button Text
  static const TextStyle submitButtonText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w900,
    color: AppColors.buttonTextColor,
    letterSpacing: 0.5,
  );

  // Footer Text
  static const TextStyle footerText = TextStyle(
    color: AppColors.white,
    fontSize: 15,
  );

  // Footer Sign-In / Link Text
  static const TextStyle footerLink = TextStyle(
    color: AppColors.accentOrange,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  // Error Message Style
  static const TextStyle errorText = TextStyle(
    color: AppColors.errorColor,
    fontWeight: FontWeight.w500,
  );
  // Title with Underline
  static const TextStyle verificationTitle = TextStyle(
    color: AppColors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    decorationThickness: 2.0,
  );
  // Bold OTP numbers inside circle
  static const TextStyle otpDigitText = TextStyle(
    color: Colors.black,
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle greyInputText = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle loginHeaderTitle = TextStyle(
    color: AppColors.white,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.3,
  );
  // Home Card Title ("Logo Text Here technology pty.ltd")
  static const TextStyle homeCardTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
    letterSpacing: 0.2,
  );
  // Home Card Subtitle ("Best CNC Technology")
  static const TextStyle homeCardSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.darkText,
  );
  // View More Text
  static const TextStyle viewMoreText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.darkText,
  );
  // Bottom Navigation Label
  static const TextStyle navLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle businessHeaderTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.3,
  );
  static const TextStyle subheaderGray = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w400,
    color: AppColors.subtitleGray,
  );
  // Stat Card Label (e.g., Total Job, Pending)
  static const TextStyle statCardLabel = TextStyle(
    fontSize: 12.5,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.2,
  );
  // Order Card Title
  static const TextStyle orderCardTitle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  // Order Card Date
  static const TextStyle orderCardDate = TextStyle(
    fontSize: 13,
    color: AppColors.subtitleGray,
  );

  // Capabilities Section Title
  static const TextStyle capabilitiesTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.2,
  );

  // Notification Screen Styles
  static const TextStyle notificationTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.2,
  );

  static const TextStyle notificationSubtitle = TextStyle(
    fontSize: 13.5,
    color: AppColors.subtitleGray,
    fontWeight: FontWeight.w400,
    height: 1.3,
  );

  static const TextStyle notificationTime = TextStyle(
    fontSize: 12.5,
    color: AppColors.subtitleGray,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle markAllReadText = TextStyle(
    fontSize: 13.5,
    color: AppColors.subtitleGray,
    fontWeight: FontWeight.w500,
  );

  // Menu Screen Styles
  static const TextStyle menuHeaderTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.2,
  );

  static const TextStyle menuItemText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  // Current Order Screen Styles
  static const TextStyle currentOrderCompany = TextStyle(
    fontSize: 15.5,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    decoration: TextDecoration.underline,
    decorationThickness: 1.5,
    letterSpacing: 0.1,
  );

  static const TextStyle currentOrderSpecs = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    height: 1.4,
  );

  static const TextStyle currentOrderDateTime = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  // Stock Screen Styles
  static const TextStyle stockItemTitle = TextStyle(
    fontSize: 16.5,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: 0.2,
  );

  static const TextStyle stockItemSubtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
    height: 1.4,
  );

  static const TextStyle stockBadgeText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  static const TextStyle stockSummaryNumber = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle stockSummaryLabel = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.subtitleGray,
  );

  // Order Status Screen Styles
  static const TextStyle statusActiveTitle = TextStyle(
    fontSize: 16.5,
    fontWeight: FontWeight.bold,
    color: AppColors.accentOrange,
    letterSpacing: 0.2,
  );

  static const TextStyle statusCompletedTitle = TextStyle(
    fontSize: 16.5,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.2,
  );

  static const TextStyle statusPendingTitle = TextStyle(
    fontSize: 16.5,
    fontWeight: FontWeight.w500,
    color: AppColors.subtitleGray,
    letterSpacing: 0.2,
  );

  static const TextStyle statusStageSubtitle = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w400,
    color: AppColors.subtitleGray,
  );

  // Log Material Yield Screen Styles
  static const TextStyle yieldInputLabel = TextStyle(
    fontSize: 14.5,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.2,
  );

  static const TextStyle yieldInputValue = TextStyle(
    fontSize: 16.5,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle yieldCardHeader = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w400,
    color: AppColors.subtitleGray,
    letterSpacing: 0.2,
  );

  static const TextStyle yieldCardTotalValue = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  static const TextStyle yieldPreviewHeader = TextStyle(
    fontSize: 14.5,
    fontWeight: FontWeight.bold,
    color: Color(0xFF00B0FF),
    letterSpacing: 0.2,
  );

  static const TextStyle yieldPreviewText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    height: 1.5,
  );

  // Business Profile Screen Styles
  static const TextStyle profileCompanyName = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  static const TextStyle profileCompanyDetails = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w400,
    color: AppColors.subtitleGray,
  );

  static const TextStyle profileActionTileText = TextStyle(
    fontSize: 15.5,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.2,
  );

  static const TextStyle profileInfoLabel = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.subtitleGray,
  );

  static const TextStyle profileInfoValue = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
    letterSpacing: 0.2,
  );

  static const TextStyle profileRateNumber = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle profileRateHeader = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.subtitleGray,
  );

  static const TextStyle profilePerformanceTag = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Color(0xFF00E676), // Green Performance Tag
  );

  // Supplier Profile Screen Styles
  static const TextStyle supplierProfileLabel = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  static const TextStyle supplierProfileInputText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  // Supplier Menu Screen Styles
  static const TextStyle supplierMenuItemText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  // Supplier Send Order Screen Styles
  static const TextStyle sendOrderLabel = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  static const TextStyle sendOrderInputValue = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: 0.2,
  );

  // Login Screen Styles
  static const TextStyle loginAccountTitle = TextStyle(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.3,
  );

  static const TextStyle roleSegmentActiveText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle roleSegmentInactiveText = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.white70,
  );

  static const TextStyle forgotPasswordLink = TextStyle(
    color: AppColors.accentOrange,
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle loginButtonText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w900,
    color: Colors.black,
  );

  static const TextStyle needAccountPrompt = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle signUpOrange = TextStyle(
    color: AppColors.accentOrange,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle splitFieldLabel = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle splitInputText = TextStyle(
    color: Colors.black,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle splitHintText = TextStyle(
    color: Color(0xA6000000),
    fontSize: 15,
  );

  static const TextStyle splitErrorText = TextStyle(
    color: Color(0xFFF5A344),
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  // Forgot Password Screen Styles
  static const TextStyle enterEmailHeading = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle backToPrompt = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle signInOrange = TextStyle(
    color: AppColors.accentOrange,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle dontHaveAccountPrompt = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle signUpBold16 = TextStyle(
    color: AppColors.accentOrange,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  // Verification Screen Styles
  static const TextStyle enterVerificationCodeHeading = TextStyle(
    color: Colors.white,
    fontSize: 22,
  );

  static const TextStyle didntReceiveCodePrompt = TextStyle(
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle resendCodeOrange = TextStyle(
    color: AppColors.accentOrange,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );

  // Business Profile & Register Modal Styles
  static const TextStyle modalTitle = TextStyle(
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle whiteInputFieldText = TextStyle(color: Colors.white);

  static const TextStyle modalCapabilitySelected = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: AppColors.accentOrange,
  );

  static const TextStyle modalCapabilityUnselected = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: Colors.white70,
  );

  static const TextStyle saveChangesButtonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle profileAvatarInitials = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Color(0xFF00B0FF),
    letterSpacing: 1.5,
  );

  static const TextStyle editProfileButtonText = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle businessInfoSectionTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  // Business Register Screen Styles
  static const TextStyle businessRegisterTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const TextStyle businessRegisterSubtitle = TextStyle(
    fontSize: 13,
    color: Color(0xE68FA3BE),
  );

  static const TextStyle machineCapabilitySub = TextStyle(
    fontSize: 12.5,
    color: Color(0xE68FA3BE),
  );

  static const TextStyle capabilityChipSelected = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.bold,
    color: AppColors.accentOrange,
  );

  static const TextStyle capabilityChipUnselected = TextStyle(
    fontSize: 13.5,
    fontWeight: FontWeight.w500,
    color: Colors.white70,
  );

  static const TextStyle createBusinessProfileButtonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  // Settings Dialog & Tiles (Business & Supplier)
  static const TextStyle dialogTitle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle dialogContent = TextStyle(
    color: AppColors.subtitleGray,
  );

  static const TextStyle dialogCancel = TextStyle(color: Colors.white70);

  static const TextStyle dialogConfirm = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle settingsHeaderTitle = TextStyle(
    color: Colors.white,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle contactUsQuestionMark = TextStyle(
    color: AppColors.accentOrange,
    fontSize: 13,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle settingsTileTitle = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
  );

  // About Us Styles
  static const TextStyle aboutVersionText = TextStyle(
    color: Colors.white38,
    fontSize: 13,
  );

  static const TextStyle aboutFeatureText = TextStyle(
    color: Colors.white,
    fontSize: 14,
  );

  // Home Stats & Expands
  static TextStyle statCardValue(Color color) =>
      TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: color);

  static const TextStyle homeExpandDescription = TextStyle(
    fontSize: 13.5,
    height: 1.45,
    color: Color(0xFF374151),
    fontWeight: FontWeight.w400,
  );

  // Log Material Yield Screen Styles
  static const TextStyle yieldSubmitButtonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.buttonTextColor,
    letterSpacing: 0.3,
  );

  // Order Status Screen Styles
  static const TextStyle orderStatusButtonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w900,
    color: Colors.black,
    letterSpacing: 0.3,
  );

  // Current Order Empty State
  static const TextStyle emptyOrderText = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  // Stock Screen Styles
  static const TextStyle stockSearchInputText = TextStyle(
    color: Colors.white,
    fontSize: 14.5,
  );

  static const TextStyle stockSearchHintText = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 14,
  );

  static const TextStyle stockAvailableText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle stockEmptyText = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // Conform Order Screen Styles
  static const TextStyle conformOrderEmptyText = TextStyle(
    color: Colors.white70,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle conformOrderResetText = TextStyle(
    color: AppColors.accentOrange,
  );

  // Supplier Profile Screen Styles
  static const TextStyle supplierProfileButtonText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.buttonTextColor,
    letterSpacing: 0.5,
  );

  // Supplier Send Order Screen Styles
  static const TextStyle sendOrderButtonText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.buttonTextColor,
    letterSpacing: 0.5,
  );

  // Calculator Screen Styles
  static const TextStyle calcDisplay = TextStyle(
    color: Colors.white,
    fontSize: 72,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle calcZeroButton = TextStyle(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.w400,
  );

  static TextStyle calcButtonText(Color color) =>
      TextStyle(color: color, fontSize: 30, fontWeight: FontWeight.w400);

  // Headers & Footers
  static const TextStyle headerBarTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.3,
  );

  static TextStyle footerNavLabel(Color color, bool isSelected) => TextStyle(
    fontSize: 11,
    color: color,
    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
  );

  // Order Details Screen Styles (Figma Page 19)
  static const TextStyle orderDetailsCardHeader = TextStyle(
    color: Colors.white,
    fontSize: 16.5,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.2,
  );

  static const TextStyle orderDetailsLabel = TextStyle(
    color: AppColors.subtitleGray,
    fontSize: 14.5,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle orderDetailsValue = TextStyle(
    color: Colors.white,
    fontSize: 14.5,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle orderDetailsStatusPending = TextStyle(
    color: AppColors.accentOrange,
    fontSize: 14.5,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );

  static const TextStyle orderDetailButtonText = TextStyle(
    fontSize: 16.5,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.3,
  );
}

/// 3. Input, Card and Button Decorations (Widget Styles)
class AppStyles {
  // About Us and Contact Us Card Decoration
  static BoxDecoration cardDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(18),
    border: Border.all(color: Colors.white10),
  );

  // Contact Icon Circle Background
  static BoxDecoration iconCircleDecoration = BoxDecoration(
    color: AppColors.accentOrange.withValues(alpha: 0.15),
    shape: BoxShape.circle,
  );

  // Support Action Cards Decoration
  static BoxDecoration supportCardDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.white10),
  );

  // FAQ Card Decoration
  static BoxDecoration faqCardDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(14),
    border: Border.all(color: Colors.white10),
  );

  // Notification Card Decoration
  static BoxDecoration notificationCardDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.white10, width: 0.8),
  );

  // Menu Item Row Spacing
  static const EdgeInsets menuItemPadding = EdgeInsets.symmetric(
    vertical: 14.0,
    horizontal: 8.0,
  );

  // Current Order Card Decoration
  static BoxDecoration currentOrderCardDecoration = BoxDecoration(
    color: AppColors.orderCardBg,
    borderRadius: BorderRadius.circular(16),
  );

  // Conform Order Card Decoration (Figma Page 12)
  static BoxDecoration conformOrderCardDecoration = BoxDecoration(
    color: AppColors.orderCardBg,
    borderRadius: BorderRadius.circular(16),
  );

  // Stock Screen Card Decoration (Figma Supplier Theme)
  static BoxDecoration stockCardDecoration = BoxDecoration(
    color: AppColors.orderCardBg,
    borderRadius: BorderRadius.circular(16),
  );

  static BoxDecoration stockSummaryCardDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.white12, width: 0.8),
  );

  // Status Stage Checkbox Decorations
  static BoxDecoration statusCheckedBox = BoxDecoration(
    color: AppColors.accentOrange,
    borderRadius: BorderRadius.circular(6),
  );

  static BoxDecoration statusUncheckedBox = BoxDecoration(
    border: Border.all(color: AppColors.accentOrange, width: 2),
    borderRadius: BorderRadius.circular(6),
  );

  // Yield Raw Material Card Decoration
  static BoxDecoration yieldCardDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.white12, width: 0.8),
  );

  // Yield Balancing Preview Box Decoration (Figma Page 21 Blue Outline Card)
  static BoxDecoration yieldPreviewDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: const Color(0xFF00B0FF), width: 1.5),
  );

  // Yield Input Box Decoration
  static BoxDecoration yieldInputBoxDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.white12, width: 0.8),
  );

  // Business Profile Avatar Decoration (Figma Page 23 Blue Outline Circle)
  static BoxDecoration profileAvatarDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    shape: BoxShape.circle,
    border: Border.all(color: const Color(0xFF00B0FF), width: 2.5),
  );

  // Business Profile Vendor Performance Card Decoration (Greenish Border)
  static BoxDecoration profilePerformanceCardDecoration = BoxDecoration(
    color: const Color(0xFF1E3545),
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: const Color(0xFF00E676), width: 1.5),
  );

  // Business Profile Action Tile Box Decoration
  static BoxDecoration profileActionTileDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.white10, width: 0.8),
  );

  // Supplier Profile Avatar Decoration (Figma Page 9 White Double Ring Circle)
  static BoxDecoration supplierProfileAvatarDecoration = BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
    border: Border.all(color: Colors.white, width: 4),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.2),
        blurRadius: 10,
        spreadRadius: 2,
      ),
    ],
  );

  // Send Order Light Grey Pill Decoration (Figma Page 13)
  static BoxDecoration sendOrderPillDecoration = BoxDecoration(
    color: const Color(0xFFD6DBE1), // Light grey pill color
    borderRadius: BorderRadius.circular(24),
  );

  // OTP Circular Box Decoration
  static const BoxDecoration otpCircleDecoration = BoxDecoration(
    color: AppColors.otpCircleFill,
    shape: BoxShape.circle,
  );

  // Dual-tone Pill Input Box Decoration
  static BoxDecoration splitInputBoxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(26),
  );

  // Role Selection Card Decoration
  static BoxDecoration roleCardDecoration({required bool isSelected}) {
    return BoxDecoration(
      color: AppColors.cardNavy,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isSelected ? AppColors.selectedBorder : Colors.transparent,
        width: 2.2,
      ),
      boxShadow: isSelected
          ? [
              BoxShadow(
                color: AppColors.selectedBorder.withValues(alpha: 0.3),
                blurRadius: 12,
                spreadRadius: 1,
              ),
            ]
          : null,
    );
  }

  // Single Line Input Box Decoration
  static InputDecoration inputDecoration({
    String? hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.accentOrange,
      hintText: hintText,
      hintStyle: AppTextStyles.inputHint,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(22),
        borderSide: BorderSide.none,
      ),
      errorStyle: AppTextStyles.errorText,
    );
  }

  // Multiline Text Area Box Decoration (For Contact Us & Support)
  static InputDecoration textAreaDecoration({String? hintText}) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.accentOrange,
      hintText: hintText,
      hintStyle: AppTextStyles.inputHint,
      contentPadding: const EdgeInsets.all(16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),
      errorStyle: AppTextStyles.errorText,
    );
  }

  // Primary Rounded Button (Submit / Continue / Send)
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.accentOrange,
    foregroundColor: AppColors.buttonTextColor,
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
  );
  // Grey Input Box Decoration for New Password & Profile (Matches Figma style)
  static InputDecoration greyInputDecoration({
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(
        0xFF707F95,
      ), // Slate grey-blue color matching mockup
      hintText: hintText,
      hintStyle: const TextStyle(
        color: Colors.white, // White hint text matching mockup
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      // Pill height and internal padding
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      // Full Pill / Oval Shape
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(color: Colors.white30, width: 1.5),
      ),

      // Error message style matching mockup
      errorStyle: const TextStyle(
        color: Color(0xFFF5A344), // Warm orange error color
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),

      // Maintain pill shape on error
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(32),
        borderSide: const BorderSide(color: Color(0xFFF5A344), width: 1.2),
      ),
    );
  }

  // Business Register Dark Input Box Decoration
  static InputDecoration businessInputDecoration({
    required String hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.cardNavy,
      hintText: hintText,
      hintStyle: const TextStyle(color: Color(0xFF6B7E96), fontSize: 14),
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColors.accentOrange, width: 1.2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.orangeAccent),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.orangeAccent, width: 1.2),
      ),
    );
  }

  // Yield TextField Input Decoration
  static InputDecoration yieldInputDecoration({String? hintText}) {
    return InputDecoration(
      filled: true,
      fillColor: AppColors.cardNavy,
      hintText: hintText,
      hintStyle: const TextStyle(color: AppColors.subtitleGray, fontSize: 16),
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white12, width: 0.8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white12, width: 0.8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF00B0FF), width: 1.5),
      ),
    );
  }

  // Login Screen Styles
  static BoxDecoration loginLogoDecoration = BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.2),
        blurRadius: 10,
        spreadRadius: 2,
      ),
    ],
  );

  static BoxDecoration roleToggleContainerDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(30),
    border: Border.all(color: Colors.white12, width: 0.8),
  );

  static BoxDecoration roleSegmentDecoration(bool isSelected) => BoxDecoration(
    color: isSelected ? AppColors.accentOrange : Colors.transparent,
    borderRadius: BorderRadius.circular(26),
  );

  static BoxDecoration splitFieldContainerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(26),
  );

  static const BoxDecoration splitFieldIconContainerDecoration = BoxDecoration(
    color: Color(0xFFD9DDE2),
  );

  static InputDecoration splitFieldInputDecoration(String hintText) =>
      InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.splitHintText,
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.zero,
      );

  // Role Screen Indicator Circles
  static const BoxDecoration roleSelectedIndicatorDecoration = BoxDecoration(
    color: AppColors.selectedBorder,
    shape: BoxShape.circle,
  );

  static const BoxDecoration roleUnselectedIndicatorDecoration = BoxDecoration(
    color: AppColors.unselectedIndicator,
    shape: BoxShape.circle,
  );

  // Verification Screen OTP Input
  static const InputDecoration otpInputDecoration = InputDecoration(
    counterText: '',
    border: InputBorder.none,
    contentPadding: EdgeInsets.zero,
  );

  // Business Profile & Register Modal
  static BoxDecoration modalDragHandleDecoration = BoxDecoration(
    color: Colors.white24,
    borderRadius: BorderRadius.circular(2),
  );

  static BoxDecoration modalCapabilityChipDecoration(bool isSelected) =>
      BoxDecoration(
        color: AppColors.cardNavy,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppColors.accentOrange : Colors.white12,
          width: 1.2,
        ),
      );

  static ButtonStyle modalSaveButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.accentOrange,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
  );

  static ButtonStyle dialogConfirmButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.accentOrange,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );

  static BoxDecoration editProfilePillDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(20),
    border: Border.all(color: Colors.white12, width: 0.8),
  );

  static BoxDecoration businessInfoCardDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(16),
    border: Border.all(color: Colors.white12, width: 0.8),
  );

  // Business Register Capabilities Chip & Button
  static BoxDecoration capabilityChipDecoration(bool isSelected) =>
      BoxDecoration(
        color: AppColors.cardNavy,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: isSelected ? AppColors.accentOrange : Colors.transparent,
          width: 1.5,
        ),
      );

  static ButtonStyle createBusinessButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.accentOrange,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28.0)),
  );

  // About Us Brand Logo
  static const BoxDecoration aboutLogoDecoration = BoxDecoration(
    color: AppColors.accentOrange,
    shape: BoxShape.circle,
  );

  // Home Stats & Order Cards
  static BoxDecoration statCardDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(14.0),
    border: Border.all(color: Colors.white10),
  );

  static BoxDecoration orderCardNavyDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(14.0),
    border: Border.all(color: Colors.white10),
  );

  static BoxDecoration supplierHomeLogoDecoration = BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.black12,
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.12),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );

  static BoxDecoration supplierHomeExpandDecoration = BoxDecoration(
    color: const Color(0xFFF8F9FA),
    borderRadius: BorderRadius.circular(14.0),
    border: Border.all(color: const Color(0xFFE0E0E0), width: 1.0),
  );

  // Log Material Yield Submit Button Style
  static ButtonStyle yieldSubmitButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.accentOrange,
    foregroundColor: AppColors.buttonTextColor,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
  );

  // Notification Dot Decoration
  static const BoxDecoration notificationDotDecoration = BoxDecoration(
    color: AppColors.notificationDot,
    shape: BoxShape.circle,
  );

  // Contact Icon Circle Decoration
  static BoxDecoration contactIconCircleDecoration = BoxDecoration(
    color: AppColors.accentOrange.withValues(alpha: 0.15),
    shape: BoxShape.circle,
  );

  // Stock Screen Styles
  static BoxDecoration stockSearchDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(25),
    border: Border.all(color: Colors.white12, width: 0.8),
  );

  static const InputDecoration stockSearchInputDecoration = InputDecoration(
    hintText: 'Search material, grade or shape...',
    hintStyle: AppTextStyles.stockSearchHintText,
    border: InputBorder.none,
    isDense: true,
  );

  static BoxDecoration stockBadgeDecoration({required bool inStock}) =>
      BoxDecoration(
        color: inStock ? const Color(0xFF2E7D32) : const Color(0xFFC62828),
        borderRadius: BorderRadius.circular(12),
      );

  static BoxDecoration stockAvailableDecoration = BoxDecoration(
    color: Colors.black.withValues(alpha: 0.06),
    borderRadius: BorderRadius.circular(10),
  );

  // Supplier Profile Screen Update Button
  static ButtonStyle supplierProfileUpdateButtonStyle =
      ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentOrange,
        foregroundColor: AppColors.buttonTextColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      );

  // Supplier Send Order Screen
  static ButtonStyle sendOrderButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.accentOrange,
    foregroundColor: AppColors.buttonTextColor,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
  );

  static const InputDecoration borderlessInputDecoration = InputDecoration(
    border: InputBorder.none,
    isDense: true,
    contentPadding: EdgeInsets.zero,
  );

  // Header & Footer Decorations
  static BoxDecoration headerProfileIconDecoration = BoxDecoration(
    shape: BoxShape.circle,
    border: Border.all(color: AppColors.accentOrange, width: 2.2),
  );

  static const BoxDecoration footerDecoration = BoxDecoration(
    color: AppColors.primaryNavy,
    border: Border(
      top: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.102), width: 0.8),
    ),
  );

  static const BoxDecoration supplierFooterDecoration = BoxDecoration(
    color: AppColors.primaryNavy,
    border: Border(top: BorderSide(color: Colors.white12, width: 0.5)),
  );

  // Order Details Screen Styles (Figma Page 19)
  static BoxDecoration orderDetailsCardDecoration = BoxDecoration(
    color: AppColors.cardNavy,
    borderRadius: BorderRadius.circular(14.0),
    border: Border.all(color: Colors.white10),
  );

  static ButtonStyle orderDetailActionButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.accentOrange,
    foregroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
  );
}
