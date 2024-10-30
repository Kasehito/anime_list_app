import 'package:anime_list_app/controller/responsive_controller.dart';
import 'package:anime_list_app/layout/discover/discover_mobile.dart';
import 'package:anime_list_app/layout/discover/discover_tablet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiscoverPage extends StatelessWidget {
  DiscoverPage({super.key});

  final ResponsiveController responsiveController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        responsiveController.setScreenWidth(constraints.maxWidth);
        if (responsiveController.isTablet()) {
          return const DiscoverTablet();
        } else {
          return const DiscoverMobile();
        }
      },
    ));
  }
}
