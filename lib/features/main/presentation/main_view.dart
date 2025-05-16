import 'package:fitted/config/assets/icons.dart';
import 'package:fitted/config/colors/colors.dart';
import 'package:fitted/config/helper/image_provider/fitted_image_provider.dart';
import 'package:fitted/features/home/presentation/screens/home_view.dart';
import 'package:fitted/features/measurement/presentation/screen/measurement_view.dart';
import 'package:fitted/features/profile/presentation/screens/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeView(),
    HomeView(),
    MeasurementView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      floatingActionButton: CustomBottomNavBar(
        index: selectedIndex,
        onTabSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  CustomBottomNavBar(
      {super.key, required this.index, required this.onTabSelected});
  final int index;
  final ValueChanged<int> onTabSelected;
  final List<Map<String, String>> _icons = [
    {
      "icon": AppVectors.home,
      "iconActive": AppVectors.homeActive,
    },
    {
      "icon": AppVectors.apparel,
      "iconActive": AppVectors.apparelActive,
    },
    {
      "icon": AppVectors.measurement,
      "iconActive": AppVectors.measurementActive,
    },
    {
      "icon": AppVectors.settings,
      "iconActive": AppVectors.settingsActive,
    }
  ];

  final List<String> _labels = ["Home", "Apparel", "Measurements", "Settings"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_icons.length, (_index) {
          final isSelected = index == _index;

          return GestureDetector(
            onTap: () => onTabSelected(_index),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 16 : 0, vertical: 10),
              decoration: BoxDecoration(
                color:
                    isSelected ? AppColors.orangePrimary : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  FittedImageProvider.localSvg(
                    imagePath: _icons[_index]
                        [isSelected ? "iconActive" : "icon"]!,
                  ),
                  if (isSelected) ...[
                    SizedBox(width: 8),
                    Text(
                      _labels[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
