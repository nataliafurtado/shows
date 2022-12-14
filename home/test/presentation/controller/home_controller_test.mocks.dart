// Mocks generated by Mockito 5.2.0 from annotations
// in home/test/presentation/controller/home_controller_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:entities/shows/entities/show.dart' as _i5;
import 'package:home/domain/use_cases/get_shows_use_case.dart' as _i3;
import 'package:home/infrastructure/data_sources/get_shows_data_source.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeGetShowsDataSource_0 extends _i1.Fake
    implements _i2.GetShowsDataSource {}

/// A class which mocks [GetShowsUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetShowsUseCase extends _i1.Mock implements _i3.GetShowsUseCase {
  MockGetShowsUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetShowsDataSource get getShowsDataSource =>
      (super.noSuchMethod(Invocation.getter(#getShowsDataSource),
          returnValue: _FakeGetShowsDataSource_0()) as _i2.GetShowsDataSource);
  @override
  _i4.Future<List<_i5.Show>> call({int? pageId}) =>
      (super.noSuchMethod(Invocation.method(#call, [], {#pageId: pageId}),
              returnValue: Future<List<_i5.Show>>.value(<_i5.Show>[]))
          as _i4.Future<List<_i5.Show>>);
}
