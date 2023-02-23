
import 'dart:io';
import 'package:clothes/CustomColors.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageCapture extends StatefulWidget {
  ImageCapture(Key key) : super(key: key);
  @override
  createState() => ImageCaptureState();
}

class ImageCaptureState extends State<ImageCapture> {
  /// Active image file
  File? imageFile;

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
    });

  }

  /// Remove image
  void _clear() {
    setState(() => imageFile = null);
  }

  Widget _getWidget() {
    if (imageFile != null) {
      return Container(
        height: 170,
        width: 170,
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(40,0,0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Container(
              height: 170,
              width: 170,
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