import 'package:equatable/equatable.dart';

// class ImageData extends Equatable {
//   final String coverUrl;

//   const ImageData({
//     this.coverUrl,
//   });

//   factory ImageData.fromJson(Map<String, dynamic> json) {
//     return ImageData(
//       coverUrl: json['cover_url'] as String,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'cover_url': coverUrl,
//     };
//   }

//   ImageData copyWith({
//     String coverUrl,
//   }) {
//     return ImageData(
//       coverUrl: coverUrl ?? this.coverUrl,
//     );
//   }

//   @override
//   bool get stringify => true;

//   @override
//   List<Object> get props => [coverUrl];
// }
class ImageData {
  final String coverUrl;

  ImageData(this.coverUrl);
}
