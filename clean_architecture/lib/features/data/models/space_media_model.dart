import 'package:clean_architecture/features/domain/entities/space_media_entity.dart';

// ignore: must_be_immutable
class SpaceMediaModel extends SpaceMediaEntity {
  late String copyright;
  late String date;
  late String explanation;
  late String hdurl;
  late String mediaType;
  late String serviceVersion;
  late String title;
  late String url;

  SpaceMediaModel(
      {required this.copyright,
      required this.date,
      required this.explanation,
      required this.hdurl,
      required this.mediaType,
      required this.serviceVersion,
      required this.title,
      required this.url})
      : super(
            copyright: copyright,
            date: date,
            explanation: explanation,
            hdurl: hdurl,
            mediaType: mediaType,
            serviceVersion: serviceVersion,
            title: title,
            url: url);

  factory SpaceMediaModel.fromJson(Map<String, dynamic> json) {
    return SpaceMediaModel(
      copyright: json['copyright'],
      date: json['date'],
      explanation: json['explanation'],
      hdurl: json['hdurl'],
      mediaType: json['media_type'],
      serviceVersion: json['service_version'],
      title: json['title'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['copyright'] = this.copyright;
    data['date'] = this.date;
    data['explanation'] = this.explanation;
    data['hdurl'] = this.hdurl;
    data['media_type'] = this.mediaType;
    data['service_version'] = this.serviceVersion;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}














//   SpaceMediaModel({
//     required late String copyright,
//     required late String date,
//     required late String explanation,
//     required late String hdurl,
//     required late String mediaType,
//     required late String serviceVersion,
//     required late String title,
//     required late String url,
//   }) : super(
//             copyright: copyright,
//             date: date,
//             explanation: explanation,
//             hdurl: hdurl,
//             mediaType: mediaType,
//             serviceVersion: serviceVersion,
//             title: title,
//             url: url);