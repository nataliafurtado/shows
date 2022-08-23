import 'package:packages/exports.dart';

part 'links.g.dart';

@JsonSerializable()
class Links extends Equatable {
  final String self;
  final String short;

  const Links({
    required this.self,
    required this.short,
  });

  @override
  List<Object?> get props => [
        self,
        short,
      ];

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}
