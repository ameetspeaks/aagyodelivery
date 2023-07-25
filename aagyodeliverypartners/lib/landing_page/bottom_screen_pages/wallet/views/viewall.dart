import 'package:flutter/material.dart';
import '../../../../colors/colors_const.dart';
import '../../../../const/constString.dart';
import '../../../../styles/textstyle_const.dart';
import '../../more/profile/widgets/ConstDropDown.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({Key? key}) : super(key: key);
  @override
  State<ViewAll> createState() => _ViewAllState();
}
class _ViewAllState extends State<ViewAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: Text(
          'Activity',
          style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(
            color: AppColors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.help_outline,
                color: AppColors.white,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstDropDownProfile(),
          ),
          SizedBox(
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext contex,index){
                  return Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Image.asset(success),
                          title: const Text(
                            'Cash Deposit Success',
                            style: AppTextStyles.kCaption12RegularTextStyle,
                          ),
                          subtitle: Row(
                            children: const [
                              Text('25/01/23'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('09:30pm')
                            ],
                          ),
                          trailing: const Text(
                            '₹500',
                            style: AppTextStyles.kBody15SemiboldTextStyle,
                          ),
                        ),const Divider(
                          color: AppColors.white40,
                        ),
                        ListTile(
                          leading: Image.asset(desposit),
                          title: const Text(
                            'Cash Deposit failed !',
                            style: AppTextStyles.kCaption12RegularTextStyle,
                          ),
                          subtitle: Row(
                            children: const [
                              Text('25/01/23'),
                              SizedBox(
                                width: 10,
                              ),
                              Text('09:30pm')
                            ],
                          ),
                          trailing: const Text(
                            '₹500',
                            style: AppTextStyles.kBody15SemiboldTextStyle,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
