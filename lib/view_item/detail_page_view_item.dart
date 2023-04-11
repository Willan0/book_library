import 'package:book_library/constant/color.dart';
import 'package:book_library/view_item/search_page_view_item.dart';
import 'package:book_library/widgets/rating_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constant/dimen.dart';
import '../constant/string.dart';
import '../widgets/easy_button.dart';
import '../widgets/easy_image.dart';
import '../widgets/easy_text.dart';
import '../widgets/rate_and_type.dart';

class BookTitleView extends StatelessWidget {
  const BookTitleView({
    Key? key, required this.bookName, required this.imageLink, required this.author,
  }) : super(key: key);

  final String bookName;
  final String imageLink;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(kRi18x)),
            child: EasyImage(
                height: kWh205x,
                imgUrl:imageLink)),
        const SizedBox(width: kMp3x,),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EasyText(text: bookName,fontWeight: FontWeight.bold,fontSize: kFs18x,),
              const SizedBox(height: kMp20x,),
              EasyText(text: author ,fontWeight: FontWeight.w500,fontSize: kFs12x,)
            ],
          ),
        )
      ],
    );
  }
}

class RateAndTypeView extends StatelessWidget {
  const RateAndTypeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RateAndType( up: Row(
          children: const [
            EasyText(text: '1.3',),
            Icon(Icons.star)
          ],
        ),down: '6 review',),
        Container(color: cGrey,height: kWh30x,width: kWh1x,),
        const RateAndType(up: Icon(Icons.book), down: 'E Book'),
        Container(color: cGrey,height: kWh30x,width: kWh1x,),
        const RateAndType(up: EasyText(text: '100',fontWeight: FontWeight.bold), down: 'pages')
      ],
    );
  }
}

class TwoButton extends StatelessWidget {
  const TwoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children:  [
        Expanded(child: EasyButton(color: cWhite,text: 'Free Sample',height: kWh40x,textColor: cCyan,onPressed: (){},)),
        const SizedBox(width: kMp3x,),
        Expanded(child: EasyButton(color: cCyan,text: '\$ 500.44',height: kWh40x,textColor: cWhite,onPressed: (){},))
      ],
    );
  }
}


class RatingView extends StatelessWidget {
  const RatingView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<double> percents = [0.9,0.6,0.5,0.3];
    return SizedBox(
      child: Row(
        children: [
          SizedBox(
            width: kWh100x,
            child: Column(
              children: const[ EasyText(text: '4.5',fontSize: kFs16x,fontWeight: FontWeight.bold,),RatingWidget(),EasyText(text: '6.9 total')],
            ),
          ),
          Expanded(
            child: Column(
              children: percents.map((percent) => LinearPercentIndicator(
                lineHeight: kWh13x,
                backgroundColor: cWhite,
                padding: const EdgeInsets.only(bottom: kMp3x),
                linearGradient: const LinearGradient(colors: [cCyan,cWhite]),
                percent: percent,
              )).toList(),
            ),
          )
        ],
      ),
    );
  }
}




class FeedBackView extends StatelessWidget {
  const FeedBackView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: kRi18x,
            backgroundColor: cCyan,
            child: EasyText(text:'W',fontColor: cWhite,),
          ),
          const SizedBox(width: kMp3x,),
          Expanded(child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              EasyText(text: 'Willian'),
              RatingWidget(),
              EasyText(text: randomText)
            ],
          ))
        ],
      ),
    );
  }
}
class TakeFeedBackView extends StatelessWidget {
  const TakeFeedBackView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: cWhiteShadow,
            borderRadius: BorderRadius.circular(kRi10x)
        ),

        child: const SearchFakeView(icon: Icons.feedback, label: 'Write your feedback'));
  }
}