import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/Screen/login_screen.dart';
import 'package:flutter_application_1/Screen/role_screen.dart';
import 'package:flutter_application_1/Screen/forgot_password_screen.dart';
import 'package:flutter_application_1/Screen/verification_screen.dart';
import 'package:flutter_application_1/Screen/new_password.dart';

import 'package:flutter_application_1/Supplier/supplier_register_screen.dart';
import 'package:flutter_application_1/Supplier/supplier_home.dart';
import 'package:flutter_application_1/Supplier/supplier_setting.dart' as supplier_setting;
import 'package:flutter_application_1/Supplier/supplier_about_us.dart' as supplier_about;
import 'package:flutter_application_1/Supplier/supplier_contact_us.dart' as supplier_contact;
import 'package:flutter_application_1/Supplier/supplier_change_password_screen.dart' as supplier_change_pw;
import 'package:flutter_application_1/Supplier/supplier_help&support_screen.dart' as supplier_help;
import 'package:flutter_application_1/Supplier/supplier_profile.dart';
import 'package:flutter_application_1/Supplier/supplier_menu.dart';
import 'package:flutter_application_1/Supplier/supplier_notification.dart';
import 'package:flutter_application_1/Supplier/supplier_current_order.dart';
import 'package:flutter_application_1/Supplier/supplier_send_order.dart';
import 'package:flutter_application_1/Supplier/supplier_conform_order.dart';
import 'package:flutter_application_1/Supplier/supplier_stock.dart';
import 'package:flutter_application_1/Supplier/calculater.dart';

import 'package:flutter_application_1/Bussiness/business_register.dart';
import 'package:flutter_application_1/Bussiness/business_home.dart';
import 'package:flutter_application_1/Bussiness/business_setting.dart' as business_setting;
import 'package:flutter_application_1/Bussiness/business_about_us.dart' as business_about;
import 'package:flutter_application_1/Bussiness/business_contact_us.dart' as business_contact;
import 'package:flutter_application_1/Bussiness/business_change_password.dart' as business_change_pw;
import 'package:flutter_application_1/Bussiness/business_help&support.dart' as business_help;
import 'package:flutter_application_1/Bussiness/business_notification.dart';
import 'package:flutter_application_1/Bussiness/business_menu.dart';
import 'package:flutter_application_1/Bussiness/business_current_order.dart';
import 'package:flutter_application_1/Bussiness/business_order_status.dart';
import 'package:flutter_application_1/Bussiness/business_log_material_yield.dart';
import 'package:flutter_application_1/Bussiness/business_profile.dart';
import 'package:flutter_application_1/Bussiness/business_order_details.dart';

Widget createTestWidget(Widget child) {
  return MaterialApp(
    home: child,
  );
}

void main() {
  testWidgets('1. LoginScreen renders properly and redirects according to role', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const LoginScreen()));
    expect(find.text('Login to Account'), findsOneWidget);
    expect(find.text('Supplier'), findsOneWidget);
    expect(find.text('Business'), findsOneWidget);

    // Fill valid login fields
    final emailField = find.widgetWithText(TextFormField, 'Enter your Email');
    final passwordField = find.widgetWithText(TextFormField, 'Enter your Password');
    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, '123456');

    // 1. By default role is Supplier -> Click Login -> redirects to Supplier Dashboard (HomeScreen)
    final loginButton = find.widgetWithText(ElevatedButton, 'Login');
    await tester.ensureVisible(loginButton);
    await tester.pumpAndSettle();
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    expect(find.text('Home'), findsOneWidget); // Supplier HomeScreen header
  });

  testWidgets('1b. LoginScreen with Business role redirects to Business Dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const LoginScreen()));

    // Tap Business button
    final businessButton = find.text('Business');
    await tester.tap(businessButton);
    await tester.pumpAndSettle();

    // Fill valid login fields
    final emailField = find.widgetWithText(TextFormField, 'Enter your Email');
    final passwordField = find.widgetWithText(TextFormField, 'Enter your Password');
    await tester.enterText(emailField, 'business@example.com');
    await tester.enterText(passwordField, '123456');

    // Click Login -> redirects to Business Dashboard (BusinessHomeScreen)
    final loginButton = find.widgetWithText(ElevatedButton, 'Login');
    await tester.ensureVisible(loginButton);
    await tester.pumpAndSettle();
    await tester.tap(loginButton);
    await tester.pumpAndSettle();
    expect(find.text('Business Home'), findsOneWidget); // Business HomeScreen header
  });

  testWidgets('2. SelectRoleScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const SelectRoleScreen()));
    expect(find.text('Select Your Role'), findsOneWidget);
  });

  testWidgets('3. ForgotPasswordScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const ForgotPasswordScreen()));
    expect(find.text('Forgot password'), findsOneWidget);
  });

  testWidgets('4. VerificationScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const VerificationScreen()));
    expect(find.text('Verification'), findsOneWidget);
  });

  testWidgets('5. NewPasswordScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const NewPasswordScreen()));
    expect(find.text('New Password'), findsOneWidget);
  });

  testWidgets('6. Supplier RegisterScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const RegisterScreen()));
    expect(find.text('Create Your Account'), findsOneWidget);
  });

  testWidgets('7. Supplier HomeScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const HomeScreen()));
    expect(find.text('Logo Text Here technology pty.ltd'), findsWidgets);
  });

  testWidgets('8. Supplier SettingScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const supplier_setting.SettingScreen()));
    expect(find.text('Settings'), findsWidgets);
  });

  testWidgets('9. Supplier AboutUsScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const supplier_about.AboutUsScreen()));
    expect(find.text('About Us'), findsOneWidget);
  });

  testWidgets('10. Supplier ContactUsScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const supplier_contact.ContactUsScreen()));
    expect(find.text('Contact Us'), findsOneWidget);
  });

  testWidgets('11. Supplier ChangePasswordScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const supplier_change_pw.ChangePasswordScreen()));
    expect(find.text('Change Password'), findsOneWidget);
  });

  testWidgets('12. Supplier HelpSupportScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const supplier_help.HelpSupportScreen()));
    expect(find.text('Help & Support'), findsOneWidget);
  });

  testWidgets('13. CalculaterScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const CalculaterScreen()));
    expect(find.text('AC'), findsOneWidget);
  });

  testWidgets('14. BusinessRegisterScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const BusinessRegisterScreen()));
    expect(find.text('Business Register'), findsOneWidget);
  });

  testWidgets('15. BusinessHomeScreen renders properly and Job Inbox cards redirect to Order Details', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const BusinessHomeScreen()));
    expect(find.text('Business Home'), findsOneWidget);
    expect(find.text('Job Inbox (New Cards)'), findsOneWidget);
    expect(find.text('Order #1 - Tech Corp Inc.'), findsOneWidget);
    expect(find.text('Order #2 - Alpha Ind.'), findsOneWidget);

    // Tap on Order #1 card to redirect to Order #1 Details page
    await tester.tap(find.text('Order #1 - Tech Corp Inc.'));
    await tester.pumpAndSettle();

    expect(find.text('Order #1 Details'), findsOneWidget);
    expect(find.text('Tech Corp Inc.'), findsOneWidget);
    expect(find.text('Accept Work Order'), findsOneWidget);
    expect(find.text('Decline Work Order'), findsOneWidget);

    // Tap Accept Work Order - prints and shows Order accepted without redirecting to status page
    final acceptBtn = find.text('Accept Work Order');
    await tester.ensureVisible(acceptBtn);
    await tester.pumpAndSettle();
    await tester.tap(acceptBtn);
    await tester.pump();
    expect(find.text('Order accepted'), findsOneWidget);
    expect(find.text('Update Status'), findsNothing);

    // Tap Decline Work Order - prints and shows Order declined
    final declineBtn = find.text('Decline Work Order');
    await tester.ensureVisible(declineBtn);
    await tester.pumpAndSettle();
    await tester.tap(declineBtn);
    await tester.pumpAndSettle();
    expect(find.text('Order declined'), findsOneWidget);
  });

  testWidgets('15b. BusinessOrderDetailsScreen renders properly and actions work', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const BusinessOrderDetailsScreen()));
    expect(find.text('Order #1 Details'), findsOneWidget);
    expect(find.text('Client Information'), findsOneWidget);
    expect(find.text('Tech Corp Inc.'), findsOneWidget);
    expect(find.text('PENDING'), findsOneWidget);
    expect(find.text('18 Feb 2026'), findsOneWidget);
    expect(find.text('Dimensions & Specs'), findsOneWidget);
    expect(find.text('Mild Steel (EN8)'), findsOneWidget);
    expect(find.text('±0.05 mm'), findsOneWidget);
    expect(find.text('Required'), findsOneWidget);

    // Tap Accept Work Order - shows Order accepted message
    final acceptButton = find.text('Accept Work Order');
    await tester.ensureVisible(acceptButton);
    await tester.pumpAndSettle();
    await tester.tap(acceptButton);
    await tester.pump();
    expect(find.text('Order accepted'), findsOneWidget);
  });

  testWidgets('16. Business SettingScreen renders properly and back button navigates to Business Home', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const business_setting.SettingScreen()));
    expect(find.text('Settings'), findsWidgets);
    expect(find.text('Help & Support'), findsOneWidget);
    expect(find.text('About Us'), findsOneWidget);
    expect(find.text('Contact Us'), findsOneWidget);
    expect(find.text('Change Password'), findsOneWidget);

    // Tap Change Password from Business Settings
    await tester.tap(find.text('Change Password'));
    await tester.pumpAndSettle();
    expect(find.text('Change Password'), findsOneWidget);

    // Tap Back button from Change Password screen
    final backBtn = find.byIcon(Icons.arrow_back_ios_new_rounded);
    await tester.tap(backBtn);
    await tester.pumpAndSettle();

    // Verify it returned to Business Settings
    expect(find.text('Settings'), findsWidgets);

    // Tap Back button from Business Settings
    final settingsBackBtn = find.byIcon(Icons.arrow_back_ios_new);
    await tester.tap(settingsBackBtn);
    await tester.pumpAndSettle();

    // Verify it returned to Business Home, NOT Supplier Home
    expect(find.text('Business Home'), findsOneWidget);
    expect(find.text('Job Inbox (New Cards)'), findsOneWidget);
  });

  testWidgets('17. Business AboutUsScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const business_about.AboutUsScreen()));
    expect(find.text('About Us'), findsOneWidget);
  });

  testWidgets('18. Business ContactUsScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const business_contact.ContactUsScreen()));
    expect(find.text('Contact Us'), findsOneWidget);
  });

  testWidgets('19. Business ChangePasswordScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const business_change_pw.ChangePasswordScreen()));
    expect(find.text('Change Password'), findsOneWidget);
  });

  testWidgets('20. Business HelpSupportScreen renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const business_help.HelpSupportScreen()));
    expect(find.text('Help & Support'), findsOneWidget);
  });

  testWidgets('21. Business NotificationScreen renders properly and mark all as read works', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const BusinessNotificationScreen()));
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Mark all as read'), findsOneWidget);
    expect(find.text('New Order Received'), findsOneWidget);
    expect(find.text('Tech Corp Inc. placed Order #12'), findsOneWidget);
    expect(find.text('Vendor Verified'), findsOneWidget);
    expect(find.text('PoD Approved'), findsOneWidget);

    // Tap Mark all as read
    await tester.tap(find.text('Mark all as read'));
    await tester.pump();
    expect(find.text('All notifications marked as read'), findsOneWidget);
  });

  testWidgets('22. Business MenuScreen renders properly and items exist', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const BusinessMenuScreen()));
    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Current Order'), findsOneWidget);
    expect(find.text('Order Status'), findsOneWidget);
    expect(find.text('Log Material Yield'), findsOneWidget);
    expect(find.text('Calculator'), findsOneWidget);
    expect(find.text('Help & Support'), findsOneWidget);
    expect(find.text('Contact Us'), findsOneWidget);
  });

  testWidgets('23. Business CurrentOrderScreen renders properly and remove order works', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const BusinessCurrentOrderScreen()));
    expect(find.text('Current Order'), findsOneWidget);
    expect(find.text('logo Text Here Technology Pty.Ltd'), findsWidgets);
    expect(find.text('11/08/2015'), findsWidgets);
    expect(find.text('11:45 AM'), findsWidgets);

    // Tap close icon on first order
    await tester.tap(find.byIcon(Icons.close_rounded).first);
    await tester.pump();
    expect(find.text('Order #1 removed'), findsOneWidget);
  });

  testWidgets('24. Business OrderStatusScreen renders properly and Mark as Ready works', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const BusinessOrderStatusScreen()));
    expect(find.text('Update Status'), findsOneWidget);
    expect(find.text('Order #1 - 4-Stage Sync'), findsOneWidget);
    expect(find.text('Material Dispatched'), findsOneWidget);
    expect(find.text('Material Received'), findsOneWidget);
    expect(find.text('Cutting In Progress'), findsOneWidget);
    expect(find.text('Ready for Quality Assembly'), findsOneWidget);
    expect(find.text('1-Tap: Mark as Ready'), findsOneWidget);

    // Tap 1-Tap: Mark as Ready button
    await tester.tap(find.text('1-Tap: Mark as Ready'));
    await tester.pump();
    expect(find.text('✓ Status: Ready Marked'), findsOneWidget);
    expect(find.text('Order #1 marked as Ready for Quality Assembly!'), findsOneWidget);
  });

  testWidgets('25. Business LogMaterialYieldScreen renders and calculates yield properly', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const BusinessLogMaterialYieldScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Log Material Yield'), findsOneWidget);
    expect(find.text('Total Raw Material Issued'), findsOneWidget);
    expect(find.text('250.00 kg'), findsOneWidget);
    expect(find.text('Usable Offcut Weight (kg)'), findsOneWidget);
    expect(find.text('Scrap / Metal Shavings (kg)'), findsOneWidget);
    expect(find.text('Yield Balancing Preview'), findsOneWidget);
    expect(find.text('Finished Units: 226.3 kg'), findsOneWidget);
    expect(find.text('Reconciliation match: 100%'), findsOneWidget);

    // Test Submit Button
    final submitButton = find.text('Submit Ledger Record');
    expect(submitButton, findsOneWidget);
    await tester.ensureVisible(submitButton);
    await tester.pumpAndSettle();
    await tester.tap(submitButton);
    await tester.pump();
    expect(find.textContaining('Ledger Record Submitted'), findsOneWidget);
  });

  testWidgets('26. Business ProfileScreen renders properly and actions respond', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const BusinessProfileScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Business Profile'), findsOneWidget);
    expect(find.text('EM'), findsOneWidget);
    expect(find.text('Excel Machinery pvt.ltd'), findsWidgets);
    expect(find.text('excelmachinery@gmail.com | 1234567890'), findsOneWidget);
    expect(find.text('Edit Profile'), findsOneWidget);
    expect(find.text('Business Information'), findsOneWidget);
    expect(find.text('Owner Full Name'), findsOneWidget);
    expect(find.text('Dhruv Patel'), findsOneWidget);
    expect(find.text('CNC, Lathe'), findsWidgets);
    expect(find.text('On-Time Delivery Rate'), findsNothing);
    expect(find.text('Switch Role (Supplier / Workshop)'), findsNothing);
    expect(find.text('App Settings & Language'), findsOneWidget);
    expect(find.text('Machine Capabilities (CNC, Lathe)'), findsOneWidget);

    // Test Edit Profile tap opens bottom sheet
    final editButton = find.text('Edit Profile');
    await tester.tap(editButton);
    await tester.pumpAndSettle();
    expect(find.text('Edit Business Profile'), findsOneWidget);
    expect(find.text('Save Changes'), findsOneWidget);

    // Test Save Changes tap
    final saveButton = find.text('Save Changes');
    await tester.ensureVisible(saveButton);
    await tester.pumpAndSettle();
    await tester.tap(saveButton);
    await tester.pumpAndSettle();
    expect(find.text('Business Profile Updated Successfully!'), findsOneWidget);
  });

  testWidgets('27. Supplier ProfileScreen renders properly and update works', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const SupplierProfileScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Profile'), findsOneWidget);
    expect(find.byIcon(Icons.person), findsWidgets);
    expect(find.text('Full Name'), findsOneWidget);
    expect(find.text('Georgia Alfaro'), findsOneWidget);
    expect(find.text('Enter Email Address'), findsOneWidget);
    expect(find.text('abc@gmail.com'), findsOneWidget);
    expect(find.text('Phone Number'), findsOneWidget);
    expect(find.text('1234567890'), findsOneWidget);
    expect(find.text('Company Name'), findsOneWidget);
    expect(find.text('Excel Machinery pvt.ltd'), findsOneWidget);

    final updateButton = find.text('Update');
    expect(updateButton, findsOneWidget);
    await tester.ensureVisible(updateButton);
    await tester.pumpAndSettle();
    await tester.tap(updateButton);
    await tester.pump();
    expect(find.text('Profile Updated Successfully!'), findsOneWidget);
  });

  testWidgets('28. Supplier MenuScreen renders properly and items exist', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const SupplierMenuScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Menu'), findsOneWidget);
    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Current Order'), findsOneWidget);
    expect(find.text('Send Order'), findsOneWidget);
    expect(find.text('Conform Order'), findsOneWidget);
    expect(find.text('Stock'), findsOneWidget);
    expect(find.text('Calculator'), findsOneWidget);
    expect(find.text('Settings'), findsOneWidget);

    // Test item click (e.g. Notifications navigates to SupplierNotificationScreen)
    final notifItem = find.text('Notifications');
    await tester.tap(notifItem);
    await tester.pumpAndSettle();
    expect(find.text('Mark all as read'), findsOneWidget);
  });

  testWidgets('29. Supplier NotificationScreen renders properly and mark all as read works', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const SupplierNotificationScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Notifications'), findsOneWidget);
    expect(find.text('Mark all as read'), findsOneWidget);
    expect(find.text('New Order Received'), findsOneWidget);
    expect(find.text('Tech Corp Inc. placed Order #12'), findsOneWidget);
    expect(find.text('Vendor Verified'), findsOneWidget);
    expect(find.text('PoD Approved'), findsOneWidget);

    // Test Mark all as read click
    final markAllButton = find.text('Mark all as read');
    await tester.tap(markAllButton);
    await tester.pump();
    expect(find.text('All notifications marked as read'), findsOneWidget);
  });

  testWidgets('30. Supplier CurrentOrderScreen renders properly and remove order works', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const SupplierCurrentOrderScreen()));
    await tester.pumpAndSettle();

    // Appbar title and footer tab both say 'Current Order'
    expect(find.text('Current Order'), findsNWidgets(2));
    expect(find.text('logo Text Here Technology Pty.Ltd'), findsNWidgets(4));
    expect(find.text('Material  : - En-D-20 , Round'), findsNWidgets(4));
    expect(find.text('Length :-45.32mm , Pish:-20'), findsNWidgets(4));
    expect(find.text('11/08/2015'), findsNWidgets(4));
    expect(find.text('11:45 AM'), findsNWidgets(4));

    // Test removing an order card
    final closeIcons = find.byIcon(Icons.close_rounded);
    expect(closeIcons, findsNWidgets(4));
    await tester.tap(closeIcons.first);
    await tester.pump();

    expect(find.text('logo Text Here Technology Pty.Ltd'), findsNWidgets(3));
    expect(find.text('Order #1 removed'), findsOneWidget);
  });

  testWidgets('31. Supplier SendOrderScreen renders properly and send works', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const SupplierSendOrderScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Send order'), findsOneWidget);
    expect(find.text('Material'), findsOneWidget);
    expect(find.text('EN-D'), findsOneWidget);
    expect(find.text('Width'), findsOneWidget);
    expect(find.text('Diagram'), findsOneWidget);
    expect(find.text('Round'), findsOneWidget);
    expect(find.text('Length'), findsOneWidget);
    expect(find.text('mm'), findsOneWidget);
    expect(find.text('Piece'), findsOneWidget);

    final textFields = find.byType(TextField);
    await tester.enterText(textFields.at(0), '10');
    await tester.enterText(textFields.at(1), '20');
    await tester.enterText(textFields.at(2), '5');

    final sendButton = find.text('Send Order');
    expect(sendButton, findsOneWidget);
    await tester.ensureVisible(sendButton);
    await tester.pumpAndSettle();
    await tester.tap(sendButton);
    await tester.pump();
    expect(find.textContaining('Order Sent to'), findsOneWidget);
  });

  testWidgets('32. Supplier ConformOrderScreen renders properly and delete works', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const SupplierConformOrderScreen()));
    await tester.pumpAndSettle();

    // Appbar title says 'Conform Order'
    expect(find.text('Conform Order'), findsOneWidget);
    expect(find.text('logo Text Here Technology Pty.Ltd'), findsNWidgets(4));
    expect(find.text('Material  : - En-D-20 , Round'), findsNWidgets(4));
    expect(find.text('Length :-45.32mm ,Pish:-20'), findsNWidgets(4));
    expect(find.text('11/08/2015'), findsNWidgets(4));
    expect(find.text('11:45 AM'), findsNWidgets(4));

    // Test deleting an order card using trash icon
    final deleteIcons = find.byIcon(Icons.delete_outline_rounded);
    expect(deleteIcons, findsNWidgets(4));
    await tester.tap(deleteIcons.first);
    await tester.pump();

    expect(find.text('logo Text Here Technology Pty.Ltd'), findsNWidgets(3));
    expect(find.text('Conformed Order #1 deleted'), findsOneWidget);
  });

  testWidgets('33. Supplier StockScreen renders properly and search works', (WidgetTester tester) async {
    await tester.pumpWidget(createTestWidget(const SupplierStockScreen()));
    await tester.pumpAndSettle();

    expect(find.text('Stock'), findsOneWidget);
    expect(find.text('Total Materials'), findsOneWidget);
    expect(find.text('Total Pieces'), findsOneWidget);
    expect(find.text('Weight'), findsOneWidget);
    expect(find.text('EN-D Raw Steel Bar'), findsOneWidget);
    expect(find.text('Mild Steel Rod'), findsOneWidget);
    expect(find.text('Stainless Steel Rod'), findsOneWidget);
    expect(find.text('Aluminium Bar Stock'), findsOneWidget);

    // Test search filtering
    final searchField = find.byType(TextField);
    expect(searchField, findsOneWidget);
    await tester.enterText(searchField, 'Aluminium');
    await tester.pumpAndSettle();

    expect(find.text('Aluminium Bar Stock'), findsOneWidget);
    expect(find.text('EN-D Raw Steel Bar'), findsNothing);
  });
}
