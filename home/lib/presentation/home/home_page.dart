import 'package:design_system/molecule/text_field_button_widget.dart';
import 'package:design_system/organism/lists/list_of_links_cards_widget.dart';
import 'package:design_system/organism/pages/error_page.dart';
import 'package:flutter/material.dart';
import 'package:design_system/theme_style.dart';
import 'package:design_system/atom/text/text_title_widget.dart';
import 'package:design_system/layout/loading_widget.dart';
import 'package:home/presentation/home/controller/home_controller.dart';
import 'package:home/utils/home_strings.dart';
import 'package:micro_app/micro_app.dart';
import 'package:state_management/state_manager_with_rx_not.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sp = ThemeStyle.themeType.spaceTypes();
    final controller = MicroApp.instanceManager.get<HomeController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeStyle.themeType.colorType().primary,
      ),
      body: StateManagementWithRXNotBuilder(
        builder: (ctx) {
          final pageState = controller.homePageState.value;

          final aliases = controller.aliases.value;
          if (pageState == HomePageState.error) {
            return ErrorPage(
              onClick: controller.changeToSuccessWidget,
            );
          }
          return LoadingWidget(
            isLoading: pageState == HomePageState.loading,
            child: Column(
              children: [
                SizedBox(height: sp.s14),
                TextFieldButtonWidget(
                  onButtonClick: controller.getShows,
                  hint: HomeStrings.enterUrl,
                ),
                SizedBox(height: sp.s12),
                TextTitleWidget(
                  text: HomeStrings.recentlyShortenedUrls,
                ),
                SizedBox(height: sp.s10),
                // ListOfLinkCardsWidget(
                //   aliases: aliases,
                // )
              ],
            ),
          );
        },
      ),
    );
  }
}
