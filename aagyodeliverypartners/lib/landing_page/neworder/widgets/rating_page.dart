import 'package:aagyodeliverypartners/colors/colors_const.dart';
import 'package:aagyodeliverypartners/const/constContainer.dart';
import 'package:aagyodeliverypartners/styles/textstyle_const.dart';
import 'package:aagyodeliverypartners/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  bool ratingGiven =false;
  double deliveryBoyRating = 0.0;
  String deliveryBoySuggestion = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Customer Feedback",style: AppTextStyles.kBody17SemiboldTextStyle.copyWith(color: AppColors.white100),),
              Card(
                elevation: 5,
                child: TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Skip",style: AppTextStyles.kBody17RegularTextStyle.copyWith(color: AppColors.secondary2),)),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Text(
              'You have just delivered an order',
              style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white50)
          ),
          SizedBox(height: 20,),
          RichText(
            text: TextSpan(
              text: 'Order: ',
              style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),
              children: [
                TextSpan(
                  text: '4244555554',
                  style:AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),
                ),
              ],
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Customer: ',
              style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white100),
              children: [
                TextSpan(
                  text: 'Satyam Singh',
                  style:AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white100),
                ),
              ],
            ),
          ),
          // SizedBox(height: 20,),
          Divider(color: AppColors.white40,thickness: 1,),
          SizedBox(height: 10,),
          Text(
              'Please rate your experience ith the customer',
              style: AppTextStyles.kBody15RegularTextStyle.copyWith(color: AppColors.white50)
          ),
          RatingBar.builder(
            initialRating: deliveryBoyRating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                deliveryBoyRating = rating;
                ratingGiven=true;
              });
            },
          ),
          SizedBox(height: 20),
          TextFormField(
            onChanged: (value) {
              setState(() {
                deliveryBoySuggestion = value;
              });
            },
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Tell us more  about the customer',
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
             if(ratingGiven){
             }
            },
            child: Center(
              child: ConstantContainer(
                  height: size.height*.05,
                  width: size.width*.3,
                  radiusBorder: 5,
                  color:  ratingGiven?AppColors.primary:AppColors.white50,
                  child: Center(child: Text('Submit',style: AppTextStyles.kBody15SemiboldTextStyle.copyWith(color: AppColors.white),))),
            ),
          ),
        ],
      ),
    );
  }
}
