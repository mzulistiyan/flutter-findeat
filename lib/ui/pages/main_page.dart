import 'package:flutter/material.dart';
import 'package:flutter_application_findeat/cubit/page_cubit.dart';
import 'package:flutter_application_findeat/ui/pages/home_page.dart';
import 'package:flutter_application_findeat/ui/pages/profile_page.dart';
import 'package:flutter_application_findeat/ui/pages/search_page.dart';
import 'package:flutter_application_findeat/ui/widget/custom_bottom_nav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return SearchPage();
          break;
        case 2:
          return ProfilePage();
          break;

        default:
          return HomePage();
      }
    }

    Widget CustomButtonNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(bottom: 30, left: 16, right: 16, top: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNav(
                index: 0,
                icon: Icon(Icons.home),
              ),
              CustomBottomNav(
                index: 1,
                icon: Icon(Icons.search),
              ),
              CustomBottomNav(
                index: 2,
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: Colors.blue,
          body: Stack(
            children: [
              buildContent(currentIndex),
              CustomButtonNavigation(),
            ],
          ),
        );
      },
    );
  }
}
