import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_test/presentation/core/constants/app_colors.dart';
import 'package:machine_test/presentation/core/widgets/build_image_container_picker.dart';
import 'package:machine_test/presentation/core/widgets/custom_app_bar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:machine_test/presentation/core/widgets/custom_btn.dart';
import 'package:machine_test/presentation/core/widgets/custom_radio_button.dart';
import 'package:machine_test/presentation/core/widgets/custom_text.dart';
import 'package:machine_test/presentation/core/widgets/custom_text_field.dart';
import 'package:image_picker/image_picker.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  int value = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _productNameFormFieldKey =
      GlobalKey<FormFieldState>();

  final TextEditingController _productNameController = TextEditingController();

  final GlobalKey<FormFieldState> _ingredientsFormFieldKey =
      GlobalKey<FormFieldState>();

  final TextEditingController _ingredientsNameController =
      TextEditingController();

  final GlobalKey<FormFieldState> _priceFormFieldKey =
      GlobalKey<FormFieldState>();

  final TextEditingController _priceController = TextEditingController();

  final GlobalKey<FormFieldState> _orginalPriceFormFieldKey =
      GlobalKey<FormFieldState>();

  final TextEditingController _orginalPriceController = TextEditingController();

  bool isSwitched = false;

  void _toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  String? _selectedCategory;
  List<String> productsCategories = [
    "Pizza",
    "Cheken",
  ];

  File? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: source,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Pizza/ Add Item',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 21,
              horizontal: 16,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: buildImageContainer(
                      context: context,
                      selectedImage: _selectedImage,
                      onDeleteTap: () {
                        setState(() {
                          _selectedImage = null;
                        });
                      },
                      onGalleryTap: () {
                        _pickImage(ImageSource.gallery);
                        Navigator.of(context).pop();
                      },
                      onCameraTap: () {
                        _pickImage(ImageSource.camera);
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Text(
                    'product Name',
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextField(
                    textFieldkey: _productNameFormFieldKey,
                    controller: _productNameController,
                    hintText: 'Enter your product name',
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  DropdownButtonFormField2<String>(
                    isExpanded: true,
                    decoration: InputDecoration(
                      fillColor: AppColors.greyColor,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            14,
                          ),
                          borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 14),
                      hintText: 'Select Category',
                      hintStyle: TextStyle(fontSize: 14.sp),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.redColor),
                      ),
                      errorStyle: TextStyle(
                        color: AppColors.redColor,
                        fontSize: 11.sp,
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.redColor),
                      ),
                    ),
                    hint: Text(
                      'Select Category',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    items: productsCategories
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select Product Category.';
                      }
                      return null;
                    },
                    value: _selectedCategory,
                    onSaved: (value) {
                      _selectedCategory = value.toString();
                    },
                    onChanged: (String? value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                    buttonStyleData: const ButtonStyleData(
                      padding: EdgeInsets.only(right: 8),
                    ),
                    iconStyleData: IconStyleData(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.primaryColor,
                      ),
                      iconSize: 24.sp,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customRadioButton(
                        text: 'Non Veg',
                        index: 0,
                        svgIcon: 'assets/icons/fram_red.svg',
                        onTap: (int index) {
                          setState(() {
                            value = index;
                          });
                        },
                        value: value,
                      ),
                      const SizedBox(
                        width: 34,
                      ),
                      customRadioButton(
                        text: 'Veg',
                        index: 1,
                        svgIcon: 'assets/icons/frame_green.svg',
                        onTap: (int index) {
                          setState(() {
                            value = index;
                          });
                        },
                        value: value,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const CustomText(text: 'Ingredients'),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomTextField(
                    textFieldkey: _ingredientsFormFieldKey,
                    controller: _ingredientsNameController,
                    hintText: 'Enter ingredients and description',
                    maxLines: 4,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(text: 'Price'),
                            SizedBox(
                              height: 7.h,
                            ),
                            CustomTextField(
                              textFieldkey: _priceFormFieldKey,
                              controller: _priceController,
                              hintText: 'e.g. € 130',
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 11.w,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomText(text: 'Orginal Price'),
                            SizedBox(
                              height: 7.h,
                            ),
                            CustomTextField(
                              textFieldkey: _orginalPriceFormFieldKey,
                              controller: _orginalPriceController,
                              hintText: 'e.g. € 130',
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomText(text: 'Pre order Only'),
                      Switch(
                        value: isSwitched,
                        onChanged: _toggleSwitch,
                        activeTrackColor: AppColors.greyColor,
                        activeColor: AppColors.primaryColor,
                        inactiveThumbColor: AppColors.greyColor,
                        trackOutlineColor:
                            const MaterialStatePropertyAll(AppColors.greyColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomButton(
                    title: '+ Add Item',
                    fixedSize: Size(MediaQuery.sizeOf(context).width, 56.r),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                    },
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 57.0),
                    child: Text(
                      'Item will be added only after confirming by Admin',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.darkGreyColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
