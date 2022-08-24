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

  final shows = StateManagementWithRXNot<List<Show>>(
    [],
  );

  final showsLists = StateManagementWithRXNot<List<List<Show>>>(
    [],
  );

  final homePageState = StateManagementWithRXNot<HomePageState>(
    HomePageState.success,
  );

  init() async {
    try {
      homePageState.value = HomePageState.loading;
      await getShows2(1);
      await getShows2(2);
      await getShows2(3);
      homePageState.value = HomePageState.success;
    } catch (e) {
      homePageState.value = HomePageState.error;
    }
  }

  getShows(String url) async {
    try {
      homePageState.value = HomePageState.loading;
      await getShows2(4);
      homePageState.value = HomePageState.success;
    } catch (e) {
      homePageState.value = HomePageState.error;
    }
  }

  getShows2(int pageId) async {
    final shows = await getShowsUseCase(pageId: pageId);
    showsLists.value.add(shows);
  }

  changeToSuccessWidget() {
    homePageState.value = HomePageState.success;
  }
}
