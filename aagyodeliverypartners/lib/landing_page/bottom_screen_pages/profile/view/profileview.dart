import 'package:flutter/material.dart';
import '../../../../colors/colors_const.dart';
import '../../../../styles/textstyle_const.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key}) : super(key: key);
  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}
class _ProfileDetailsState extends State<ProfileDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios,color: AppColors.neutralDark,)),
        title: Text("Profile Details",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.neutralDark),),
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
