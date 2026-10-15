import 'package:flutter/material.dart';
import '../App_Style/App_Screen_Style.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onProfileTap;
  final VoidCallback? onMenuTap;
  final String? title;
  final bool showBackButton;
  final VoidCallback? onBackTap;
  final bool showMenuButton;
  final bool centerTitle;

  const CustomHeader({
    super.key,
    this.onProfileTap,
    this.onMenuTap,
    this.title,
    this.showBackButton = false,
    this.onBackTap,
    this.showMenuButton = true,
    this.centerTitle = false,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryNavy,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 60.0,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              // 👈 1. Left: Back Button or Profile Icon
              if (showBackButton)
                IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.accentOrange,
                    size: 22,
                  ),
                  onPressed: onBackTap ??
                      () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                )
              else
                GestureDetector(
                  onTap: onProfileTap ?? () {},
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: AppStyles.headerProfileIconDecoration,
                    child: const Center(
                      child: Icon(
                        Icons.person,
                        color: AppColors.accentOrange,
                        size: 24,
                      ),
                    ),
                  ),
                ),

              const SizedBox(width: 14),

              // 👈 2. Title (if present)
              if (title != null)
                Expanded(
                  child: Text(
                    title!,
                    textAlign: centerTitle ? TextAlign.center : TextAlign.left,
                    style: AppTextStyles.headerBarTitle,
                  ),
                )
              else
                const Spacer(),

              // 👈 3. Right Hamburger Menu Icon or Spacer
              if (showMenuButton)
                IconButton(
                  onPressed: onMenuTap ?? () {},
                  icon: const Icon(
                    Icons.menu,
                    color: AppColors.accentOrange,
                    size: 32,
                  ),
                )
              else if (showBackButton && centerTitle)
                const SizedBox(width: 24)
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}