import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quizlee/features/base_nav/widgets/nav_bar_widget.dart';
import 'package:quizlee/features/home/views/home_view.dart';
import 'package:quizlee/theme/palette.dart';

class BaseNavWrapper extends ConsumerStatefulWidget {
  const BaseNavWrapper({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseNavWrapperState();
}

class _BaseNavWrapperState extends ConsumerState<BaseNavWrapper> {
  List<Widget> pages = const [
    HomeView(),
    Center(
      child: Text('Leaderboards'),
    ),
    Center(
      child: Text('Account'),
    ),
  ];

  final ValueNotifier<int> _page = ValueNotifier(0);

  @override
  void dispose() {
    _page.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // pages
      body: ValueListenableBuilder(
        valueListenable: _page,
        builder: (context, value, child) => pages[_page.value],
      ),

      // nav bar
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _page,
        builder: (context, value, child) => Material(
          elevation: 5,
          // nav bar content
          child: Container(
            color: Pallete.upcomingblue,
            padding: EdgeInsets.only(top: 8.h, left: 17.w, right: 17.w),
            height: 90.h,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //! Home
                NavBarWidget(
                  onTap: () => _page.value = 0,
                  icon: 'home',
                  label: 'Home',
                  color: _page.value == 0 ? Pallete.buttonBlue : null,
                  textColor: _page.value == 0 ? Pallete.textWhite : null,
                ),

                //! Leaderboards
                NavBarWidget(
                  onTap: () => _page.value = 1,
                  icon: 'leaderboard',
                  label: 'Leaderboard',
                  color: _page.value == 1 ? Pallete.buttonBlue : null,
                  textColor: _page.value == 1 ? Pallete.textWhite : null,
                ),

                //! Account
                NavBarWidget(
                  onTap: () => _page.value = 2,
                  icon: 'account',
                  label: 'Account',
                  color: _page.value == 2 ? Pallete.buttonBlue : null,
                  textColor: _page.value == 2 ? Pallete.textWhite : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
