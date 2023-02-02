import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:house_rent/components/search_page.dart';
// import 'package:flutter/components/search_page.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final bottomBarItem = [
    'home',
    'search',
    'premium',
    'feed',
    'user_account'
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ]),
      child: InkWell(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:  bottomBarItem
                .map((e) => SvgPicture.asset(
                      'assets/icons/$e.svg',
                      color: Theme.of(context).primaryColor,
                    ))
                .toList(),

        ),
        onTap: () {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) {
    return SearchPage();
        }));
          }
      ),

    );
  }
}
