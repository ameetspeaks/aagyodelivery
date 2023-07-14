import 'package:flutter/material.dart';
import '../../../../../colors/colors_const.dart';
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
        title: Text("Profile Details",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          constTextField(label: 'Full Name', name: 'Amit Pandey',),
          constTextField(label: 'Email', name: 'abc@gmail.com',),
          constTextField(label: 'Phone Number', name: '123456789',),
        ],
      ),
    );
  }
 }
 class constTextField extends StatefulWidget {
  final String label;
  final String name ;
   const constTextField({Key? key, required this.label, required this.name}) : super(key: key);

   @override
   State<constTextField> createState() => _constTextFieldState();
 }
 class _constTextFieldState extends State<constTextField> {
  TextEditingController controller = TextEditingController();
   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: TextFormField(
         readOnly: true,
         controller: controller..text=widget.name,
         decoration: InputDecoration(
           border: UnderlineInputBorder(),
           focusedBorder: UnderlineInputBorder(),
           enabledBorder: UnderlineInputBorder(),
           labelText: widget.label,
           labelStyle: AppTextStyles.kBody15RegularTextStyle
         ),
       ),
     );
   }
 }
