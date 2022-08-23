import 'package:entities/shows/show.dart';
import 'package:home/domain/use_cases/get_shows_use_case.dart';
import 'package:state_management/state_manager_with_rx_not.dart';

enum HomePageState {
  loading,
  success,
  error,
}

class HomeController {
  HomeController({
    required this.getShowsUseCase,
  });

  final GetShowsUseCase getShowsUseCase;

  final aliases = StateManagementWithRXNot<List<Show>>(
    [],
  );
  final homePageState = StateManagementWithRXNot<HomePageState>(
    HomePageState.success,
  );

  getShows(String url) async {
    try {
      homePageState.value = HomePageState.loading;
      final alias = await getShowsUseCase(pageId: 1);
      // aliases.value.add(alias);
      homePageState.value = HomePageState.success;
    } catch (e) {
      homePageState.value = HomePageState.error;
    }
  }

  changeToSuccessWidget() {
    homePageState.value = HomePageState.success;
  }
}
