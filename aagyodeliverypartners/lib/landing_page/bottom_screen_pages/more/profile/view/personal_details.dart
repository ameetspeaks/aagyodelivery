import 'package:flutter/material.dart';
import '../../../../../colors/colors_const.dart';
import '../../../../../const/constString.dart';
import '../../../../../styles/textstyle_const.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);
  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}
class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: Text("Personal Details",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          constTextField(label: 'Full Name', name: 'Amit Pandey',),
          constTextField(label: 'Mobile', name: '000000000',),
          constTextField(label: 'Email', name: 'abc@gmail.com',),
          constTextField(label: 'Date of Birth', name: '12/06/2001',),
          constTextField(label: 'Aadhar Number', name: '123456789',),
          constTextField(label: 'Phone Number', name: '123456789',),
          constTextField(label: 'Driving Licence', name: '123456789',),
          constTextField(label: 'Address ', name: 'Lucknow',),
        ],
      ),
    );
  }
 }
 class constTextField extends StatelessWidget {
  final String label;
  final String name ;
    constTextField({Key? key, required this.label, required this.name}) : super(key: key);

  TextEditingController controller = TextEditingController();

   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         Text(
         label,
         style: AppTextStyles.kBody15SemiboldTextStyle
             .copyWith(color: AppColors.white100),
       ),
           TextFormField(
             readOnly: true,
             controller: controller..text=name,
             decoration: InputDecoration(
               border: UnderlineInputBorder(
     borderSide: const BorderSide(
     color: AppColors.white70,
               )),
               focusedBorder: UnderlineInputBorder(
                 borderSide: const BorderSide(
                   color: AppColors.white70,
                 ),
               ),
               enabledBorder: UnderlineInputBorder( borderSide: const BorderSide(
     color: AppColors.white70,)),
               labelStyle: AppTextStyles.kBody15RegularTextStyle
             ),
           ),
         ],
       ),
     );
   }
 }
