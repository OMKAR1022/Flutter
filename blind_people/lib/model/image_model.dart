import 'dart:io';
import 'package:flutter/foundation.dart';

class ImageModel with ChangeNotifier {
  File? imageFile;

  void setImage(File? file) {
    imageFile = file;
    notifyListeners(); // Notify listeners of the change
  }
}
