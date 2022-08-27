import 'package:entities/shows/entities/season.dart';
import 'package:show_details/domain/use_cases/get_seasons_use_case.dart';
import 'package:state_management/state_manager_with_rx_not.dart';

enum SeasonsState {
  loading,
  success,
  error,
}

class ShowDetailsController {
  ShowDetailsController({
    required this.getSeasonsUseCase,
  });

  final GetSeasonsUseCase getSeasonsUseCase;

  final seasons = StateManagementWithRXNot<List<Season>>(
    [],
  );

  final seasonState = StateManagementWithRXNot<SeasonsState>(
    SeasonsState.success,
  );

  List<Season> get seasonsList => seasons.value;

  SeasonsState get getSeasonState => seasonState.value;
  int? idPassed;

  init({int? id}) async {
    try {
      if (id != null) {
        idPassed = id;
      }
      seasonState.value = SeasonsState.loading;
      seasons.value = await getSeasonsUseCase(id: id ?? idPassed!);
      seasonState.value = SeasonsState.success;
    } catch (e) {
      seasonState.value = SeasonsState.error;
    }
  }
}
