import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/const/constString.dart';
import 'package:flutter/material.dart';
import '../../../../styles/textstyle_const.dart';

class ConstGridView extends StatelessWidget {
  const ConstGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List <String> img = [
      pending,
      completed,
      ruppess,
      splash
    ];
    List <String> name = [
      "Pending Orders",
      "Completed Orders",
      "Collections",
      "Others",
    ];
    final Screen = [
      Text("ss"),
      Text("ss"),
      Text("ss"),
      Text("ss"),
    ];
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 0,
      mainAxisSpacing: 4,
      childAspectRatio: 1.35,
      shrinkWrap: true,
      children: List.generate(4, (index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen[index]));
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.neutralBorder,width: 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(child: Image.asset(img[index],height: 100,width: 100,)),
                    const Text("12",style:AppTextStyles.kHeading3TextStyle),
                    Text(name[index],style:AppTextStyles.kBody15SemiboldTextStyle)
                  ],
                ),
              ),
            ),
          ),
        );
      },),
    );


  }
}
