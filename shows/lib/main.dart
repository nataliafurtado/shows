import 'package:flutter/material.dart';
import 'package:shows/theme/shows_theme.dart';
import 'package:shows/utils/page_rout_builder_wrapper.dart';
import 'package:shows/utils/register_dependencies.dart';
import 'package:shows/utils/routes.dart';
import 'package:design_system/theme_style.dart';
import 'package:packages/exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeStyle(ShowsTheme());
  await registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildTheme(Brightness.light),
      title: '',
      onGenerateRoute: (settings) {
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (ctx, _, __) {
            return PageRouteBuilderWrapper(
              routes[settings.name]!(
                ctx,
                settings.arguments,
              ),
              settings.name!,
            );
          },
        );
      },
      initialRoute: '/',
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);
    return baseTheme.copyWith(
      textTheme: GoogleFonts.workSansTextTheme(),
    );
  }
}
