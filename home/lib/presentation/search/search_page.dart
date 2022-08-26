import 'package:design_system/atom/app_bar/regular_app_bar.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: RegularAppBar(
        onBackClick: () {
          Navigator.of(context).pop();
        },
        onSearchClick: (ee) {
          print(ee);
        },
      ),
      // body: ,
    );
  }
}
