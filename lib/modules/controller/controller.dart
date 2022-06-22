import 'dart:developer';
import 'package:admin_app/model/user_data_model.dart';
import 'package:admin_app/modules/firestorerepository/firebase_repository.dart';
import 'package:admin_app/modules/firestorerepository/firebase_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class Controller extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  // TextEditingController fileNameController = TextEditingController();
  // TextEditingController controller = TextEditingController();
  Firestore firestoreRepository = Firestore();
  RxBool isLoader = false.obs;
  RxList<UserDataModel> dataList = <UserDataModel>[].obs;
  RxString? imagePath = "".obs;
  // RxString uploadedUrl = ''.obs;
  Map imageProfile = {};
  ImagePicker pick = ImagePicker();
  XFile? imageFile;
  // FilePickerResult? result;
  // final aWSBucketName = 'addMin-dev-s3';
  // final awsUrl = 'https://addMin-dev-s3.s3.us-west-2.amazonaws.com/';

  @override
  onInit() {
    allData();
    super.onInit();
  }

  Future<void> setHistoryData() async {
    String docId = listData.doc().id;
    await listData.doc(docId).set({
      'title': titleController.text,
      'url': linkController.text,
      'time': DateTime.now(),
      'image': imagePath?.value
    });
  }


  // Future createDoc(File file) async {
  //   final AwsS3 awsS3 = AwsS3(
  //     awsFolderPath: "",
  //     file: file,
  //     fileNameWithExt: file.path.split("/").last,
  //     poolId: '',
  //     region: Regions.US_WEST_2,
  //     bucketName: aWSBucketName,
  //   );
  //   try {
  //     final String? uploadedFileName = await awsS3.uploadFile;
  //     uploadedUrl.value = '${awsUrl}$uploadedFileName';
  //     fileNameController.text = awsS3.fileNameWithExt;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }


  Future<void> allData() async {
    try {
      isLoader.value = true;
      dataList.value = await firestoreRepository.getData();
      isLoader.value = false;
    } catch (error) {
      isLoader.value = false;
      log("Error ${error.toString()}");
    }
  }

  getFromGallery() async {
    try {
      XFile? image = await pick.pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        if (kDebugMode) {
          log("message-------${image.path}");
          imagePath?.value = image.path;
          log("--------------${imagePath?.value}");
        }
      }
    } catch (e) {
      log("error--->${e.toString()}");
    }
  }
}
