import 'package:entities/shows/show.dart';
import 'package:home/domain/use_cases/get_shows_use_case.dart';
import 'package:state_management/state_manager_with_rx_not.dart';
import 'package:home/domain/exceptions/get_shows_exceptions.dart';

enum HomePageState {
  loading,
  success,
  error,
}

enum ListPaginationState {
  regular,
  error,
  loading,
  finish,
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

  final listPaginationState = StateManagementWithRXNot<ListPaginationState>(
    ListPaginationState.regular,
  );

  int get getShowListsLength => showsLists.value.length;

  ListPaginationState get getListPaginationState => listPaginationState.value;

  int lastId = 0;

  init() async {
    try {
      homePageState.value = HomePageState.loading;
      await getShows(pageId: 0);
      await getShows(pageId: 1);
      await getShows(pageId: 2);
      homePageState.value = HomePageState.success;
    } catch (e) {
      homePageState.value = HomePageState.error;
    }
  }

  List<Show> getShowList(int index, int page) {
    final length = showsLists.value[index].length;
    int quantityToLoad = page * 10;
    if (quantityToLoad >= length) {
      quantityToLoad = length;
    }
    return showsLists.value[index].getRange(0, quantityToLoad).toList();
  }

  loadNextPage() async {
    try {
      listPaginationState.value = ListPaginationState.loading;
      await getShows();
      listPaginationState.value = ListPaginationState.regular;
    } on FinishPaginationOfGetShows {
      listPaginationState.value = ListPaginationState.finish;
    } catch (e) {
      listPaginationState.value = ListPaginationState.error;
    }
  }

  getShows({int? pageId}) async {
    final shows = await getShowsUseCase(
      pageId: pageId ?? getNextPage(),
    );
    showsLists.value.add(shows);
    lastId = shows.last.id;
  }

  int getNextPage() {
    final lastPage = lastId / 250;
    return lastPage.round() + 1;
  }
}
