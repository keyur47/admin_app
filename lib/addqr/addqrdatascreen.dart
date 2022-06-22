// import 'package:admin_app/model/addbutton.dart';
// import 'package:admin_app/modules/controller/controller.dart';
// import 'package:admin_app/utils/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// class AddQrDataScreen extends StatelessWidget {
//   final Controller controller = Get.put(Controller());
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("title!"),
//         elevation: 0,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(AddButton());
//         },
//         child: const Icon(Icons.add),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 10,
//           ),
//           Expanded(
//             child: Obx(
//               () => controller.isLoader.value
//                   ? const Center(child: CircularProgressIndicator())
//                   : Padding(
//                       padding: const EdgeInsets.only(
//                         right: 0,
//                       ),
//                       child: ListView.builder(
//                           padding: EdgeInsets.zero,
//                           itemCount: controller.dataList.length,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 10, right: 10, bottom: 10),
//                               child: Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(10),
//                                     border: Border.all(width: 2),
//                                     color: AppColor.greyColor,
//                                   ),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(8.0),
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           controller.dataList[index].title
//                                                   ?.toUpperCase() ??
//                                               '',
//                                           style:
//                                               const TextStyle(fontSize: 25),
//                                         ),
//                                         Text(
//                                           controller.dataList[index].url ??
//                                               'aa',
//                                           style: const TextStyle(
//                                             fontSize: 20,
//                                             color: Colors.lightBlue,
//                                             decoration:
//                                                 TextDecoration.underline,
//                                           ),
//                                         ),
//                                         Text(
//                                           dateTimeformat(controller
//                                               .dataList[index].time!
//                                               .toDate()),
//                                           style: const TextStyle(
//                                               fontSize: 15,
//                                               color: Colors.red),
//                                           textAlign: TextAlign.end,
//                                         )
//                                       ],
//                                     ),
//                                   )),
//                             );
//                           }),
//                     ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   // Widget customTextField({TextEditingController? controller, String? text}) {
//   //   String? labelText;
//   //   return Container(
//   //       margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//   //       child: TextField(
//   //         controller: controller,
//   //         decoration: InputDecoration(
//   //           border: const OutlineInputBorder(),
//   //           labelText: text,
//   //         ),
//   //       ));
//   // }
//   //
//   dateTimeformat(DateTime date) {
//     final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm');
//     final String formatted = formatter.format(date);
//     // print("-----------$formatted");
//     return formatted;
//   }
// }
//
// // import 'package:demo_firebase_project/utils/app_color.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get_core/src/get_main.dart';
// // import 'package:get/get_navigation/get_navigation.dart';
// // import 'add_data.dart';
// // import 'list_data.dart';
// //
// // class HomePage extends StatefulWidget {
// //   const HomePage({Key? key}) : super(key: key);
// //
// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }
// //
// // class _HomePageState extends State<HomePage> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: AppColors.darkBlue,
// //         title: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //              Text("All Details",style: TextStyle(color: Colors.white),),
// //             // GestureDetector(
// //             //   child: const Icon(
// //             //     Icons.add,
// //             //     size: 30,
// //             //
// //             //   ),
// //             //   onTap: () {
// //             //     Get.to(const AddStudent());
// //             //   },
// //             // )
// //           ],
// //         ),
// //       ),
// //       body: ListStudent(),
// //       floatingActionButton: FloatingActionButton(
// //         splashColor: Colors.transparent,
// //         backgroundColor: AppColors.darkBlue,
// //         child: Icon(Icons.add,size: 30,),
// //         onPressed: () {
// //           Get.to(const AddStudent());
// //         },
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
//
// ///dfsdfsdfsdfsd
//
// // import 'dart:io';
// // import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// // import 'package:flutter/material.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:path/path.dart';
// //
// // class ImageUploads extends StatefulWidget {
// //   const ImageUploads({Key? key}) : super(key: key);
// //
// //   @override
// //   _ImageUploadsState createState() => _ImageUploadsState();
// // }
// //
// // class _ImageUploadsState extends State<ImageUploads> {
// //
// //   firebase_storage.FirebaseStorage storage =
// //       firebase_storage.FirebaseStorage.instance;
// //
// //   File? _photo;
// //   final ImagePicker _picker = ImagePicker();
// //
// //   Future imgFromGallery() async {
// //     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
// //
// //     setState(() {
// //       if (pickedFile != null) {
// //         _photo = File(pickedFile.path);
// //         uploadFile();
// //       } else {
// //         print('No image selected.');
// //       }
// //     });
// //   }
// //
// //
// //   Future uploadFile() async {
// //     if (_photo == null) return;
// //     final fileName = basename(_photo!.path);
// //     final destination = 'files/$fileName';
// //
// //     try {
// //       final ref = firebase_storage.FirebaseStorage.instance
// //           .ref(destination)
// //           .child('file/');
// //       await ref.putFile(_photo!);
// //     } catch (e) {
// //       print('error occured');
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(),
// //       body: Column(
// //         children: <Widget>[
// //           const SizedBox(
// //             height: 32,
// //           ),
// //           Center(
// //             child: GestureDetector(
// //               onTap: () {
// //                 _showPicker(context);
// //               },
// //               child: CircleAvatar(
// //                 radius: 50,
// //                 backgroundColor: Colors.black,
// //                 child: _photo != null
// //                        ? ClipRRect( borderRadius: BorderRadius.circular(50),
// //                           child: Image.file(_photo!,width: 100,height: 100,fit: BoxFit.fitHeight),)
// //                     : Container(decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(50)),
// //                      width: 100,
// //                      height: 100,
// //                      child: Icon(Icons.camera_alt,color: Colors.grey[800],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   void _showPicker(context) {
// //     showModalBottomSheet(
// //         context: context,
// //         builder: (BuildContext bc) {
// //           return SafeArea(
// //             child: Wrap(
// //               children: <Widget>[
// //                 ListTile(
// //                     leading: Icon(Icons.photo_library),
// //                     title: Text('Gallery'),
// //                     onTap: () {
// //                       imgFromGallery();
// //                       Navigator.of(context).pop();
// //                     }),
// //               ],
// //             ),
// //           );
// //         });
// //   }
// // }
