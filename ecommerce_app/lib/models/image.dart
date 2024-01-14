import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageControler extends GetxController {
  PickedFile? _pickedFile;
  PickedFile? get pickedFile => _pickedFile;
  final _picker = ImagePicker();
  Future<void> pickImage() async {
    _pickedFile = (await _picker.pickImage(source: ImageSource.gallery)) as PickedFile?;
  }
}
