import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taj/core/utils/app_colors.dart';
import 'package:taj/feature/widgets/text_marquee.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TabItem> tabItems = List.of([
    TabItem(
      Icons.home,
      "Home",
      AppColors.redLite,
      labelStyle: GoogleFonts.openSans(
        fontWeight: FontWeight.bold,
      ),
    ),
    TabItem(
      Icons.layers,
      "Reports",
      Colors.amber,
      labelStyle: GoogleFonts.openSans(
        fontWeight: FontWeight.bold,
      ),
    ),
  ]);

  int selectedPos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Align(
              alignment: const Alignment(0, -0.80),
              child: Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 12),
                    Text(
                      'Welcome to',
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
              ),
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  late CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(selectedPos);
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      selectedPos: selectedPos,
      controller: _navigationController,
      selectedCallback: (selectedPos) {
        setState(() {
          this.selectedPos = selectedPos ?? 0;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
