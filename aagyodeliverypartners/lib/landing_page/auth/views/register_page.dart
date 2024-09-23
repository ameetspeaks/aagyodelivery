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
  final ImagePicker picker = ImagePicker();

  File? _frontImage;
  File? _backImage;
  File? _panCardImage;
  File? _rcCardImage;
  File? _dlCardImage;

  Future<void> _pickImage(bool isAadhaarFront, bool isAadhaarBack, bool isPanCard, bool isRCCard, bool isDLCard) async  {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isAadhaarFront) {
          _frontImage = File(pickedFile.path);
        } else if (isAadhaarBack) {
          _backImage = File(pickedFile.path);
        } else if (isPanCard) {
          _panCardImage = File(pickedFile.path);
        }
      });
    }
  }


  DateTime? selectedDate;
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
        _dateController.text =
            DateFormat('dd/MM/yyyy').format(selectedDate!);
      });
    }
  }

  final List<String> _cities = [
    'Ghaziabad',
    'Meerut',
    'Noida',
    'Greater Noida',
    'North Delhi'
  ];

  String? _selectedCity;
  String? _dlOption = 'No';
  String? _vehicleOption = 'No';


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
      body: Utils.isloading?Utils().progressIndicator(context): NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(background),
              fit: BoxFit.cover,
            )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "(*) All fields are Required",
                      style: AppTextStyles.kBody15RegularTextStyle
                          .copyWith(color: AppColors.error40),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Personal Details",
                      style: TextStyle(
                        color: AppColors.white100,
                        fontSize: 20,
                          decoration: TextDecoration.underline
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    constText("Name"),
                    ConstTextfield(
                      hinttext: "Enter Your Name",
                      inputtype: TextInputType.name,
                      validator: (value) =>
                          value!.isEmpty ? 'This Field cannot be null' : null,
                    ),
                    const SizedBox(
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
                      suffixicon: IconButton(
                          onPressed: () {
                           Utils.DialogBox(context, 'Authentication', 'Otp Send', SizedBox());
                          },
                          icon: const Icon(Icons.verified_outlined, color: AppColors.success40,)),
                    ),
                    const SizedBox(
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
                    const SizedBox(
                      height: 10,
                    ),
                    constText("Date of Birth"),
                    ConstTextfield(
                      controller: _dateController,
                      validator: (number) {
                        if (number.isEmpty && selectedDate == null) {
                          return "Please Select Date";
                        } else {
                          return null;
                        }
                      },
                      inputtype: TextInputType.datetime,
                      hinttext: "Enter Your DOB(same as in Aadhar)",
                      suffixicon: IconButton(
                          onPressed: () {
                            _selectDate(context);
                          },
                          icon: const Icon(Icons.calendar_month_outlined)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    constText("Select City"),
                    cityDropdown(),
                    const SizedBox(
                      height: 20,
                    ),
                    constText("Refferal ID"),
                    ConstTextfield(
                      validator: (number) {
                        if (number!.isEmpty || number.length < 10) {
                          return "Please Enter the Number";
                        }
                      },
                      hinttext: "Enter Refferal ID",

                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Work",
                      style: TextStyle(
                          color: AppColors.white100,
                          fontSize: 20,
                        decoration: TextDecoration.underline
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
                              : const AssetImage(splash) as ImageProvider,
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
                    const SizedBox(
                      height: 15,
                    ),
                    constText("Aadhar/PAN"),
                    ConstTextfield(
                      validator: (number) {
                        if (number!.isEmpty || number.length < 10) {
                          return "Please Enter the Number";
                        }
                        if (_frontImage == null || _backImage == null) {
                          return "Please select image";
                        } else {
                          return null;
                        }
                      },
                      hinttext: "Enter Aadhar Number or PAN Number ",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    aadhaarCard(),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    constText("PAN Card"),
                    const SizedBox(
                      height: 15,
                    ),
                    ConstTextfield(
                      validator: (number) {
                        if (number!.isEmpty || number.length < 10) {
                          return "Please Enter the Number";
                        }
                        if (_panCardImage == null) {
                          return "Please select Pan card image";
                        } else {
                          return null;
                        }
                      },
                      hinttext: "Enter PAN Number",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    panCard(),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Vehicle",
                      style: TextStyle(
                          color: AppColors.white100,
                          fontSize: 20,
                          decoration: TextDecoration.underline
                      ),
                    ),
                    DLWidget(),
                    vehicleWidget(),
                    const SizedBox(
                      height: 10,
                    ),
                    constText("Driving Licence"),
                    ConstTextfield(
                      validator: (number) {
                        if (number!.isEmpty || number.length < 10) {
                          return "Please Enter the Number";
                        }
                        if (_dlCardImage == null) {
                          return "Please select image";
                        } else {
                          return null;
                        }
                      },
                      hinttext: "Enter Driving Licence Number",
                    ),
                    constText("Location"),
                    ConstTextfield(
                      hinttext: "Enter Your Location",
                      maxline: 3,
                      validator: (value) =>
                          value!.isEmpty ? 'This Field cannot be null' : null,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: InkWell(
                          onTap: () {
                            if (imageFile == null) {
                              Utils.PopUP(
                                  context, "Please Select the Profile Picture");
                            }
                            if (formGlobalKey.currentState!.validate()) {
                              if (imageFile == null) {
                                Utils.PopUP(context,
                                    "Please Select the Profile Picture");
                              } else {
                                setState(() {
                                  Utils.isloading = true;
                                });
                                Future.delayed(const Duration(seconds: 1), () {
                                  setState(() {
                                    Utils.isloading = false;
                                  });
                                  Utils.goTo(context, const LoginPage());
                                  Utils.PopUP(context,
                                      "You have registered successfully\nPlease wait Admin will verify your  data then you will be able to login");
                                });
                              }
                            }
                          },
                          child: const ConstButton(
                            text: "Register",
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
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
        return Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                _selectImage(ImageSource.gallery);
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera),
              title: const Text('Take a Photo'),
              onTap: () {
                _selectImage(ImageSource.camera);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget constText(heading) {
    return Text(
      heading + "*",
      style: AppTextStyles.kBody15SemiboldTextStyle
          .copyWith(color: AppColors.white100),
    );
  }
  
  Widget cityDropdown(){
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10)
      ),
      value: _selectedCity,
      items: _cities.map((String city) {
        return DropdownMenuItem<String>(
          value: city,
          child: Text(city),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          _selectedCity = newValue;
        });
      },
      icon: Icon(Icons.arrow_drop_down),
      style: TextStyle(color: Colors.black, fontSize: 16),
      isExpanded: true,
    );
  }

  Widget aadhaarCard() {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // Aadhaar Front Image Upload
        GestureDetector(
          onTap: () => _pickImage(true, false, false, false, false),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: _frontImage != null
                ? Image.file(_frontImage!, fit: BoxFit.cover)
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt, color: Colors.grey),
                Text("Aadhaar Front", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),

        // Aadhaar Back Image Upload
        GestureDetector(
          onTap: () => _pickImage(false, true, false, false, false),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: _backImage != null
                ? Image.file(_backImage!, fit: BoxFit.cover)
                : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.camera_alt, color: Colors.grey),
                Text("Aadhaar Back", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget panCard() {
    return  GestureDetector(
      onTap: () => _pickImage(false, false, true, false, false),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: _panCardImage != null
            ? Image.file(_panCardImage!, fit: BoxFit.cover)
            : const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt, color: Colors.grey),
            Text("PAN Card", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget DLWidget(){
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Do You Have DL?", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          SizedBox(width: 10), // Space between text and radio buttons
          Row(
            children: [
              Radio<String>(
                value: 'Yes',
                groupValue: _dlOption,
                onChanged: (value) {
                  setState(() {
                    _dlOption = value;
                  });
                },
              ),
              Text('Yes'),
            ],
          ),
          Row(
            children: [
              Radio<String>(
                value: 'No',
                groupValue: _dlOption,
                onChanged: (value) {
                  setState(() {
                    _dlOption = value;
                  });
                },
              ),
              Text('No'),
            ],
          ),
        ],
      ),
    );
  }

  Widget vehicleWidget(){
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Do you have bike/2-wheeler?", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          SizedBox(width: 10), // Space between text and radio buttons
          Row(
            children: [
              Radio<String>(
                value: 'Yes',
                groupValue: _vehicleOption,
                onChanged: (value) {
                  setState(() {
                    _vehicleOption = value;
                  });
                },
              ),
              Text('Yes'),
            ],
          ),
          Row(
            children: [
              Radio<String>(
                value: 'No',
                groupValue: _vehicleOption,
                onChanged: (value) {
                  setState(() {
                    _vehicleOption = value;
                  });
                },
              ),
              Text('No'),
            ],
          ),
        ],
      ),
    );
  }

  Widget rcCard() {
    return  GestureDetector(
      onTap: () => _pickImage(false, false, false, true, false,),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: _rcCardImage != null
            ? Image.file(_rcCardImage!, fit: BoxFit.cover)
            : const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt, color: Colors.grey),
            Text("Upload vehicle RC", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget dLCard() {
    return  GestureDetector(
      onTap: () => _pickImage(false, false, false, true, false,),
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: _rcCardImage != null
            ? Image.file(_rcCardImage!, fit: BoxFit.cover)
            : const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt, color: Colors.grey),
            Text("Upload Driving License", style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
