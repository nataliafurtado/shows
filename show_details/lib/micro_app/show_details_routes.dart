import 'package:entities/shows/show.dart';
import 'package:show_details/presentation/show_details_page.dart';

final showDetailsRoutes = <String, Function(dynamic context, Object? args)>{
  '/show_details_page': (ctx, args) => ShowDetailsPage(
        show: args as Show,
      ),
};
