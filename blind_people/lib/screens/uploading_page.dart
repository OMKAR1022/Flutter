import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../model/image_model.dart';

class Uploading extends StatefulWidget {
  const Uploading({Key? key});

  @override
  State<Uploading> createState() => _UploadingState();
}

class _UploadingState extends State<Uploading> {
  File? imageFile;
  String? selectedGender; // Initialize with null or a default value
  List<String> genderOptions = ["Male", "Female", "Other"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Upload Example'),

      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              if (imageFile != null)
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => _showPopUp(context),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(imageFile!),
                        ),
                      ),
                    ))
              else
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () => _showPopUp(context),
                        child: CircleAvatar(
                          radius: 50,
                        ),
                      ),
                    )),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Name", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Relation", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: "Age", border: OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: "Gender",
                    border: OutlineInputBorder(),
                  ),
                  value: selectedGender,
                  items: genderOptions.map((gender) {
                    return DropdownMenuItem(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: () {},

                    child: Text('Add Member')),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }

  void _showPopUp(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Profile Iamge'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => getImage(source: ImageSource.camera),
                child: Text('Camera'),
              ),
              ElevatedButton(
                onPressed: () => getImage(source: ImageSource.gallery),
                child: Text('Gallery'),
              ),
            ],
          ),
        );
      },
    );
  }
}
