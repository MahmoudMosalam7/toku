import 'package:toku/models/video_model.dart';

class Section {
  String sectionName;
  List<PickFile> videos;
  Section({required this.sectionName, required this.videos });
  @override
  String toString() {
    return 'Course{sectionName: $sectionName, videos: ${videos}}';
  }
}
