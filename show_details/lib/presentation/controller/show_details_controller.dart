import 'package:entities/shows/entities/season.dart';
import 'package:entities/shows/entities/show.dart';
import 'package:show_details/domain/use_cases/get_seasons_use_case.dart';
import 'package:state_management/state_manager_with_rx_not.dart';

enum HomePageState {
  loading,
  success,
  error,
}

class ShowDetailsController {
  ShowDetailsController({
    required this.getSeasonsUseCase,
  });

  final GetSeasonsUseCase getSeasonsUseCase;

  // final shows = StateManagementWithRXNot<List<Show>>(
  //   [],
  // );

  final seasons = StateManagementWithRXNot<List<Season>>(
    [],
  );

  List<Season> get seasonsList => seasons.value;

  final homePageState = StateManagementWithRXNot<HomePageState>(
    HomePageState.success,
  );

  init(int id) async {
    try {
      homePageState.value = HomePageState.loading;
      seasons.value = await getSeasonsUseCase(id: id);

      homePageState.value = HomePageState.success;
    } catch (e) {
      homePageState.value = HomePageState.error;
    }
  }
}
