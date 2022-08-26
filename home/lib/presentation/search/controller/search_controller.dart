import 'package:entities/shows/entities/show.dart';
import 'package:home/domain/use_cases/search_shows_use_case.dart';
import 'package:state_management/state_manager_with_rx_not.dart';

enum SearchPageState {
  loading,
  success,
  error,
}

class SearchController {
  SearchController({
    required this.searchShowsUseCase,
  });

  final SearchShowsUseCase searchShowsUseCase;

  final shows = StateManagementWithRXNot<List<Show>>(
    [],
  );

  final searchPageState = StateManagementWithRXNot<SearchPageState>(
    SearchPageState.loading,
  );

  // int get getShowListsLength => showsLists.value.length;

  // ListPaginationState get getListPaginationState => listPaginationState.value;

  searchShow(String query) async {
    try {
      searchPageState.value = SearchPageState.loading;
      shows.value = await searchShowsUseCase(query: query);
      searchPageState.value = SearchPageState.success;
    } catch (e) {
      searchPageState.value = SearchPageState.error;
    }
  }
}
