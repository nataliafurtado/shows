import 'package:home/presentation/home/home_page.dart';
import 'package:home/presentation/search/search_page.dart';

final homeRoutes = <String, Function(dynamic context, Object? args)>{
  '/': (ctx, args) => const HomePage(),
  '/search_page': (ctx, args) => const SearchPage(),
};
