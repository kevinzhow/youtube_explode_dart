import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

import 'closed_caption.dart';

part 'closed_caption_track.g.dart';

/// Track that contains closed captions in a specific language.
@JsonSerializable()
class ClosedCaptionTrack {
  /// Closed captions.
  final List<ClosedCaption> captions;

  /// Initializes an instance of [ClosedCaptionTrack].
  ClosedCaptionTrack(Iterable<ClosedCaption> captions)
      : captions = captions.toList();

  /// Gets the caption displayed at the specified point in time.
  /// Returns null if not found.
  ClosedCaption? getByTime(Duration time) =>
      captions.firstWhereOrNull((e) => time >= e.offset && time <= e.end);

  ///
  factory ClosedCaptionTrack.fromJson(Map<String, dynamic> json) =>
      _$ClosedCaptionTrackFromJson(json);

  ///
  Map<String, dynamic> toJson() => _$ClosedCaptionTrackToJson(this);
}
