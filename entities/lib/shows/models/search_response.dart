import 'package:entities/shows/models/show_response.dart';
import 'package:packages/exports.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse extends Equatable {
  final ShowResponse show;

  const SearchResponse({required this.show});

  @override
  List<Object?> get props => [show];

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
