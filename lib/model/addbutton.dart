import 'dart:io';

import 'package:admin_app/modules/controller/controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddButton extends StatefulWidget {
  AddButton({Key? key}) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD DETAILS"),
        elevation: 0,
      ),
      body: Obx(()=>
        Column(
          children: [
            CircleAvatar(
              backgroundImage: FileImage(File("${controller.imagePath}")),
              radius: 50,
              child: IconButton(
                onPressed: () {
                  controller.getFromGallery();
                },
                icon: const Icon(
                  Icons.add,
                  size: 35,
                  color: Colors.transparent
                  ,
                ),
              ),
            ),
            customTextField(
                controller: controller.titleController, text: 'Title'),
            customTextField(controller: controller.linkController, text: 'Url'),
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
}
