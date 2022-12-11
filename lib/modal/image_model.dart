import 'package:json_annotation/json_annotation.dart';
part 'image_model.g.dart';

@JsonSerializable()
class pixelforimage {
  String id;
  String filename;
  String? title;

  @JsonKey(name: 'url_full_size')
  String urlFullSize;
  @JsonKey(name: 'url_small_size')
  String urlSmallSize;

  pixelforimage(
      {this.title,
      required this.id,
      required this.filename,
      required this.urlFullSize,
      required this.urlSmallSize});

  factory pixelforimage.fromJson(Map<String, dynamic> json) =>
      _$pixelforimageFromJson(json);

  /// Connect the generated [_$pixelforimageToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$pixelforimageToJson(this);
}
