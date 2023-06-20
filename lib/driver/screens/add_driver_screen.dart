import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fleet_admin_panel/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:ready/ready.dart';

import '../../widgets/snackbar_message_widget.dart';
import '../models/driver_model.dart';
import 'driver_list_screen.dart';

class AddDriverScreen extends StatefulWidget {
  const AddDriverScreen({super.key, this.driver});
  final DriverModel? driver;

  @override
  State<AddDriverScreen> createState() => _AddDriverScreenState();
}

class _AddDriverScreenState extends State<AddDriverScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
      try {
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
                Timestamp.fromDate(DateTime.now()))
            .toJson());
        PageInfo.of(context).pushNewPage(
            builder: (context) => DriverListScreen(),
            titleSpans: [const TextSpan(text: 'sub')]);
        SnackBarMessageWidget.show("Add Driver Successfully !");
      } on FirebaseAuthException catch (error) {
        SnackBarMessageWidget.show(error.message.toString());
        return error;
      }
    }
  }

  updateDriverData(BuildContext context) async {
    if (nameController.text.isEmpty) {
      SnackBarMessageWidget.show("Please enter driver name");
    } else if (passwordController.text.isEmpty) {
      SnackBarMessageWidget.show("Please enter password");
    } else if (phoneController.text.isEmpty) {
      SnackBarMessageWidget.show("Please enter phone no");
    } else if (emailController.text.isEmpty) {
      SnackBarMessageWidget.show("Please enter email id");
    } else {
      try {
        String driverId = widget.driver!.driverId!;

        final DocumentReference postsDocRef =
            FirebaseFirestore.instance.collection('drivers').doc(driverId);
        await postsDocRef.update(DriverModel.edit(
            driverId,
                nameController.text,
                passwordController.text,
                emailController.text,
                phoneController.text,
                Timestamp.fromDate(DateTime.now()),
                Timestamp.fromDate(DateTime.now()))
            .toJson());
        PageInfo.of(context).pushNewPage(
            builder: (context) => DriverListScreen(),
            titleSpans: [const TextSpan(text: 'sub')]);
        SnackBarMessageWidget.show("Update Driver Successfully !");
      } on FirebaseAuthException catch (error) {
        debugPrint("ss");
        SnackBarMessageWidget.show(error.message.toString());
        return error;
      }
    }
  }

  setData() {
    if (widget.driver != null) {
      nameController.text = widget.driver!.name ?? "";
      emailController.text = widget.driver!.email ?? "";
      phoneController.text = widget.driver!.phone ?? "";
      passwordController.text = widget.driver!.password ?? "";
      debugPrint("---${widget.driver!.toJson()}");
    }
  }

  @override
  void initState() {
    super.initState();
    setData();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedItemsScope(
      delay: const Duration(seconds: 1),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList.list(
              children: [
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      const Text("Driver Name"),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: nameController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text("Email Id"),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text("Password"),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text("Phone Number"),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: const InputDecoration(
                          prefixStyle: TextStyle(color: Colors.transparent),
                          prefixIcon: Padding(
                            padding:
                                EdgeInsets.only(top: 8, left: 12, right: 4,bottom: 8),
                            child: Text(
                              "+91",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: TextButton(
                              onPressed: () {
                                widget.driver != null
                                    ? updateDriverData(context)
                                    : addDriverData(context);
                              },
                              style: ButtonStyle(
                                animationDuration:
                                    const Duration(milliseconds: 2000),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.lightBlue),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(12)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Submit",
                                style: TextStyle(color: AppColors.white),
                              )))
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
