import 'package:entities/shows/entities/season.dart';
import 'package:show_details/domain/use_cases/get_seasons_use_case.dart';
import 'package:state_management/state_manager_with_rx_not.dart';

class ShowDetailsController {
  ShowDetailsController({
    required this.getSeasonsUseCase,
  });

  final GetSeasonsUseCase getSeasonsUseCase;

  final seasons = StateManagementWithRXNot<List<Season>>(
    [],
  );

  List<Season> get seasonsList => seasons.value;

  init(int id) async {
    seasons.value = await getSeasonsUseCase(id: id);
  }
}
