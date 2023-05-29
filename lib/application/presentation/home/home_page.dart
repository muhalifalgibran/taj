import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taj/core/utils/app_colors.dart';
import 'package:taj/application/presentation/dashboard/user_home_page.dart';
import 'package:taj/application/presentation/report/report_page.dart';
import 'package:taj/application/presentation/widgets/text_marquee.dart';

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

  final List<Widget> _contents = const [UserHomePage(), ReportPage()];

  int _selectedPos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Align(
                alignment: const Alignment(-1, -0.8),
                child: IndexedStack(
                  index: _selectedPos,
                  children: _contents,
                )),
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
    _navigationController = CircularBottomNavigationController(_selectedPos);
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      selectedPos: _selectedPos,
      controller: _navigationController,
      selectedCallback: (selectedPos) {
        setState(() {
          this._selectedPos = selectedPos ?? 0;
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
