
import 'dart:io';
import 'package:clothes/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageCapture extends StatefulWidget {
  String? path;
  ImageCapture(Key key, {this.path}) : super(key: key);
  @override
  createState() => ImageCaptureState(path);
}

class ImageCaptureState extends State<ImageCapture> {
  String? path;
  ImageCaptureState(this.path);
  /// Active image file
  File? imageFile;

  void SetImage(String path) {
    imageFile = File(path);
  }

  void Clear() {
    setState(() {
      imageFile = null;
    });
  }

  Future<String> SaveImage(String name) async {
    final imageFile = this.imageFile;
    if(imageFile != null) {
      final String path = await getApplicationDocumentsDirectory().then((value) => value.path);
      final String fileName = name;
      final String fileExtension = extension(imageFile.path);
      var savedFile = await imageFile!.copy('$path/$fileName$fileExtension');
      return savedFile.path;
    }
    return "";
  }
  /// Cropper plugin
  Future<void> _cropImage() async {
    File? cropped = await ImageCropper().cropImage(
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        sourcePath: imageFile!.path,
        androidUiSettings: AndroidUiSettings(

            toolbarColor: CustomColors.light_coffee_clr,
            backgroundColor: CustomColors.light_coffee_tint,
            toolbarWidgetColor: CustomColors.dark_brown_tint,
            activeControlsWidgetColor: CustomColors.dark_brown_tint,
            statusBarColor: CustomColors.light_coffee_clr,
            dimmedLayerColor: CustomColors.light_coffee_tint,
            cropFrameColor: CustomColors.light_coffee_clr,
            toolbarTitle: 'Кадрирование'
        ),
    );

    setState(() {
      if (cropped != null) {
        imageFile = cropped;
      }
    });
  }

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    File selected = File((await ImagePicker().getImage(source: source))!.path);

    setState(() {
      imageFile = selected;
      print(imageFile?.path);
    });

  }

  /// Remove image
  void _clear() {
    setState(() => imageFile = null);
  }

  Widget _getWidget() {
    if (imageFile != null) {
      return Container(
        height: 130,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.0),
          image: DecorationImage(image: FileImage(imageFile!),
              fit: BoxFit.cover
          ),
        ),
          child: GestureDetector(
            onTap: () {
              _pickImage(ImageSource.gallery);
            },
          ),
      );
    } else {
      return Container(
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (path != null && imageFile == null) {
      SetImage(path!);
    }
    return Padding(
      padding: const EdgeInsets.fromLTRB(40,0,0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Container(
              height: 130,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: CustomColors.dark_brown_tint2,width: 2.5, ),
              ),
              child: _getWidget(),

            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: GestureDetector(
                  onTap: () {
                    if (imageFile != null) {
                      _cropImage();
                    }
                  },
                  child: Icon(Icons.crop_rounded,color: CustomColors.dark_brown_tint2, size: 30,),
                ),
              ),
              SizedBox(height: 50,),
              Container(
                child: GestureDetector(
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                  },
                  child: Icon(Icons.image_search, color: CustomColors.dark_brown_tint2, size: 30,),
                ),
              )
            ],
          ),
          SizedBox(width: 5,),

        ],
      ),
    );
  }
}