import 'dart:developer';

import 'package:admin_app/modules/controller/controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'customtext_field.dart';

class AddButton extends StatefulWidget {
  AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  final Controller controller = Get.put(Controller());
  Map imageProfile = {};
  ImagePicker pick = ImagePicker();
  XFile? imageFile;
  // String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD DETAILS"),
        elevation: 0,
      ),
      body: Column(
            children: [
              Container(),
              // uploadFile(uploadFileOnTap: ()async {
              //   controller.result = await FilePicker
              //       .platform
              //       .pickFiles(type: FileType.image);
              //   controller.fileNameController.text =
              //       controller
              //           .result!.files.single.path!
              //           .split("/")
              //           .last;
              //   log("Name --->2 ${controller.fileNameController.text}");
              // }, controller: controller.controller)
              ///dfgdfgdg
              // GestureDetector(
              //   onTap: (){
              //     controller.getFromGallery();
              //   },
              //   child: Container(
              //     width: 20,
              //     child: Image.file(File("${controller.imagePath}")),
              //   ),
              // ),
              CircleAvatar(
                backgroundImage: FileImage(File("${controller.imagePath}")),
                radius: 50,
                child: IconButton(
                  onPressed: () {
                    _getFromGallery();
                  },
                  icon: const Icon(
                      Icons.add,
                      size: 35,
                      color: Colors.transparent
                  ),
                ),
              ),
              ///gdfgdgdfg
              // CircleAvatar(
              //   backgroundImage: FileImage(File("${controller.imagePath}")),
              //   radius: 30,
              //   child: IconButton(
              //     onPressed: () {
              //       _getFromGallery();
              //     },
              //     icon: const Icon(
              //       Icons.add,
              //       size: 35,
              //       color: Colors.transparent,
              //     ),
              //   ),
              // ),
              customTextField(
                  controller: controller.titleController, text: 'Title'),
              customTextField(
                  controller: controller.linkController, text: 'Url'),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.setHistoryData();
                    controller.allData();
                    Get.back();
                    controller.titleController.clear();
                    controller.linkController.clear();
                    print('${controller.allData()}');
                  },
                  child: const Text(
                    'SUBMIT',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
    );
  }

  Widget customTextField({TextEditingController? controller, String? text}) {
    String? labelText;
    return Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: text,
          ),
        ));
  }

  dateTimeformat(DateTime date) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
    final String formatted = formatter.format(date);
    return formatted;
  }


  _getFromGallery() async {
    try {
      XFile? image = await pick.pickImage(
        source: ImageSource.gallery,
      );
      if (image != null) {
        if (kDebugMode) {
          setState(() {
            log("message-------${image.path}");
            controller.imagePath.value = image.path;
            log("--------------${controller.imagePath}");
          });
          print("--------------${imageFile?.path}");
        }
      }
    } catch (e) {
      log("error--->${e.toString()}");
    }
  }



  Widget uploadFile(
      {required VoidCallback uploadFileOnTap, required TextEditingController controller}) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 10),
            child: Text("StringsUtils.uploadFiles",),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14, top: 10, right: 14),
            child: CustomTextField(
              readOnly: true,
              height: 15,
              maxLines: 1,
              trailingIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: GestureDetector(
                    onTap: uploadFileOnTap,
                    child: Text("Sdfsd")),
              ),
              textStyle: const TextStyle(color: Colors.black, fontSize: 14),
              controller: controller,
              keyboardType: TextInputType.text,
              contentPadding: const EdgeInsets.only(left: 8, bottom: 17),
              filled: true,
            ),
          ),
        ],
      ),
    );
  }

}
