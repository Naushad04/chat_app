import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class ImagePickerController extends GetxController{

  File? _userImagePath;
  File? get userImagePath => _userImagePath;
  String? userImageName;
  Future<void> vehicleImageImagePicker() async{
    var imagePick = await FilePicker.platform.pickFiles(type: FileType.image);
    if(imagePick != null){
      _userImagePath = File(imagePick.files.single.path!);
      userImageName = imagePick.files.single.name;
    }
    update();
  }

}