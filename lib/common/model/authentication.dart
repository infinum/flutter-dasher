import 'package:json_annotation/json_annotation.dart';

part 'authentication.g.dart';

@JsonSerializable()
class Authentication {
  Authentication({
    required this.authorizationToken,
  });

  factory Authentication.fromJson(Map<String, dynamic> json) => _$AuthenticationFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationToJson(this);

  @JsonKey(name: 'token')
  final String authorizationToken;
}
