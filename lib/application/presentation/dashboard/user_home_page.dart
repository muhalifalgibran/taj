import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taj/core/utils/app_colors.dart';
import 'package:taj/feature/widgets/text_marquee.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        alignment: WrapAlignment.start,
        direction: Axis.vertical,
        children: [
          Text(
            'Selamat datang di',
            style: GoogleFonts.openSans(
              color: AppColors.blackLite,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 4),
          TextMarquee(
            text: 'TAJ.',
            isRepeat: false,
            delayed: const Duration(seconds: 1),
            textStyle: GoogleFonts.openSans(
              color: AppColors.redLite,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
