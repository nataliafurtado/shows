import 'package:entities/shows/entities/show.dart';
import 'package:home/domain/use_cases/search_shows_use_case.dart';
import 'package:state_management/state_manager_with_rx_not.dart';

enum SearchPageState {
  loading,
  success,
  error,
  initial,
  noShowsWereFound,
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
    SearchPageState.initial,
  );

  int get getShowListLength => shows.value.length;

  List<Show> get getShowLists => shows.value;

  SearchPageState get getSearchPageState => searchPageState.value;

  searchShow(String query) async {
    try {
      searchPageState.value = SearchPageState.loading;
      shows.value = await searchShowsUseCase(query: query);

      if (shows.value.isEmpty) {
        searchPageState.value = SearchPageState.noShowsWereFound;
      } else {
        searchPageState.value = SearchPageState.success;
      }
    } catch (e) {
      searchPageState.value = SearchPageState.error;
    }
  }

  cleanSearch() async {
    shows.value = [];
    searchPageState.value = SearchPageState.success;
  }
}
