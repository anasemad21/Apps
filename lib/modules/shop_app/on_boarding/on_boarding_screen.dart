import 'package:flutter/material.dart';
import 'package:project/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:project/shared/components/components.dart';
import 'package:project/shared/network/local/cash_helper.dart';
import 'package:project/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String tittle;
  final String body;
  final String image;
  BoardingModel({
    required this.tittle,
    required this.body,
    required this.image,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardcontroller = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      tittle: 'On Board 1 Tittle',
      body: 'On Board 1 Body',
      image: 'assets/images/onboard_1.jpg',
    ),
    BoardingModel(
      tittle: 'On Board 2 Tittle',
      body: 'On Board 2 Body',
      image: 'assets/images/onboard_1.jpg',
    ),
    BoardingModel(
      tittle: 'On Board 3 Tittle',
      body: 'On Board 3 Body',
      image: 'assets/images/onboard_1.jpg',
    ),
  ];

  bool isLast = false;

  void submit() {
    CashHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigatAndFinish(
          context,
          ShopLoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defultTextButton(
            function: submit,
            text: 'skip',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    print('is last');
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    print('not last');
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: boardcontroller,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    BuilBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 5.0,
                      expansionFactor: 4,
                      activeDotColor: defultcolor,
                    ),
                    controller: boardcontroller,
                    count: boarding.length),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: defultcolor,
                  onPressed: () {
                    if (isLast) {
                      submit;
                    } else {
                      boardcontroller.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget BuilBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '${model.tittle}',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      );
}
