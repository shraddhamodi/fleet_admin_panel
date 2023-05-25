import 'package:fleet_admin_panel/utils/arch_utils/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class CommonAssets {
  static BoxDecoration containerBoxDecoration(Color color,{double radius = 30}) {
    return BoxDecoration(
      color: color,
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(Radius.circular(radius)),
    );
  }

  Future<XFile?> getImageFromCamera(int type) async {
    XFile? tempImage;
    if (type == 0) {
      tempImage = await ImagePicker()
          .pickImage(source: ImageSource.camera, imageQuality: 10);
    } else {
      tempImage = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 10);
    }
    return tempImage;
  }

  showImagePickDialog(Function() onTapCamera,Function() onTapGallery) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        titlePadding: const EdgeInsets.all(0),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    color: Theme.of(context).cardColor,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Text(
                        "Image From",
                        textAlign: TextAlign.left,
                      ),
                    )),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.clear))
              ],
            ),
            const Divider(
              height: 0,
            )
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap:onTapCamera,
                  child: const Column(
                    children: <Widget>[
                      Icon(Icons.camera_alt_outlined),
                      Text("Camera"),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: onTapGallery,
                  child: const Column(
                    children: <Widget>[
                      Icon(Icons.photo_library_outlined),
                      Text("Gallery"),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  static Widget getNetworkImage(String imageUrl,
      {double height = 90, double width = 90}) {
    return imageUrl.isNotEmpty
        ? Image.network(
            imageUrl,
            height: height,
            colorBlendMode: BlendMode.softLight,
            width: width,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox();
            },
          )
        : const SizedBox();
  }

  static Widget getGCSNetworkImage(String imageUrl,
      {double height = 40, double width = 40}) {
    try {
      if (imageUrl.isEmpty) {
        return ClipRRect(
            borderRadius: BorderRadius.circular(14.vdp()),
            child: Image.asset(
              "assets/images/add_image.png",height: height,width: width
              ,opacity: const AlwaysStoppedAnimation(.5),));
      } else {
        return FutureBuilder(
          future: getGCSUrl(imageUrl),
          builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.hasError) {
              snapshot.error.toString();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data == null) {
                return const SizedBox();
              }
              return ClipRRect(
                  borderRadius: BorderRadius.circular(14.vdp()),
                  child: getNetworkImage(snapshot.data.toString(),
                      height: height, width: width));
            } else {
              return const SizedBox();
            }
          },
        );
      }
    } on Exception {
      return const SizedBox();
    }
  }

  //Generate FirebaseStorage URL
  static Future<String?> getGCSUrl(String? icon) async {
    if (icon == null || icon == "") icon = "goal_icons/default.png";
    try {
      debugPrint("hhh$icon");
      return FirebaseStorage.instance
          .ref(icon)
      // .ref("${icon}_40x40.jpeg")
          .getDownloadURL();
    } catch (e) {
      debugPrint('Error occurred for $e');
      return null;
    }
  }

  static String generateRandomString(){
    return randomAlphaNumeric(10);// 10 character long random string
  }

  static String generateQRCodeData() {
    // Get the Firebase Authentication UID
    String uid = FirebaseAuth.instance.currentUser!.uid;

    // Generate a random string or hash
    // String randomString = randomAlphaNumeric(10); // 10 character long random string

    // Concatenate the UID and random string
    String qrCodeData = uid;

    // Add additional information to the QR code data
    qrCodeData += '|seller';

    return qrCodeData;
  }
}
