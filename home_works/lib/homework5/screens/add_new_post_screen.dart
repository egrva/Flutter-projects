import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_works/homework5/stores/posts_store.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as dartpath;
import 'package:path_provider/path_provider.dart';

class AddNewPostScreen extends StatefulWidget {
  final PostsStore postsStore;

  const AddNewPostScreen({Key? key, required this.postsStore}) : super(key: key);

  @override
  _AddNewPostScreenState createState() => _AddNewPostScreenState();
}

class _AddNewPostScreenState extends State<AddNewPostScreen> {
  final _textController = TextEditingController();
  PickedFile? pickedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new post"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: buildImageOrButtonWidget(),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                )
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: OutlinedButton(
              onPressed: () async {
                if (pickedFile != null) {
                  File tmpFile = File(pickedFile!.path);
                  final Directory directory = await getApplicationDocumentsDirectory();
                  final String path = directory.path;
                  final String fileName = dartpath.basename(pickedFile!.path);
                  final String fileExtension = dartpath.extension(pickedFile!.path);
                  tmpFile = await tmpFile.copy('$path/$fileName$fileExtension');
                  widget.postsStore.addPost(tmpFile.path, _textController.text);
                  Navigator.pop(context);
                }
              },
              child: const Text("Continue"),
            ),
          )
        ],
      ),
    );
  }

  Widget buildImageOrButtonWidget() {
    if (pickedFile == null) {
      return GestureDetector(
        onTap: () {
          chooseImage();
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey)),
          child: ClipRRect(
            child: Container(
                width: 300,
                height: 300,
                child: const Icon(Icons.add, color: Colors.black)),
          ),
        ),
      );
    } else {
      return Image.file(
        File(pickedFile!.path),
        width: 300,
        height: 300,
      );
    }
  }

  getFromGallery() async {
    PickedFile? pickedFile =
    await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        this.pickedFile = pickedFile;
      });
    }
  }

  getFromCamera() async {
    PickedFile? pickedFile =
    await ImagePicker().getImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        this.pickedFile = pickedFile;
      });
    }
  }

  chooseImage() async {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Choose source'),
        content: const Text(
            'Gallery or camera?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              getFromGallery();
            },
            child: const Text('Gallery'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              getFromCamera();
            },
            child: const Text('Camera'),
          ),
        ],
      ),
    );
  }
}
