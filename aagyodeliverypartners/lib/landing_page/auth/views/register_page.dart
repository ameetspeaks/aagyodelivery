import 'dart:io';
import 'package:aagyodeliverypartners/landing_page/auth/views/login_screen.dart';
import 'package:aagyodeliverypartners/landing_page/auth/widgets/const_text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../colors/colors_const.dart';
import '../../../const/constString.dart';
import '../../../styles/textstyle_const.dart';
import '../../../utils/Utils.dart';
import '../widgets/const_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  File? imageFile;
  Future<void> _selectImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
  File? _adhar;
  Future<void> _pickedAdhar() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _adhar = File(pickedFile.path);
      });
    }
  }
  File? _dL;
  Future<void> _pickedDL() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _dL = File(pickedFile.path);
      });
    }
  }
  DateTime ?selectedDate;
  TextEditingController _dateController = TextEditingController();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text='${DateFormat('dd/MM/yyyy').format(selectedDate!)}';
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final formGlobalKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          "Register",
          style: AppTextStyles.kBody15SemiboldTextStyle
              .copyWith(color: AppColors.white),
        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formGlobalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text("(*) All fields are Required",style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.error40),),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        _showImagePicker(context);
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: AppColors.white50,
                        backgroundImage: imageFile != null
                            ? FileImage(imageFile!)
                            : AssetImage(splash) as ImageProvider,
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        _showImagePicker(context);
                      },
                      child: Text(
                        "Upload Profile Picture",
                        style: AppTextStyles.kBody15SemiboldTextStyle
                            .copyWith(color: AppColors.primary1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  constText("Name"),
                  ConstTextfield(
                    hinttext: "Enter Your Name",
                    inputtype: TextInputType.name,
                    validator: (value) =>
                        value!.isEmpty ? 'This Field cannot be null' : null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  constText("Mobile"),
                  ConstTextfield(
                    hinttext: "Enter Mobile Number",
                    inputtype: TextInputType.phone,
                    maxlength: 10,
                    validator: (number) {
                      if (number!.isEmpty || number.length < 9) {
                        return "Mobile must contain 10 digits";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  constText("Email"),
                  ConstTextfield(
                    hinttext: "Enter Your Email",
                    inputtype: TextInputType.emailAddress,
                    validator: (email) {
                      if (email!.isEmpty || !email.contains('@')) {
                        return "Please enter valid email address";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  constText("Date of Birth"),
                  ConstTextfield(
                    controller: _dateController,
                    validator: (number) {
                      if (number.isEmpty && selectedDate==null ) {
                        return "Please Select Date";}
                      else{
                        return null;
                      }
                    },
                    inputtype: TextInputType.datetime,
                    hinttext:"Enter Your DOB(same as in Aadhar)",
                    suffixicon: IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: Icon(Icons.calendar_month_outlined)),
                  ),  SizedBox(
                    height: 10,
                  ),
                  constText("Aadhar/PAN"),
                  ConstTextfield(
                    validator: (number) {
                      if (number!.isEmpty || number.length < 10) {
                        return "Please Enter the Number";}
                      if( _adhar==null) {
                        return "Please select image";
                      }
                    else{
                      return null;
                      }
                    },
                    hinttext: "Enter Aadhar Number or PAN Number ",
                    suffix: GestureDetector(
                        onTap: () {
                          _pickedAdhar();
                        },
                        child: Text("Upload",style: AppTextStyles.kCaption12SemiboldTextStyle.copyWith(color: Colors.blue),)),
                  ),
                  if (_adhar != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
                          width: 200,
                          color: AppColors.white,
                          child: Image.file(_adhar!, fit: BoxFit.cover)),
                    )
                  else
                    Text(""),
                  constText("Driving Licence"),
                  ConstTextfield(
                    validator: (number) {
                      if (number!.isEmpty || number.length < 10) {
                        return "Please Enter the Number";}
                      if( _dL==null) {
                        return "Please select image";
                      }
                      else{
                        return null;
                      }
                    },
                    hinttext: "Enter Driving Licence Number",
                    suffix: GestureDetector(
                        onTap: () {
                          _pickedDL();
                        },
                        child: Text("Upload",style: AppTextStyles.kCaption12SemiboldTextStyle.copyWith(color:  Colors.blue),)),
                  ),
                  if (_dL != null)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 100,
                          width: 200,
                          color: AppColors.white,
                          child: Image.file(_dL!, fit: BoxFit.cover)),
                    )
                  else
                    Text(""),
                  constText("Location"),
                  ConstTextfield(
                    hinttext: "Enter Your Location",
                    maxline: 2,
                    validator: (value) =>
                        value!.isEmpty ? 'This Field cannot be null' : null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: InkWell(
                        onTap: () {
                          if(imageFile==null){
                            Utils.PopUP(context, "Please Select the Profile Picture");
                          }
                          if (formGlobalKey.currentState!.validate()) {
                            if(imageFile==null){
                              Utils.PopUP(context, "Please Select the Profile Picture");
                            }else{
                              Utils.goTo(context, LoginPage());
                              Utils.PopUP(context,
                                  "You have registered successfully\nPlease wait Admin will verify your  data then you will be able to login");
                            }
                          }
                        },
                        child: ConstButton(
                          text: "Register",
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showImagePicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from Gallery'),
                onTap: () {
                  _selectImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Take a Photo'),
                onTap: () {
                  _selectImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
  Widget constText(heading){
    return Text(
      heading+"*",
      style: AppTextStyles.kBody15SemiboldTextStyle
          .copyWith(color: AppColors.white100),
    );
  }
}
