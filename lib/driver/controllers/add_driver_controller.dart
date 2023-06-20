import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ready/ready.dart';

import '../../widgets/snackbar_message_widget.dart';
import '../models/driver_model.dart';
import '../screens/driver_list_screen.dart';

class AddDriverController extends GetxController{

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  addDriverData(BuildContext context) async {
    if (nameController.text.isEmpty) {
      SnackBarMessageWidget.show("Please enter driver name");
    } else if (passwordController.text.isEmpty) {
      SnackBarMessageWidget.show("Please enter password");
    } else if (phoneController.text.isEmpty) {
      SnackBarMessageWidget.show("Please enter phone no");
    } else if (emailController.text.isEmpty) {
      SnackBarMessageWidget.show("Please enter email id");
    } else {
      try{
        UserCredential authUser = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        String userId = authUser.user!.uid;

        final DocumentReference postsDocRef =
        FirebaseFirestore.instance.collection('drivers').doc(userId);
        await postsDocRef.set(DriverModel.edit(
            userId,
            nameController.text,
            passwordController.text,
            emailController.text,
            phoneController.text,
            Timestamp.fromDate(DateTime.now()),
            Timestamp.fromDate(DateTime.now())).toJson());
        PageInfo.of(context).pushNewPage(
            builder: (context) => DriverListScreen(),
            titleSpans: [const TextSpan(text: 'sub')]);
        SnackBarMessageWidget.show("Add Driver Successfully !");
      }on FirebaseAuthException catch (error){
        SnackBarMessageWidget.show(error.message.toString());
        return error;
      }
    }
  }

}