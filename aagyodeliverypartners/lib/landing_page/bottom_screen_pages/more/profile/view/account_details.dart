import 'package:flutter/material.dart';
import '../../../../../colors/colors_const.dart';
import '../../../../../styles/textstyle_const.dart';

class AccountDetails extends StatefulWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: Text("Account Details",style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CustomTextField(label: 'Name(as on Aadhar Card)', name: 'Amit Pandey',),
          CustomTextField(label: 'Date of Birth', name: '12/06/2001',),
          CustomTextField(label: 'Mobile Number', name: '000000000',),
          CustomTextField(label: 'Account Number', name: '000000000',),
          CustomTextField(label: 'Email', name: 'abc@gmail.com',),
          CustomTextField(label: 'Aadhar Number', name: '123456789',),
          CustomTextField(label: 'Driving Licence', name: '123456789',),
          CustomTextField(label: 'Address ', name: 'Lucknow',),
        ],
      ),
    );
  }
}
class CustomTextField extends StatelessWidget {
  final String label;
  final String name ;
  CustomTextField({Key? key, required this.label, required this.name}) : super(key: key);

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