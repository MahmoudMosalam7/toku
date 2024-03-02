import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class Course {
  String sectionName;
  List<Video> videos;

  Course({required this.sectionName, required this.videos});
}

class Video {
  String videoName;
  File? videoFile;
  VideoPlayerController? videoController;

  Video({required this.videoName, this.videoFile}) {
    if (videoFile != null) {
      videoController = VideoPlayerController.file(videoFile!);
    }
  }
}

class DynamicTextFields extends StatefulWidget {
  @override
  _DynamicTextFieldsState createState() => _DynamicTextFieldsState();
}

class _DynamicTextFieldsState extends State<DynamicTextFields> {
  List<Course> courses = [];
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void dispose() {
    for (var course in courses) {
      for (var video in course.videos) {
        video.videoController?.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: courses.length,
                  itemBuilder: (context,index){
                    return _buildSectionContainer(index);
                  }),
              ElevatedButton(
                onPressed: () {
                  _addSection();
                },
                child: Text('Add Section'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionContainer(int index) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      _editSectionName(index);
                    },
                  ),
                  Text(
                    courses[index].sectionName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  _deleteSection(index);
                },
              ),
            ],
          ),
          SizedBox(height: 16.0),
          _buildVideoButton(index),
          for (int videoIndex = 0;
          videoIndex < courses[index].videos.length;
          videoIndex++)
            _buildVideoField(index, videoIndex),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _buildVideoButton(int index) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Videos ${index + 1}'),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  _editSectionName(index);
                },
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () async {
                  File? videoFile = await _pickVideo();
                  if (videoFile != null) {
                    setState(() {
                      courses[index].videos.add(Video(
                        videoName: '',
                        videoFile: videoFile,
                      ));
                    });
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {

                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVideoField(int sectionIndex, int videoIndex) {
    Video video = courses[sectionIndex].videos[videoIndex];
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            _editVideoName(sectionIndex, videoIndex);
          },
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () async {
            File? videoFile = await _pickVideo();
            if (videoFile != null) {
              setState(() {
                courses[sectionIndex].videos.add(Video(
                  videoName: '',
                  videoFile: videoFile,
                ));
              });
            }
          },
        ),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _deleteVideo(sectionIndex, videoIndex);
          },
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  courses[sectionIndex].videos[videoIndex].videoName = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter video name',
                suffixIcon: null,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<File?> _pickVideo() async {
    final pickedFile =
    await _imagePicker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  void _editSectionName(int index) {
    // Implement section name editing logic here
    // For example, you can use a dialog or navigate to a new screen
    // to allow the user to edit the section name.
  }

  void _deleteSection(int index) {
    setState(() {
      courses.removeAt(index);
    });
  }

  void _addSection() {
    setState(() {
      Course duplicatedCourse = Course(
        sectionName: 'Section ${courses.length + 1}',
        videos: [],
      );
      courses.add(duplicatedCourse);
    });
  }

  void _deleteVideo(int sectionIndex, int videoIndex) {
    setState(() {
      Video video = courses[sectionIndex].videos[videoIndex];
      video.videoController?.dispose();
      courses[sectionIndex].videos.removeAt(videoIndex);
    });
  }

  void _addVideo(int sectionIndex) {
    setState(() {
      courses[sectionIndex].videos.add(Video(
        videoName: '',
      ));
    });
  }

  void _editVideoName(int sectionIndex, int videoIndex) {
    // Implement video name editing logic here
    // For example, you can use a dialog or navigate to a new screen
    // to allow the user to edit the video name.
  }
}
