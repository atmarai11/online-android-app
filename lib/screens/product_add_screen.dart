import 'dart:io';

import 'package:flutter/material.dart';
import 'package:techno_gadgets/repository/mobile_repository.dart';
import 'package:techno_gadgets/widgets/display_image.dart';
import 'package:techno_gadgets/widgets/text_input.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

import '../widgets/mycolors.dart';
import '../model/mobile.dart';

// import '../ui/display_image.dart';
class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String? mobileCategoryValue;
  var mobileCategories = ['Apple', 'Samsung', 'Xiaomi'];

  File? img;
  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint('Failed to pick the image $e');
    }
  }

  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();

  void _addMobile(Mobile mobile) async {
    try {
      bool? isAdded = await MobileRepository().addMobile(img, mobile);

      if (isAdded!) {
        _showMotionToast(isAdded);
      } else {
        _showMotionToast(isAdded);
      }
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  void _showMotionToast(bool isAdded) {
    if (isAdded) {
      MotionToast.success(
        toastDuration: const Duration(seconds: 2),
        description: const Text('Mobile added successfully.'),
      ).show(context);
    } else {
      MotionToast.error(
        toastDuration: const Duration(seconds: 2),
        description: const Text('Mobile addition failed.'),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 28,
                    color: MyColors.myGreen,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 78),
                  child: Text(
                    "Add Product",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: MyColors.myGreen,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.more_vert,
                  size: 28,
                  color: MyColors.myGreen,
                )
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: MyColors.myWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34),
                topRight: Radius.circular(34),
              ),
            ),
            child: Column(
              children: [
                DisplayImage(img: img),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _loadImage(ImageSource.camera);
                          },
                          icon: const Icon(Icons.camera),
                          label: const Text(
                            "Open Camera",
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              MyColors.myGreen,
                            ),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 15),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            _loadImage(ImageSource.gallery);
                          },
                          icon: const Icon(Icons.browse_gallery_outlined),
                          label: const Text(
                            "Open Gallery",
                            style: TextStyle(fontSize: 16),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              MyColors.myGreen,
                            ),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 15),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                TextInput(
                  icon: Icons.smartphone,
                  hint: "Enter mobile Name",
                  inputAction: TextInputAction.next,
                  controller: _nameController,
                  msg: "Please enter mobile name",
                ),
                const SizedBox(
                  height: 6,
                ),
                TextInput(
                  icon: Icons.description,
                  hint: "Enter mobile description",
                  inputAction: TextInputAction.next,
                  controller: _descriptionController,
                  msg: "Please enter description of the product",
                ),
                const SizedBox(
                  height: 6,
                ),
                TextInput(
                  icon: Icons.production_quantity_limits,
                  hint: "Enter quantity",
                  inputAction: TextInputAction.next,
                  controller: _quantityController,
                  msg: "Please enter quantity ",
                ),
                const SizedBox(
                  height: 6,
                ),
                TextInput(
                  icon: Icons.price_change,
                  hint: "Enter mobile price",
                  inputAction: TextInputAction.next,
                  controller: _priceController,
                  msg: "Please enter mobile price",
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: DropdownButtonFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(28),
                            ),
                            borderSide: BorderSide(
                                color: MyColors.myGreen, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: MyColors.myGreen, width: 2.0),
                          ),
                          hintText: 'Select mobile category',
                          hintStyle:
                              TextStyle(fontSize: 16, color: MyColors.myGreen),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        focusColor: const Color.fromARGB(255, 220, 123, 206),
                        value: mobileCategoryValue,
                        items: mobileCategories.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            mobileCategoryValue = newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 23),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Mobile mobile = Mobile(
                          category: mobileCategoryValue,
                          name: _nameController.text,
                          description: _descriptionController.text,
                          price: double.parse(_priceController.text),
                          quantity: int.parse(_quantityController.text),
                        );

                        _addMobile(mobile);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text(
                        "Add Mobile",
                        style: TextStyle(fontSize: 23),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          MyColors.myGreen,
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              vertical: 13, horizontal: 15),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                      ),
                    ),
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
