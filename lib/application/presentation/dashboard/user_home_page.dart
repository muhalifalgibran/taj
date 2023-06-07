import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taj/application/infrastructure/home/datasource/surah_remote_data_source.dart';
import 'package:taj/core/di/service_locator.dart';
import 'package:taj/core/utils/app_colors.dart';
import 'package:taj/application/presentation/widgets/text_marquee.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  void initState() {
    getIt<SurahRemoteDataSource>().getSurah();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Wrap(
          alignment: WrapAlignment.start,
          direction: Axis.vertical,
          children: [
            SizedBox(
              height: 36,
              width: MediaQuery.of(context).size.width - 40,
              child: Row(
                children: [
                  Icon(
                    Icons.clear_all,
                    size: 36,
                    color: AppColors.blackLite,
                  ),
                  const SizedBox(width: 36),
                  TextMarquee(
                    text: 'Taj App',
                    isRepeat: false,
                    delayed: const Duration(seconds: 1),
                    textStyle: GoogleFonts.openSans(
                      color: AppColors.redLite,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.search,
                    size: 36,
                    color: AppColors.blackLite,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '..',
              style: GoogleFonts.openSans(
                color: AppColors.blackLite,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'Alif Al Gibran',
              style: GoogleFonts.openSans(
                color: AppColors.brownLite,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 2.0, color: AppColors.greyLite),
                ),
              ),
              width: MediaQuery.of(context).size.width - 40,
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                  indicatorColor: AppColors.redLite,
                  labelColor: AppColors.redLite,
                  labelStyle: GoogleFonts.openSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: const [
                    Tab(text: 'Surah'),
                    Tab(text: 'Juz'),
                    Tab(text: 'Surah'),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
