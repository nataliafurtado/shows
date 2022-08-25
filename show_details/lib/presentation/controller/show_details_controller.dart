import 'package:entities/shows/entities/show.dart';
import 'package:state_management/state_manager_with_rx_not.dart';

enum HomePageState {
  loading,
  success,
  error,
}

class HomeController {
  // HomeController({
  //   // required this.getShowsUseCase,
  // });

  // final GetShowsUseCase getShowsUseCase;

  final shows = StateManagementWithRXNot<List<Show>>(
    [],
  );

  final showsLists = StateManagementWithRXNot<List<List<Show>>>(
    [],
  );

  final homePageState = StateManagementWithRXNot<HomePageState>(
    HomePageState.success,
  );
}
