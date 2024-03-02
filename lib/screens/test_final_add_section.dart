import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toku/screens/s.dart';
import '../components/shared.dart';
import '../models/section_model.dart';
import '../models/video_model.dart';

class CourseCurriculum extends StatefulWidget {
  @override
  _CourseCurriculumState createState() => _CourseCurriculumState();
}

class _CourseCurriculumState extends State<CourseCurriculum> {
  final ImagePicker _imagePicker = ImagePicker();
  TextEditingController _sectionNameControllers = TextEditingController();
  TextEditingController _videoNameControllers = TextEditingController();
  @override
  void dispose() {
    for (var course in sections) {
      for (var video in course.videos) {
        video.videoController?.dispose();
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                  itemCount: sections.length,
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
                    sections[index].sectionName,
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
          PickFileAndVideo(index: index,),
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
                      sections[index].videos.add(PickFile(
                        fileName: '',
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
    PickFile video = sections[sectionIndex].videos[videoIndex];
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
                sections[sectionIndex].videos.add(PickFile(
                  fileName: '',
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
                  sections[sectionIndex].videos[videoIndex].fileName = value;
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

    setState(() {
      //_showUpSheet(context);
      showDialogg(index);
    });
  }

  void _deleteSection(int index) {
    setState(() {
      sections.removeAt(index);
    });
  }

  void _addSection() {
    setState(() {
      Section duplicatedCourse = Section(
        sectionName: 'Section ${sections.length + 1}',
        videos: [],
      );
      sections.add(duplicatedCourse);
    });
  }

  void _deleteVideo(int sectionIndex, int videoIndex) {
    setState(() {
      PickFile video = sections[sectionIndex].videos[videoIndex];
      video.videoController?.dispose();
      sections[sectionIndex].videos.removeAt(videoIndex);
    });
  }

  void _addVideo(int sectionIndex) {
    setState(() {
      sections[sectionIndex].videos.add(PickFile(
        fileName: 'file',
      ));
    });
  }

  void _editVideoName(int sectionIndex, int videoIndex) {
    // Implement video name editing logic here
    // For example, you can use a dialog or navigate to a new screen
    // to allow the user to edit the video name.
  }
void showDialogg(int index){
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          'Please Change Section Name!',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _sectionNameControllers,
              decoration: InputDecoration(
                hintText: 'Enter Section Name',
              ),
              onSubmitted: (value) {
                setState(() {
                  if(!value.isEmpty)
                    sections[index].sectionName = value;
                });
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 16.0), // Add some spacing if needed

          ],
        ),
      );
    },
  );
}
}
