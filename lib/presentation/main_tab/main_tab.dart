import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../common/controller/main_tab_controller.dart';
import 'tabs/cart_tab.dart';
import 'tabs/home_tab.dart';
import 'tabs/menu_tab.dart';
import 'tabs/profile_tab.dart';
import 'tabs/search_tab.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      floatingActionButton: Container(
        height: 7.h,
        width: 7.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.5.h),
          gradient: const LinearGradient(
            colors: [Color(0xFFFF9472), Color(0xFFF2709C)],
          ),
        ),
        child: FloatingActionButton(
          isExtended: true,
          elevation: 0,
          onPressed: () => mainController.changeTab(4),
          child: Icon(
            FontAwesomeIcons.search,
            size: 18.sp,
          ),
          backgroundColor: Colors.transparent,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Obx(() => Icon(
                    FontAwesomeIcons.home,
                    size: 18.sp,
                    color: mainController.currentIndex.value == 0
                        ? const Color(0xFFFF679B)
                        : const Color(0xFF6E7FAA),
                  )),
              onPressed: () => mainController.changeTab(0),
            ),
            IconButton(
              icon: Obx(() => Icon(
                    FontAwesomeIcons.thLarge,
                    size: 18.sp,
                    color: mainController.currentIndex.value == 1
                        ? const Color(0xFFFF679B)
                        : const Color(0xFF6E7FAA),
                  )),
              onPressed: () => mainController.changeTab(1),
            ),
            IconButton(
              icon: Obx(() => Icon(
                    FontAwesomeIcons.shoppingCart,
                    size: 18.sp,
                    color: mainController.currentIndex.value == 2
                        ? const Color(0xFFFF679B)
                        : const Color(0xFF6E7FAA),
                  )),
              onPressed: () => mainController.changeTab(2),
            ),
            IconButton(
              icon: Obx(() => Icon(
                    FontAwesomeIcons.solidUser,
                    size: 18.sp,
                    color: mainController.currentIndex.value == 3
                        ? const Color(0xFFFF679B)
                        : const Color(0xFF6E7FAA),
                  )),
              onPressed: () => mainController.changeTab(3),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    List<Widget> pages = [
      HomeTab(),
      const MenuTab(),
      const CartTab(),
      const ProfileTab(),
      const SearchTab(),
    ];
    return Obx(() => IndexedStack(
          index: mainController.currentIndex.value,
          children: pages,
        ));
  }
}
